# -*- coding: utf-8 -*-
"""Atlas de l'API Lua BeamNG : génération des stubs LuaLS et de la doc Markdown.

Usage : python -I generer.py <version>
Entrées (dans atlas-lua/) :
  donnees/<v>/statique.json            extraction statique (extraire.py)
  donnees/<v>/runtime_ge.json          relevé en jeu (facultatif)
  donnees/<v>/runtime_vehicle.json     relevé en jeu (facultatif)
  descriptions/<v>/**/*.json           descriptions rédigées (facultatif)
Sorties :
  stubs/<v>/lua/...                    fichiers ---@meta, même arborescence que le jeu
  doc/<v>/...                          Markdown
"""
import glob, json, os, re, sys, shutil
from collections import defaultdict

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LUA_KW = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in",
          "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
VM_LABEL = {"ge": "Game Engine (GE)", "vehicle": "Véhicule", "common": "Commun (GE + véhicule)", "console": "Console"}


def load(p, default=None):
    if os.path.exists(p):
        with open(p, encoding="utf-8") as fh:
            return json.load(fh)
    return default


def ident(s):
    s = re.sub(r"[^A-Za-z0-9_]", "_", s)
    if not s or s[0].isdigit() or s in LUA_KW:
        s = "_" + s
    return s


def lua_comment(text, prefix="---"):
    if not text:
        return []
    return [prefix + (" " + l if l else "") for l in text.splitlines()]


def md_escape(s):
    return (s or "").replace("|", "\\|").replace("\n", "<br>")


def load_descriptions(v):
    root = os.path.join(BASE, "descriptions", v)
    out = {}
    if not os.path.isdir(root):
        return out
    for dp, _, fn in os.walk(root):
        for f in fn:
            if f.endswith(".json"):
                d = load(os.path.join(dp, f), {})
                items = d if isinstance(d, list) else [d]
                for it in items:
                    if isinstance(it, dict) and it.get("path"):
                        for cd in (it.get("classes") or {}).values():
                            if isinstance(cd, dict) and isinstance(cd.get("functions"), dict):
                                cd["functions"] = {k.split(".")[-1].split(":")[-1]: v for k, v in cd["functions"].items()}
                        # descriptions reportées d'une version précédente dont la signature a changé
                        groups = [it.get("functions") or {}] + [(cd or {}).get("functions") or {} for cd in (it.get("classes") or {}).values() if isinstance(cd, dict)]
                        for g in groups:
                            for fd in g.values():
                                if isinstance(fd, dict) and fd.get("aVerifier"):
                                    fd["desc"] = f"⚠ À revérifier ({fd['aVerifier']}). " + (fd.get("desc") or "")
                        out[it["path"].replace("\\", "/").removeprefix("lua/")] = it
    return out


def class_name(m):
    if m["kind"] == "extension":
        return m["access"]
    if m["globalNames"]:
        return m["globalNames"][0]
    pre = {"controller": "controller_", "powertrain": "powertrain_", "energyStorage": "energyStorage_"}.get(m["kind"], "")
    return ident(pre + m["access"].replace("/", "_"))


def access_text(m):
    a = m["access"]
    if m["kind"] == "extension" and (m.get("returnStyle") == "constructor" or not m["moduleVar"]):
        return f"`require(\"{m['path'][4:-4].split('/', 1)[1]}\")` (fichier sous extensions/ mais pas une extension classique)"
    if m["kind"] == "extension":
        loader = "extensions.load" if m["vm"] != "vehicle" else "extensions.load (VM véhicule)"
        return f"extension `{a}` : `{loader}(\"{a}\")`, puis la globale `{a}`"
    if m["kind"] == "controller":
        return f"contrôleur `{a}` déclaré dans le jbeam (`controller`), accessible par `controller.getController(\"nom\")`"
    if m["kind"] == "powertrain":
        return f"type de composant powertrain `{a}` (jbeam `powertrain`), accessible par `powertrain.getDevice(\"nom\")`"
    if m["kind"] == "energyStorage":
        return f"type de stockage d'énergie `{a}`, accessible par `energyStorage.getStorage(\"nom\")`"
    if m["globalNames"]:
        return "globale " + ", ".join(f"`{g}`" for g in m["globalNames"])
    return f"`require(\"{a}\")`"


