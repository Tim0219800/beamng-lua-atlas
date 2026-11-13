# -*- coding: utf-8 -*-
"""Vérificateur de mods BeamNG.drive (tim19Atlas).

Usage :
  python -I outils/verifier_mod.py <mod.zip | dossier du mod> [...] [--version V] [--json sortie.json]
  python -I outils/verifier_mod.py --mods-actifs [<dossier mods>] [--version V]

--mods-actifs lit mods/db.json du dossier utilisateur (par défaut %LOCALAPPDATA%/BeamNG/BeamNG.drive/current/mods)
et vérifie tous les mods actifs ensemble. Ne modifie rien.

Vérifications :
  CONFLIT    même fichier fourni par plusieurs mods (le dernier chargé gagne)
  REMPLACE   le mod remplace un fichier Lua du jeu (fragile à chaque mise à jour)
  RETIRÉ     appel à une fonction, un module ou un hook retiré dans une version récente (d'après donnees/<v>/diff-*.json)
  INCONNU    appel à une fonction absente de l'API de la version visée (faute de frappe, API privée ou dynamique)
  EXTENSION  extensions.load("x") d'une extension que ni le jeu ni les mods ne fournissent
  HOOK       hook M.onXxx défini par le mod mais jamais émis par le jeu
"""
import glob, json, os, re, sys, zipfile
from collections import defaultdict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from extraire import tokenize  # noqa: E402

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
USER_MODS = os.path.join(os.environ.get("LOCALAPPDATA", ""), "BeamNG", "BeamNG.drive", "current", "mods")
IGNORE_CONFLICT = re.compile(r"^(mod_info/|info\.json$|readme|license|changelog)", re.I)
# globales Lua standard et utilitaires toujours présents : on ne vérifie pas leurs membres
LUA_STD = {"string", "table", "math", "os", "io", "debug", "coroutine", "package", "bit", "jit", "ffi", "utf8", "_G"}
SEVERITE = ["RETIRÉ", "CONFLIT", "REMPLACE", "INCONNU", "EXTENSION", "HOOK"]


def load(p, default=None):
    if os.path.exists(p):
        with open(p, encoding="utf-8") as fh:
            return json.load(fh)
    return default


def versions():
    vs = [os.path.basename(d) for d in glob.glob(os.path.join(BASE, "donnees", "*")) if os.path.exists(os.path.join(d, "statique.json"))]
    return sorted(vs, key=lambda v: [int(x) if x.isdigit() else x for x in re.split(r"[.-]", v)])


