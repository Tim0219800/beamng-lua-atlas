# -*- coding: utf-8 -*-
"""Reporte les descriptions rédigées d'une version du jeu sur la suivante.

Usage : python -I outils/reporter_descriptions.py <ancienne> <nouvelle>
Prérequis : donnees/<nouvelle>/diff-<ancienne>.json (outils/comparer.py).

- copie descriptions/<ancienne>/ vers descriptions/<nouvelle>/ (sans écraser un fichier déjà présent) ;
- suit les modules déplacés (nouveau chemin, champ "path" mis à jour) ;
- ne copie pas les modules retirés ;
- supprime les fonctions et champs retirés ;
- marque "aVerifier" les fonctions dont les paramètres ont changé (affiché « ⚠ À revérifier » par generer.py) ;
- écrit donnees/<nouvelle>/lots_nouveaux.json : modules nouveaux ou modifiés à (re)décrire, par lots.
"""
import json, os, sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def load(p):
    with open(p, encoding="utf-8") as fh:
        return json.load(fh)


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    va, vb = sys.argv[1], sys.argv[2]
    diff = load(os.path.join(BASE, "donnees", vb, f"diff-{va}.json"))
    src_root = os.path.join(BASE, "descriptions", va)
    dst_root = os.path.join(BASE, "descriptions", vb)
    moved = diff["modulesMoved"]
    removed = set(diff["modulesRemoved"])
    changes = diff["modules"]
    stats = {"copiés": 0, "déjà présents": 0, "retirés": 0, "déplacés": 0, "fonctions supprimées": 0, "à revérifier": 0}
    a_redecrire = set(diff["modulesAdded"])

    for dp, _, fn in os.walk(src_root):
        for f in fn:
            if not f.endswith(".json"):
                continue
            d = load(os.path.join(dp, f))
            rel = d["path"].removeprefix("lua/")
            if rel in removed:
                stats["retirés"] += 1
                continue
            if rel in moved:
                rel = moved[rel]
                d["path"] = "lua/" + rel
                stats["déplacés"] += 1
            dst = os.path.join(dst_root, rel[:-4] + ".json")
            if os.path.exists(dst):
                stats["déjà présents"] += 1
                continue
            ch = changes.get(rel)
            if ch:
                funcs = d.get("functions") or {}
                classes = d.get("classes") or {}
                for k in ch["removed"]:
                    if k.startswith("champ "):
                        if (d.get("fields") or {}).pop(k[6:], None) is not None:
                            stats["fonctions supprimées"] += 1
                    elif ":" in k:
                        cls, meth = k.split(":", 1)
                        if ((classes.get(cls) or {}).get("functions") or {}).pop(meth, None) is not None:
                            stats["fonctions supprimées"] += 1
                    elif funcs.pop(k, None) is not None:
                        stats["fonctions supprimées"] += 1
                for k, c in ch["changed"].items():
                    if ":" in k:
                        cls, meth = k.split(":", 1)
                        fd = ((classes.get(cls) or {}).get("functions") or {}).get(meth)
                    else:
                        fd = funcs.get(k)
                    if isinstance(fd, dict):
                        fd["aVerifier"] = f"paramètres modifiés en {vb} : ({', '.join(c['old'])}) → ({', '.join(c['new'])})"
                        stats["à revérifier"] += 1
                if ch["added"] or ch["changed"]:
                    a_redecrire.add(rel)
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            with open(dst, "w", encoding="utf-8") as fh:
                json.dump(d, fh, ensure_ascii=False, indent=2)
            stats["copiés"] += 1

    lots, cur = [], []
    for p in sorted(a_redecrire):
        cur.append(p)
        if len(cur) >= 30:
            lots.append(cur)
            cur = []
    if cur:
        lots.append(cur)
    with open(os.path.join(BASE, "donnees", vb, "lots_nouveaux.json"), "w", encoding="utf-8") as fh:
        json.dump(lots, fh, indent=0)
    print(json.dumps(stats, ensure_ascii=False))
    print(f"{len(a_redecrire)} modules nouveaux ou modifiés à (re)décrire, en {len(lots)} lots : donnees/{vb}/lots_nouveaux.json")


if __name__ == "__main__":
    main()