def fn_desc(desc, name):
    if not desc:
        return {}
    return (desc.get("functions") or {}).get(name) or {}


def param_type(fd, p):
    pd = (fd.get("params") or {}).get(p)
    if isinstance(pd, dict):
        return pd.get("type") or "any", pd.get("desc") or ""
    if isinstance(pd, str):
        m = re.match(r"^\s*([A-Za-z_][\w.|\[\]<>, ?]*)\s+[—-]\s*(.*)$", pd)
        if m:
            return m.group(1).strip(), m.group(2).strip()
        return "any", pd
    return "any", ""


def stub_function(lines, owner, sep, name, f, fd):
    doc = fd.get("desc") or f.get("doc") or ""
    lines += lua_comment(doc)
    if fd.get("internal"):
        lines.append("---*(interne : appelée par le moteur ou la boucle principale)*")
    lines.append(f"---Source : {f.get('_path', '')}:{f.get('line', '?')}")
    ps = list(f.get("params", []))[1:] if sep == ":" else list(f.get("params", []))
    for p in ps:
        if p == "...":
            t, d = param_type(fd, "...")
            lines.append(f"---@param ... {t} {d}".replace("\n", " ").rstrip())
            continue
        t, d = param_type(fd, p)
        lines.append(f"---@param {ident(p)} {t} {d}".replace("\n", " ").rstrip())
    rets = fd.get("returns")
    if isinstance(rets, str) and rets:
        rets = [rets]
    for r in rets or []:
        if isinstance(r, dict):
            lines.append(f"---@return {r.get('type', 'any')} {r.get('name', '')} {r.get('desc', '')}".replace("\n", " ").rstrip())
        else:
            mm = re.match(r"^\s*([A-Za-z_][\w.|\[\]<>, ?]*)\s+[—-]\s*(.*)$", r)
            lines.append(f"---@return {mm.group(1)} # {mm.group(2)}" if mm else f"---@return any # {r}")
    if fd.get("deprecated"):
        lines.append("---@deprecated")
    pname = ", ".join("..." if p == "..." else ident(p) for p in ps)
    if re.fullmatch(r"[A-Za-z_]\w*", name) and name not in LUA_KW:
        lines.append(f"function {owner}{sep}{name}({pname}) end")
    else:
        lines.append(f"{owner}[{json.dumps(name)}] = function({pname}) end")
    lines.append("")