# ------------------------------------------------------------------ API du jeu
class Api:
    def __init__(self, ver):
        st = load(os.path.join(BASE, "donnees", ver, "statique.json"))
        if not st:
            sys.exit(f"donnees/{ver}/statique.json introuvable (versions disponibles : {', '.join(versions())})")
        self.ver = ver
        self.files = {"lua/" + p for p in st["modules"]}
        self.globals = {"ge": defaultdict(set), "vehicle": defaultdict(set)}   # nom global -> membres
        self.extensions = set()
        for m in st["modules"].values():
            members = set(m["exports"]) | set(m["fields"]) | set(m.get("globalVariables", {}))
            names = list(m["globalNames"])
            if m["kind"] == "extension":
                names.append(m["access"])
                self.extensions.add(m["access"])
            vms = ("ge", "vehicle") if m["vm"] == "common" else (m["vm"],)
            for vm in vms:
                if vm not in self.globals:
                    continue
                for n in names:
                    self.globals[vm][n] |= members
                for g in m["globalFunctions"]:
                    self.globals[vm].setdefault("_G", set()).add(g)
        self.hooks = set()
        for hs in st["hooks"].values():
            self.hooks |= set(hs)
        self.cpp = {}
        for vm in ("ge", "vehicle"):
            rt = load(os.path.join(BASE, "donnees", ver, f"runtime_{vm}.json"))
            if not rt:
                continue
            classes = rt.get("classes", {})

            def members_of(cls, seen=()):
                c = classes.get(cls) or {}
                out = set(c.get("methods") or []) | set(c.get("getters") or []) | set(c.get("setters") or []) | set(c.get("constants") or {})
                sup = c.get("super")
                if sup and sup not in seen:
                    out |= members_of(sup, seen + (cls,))
                return out

            for g, info in rt.get("globals", {}).items():
                if info.get("kind") == "table" and isinstance(info.get("fields"), dict):
                    if g in self.globals[vm]:  # complète l'API statique avec ce qui existe vraiment en jeu
                        self.globals[vm][g] |= set(info["fields"])
                elif info.get("class", "").startswith("class<"):
                    self.cpp[(vm, g)] = members_of(info["class"])
                elif info.get("class", "").startswith("module<"):
                    mod = rt.get("modules", {}).get(g) or {}
                    if mod.get("functions"):
                        self.cpp[(vm, g)] = set(mod["functions"])
        # retraits connus : diffs dont la cible est <= version visée
        self.removed = {}   # ("module", acces) / ("fn", acces, nom) / ("hook", nom) -> version
        vs = versions()
        for dp in glob.glob(os.path.join(BASE, "donnees", "*", "diff-*.json")):
            d = load(dp)
            if d["to"] not in vs or vs.index(d["to"]) > vs.index(ver):
                continue
            for p, m in d["modulesRemoved"].items():
                self.removed[("module", m["access"])] = d["to"]
            old_st = load(os.path.join(BASE, "donnees", d["from"], "statique.json")) or {"modules": {}}
            for p, m in d["modules"].items():
                old_g = set((old_st["modules"].get(m.get("from") or p) or {}).get("globalFunctions", {}))
                for k in m["removed"]:
                    if k in old_g:
                        self.removed[("global", k)] = d["to"]
                    if ":" not in k and not k.startswith("champ "):
                        self.removed[("fn", m["access"], k)] = d["to"]
                for k in m["changed"]:
                    self.removed.setdefault(("sig", m["access"], k), (d["to"], m["changed"][k]))
            for x in d["hooks"].values():
                for h in x["removed"]:
                    self.removed[("hook", h)] = d["to"]


# ------------------------------------------------------------------ lecture des mods
def lire_mod(path):
    """Renvoie (nom, {chemin relatif normalisé: contenu texte ou None})."""
    files = {}
    if os.path.isdir(path):
        name = os.path.basename(os.path.normpath(path))
        for dp, _, fn in os.walk(path):
            for f in fn:
                full = os.path.join(dp, f)
                rel = os.path.relpath(full, path).replace("\\", "/")
                files[rel.lower()] = (rel, open(full, encoding="utf-8", errors="replace").read() if f.endswith(".lua") else None)
    else:
        name = os.path.splitext(os.path.basename(path))[0]
        with zipfile.ZipFile(path) as zf:
            for zi in zf.infolist():
                if zi.is_dir():
                    continue
                rel = zi.filename.replace("\\", "/")
                txt = zf.read(zi).decode("utf-8", errors="replace") if rel.endswith(".lua") else None
                files[rel.lower()] = (rel, txt)
    return name, files


def mods_actifs(dossier):
    db = load(os.path.join(dossier, "db.json"))
    if not db:
        sys.exit(f"db.json introuvable dans {dossier}")
    user = os.path.dirname(os.path.normpath(dossier))
    out = []
    for k, m in sorted(db["mods"].items()):
        if not m.get("active"):
            continue
        p = m.get("unpackedPath") or m.get("fullpath")
        if not p:
            continue
        full = os.path.join(user, p.lstrip("/"))
        if os.path.exists(full):
            out.append(full)
        else:
            print(f"(introuvable : {k} -> {full})")
    return out


def vm_of(rel):
    r = rel.lower()
    if r.startswith("lua/vehicle/") or "/lua/" in r and "/vehicle" in r.split("/lua/")[0]:
        return ("vehicle",)
    if r.startswith("lua/common/"):
        return ("ge", "vehicle")
    return ("ge",)


def extension_name(rel):
    """lua/ge/extensions/foo/bar.lua -> foo_bar (nom de la globale créée par extensions.load)."""
    m = re.match(r"lua/(?:ge|vehicle|common)/extensions/(.+)\.lua$", rel, re.I)
    if m:
        return m.group(1).replace("/", "_")
    m = re.match(r"scripts/(.+)\.lua$", rel, re.I)
    if m:
        return m.group(1).replace("/", "_")
    return None


