# -*- coding: utf-8 -*-
"""Aperçu rapide du JSON statique : python -I voir.py <statique.json> [module_rel ...]"""
import json, sys, collections
sys.stdout.reconfigure(encoding="utf-8")
d = json.load(open(sys.argv[1], encoding="utf-8"))
mods = d["modules"]
if len(sys.argv) == 2:
    print("erreurs:", d["errors"][:5])
    print(collections.Counter((m["vm"], m["kind"]) for m in mods.values()))
    sans = [r for r, m in mods.items() if not m["moduleVar"]]
    print("sans moduleVar:", len(sans), sans[:40])
    vides = [r for r, m in mods.items() if m["moduleVar"] and not m["exports"]]
    print("moduleVar sans exports:", len(vides), vides[:30])
    print("hooks ge:", len(d["hooks"].get("ge", {})), "vehicle:", len(d["hooks"].get("vehicle", {})))
for rel in sys.argv[2:]:
    m = mods[rel]
    print("==", rel, m["moduleVar"], m["access"], m["globalNames"], m["kind"])
    for k, e in m["exports"].items():
        print("  fn", k, e["params"], e["line"], repr(e["doc"][:80]))
    for k, f in m["fields"].items():
        print("  field", k, f["type"], f["ref"])
    print("  globalsFn", list(m["globalFunctions"])[:20])
    print("  qualified", list(m["qualifiedFunctions"])[:20])
    print("  globalsVar", list(m["globalVariables"])[:20])
    print("  hooksFired", m["hooksFired"])
    print("  cpp", {k: list(v)[:15] for k, v in m["cppCalls"].items()})
    print("  deps", m["dependencies"], "head", repr(m["headComment"][:200]))