def make_stub(m, desc, ver):
    cn = class_name(m)
    lines = ["---@meta", f"-- tim19Atlas stub generated from {m['path']} (BeamNG.drive {ver}). Do not edit.",
             "-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).", ""]
    mdesc = (desc or {}).get("module") or m.get("headComment") or ""
    if m["exports"] or m["fields"] or m["moduleVar"]:
        lines += lua_comment(mdesc)
        lines += lua_comment("Accès : " + access_text(m))
        lines.append(f"---@class {cn}")
        for fname, fl in sorted(m["fields"].items()):
            fdd = ((desc or {}).get("fields") or {}).get(fname) or {}
            t = fdd.get("type") if isinstance(fdd, dict) else None
            d = fdd.get("desc") if isinstance(fdd, dict) else (fdd if isinstance(fdd, str) else "")
            if not t:
                t = {"table": "table", "string": "string", "number": "number", "boolean": "boolean", "function": "function"}.get(fl["type"], "any")
            if re.fullmatch(r"[A-Za-z_]\w*", fname):
                lines.append(f"---@field {fname} {t} {d or ''}".rstrip())
        glob = (m["kind"] == "extension" or m["globalNames"])
        lines.append(f"{cn} = {{}}" if glob else f"local {cn} = {{}}")
        lines.append("")
        for fname, f in sorted(m["exports"].items()):
            f = dict(f, _path=m["path"])
            stub_function(lines, cn, ".", fname, f, fn_desc(desc, fname))
    for cls, meths in sorted(m.get("classes", {}).items()):
        ccn = ident(cn + "_" + cls) if m["exports"] else ident(cn if m.get("returnStyle") == "constructor" and len(m["classes"]) == 1 else cn + "_" + cls)
        cd = ((desc or {}).get("classes") or {}).get(cls) or {}
        lines += lua_comment(cd.get("desc") or f"Classe locale `{cls}` de {m['path']}" + (" (instanciée par la fonction renvoyée par le module)" if m.get("returnStyle") == "constructor" else ""))
        lines.append(f"---@class {ccn}")
        lines.append(f"local {ccn} = {{}}")
        lines.append("")
        for fname, f in sorted(meths.items()):
            f = dict(f, _path=m["path"])
            sep = ":" if f.get("method") else "."
            stub_function(lines, ccn, sep, fname, f, (cd.get("functions") or {}).get(fname) or {})
    for gname, f in sorted(m["globalFunctions"].items()):
        f = dict(f, _path=m["path"])
        stub_function(lines, "", "", gname, f, fn_desc(desc, gname))
    for gname, g in sorted(m["globalVariables"].items()):
        if re.fullmatch(r"[A-Za-z_]\w*", gname) and gname not in LUA_KW and gname != (m["globalNames"] or [None])[0]:
            lines.append(f"---@type {g['type'] if g['type'] != 'nil' else 'any'}")
            lines.append(f"{gname} = nil")
    if not (m["kind"] == "extension" or m["globalNames"]) and (m["exports"] or m["fields"]):
        lines.append(f"return {cn}")
    # Lignes "function .name(" invalides pour globales : corriger
    out = "\n".join(l.replace("function (", "function _anon(") for l in lines)
    out = re.sub(r"^function ([A-Za-z_]\w*)\(", r"function \1(", out, flags=re.M)
    return out.replace("\nfunction .", "\nfunction ").replace("\nfunction ", "\nfunction ") + "\n"


def sig(name, f, sep="."):
    ps = f.get("params", [])
    if sep == ":":
        ps = ps[1:]
    return f"{name}({', '.join(ps)})"