# ------------------------------------------------------------------ analyse
def analyser(api, mods):
    constats = []
    owners = defaultdict(list)
    provided_ext = set()
    defined_names = set()
    for name, files in mods:
        for low, (rel, txt) in files.items():
            owners[low].append(name)
            e = extension_name(rel)
            if e:
                provided_ext.add(e)
                provided_ext.add(e.split("_")[-1])
    for low, who in owners.items():
        if len(who) > 1 and not IGNORE_CONFLICT.match(low):
            constats.append(("CONFLIT", ", ".join(who), low, "fichier fourni par plusieurs mods"))
    game_files = {f.lower() for f in api.files}

    for name, files in mods:
        toks_by_file = {}
        cites = defaultdict(int)   # noms cités par le mod hors définition M.onXxx (appel direct, chaîne queueLuaCommand…)
        for low, (rel, txt) in files.items():
            if low in game_files:
                constats.append(("REMPLACE", name, rel, "remplace le fichier du jeu : à revérifier à chaque mise à jour"))
            if txt is None:
                continue
            try:
                toks = [t for t in tokenize(txt) if t[0] != "com"]
            except Exception as e:  # fichier illisible : on le signale sans s'arrêter
                constats.append(("INCONNU", name, rel, f"fichier Lua non analysable ({e})"))
                continue
            toks_by_file[rel] = toks
            for j, t in enumerate(toks):
                if t[0] == "str":
                    for w in re.findall(r"on[A-Z]\w*", t[1]):
                        cites[w] += 1
                elif t[0] == "name" and t[1].startswith("on") and not (j > 1 and toks[j - 2][1] == "M" and toks[j - 1][1] == "."):
                    cites[t[1]] += 1
            for i, t in enumerate(toks):   # noms définis par le mod (locales, globales, paramètres)
                if t[0] == "name" and i and toks[i - 1][1] in ("local", "function", ",", "(", "for"):
                    defined_names.add(t[1])
                if t[0] == "name" and i + 1 < len(toks) and toks[i + 1] == ("op", "=", toks[i + 1][2]) and (not i or toks[i - 1][1] not in (".", ":")):
                    defined_names.add(t[1])

        for rel, toks in toks_by_file.items():
            seen = set()
            vms = vm_of(rel)
            for i in range(1, len(toks) - 1):   # fonctions globales retirées appelées directement
                t = toks[i]
                if t[0] == "name" and toks[i + 1][1] == "(" and toks[i - 1][1] not in (".", ":", "function")                         and ("global", t[1]) in api.removed and t[1] not in defined_names and ("g", t[1]) not in seen:
                    seen.add(("g", t[1]))
                    constats.append(("RETIRÉ", name, f"{rel}:{t[2]}", f"fonction globale `{t[1]}` retirée en {api.removed[('global', t[1])]}"))
            for i in range(len(toks) - 3):
                a, sep, b, nxt = toks[i], toks[i + 1], toks[i + 2], toks[i + 3]
                if a[0] != "name" or sep[0] != "op" or sep[1] not in (".", ":") or b[0] != "name":
                    continue
                if i and toks[i - 1][1] in (".", ":"):
                    continue
                recv, memb, line = a[1], b[1], a[2]
                called = nxt[1] in ("(", "{") or nxt[0] == "str"
                key = (recv, memb)
                if key in seen:
                    continue
                # extensions.load("x") / extensions.x
                if recv == "extensions" and memb in ("load", "loadModulesInDirectory", "unload", "reload") and nxt[1] == "(" and toks[i + 4][0] == "str":
                    ext = toks[i + 4][1].replace("/", "_")
                    if memb == "load" and ext not in api.extensions and ext not in provided_ext and ("module", ext) not in api.removed:
                        constats.append(("EXTENSION", name, f"{rel}:{line}", f'extensions.load("{toks[i + 4][1]}") : extension inconnue en {api.ver}'))
                    elif ("module", ext) in api.removed:
                        constats.append(("RETIRÉ", name, f"{rel}:{line}", f"extension `{ext}` retirée en {api.removed[('module', ext)]}"))
                    continue
                if recv in LUA_STD or recv in defined_names or recv in provided_ext:
                    continue
                if ("module", recv) in api.removed and not any(recv in api.globals[vm] for vm in vms):
                    seen.add(key)
                    constats.append(("RETIRÉ", name, f"{rel}:{line}", f"module `{recv}` retiré en {api.removed[('module', recv)]}"))
                    continue
                if ("fn", recv, memb) in api.removed:
                    seen.add(key)
                    constats.append(("RETIRÉ", name, f"{rel}:{line}", f"`{recv}.{memb}` retirée en {api.removed[('fn', recv, memb)]}"))
                    continue
                if ("sig", recv, memb) in api.removed and called:
                    seen.add(key)
                    v, c = api.removed[("sig", recv, memb)]
                    constats.append(("INCONNU", name, f"{rel}:{line}", f"`{recv}.{memb}` : paramètres modifiés en {v} ({', '.join(c['old'])}) → ({', '.join(c['new'])})"))
                    continue
                if not called:
                    continue
                known = None
                for vm in vms:
                    if recv in api.globals[vm]:
                        known = (known or set()) | api.globals[vm][recv]
                    if (vm, recv) in api.cpp:
                        known = (known or set()) | api.cpp[(vm, recv)]
                if known is None or memb in known:
                    continue
                seen.add(key)
                constats.append(("INCONNU", name, f"{rel}:{line}", f"`{recv}{sep[1]}{memb}` n'existe pas dans l'API {api.ver}"))
            # hooks définis par le mod
            for i in range(len(toks) - 2):
                if toks[i][1] == "M" and toks[i + 1][1] == "." and toks[i + 2][0] == "name" and re.fullmatch(r"on[A-Z]\w*", toks[i + 2][1]):
                    h = toks[i + 2][1]
                    if ("hook", h) in api.removed:
                        constats.append(("RETIRÉ", name, f"{rel}:{toks[i][2]}", f"hook `{h}` retiré en {api.removed[('hook', h)]} : il ne sera plus appelé"))
                    elif h not in api.hooks and not cites[h]:
                        constats.append(("HOOK", name, f"{rel}:{toks[i][2]}", f"hook `{h}` jamais émis par le Lua du jeu (moteur C++, autre mod, ou faute de frappe)"))
    # dédoublonnage
    out, vus = [], set()
    for c in constats:
        if c not in vus:
            vus.add(c)
            out.append(c)
    out.sort(key=lambda c: (SEVERITE.index(c[0]), c[1], c[2]))
    return out


