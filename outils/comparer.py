# -*- coding: utf-8 -*-
"""Atlas de l'API Lua BeamNG : diff d'API entre deux versions du jeu.

Usage : python -I outils/comparer.py <ancienne> <nouvelle>      ex. 0.40.5 0.41.0
Entrées : donnees/<v>/statique.json (obligatoire), donnees/<v>/runtime_ge.json et runtime_vehicle.json (facultatifs)
Sorties :
  donnees/<nouvelle>/diff-<ancienne>.json   diff lisible par machine (utilisé par verifier_mod.py)
  doc/<nouvelle>/changements.md             page « Changements depuis <ancienne> »
"""
import json, os, sys
from collections import defaultdict

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
VM_LABEL = {"ge": "GE", "vehicle": "Véhicule", "common": "Commun", "console": "Console"}


def load(p, default=None):
    if os.path.exists(p):
        with open(p, encoding="utf-8") as fh:
            return json.load(fh)
    return default


def api_of(m):
    """Inventaire d'un module : {clé: params ou None}. Clés : 'nom', 'Classe:methode', 'champ nom'."""
    out = {}
    for src in ("exports", "globalFunctions"):
        for k, f in m.get(src, {}).items():
            out[k] = list(f.get("params", []))
    for group in ("classes", "instances"):
        for cls, meths in m.get(group, {}).items():
            for k, f in meths.items():
                ps = list(f.get("params", []))
                if f.get("method") and ps[:1] == ["self"]:
                    ps = ps[1:]
                out[f"{cls}:{k}"] = ps
    for k in m.get("fields", {}):
        out.setdefault(f"champ {k}", None)
    for k in m.get("globalVariables", {}):
        out.setdefault(f"champ {k}", None)
    return out


def diff_dict(a, b):
    """Renvoie (ajoutés, retirés, modifiés) pour deux inventaires {clé: params}."""
    add = sorted(set(b) - set(a))
    rem = sorted(set(a) - set(b))
    chg = sorted(k for k in set(a) & set(b) if a[k] is not None and b[k] is not None and a[k] != b[k])
    return add, rem, chg


def compare_static(sa, sb):
    ma, mb = sa["modules"], sb["modules"]
    added = sorted(set(mb) - set(ma))
    removed = sorted(set(ma) - set(mb))
    # déplacements : même nom d'accès, même VM, chemin différent
    by_access = defaultdict(list)
    for p in added:
        by_access[(mb[p]["vm"], mb[p]["access"])].append(p)
    moved = {}
    for p in removed:
        cand = by_access.get((ma[p]["vm"], ma[p]["access"]), [])
        if len(cand) == 1:
            moved[p] = cand[0]
    added = [p for p in added if p not in moved.values()]
    removed = [p for p in removed if p not in moved]

    modules = {}
    pairs = [(p, p) for p in sorted(set(ma) & set(mb))] + sorted(moved.items())
    for pa, pb in pairs:
        a, b = api_of(ma[pa]), api_of(mb[pb])
        add, rem, chg = diff_dict(a, b)
        if add or rem or chg or pa != pb:
            modules[pb] = {
                "vm": mb[pb]["vm"], "access": mb[pb]["access"], "from": pa if pa != pb else None,
                "added": {k: b[k] for k in add},
                "removed": {k: a[k] for k in rem},
                "changed": {k: {"old": a[k], "new": b[k]} for k in chg},
            }

    hooks = {}
    for vm in sorted(set(sa["hooks"]) | set(sb["hooks"])):
        ha, hb = sa["hooks"].get(vm, {}), sb["hooks"].get(vm, {})
        emit = {}
        for h in set(ha) & set(hb):
            fa, fb = set(ha[h]["firedBy"]), set(hb[h]["firedBy"])
            if fa != fb:
                emit[h] = {"plus": sorted(fb - fa), "moins": sorted(fa - fb)}
        hooks[vm] = {"added": sorted(set(hb) - set(ha)), "removed": sorted(set(ha) - set(hb)), "emitters": emit}

    return {
        "modulesAdded": {p: {"vm": mb[p]["vm"], "access": mb[p]["access"], "api": sorted(api_of(mb[p]))} for p in added},
        "modulesRemoved": {p: {"vm": ma[p]["vm"], "access": ma[p]["access"], "api": sorted(api_of(ma[p]))} for p in removed},
        "modulesMoved": moved,
        "modules": modules,
        "hooks": hooks,
    }


def cpp_inventory(rt):
    """{'class<X>': set(membres)}, {'Module': set(fonctions)}, set(globales)."""
    if not rt:
        return None
    classes = {k: set(c.get("methods") or []) | set(c.get("getters") or []) | set(c.get("setters") or [])
               | set(c.get("constants") or {}) for k, c in rt.get("classes", {}).items()}
    mods = {k: set(m.get("functions") or []) for k, m in rt.get("modules", {}).items()}
    return classes, mods, set(rt.get("globals", {}))