def make_md(m, desc, hooks, ver, runtime_names, all_globals=frozenset()):
    cn = class_name(m)
    L = [f"# `{cn}`", "",
         f"*Fichier : `{m['path']}` · VM : {VM_LABEL.get(m['vm'], m['vm'])} · {m['lines']} lignes · BeamNG.drive {ver}*", "",
         f"**Accès :** {access_text(m)}", ""]
    mdesc = (desc or {}).get("module") or m.get("headComment")
    if mdesc:
        L += [mdesc, ""]
    if desc and desc.get("usage"):
        L += ["## Exemple", "", "```lua", desc["usage"].strip(), "```", ""]
    if desc and desc.get("notes"):
        L += ["## Remarques", ""] + [f"- {n}" for n in desc["notes"]] + [""]
    if m["dependencies"]:
        L += ["**Dépendances (chargées avant) :** " + ", ".join(f"`{d}`" for d in m["dependencies"]), ""]
    if m["exports"]:
        L += ["## Fonctions", "", "| Fonction | Description | Ligne |", "|---|---|---|"]
        for fname, f in sorted(m["exports"].items()):
            fd = fn_desc(desc, fname)
            d = fd.get("desc") or f.get("doc") or ""
            if fd.get("internal"):
                d = (d + " " if d else "") + "*(interne)*"
            if fname.startswith("on") and fname[2:3].isupper():
                d = (d + " " if d else "") + "*(hook)*"
            L.append(f"| `{sig(cn + '.' + fname, f)}` | {md_escape(d)} | {f['line']} |")
        L.append("")
        detailed = [(fname, fn_desc(desc, fname)) for fname in sorted(m["exports"]) if fn_desc(desc, fname).get("params") or fn_desc(desc, fname).get("returns")]
        if detailed:
            L += ["### Détail des paramètres", ""]
            for fname, fd in detailed:
                L.append(f"#### `{sig(cn + '.' + fname, m['exports'][fname])}`")
                L.append("")
                if fd.get("desc"):
                    L += [fd["desc"], ""]
                for p in m["exports"][fname].get("params", []):
                    t, d = param_type(fd, p)
                    L.append(f"- `{p}` (*{t}*) : {d}")
                rets = fd.get("returns")
                if isinstance(rets, str):
                    rets = [rets]
                for r in rets or []:
                    L.append(f"- **renvoie** : {r if isinstance(r, str) else (r.get('type', '') + ' ' + r.get('desc', ''))}")
                L.append("")
    if m["fields"]:
        L += ["## Champs", "", "| Champ | Type | Description |", "|---|---|---|"]
        for fname, fl in sorted(m["fields"].items()):
            fdd = ((desc or {}).get("fields") or {}).get(fname)
            d = fdd.get("desc") if isinstance(fdd, dict) else (fdd or fl.get("doc") or "")
            t = (fdd.get("type") if isinstance(fdd, dict) else None) or fl["type"]
            note = ""
            if fl.get("ref") and fl["ref"] not in ("true", "false", "nil") and not fl.get("refKnown") and fl["ref"] not in runtime_names and fl["ref"] not in all_globals:
                note = " ⚠ référence `" + fl["ref"] + "` non définie dans le fichier (vaut probablement nil)"
            L.append(f"| `{fname}` | {t} | {md_escape(d)}{note} |")
        L.append("")
    for cls, meths in sorted(m.get("classes", {}).items()):
        L += [f"## Classe `{cls}`", ""]
        cd = ((desc or {}).get("classes") or {}).get(cls) or {}
        if cd.get("desc"):
            L += [cd["desc"], ""]
        if cls in m.get("_instvars", ()):
            L += [f"Objet `{cls}` construit dans le module (par ex. par `new`), avec ces méthodes :", ""]
        elif m.get("returnStyle") == "constructor":
            L += [f"Le module renvoie un constructeur : `local obj = require(\"{m['access']}\")(options)`.", ""]
        L += ["| Méthode | Description | Ligne |", "|---|---|---|"]
        for fname, f in sorted(meths.items()):
            sep = ":" if f.get("method") else "."
            fdc = (cd.get("functions") or {}).get(fname) or {}
            L.append(f"| `{sig(cls + sep + fname, f, sep)}` | {md_escape(fdc.get('desc') or f.get('doc'))} | {f['line']} |")
        L.append("")
    if m["globalFunctions"]:
        L += ["## Fonctions globales définies ici", "", "| Fonction | Description | Ligne |", "|---|---|---|"]
        for g, f in sorted(m["globalFunctions"].items()):
            fd = fn_desc(desc, g)
            L.append(f"| `{sig(g, f)}` | {md_escape(fd.get('desc') or f.get('doc'))} | {f['line']} |")
        L.append("")
    if m["globalVariables"]:
        L += ["**Globales affectées :** " + ", ".join(f"`{g}`" for g in sorted(m["globalVariables"])), ""]
    if m["hooksFired"]:
        L += ["## Hooks émis", "", "Évènements diffusés aux extensions par `extensions.hook` :", ""]
        for h, c in sorted(m["hooksFired"].items()):
            impl = hooks.get(m["vm"], {}).get(h, {}).get("implementedBy", [])
            L.append(f"- `{h}`" + (f" — écouté par {len(impl)} module(s)" if impl else ""))
        L.append("")
    if m["guiEvents"]:
        L += ["**Évènements UI (guihooks.trigger) :** " + ", ".join(f"`{e}`" for e in sorted(m["guiEvents"])), ""]
    if m["cppCalls"]:
        L += ["## Appels vers le moteur (C++)", ""]
        for recv, meths in sorted(m["cppCalls"].items()):
            L.append(f"- `{recv}` " + ", ".join(f"`{x}`" for x in sorted(meths)))
        L.append("")
    if m["extensionLoads"]:
        L += ["**Charge les extensions :** " + ", ".join(f"`{e}`" for e in sorted(m["extensionLoads"])), ""]
    L += ["---", f"*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `{m['path']}`.*"]
    return "\n".join(L) + "\n"