def main():
    sys.stdout.reconfigure(encoding="utf-8")
    args = sys.argv[1:]
    if not args or args[0] in ("-h", "--help"):
        sys.exit(__doc__)
    ver, out_json, paths = None, None, []
    i = 0
    while i < len(args):
        a = args[i]
        if a == "--version":
            ver = args[i + 1]; i += 2
        elif a == "--json":
            out_json = args[i + 1]; i += 2
        elif a == "--mods-actifs":
            d = args[i + 1] if i + 1 < len(args) and not args[i + 1].startswith("--") else USER_MODS
            paths += mods_actifs(d); i += 2 if d is not USER_MODS else 1
        else:
            paths.append(a); i += 1
    ver = ver or versions()[-1]
    api = Api(ver)
    mods = [lire_mod(p) for p in paths]
    constats = analyser(api, mods)
    print(f"tim19Atlas : vérification de {len(mods)} mod(s) contre l'API BeamNG.drive {ver}\n")
    if not constats:
        print("Aucun problème détecté.")
    par = defaultdict(int)
    for sev, mod, ou, msg in constats:
        par[sev] += 1
        print(f"[{sev}] {mod} — {ou} : {msg}")
    if constats:
        print("\nRésumé : " + ", ".join(f"{par[s]} {s}" for s in SEVERITE if par[s]))
    if out_json:
        with open(out_json, "w", encoding="utf-8") as fh:
            json.dump([{"type": s, "mod": m, "où": o, "message": t} for s, m, o, t in constats], fh, ensure_ascii=False, indent=1)
    sys.exit(1 if par["RETIRÉ"] or par["CONFLIT"] else 0)


if __name__ == "__main__":
    main()