def compare_cpp(ra, rb):
    ia, ib = cpp_inventory(ra), cpp_inventory(rb)
    if not ia or not ib:
        return None
    out = {}
    for idx, name in ((0, "classes"), (1, "modules")):
        a, b = ia[idx], ib[idx]
        ch = {}
        for k in set(a) & set(b):
            if a[k] != b[k]:
                ch[k] = {"added": sorted(b[k] - a[k]), "removed": sorted(a[k] - b[k])}
        out[name] = {"added": sorted(set(b) - set(a)), "removed": sorted(set(a) - set(b)), "changed": ch}
    out["globals"] = {"added": sorted(ib[2] - ia[2]), "removed": sorted(ia[2] - ib[2])}
    return out


def sig(k, ps):
    if ps is None:
        return f"`{k}`"
    return f"`{k}({', '.join(ps)})`"


def md_link(p):
    return f"[`{p}`]({p[:-4]}.md)"


def render(d, va, vb):
    s = d["stats"]
    L = [f"# Changements de l'API Lua : {va} → {vb}", "",
         "Page générée par `outils/comparer.py` à partir des extractions statiques des deux versions"
         + (" et des relevés C++ en jeu." if d.get("cpp") else "."),
         "Une **rupture** (fonction ou module retiré, paramètres modifiés) peut casser un mod. "
         "Vérifier un mod : `python -I outils/verifier_mod.py <mod> --version " + vb + "`.", "",
         "| | Ajouts | Retraits | Modifiés |", "|---|---|---|---|",
         f"| Modules | {s['modulesAdded']} | {s['modulesRemoved']} | {s['modulesMoved']} déplacés |",
         f"| Fonctions et champs | {s['fnAdded']} | {s['fnRemoved']} | {s['fnChanged']} signatures |",
         f"| Hooks | {s['hooksAdded']} | {s['hooksRemoved']} | |"]
    if d.get("cpp"):
        c = d["cpp"]
        L.append(f"| Classes C++ | {len(c['classes']['added'])} | {len(c['classes']['removed'])} | {len(c['classes']['changed'])} |")
        L.append(f"| Modules C++ | {len(c['modules']['added'])} | {len(c['modules']['removed'])} | {len(c['modules']['changed'])} |")
    L.append("")

    # ruptures d'abord
    L += ["## Ruptures", ""]
    rupt = False
    if d["modulesRemoved"]:
        rupt = True
        L += ["### Modules retirés", ""]
        for p, m in d["modulesRemoved"].items():
            L.append(f"- `{p}` ({VM_LABEL.get(m['vm'], m['vm'])}, `{m['access']}`) : {len(m['api'])} éléments")
        L.append("")
    rows = []
    for p, m in sorted(d["modules"].items()):
        for k, ps in m["removed"].items():
            rows.append(f"| {md_link(p)} | retiré | {sig(k, ps)} |")
        for k, c in m["changed"].items():
            rows.append(f"| {md_link(p)} | paramètres | `{k}({', '.join(c['old'])})` → `({', '.join(c['new'])})` |")
    if rows:
        rupt = True
        L += ["### Fonctions retirées ou modifiées", "", "| Module | Changement | Élément |", "|---|---|---|"] + rows + [""]
    hrem = [(vm, h) for vm, x in d["hooks"].items() for h in x["removed"]]
    if hrem:
        rupt = True
        L += ["### Hooks disparus", "", "Plus aucun module Lua ne les émet ni ne les écoute (le moteur C++ peut encore en émettre certains).", ""]
        L += [f"- {VM_LABEL.get(vm, vm)} : `{h}`" for vm, h in hrem] + [""]
    if d.get("cpp"):
        c = d["cpp"]
        rows = [f"- classe `{k}` retirée" for k in c["classes"]["removed"]]
        rows += [f"- `{k}` : retiré " + ", ".join(f"`{x}`" for x in v["removed"]) for k, v in sorted(c["classes"]["changed"].items()) if v["removed"]]
        rows += [f"- module C++ `{k}` retiré" for k in c["modules"]["removed"]]
        rows += [f"- `{k}` : retiré " + ", ".join(f"`{x}`" for x in v["removed"]) for k, v in sorted(c["modules"]["changed"].items()) if v["removed"]]
        if rows:
            rupt = True
            L += ["### C++", ""] + rows + [""]
    if not rupt:
        L += ["Aucune rupture détectée.", ""]

    # ajouts
    L += ["## Nouveautés", ""]
    if d["modulesAdded"]:
        L += ["### Nouveaux modules", "", "| Module | VM | Accès | Éléments |", "|---|---|---|---|"]
        for p, m in d["modulesAdded"].items():
            L.append(f"| {md_link(p)} | {VM_LABEL.get(m['vm'], m['vm'])} | `{m['access']}` | {len(m['api'])} |")
        L.append("")
    if d["modulesMoved"]:
        L += ["### Modules déplacés", ""] + [f"- `{a}` → {md_link(b)}" for a, b in d["modulesMoved"].items()] + [""]
    rows = []
    for p, m in sorted(d["modules"].items()):
        if m["added"]:
            rows.append(f"| {md_link(p)} | " + ", ".join(sig(k, ps) for k, ps in m["added"].items()) + " |")
    if rows:
        L += ["### Fonctions et champs ajoutés", "", "| Module | Ajouts |", "|---|---|"] + rows + [""]
    hadd = [(vm, h) for vm, x in d["hooks"].items() for h in x["added"]]
    if hadd:
        L += ["### Nouveaux hooks", ""] + [f"- {VM_LABEL.get(vm, vm)} : `{h}`" for vm, h in hadd] + [""]
    emit = [(vm, h, e) for vm, x in d["hooks"].items() for h, e in sorted(x["emitters"].items())]
    if emit:
        L += ["### Hooks émis par d'autres modules", "", "| VM | Hook | Nouveaux émetteurs | Ne l'émettent plus |", "|---|---|---|---|"]
        for vm, h, e in emit:
            L.append(f"| {VM_LABEL.get(vm, vm)} | `{h}` | {', '.join(e['plus'])} | {', '.join(e['moins'])} |")
        L.append("")
    if d.get("cpp"):
        c = d["cpp"]
        rows = [f"- classe `{k}`" for k in c["classes"]["added"]]
        rows += [f"- `{k}` : " + ", ".join(f"`{x}`" for x in v["added"]) for k, v in sorted(c["classes"]["changed"].items()) if v["added"]]
        rows += [f"- module C++ `{k}`" for k in c["modules"]["added"]]
        rows += [f"- `{k}` : " + ", ".join(f"`{x}`" for x in v["added"]) for k, v in sorted(c["modules"]["changed"].items()) if v["added"]]
        if rows:
            L += ["### C++", ""] + rows + [""]
    return "\n".join(L) + "\n"


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    va, vb = sys.argv[1], sys.argv[2]
    sa = load(os.path.join(BASE, "donnees", va, "statique.json"))
    sb = load(os.path.join(BASE, "donnees", vb, "statique.json"))
    if not sa or not sb:
        sys.exit("statique.json manquant : lancer d'abord outils/extraire.py pour les deux versions")
    d = {"from": va, "to": vb, "buildFrom": sa["meta"].get("build"), "buildTo": sb["meta"].get("build")}
    d.update(compare_static(sa, sb))
    cpp = {}
    for vm in ("ge", "vehicle"):
        c = compare_cpp(load(os.path.join(BASE, "donnees", va, f"runtime_{vm}.json")),
                        load(os.path.join(BASE, "donnees", vb, f"runtime_{vm}.json")))
        if c:
            cpp[vm] = c
    if cpp:  # fusion des deux VM pour la page (les noms ne se recouvrent pas en pratique)
        merged = {}
        for part in ("classes", "modules"):
            merged[part] = {"added": [], "removed": [], "changed": {}}
            for vm, c in cpp.items():
                merged[part]["added"] += [f"{x} ({vm})" for x in c[part]["added"]]
                merged[part]["removed"] += [f"{x} ({vm})" for x in c[part]["removed"]]
                merged[part]["changed"].update({f"{k} ({vm})": v for k, v in c[part]["changed"].items()})
        d["cpp"] = merged
        d["cppByVm"] = cpp
    mods = d["modules"].values()
    d["stats"] = {
        "modulesAdded": len(d["modulesAdded"]), "modulesRemoved": len(d["modulesRemoved"]), "modulesMoved": len(d["modulesMoved"]),
        "fnAdded": sum(len(m["added"]) for m in mods), "fnRemoved": sum(len(m["removed"]) for m in mods),
        "fnChanged": sum(len(m["changed"]) for m in mods),
        "hooksAdded": sum(len(x["added"]) for x in d["hooks"].values()),
        "hooksRemoved": sum(len(x["removed"]) for x in d["hooks"].values()),
    }
    out = os.path.join(BASE, "donnees", vb, f"diff-{va}.json")
    with open(out, "w", encoding="utf-8") as fh:
        json.dump(d, fh, ensure_ascii=False, indent=1)
    page = os.path.join(BASE, "doc", vb, "changements.md")
    os.makedirs(os.path.dirname(page), exist_ok=True)
    with open(page, "w", encoding="utf-8") as fh:
        fh.write(render(d, va, vb))
    print(json.dumps(d["stats"], ensure_ascii=False))
    print("écrit :", out, "et", page)


if __name__ == "__main__":
    main()