def split_type(t):
    """'class<X>' -> ('class', 'X')"""
    m = re.match(r"^(\w+)<(.+)>$", t or "")
    return (m.group(1), m.group(2)) if m else ("?", t or "?")


def lua_id(name):
    return ident(name.replace("::", "_"))


def cpp_section(rt, usage, vlabel):
    C = [f"# Classes et objets C++ exposés au Lua — BeamNG.drive {vlabel}", "",
         "Relevé en jeu par le mod `tim19_atlas` (métatables luaBinding) et complété par les appels trouvés dans le Lua du jeu.",
         "Les paramètres des fonctions C++ ne sont pas visibles depuis le Lua : les stubs les déclarent en `...`.",
         "Accès : `objet:methode(...)` pour une instance (`obj`, `be`, un objet de la scène), `Module.fonction(...)` pour un module.", ""]
    stubs = {}
    ID = r"[A-Za-z_]\w*"
    PAR = "---@param ... any\n---@return any\n"
    for vm in ("ge", "vehicle"):
        L = ["---@meta", f"-- tim19Atlas: C++ objects exposed to Lua ({vm} VM), BeamNG.drive {vlabel}. Do not edit.",
             "-- Collected from the running game by the tim19_atlas mod. Contributor: Tim0219800 (tim19Atlas). See LICENSE.", ""]
        d = rt.get(vm)
        C += [f"## {VM_LABEL[vm]}", ""]
        uses = {recv.rstrip(":."): meths for (uvm, recv), meths in usage.items() if uvm == vm}
        if not d:
            C += ["*Relevé en jeu pas encore fait.*", ""]
            for r, meths in sorted(uses.items()):
                C.append(f"- **`{r}`** : " + ", ".join(f"`{k}`" for k in sorted(meths)))
            stubs[vm] = L
            C.append("")
            continue
        classes = d["classes"]
        for c in classes.values():
            for key in ("methods", "getters", "setters"):
                if not isinstance(c.get(key), list):
                    c[key] = sorted(c.get(key) or {})
        for mp in (d.get("modules") or {}).values():
            if isinstance(mp, dict) and not isinstance(mp.get("functions"), list):
                mp["functions"] = sorted(mp.get("functions") or {})
        inst, stat, mods = {}, {}, {}
        for t, c in classes.items():
            kind, name = split_type(t)
            {"class": inst, "static_class": stat, "module": mods}.get(kind, inst)[name] = c

        def props(c):
            ms = set(c["methods"])
            return [g for g in c["getters"] if g not in ms], [x for x in c["setters"] if x not in ms]

        gl = sorted((k, g["class"]) for k, g in d["globals"].items() if g.get("class"))
        typed = [(k, t) for k, t in gl if split_type(t)[0] == "class"]
        C += [f"Relevé : {len(inst)} classes d'instance, {len(mods)} modules, {len(stat)} classes statiques (constructeurs), "
              f"{len(d.get('instances', {}))} types d'objets rencontrés.", ""]
        if typed:
            C += ["### Objets globaux", "", "| Globale | Classe | Méthodes | Appels dans le Lua du jeu |", "|---|---|---|---|"]
            for k, t in typed:
                n = split_type(t)[1]
                C.append(f"| `{k}` | `{n}` | {len(inst.get(n, {}).get('methods', []))} | {sum(uses.get(k, {}).values())} |")
            C.append("")
        raw = d.get("modules", {})
        roots = {k for k, v in raw.items() if "." not in k and isinstance(v, dict) and (v.get("type") or "").startswith("module<")}
        modpaths = {}
        for k, v in raw.items():
            segs = k.split(".")
            if segs[0] in roots and not any(x.startswith("__") for x in segs) and isinstance(v, dict):
                modpaths[k] = dict(v, functions=sorted(set(v.get("functions") or [])))
        if modpaths:
            C += ["### Modules", ""]
            for path in sorted(p for p in modpaths if "." not in p):
                mt = modpaths[path]
                fns = mt.get("functions", []) if isinstance(mt, dict) else []
                C += [f"#### `{path}`", "", ("Fonctions : " + ", ".join(f"`{f}`" for f in fns)) if fns else "*(aucune fonction directe)*", ""]
                if not re.fullmatch(ID, path):
                    continue
                L += [f"---@class {lua_id(path)}_module", f"{path} = {{}}"]
                L += [f"{PAR}function {path}.{f}(...) end" for f in fns if re.fullmatch(ID, f) and f not in LUA_KW]
                for sub in sorted(p for p in modpaths if p.startswith(path + ".")):
                    sfns = modpaths[sub].get("functions", []) if isinstance(modpaths[sub], dict) else []
                    C.append(f"- `{sub}` : " + (", ".join(f"`{f}`" for f in sfns) or "—"))
                    if not all(re.fullmatch(ID, x) and x not in LUA_KW for x in sub.split(".")):
                        continue
                    L += [f"{sub} = {{}}"] + [f"{PAR}function {sub}.{f}(...) end" for f in sfns if re.fullmatch(ID, f) and f not in LUA_KW]
                C.append("")
                L.append("")
        C += ["### Classes d'instance", ""]
        for n, c in sorted(inst.items()):
            sup = split_type(c.get("super"))[1] if c.get("super") else None
            pr, pw = props(c)
            ex = d.get("instances", {}).get(f"class<{n}>")
            C += [f"#### Classe `{n}`" + (f" (hérite de `{sup}`)" if sup else ""), ""]
            if ex:
                C.append(f"Exemple rencontré : `{ex}`.  ")
            if c["methods"]:
                C.append(f"**Méthodes ({len(c['methods'])})** : " + ", ".join(f"`{x}`" for x in c["methods"]))
            if pr:
                C.append(f"\n**Propriétés lisibles ({len(pr)})** : " + ", ".join(f"`{x}`" for x in pr))
            if pw:
                C.append(f"\n**Propriétés modifiables ({len(pw)})** : " + ", ".join(f"`{x}`" for x in pw))
            C.append("")
            L.append(f"---@class {lua_id(n)}" + (f" : {lua_id(sup)}" if sup and sup != "?" else ""))
            for g in pr:
                if re.fullmatch(ID, g):
                    L.append(f"---@field {g} any" + (" modifiable" if g in pw else ""))
            L.append(f"local {lua_id(n)} = {{}}")
            for meth in c["methods"]:
                if re.fullmatch(ID, meth) and meth not in LUA_KW:
                    L.append(f"{PAR}function {lua_id(n)}:{meth}(...) end")
            L.append("")
        nonvide = {n: c for n, c in stat.items() if c["methods"] or props(c)[0]}
        C += ["### Classes statiques (globales-constructeurs)", "",
              f"{len(stat)} globales du même nom que leur classe (ex. `BeamNGVehicle`, `TSStatic`, `Point3F`). "
              f"Avec fonctions propres : {len(nonvide)}. Sans : " +
              ", ".join(f"`{n}`" for n in sorted(stat) if n not in nonvide), ""]
        for n, c in sorted(nonvide.items()):
            C.append(f"- `{n}` : " + ", ".join(f"`{x}`" for x in c["methods"] + props(c)[0]))
        C.append("")
        for n, c in sorted(stat.items()):
            if not re.fullmatch(ID, n) or n not in d["globals"] or n in modpaths:
                continue
            L.append(f"---@class {lua_id(n)}_static" + (f"\n---@operator call: {lua_id(n)}" if n in inst else ""))
            L.append(f"{n} = {{}}")
            for meth in c["methods"]:
                if re.fullmatch(ID, meth) and meth not in LUA_KW:
                    L.append(f"{PAR}function {n}.{meth}(...) end")
            L.append("")
        for k, t in typed:
            if re.fullmatch(ID, k) and k not in stat and k not in modpaths:
                L += [f"---@type {lua_id(split_type(t)[1])}", f"{k} = nil", ""]
        C += ["### Appels C++ du Lua du jeu", "",
              "Méthodes appelées par le code Lua du jeu (nombre d'appels). En *italique* : absentes du relevé en jeu.", ""]
        for r, meths in sorted(uses.items()):
            g = d["globals"].get(r, {})
            n = split_type(g.get("class"))[1] if g.get("class") else r
            known = set(inst.get(n, {}).get("methods", [])) | set(inst.get(n, {}).get("getters", []))
            mp = modpaths.get(r)
            if isinstance(mp, dict):
                known |= set(mp.get("functions", []))
            C.append(f"- **`{r}`** : " + ", ".join((f"`{k}`×{c}" if (k in known or not known) else f"*`{k}`×{c}*")
                                               for k, c in sorted(meths.items(), key=lambda x: -x[1])))
        C.append("")
        stubs[vm] = L
    return C, stubs


def md_path(rel):
    return rel[:-4] + ".md"


def main():
    ver = sys.argv[1]
    st = load(os.path.join(BASE, "donnees", ver, "statique.json"))
    descs = load_descriptions(ver)
    rt = {vm: load(os.path.join(BASE, "donnees", ver, f"runtime_{vm}.json")) for vm in ("ge", "vehicle")}
    runtime_names = set()
    for d in rt.values():
        if d:
            runtime_names |= set(d.get("globals", {}))
    build = st["meta"].get("build", "")
    vlabel = f"{ver} ({build})" if build else ver

    sdir = os.path.join(BASE, "stubs", ver)
    ddir = os.path.join(BASE, "doc", ver)
    for d in (sdir, ddir):
        if os.path.isdir(d):
            shutil.rmtree(d)
    hooks = st["hooks"]
    all_globals = set()
    for mm in st["modules"].values():
        all_globals |= set(mm["globalNames"]) | set(mm["globalFunctions"]) | set(mm["globalVariables"])
        if mm["kind"] == "extension":
            all_globals.add(mm["access"])
    all_globals |= {"nop", "print", "log", "dump"}
    index = defaultdict(list)
    for rel, m in sorted(st["modules"].items()):
        for var, meths in m.get("instances", {}).items():
            m.setdefault("classes", {}).setdefault(var, {}).update({k: v for k, v in meths.items() if k not in m["classes"].get(var, {})})
            m.setdefault("_instvars", set()).add(var)
        desc = descs.get(rel)
        if desc:  # fonctions décrites mais assignées dynamiquement (M.updateGFX = ... dans init, device.x = ...)
            for fname, fd in (desc.get("functions") or {}).items():
                if fname not in m["exports"] and fname not in m["globalFunctions"] and re.fullmatch(r"[A-Za-z_]\w*", fname):
                    m["fields"].pop(fname, None)
                    m["exports"][fname] = {"name": fname, "params": list((fd.get("params") or {}).keys()), "line": "dyn",
                                           "doc": "", "dynamic": True}
                    fd.setdefault("desc", "")
                    fd["desc"] = (fd["desc"] + " " if fd["desc"] else "") + "(assignée dynamiquement)"
            for cls, cd in (desc.get("classes") or {}).items():
                tgt = m.setdefault("classes", {}).setdefault(cls, {})
                for fname, fd in (cd.get("functions") or {}).items():
                    fname = fname.split(".")[-1].split(":")[-1]
                    if fname not in tgt and re.fullmatch(r"[A-Za-z_]\w*", fname):
                        tgt[fname] = {"name": fname, "params": [cls] + list((fd.get("params") or {}).keys()), "line": "dyn", "doc": "", "method": True}
                if cls not in m.get("instances", {}) and tgt and cls in m.get("_instvars", set()) | set(m.get("instances", {})):
                    pass
        stub = make_stub(m, desc, vlabel)
        p = os.path.join(sdir, "lua", rel)
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w", encoding="utf-8") as fh:
            fh.write(stub)
        p = os.path.join(ddir, md_path(rel))
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w", encoding="utf-8") as fh:
            fh.write(make_md(m, desc, hooks, vlabel, runtime_names, all_globals))
        short = ((desc or {}).get("module") or m.get("headComment") or "").split("\n")[0][:140]
        index[(m["vm"], m["kind"])].append((rel, class_name(m), len(m["exports"]) + sum(len(c) for c in m.get("classes", {}).values()), short, bool(desc)))

    # index
    kinds = {"module": "Modules", "extension": "Extensions", "controller": "Contrôleurs", "powertrain": "Powertrain",
             "energyStorage": "Stockage d'énergie"}
    L = [f"# Atlas de l'API Lua BeamNG.drive {vlabel}", "",
         "Généré par tim19Atlas à partir du code Lua du jeu (lecture seule). ",
         "✍ = description rédigée et vérifiée ; sinon : signatures et commentaires d'origine.", "",
         "- [Hooks (évènements)](hooks.md)", "- [Classes C++ exposées](cpp.md)", *(["- [Changements depuis la version précédente](changements.md)"] if glob.glob(os.path.join(BASE, "donnees", ver, "diff-*.json")) else []), "- [Mode d'emploi des stubs LuaLS](../../README.md)", ""]
    for vm in ("vehicle", "ge", "common", "console"):
        L += [f"## {VM_LABEL[vm]}", ""]
        for kind in ("module", "controller", "powertrain", "energyStorage", "extension"):
            items = index.get((vm, kind))
            if not items:
                continue
            L += [f"### {kinds[kind]} ({len(items)})", "", "| Nom | Fonctions | Résumé |", "|---|---|---|"]
            for rel, cn, nf, short, has in items:
                L.append(f"| [{'✍ ' if has else ''}`{cn}`]({md_path(rel)}) | {nf} | {md_escape(short)} |")
            L.append("")
    with open(os.path.join(ddir, "index.md"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(L) + "\n")

    # hooks
    H = [f"# Hooks — BeamNG.drive {vlabel}", "",
         "Un hook est une fonction `M.onXxx` d'une extension, appelée par `extensions.hook(\"onXxx\", ...)`. ",
         "« Émis par » = modules Lua qui le déclenchent ; s'il est vide, il est appelé par le moteur C++ ou par du code construit dynamiquement.", ""]
    for vm in ("ge", "vehicle", "common"):
        hs = hooks.get(vm, {})
        if not hs:
            continue
        H += [f"## {VM_LABEL[vm]} ({len(hs)})", "", "| Hook | Émis par | Écouté par |", "|---|---|---|"]
        for h, d in sorted(hs.items()):
            fb = ", ".join(f"`{x}`" for x in d["firedBy"][:6]) + (" …" if len(d["firedBy"]) > 6 else "")
            ib = f"{len(d['implementedBy'])} : " + ", ".join(f"`{x}`" for x in d["implementedBy"][:5]) + (" …" if len(d["implementedBy"]) > 5 else "") if d["implementedBy"] else ""
            H.append(f"| `{h}` | {fb or '*moteur*'} | {ib} |")
        H.append("")
    with open(os.path.join(ddir, "hooks.md"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(H) + "\n")

    # C++ : usage statique + relevé en jeu
    usage = defaultdict(lambda: defaultdict(int))
    for m in st["modules"].values():
        for recv, meths in m["cppCalls"].items():
            for k, c in meths.items():
                usage[(m["vm"] if m["vm"] != "common" else "ge", recv)][k] += c
    C, cpp_stub = cpp_section(rt, usage, vlabel)
    with open(os.path.join(ddir, "cpp.md"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(C) + "\n")
    for vm, lines in cpp_stub.items():
        p = os.path.join(sdir, "cpp", f"{vm}.lua")
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w", encoding="utf-8") as fh:
            fh.write("\n".join(lines) + "\n")
    # page des changements (diff-<ancienne>.json produit par comparer.py), recréée car doc/<v> est effacé plus haut
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    from comparer import render
    for dp in sorted(glob.glob(os.path.join(BASE, "donnees", ver, "diff-*.json"))):
        dd = load(dp)
        with open(os.path.join(ddir, "changements.md"), "w", encoding="utf-8") as fh:
            fh.write(render(dd, dd["from"], dd["to"]))
    print(f"stubs + doc : {len(st['modules'])} modules, {len(descs)} descriptions, runtime ge={bool(rt['ge'])} vehicle={bool(rt['vehicle'])}")


if __name__ == "__main__":
    main()
