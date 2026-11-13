# -*- coding: utf-8 -*-
"""Crée les zips de release : dist/stubs-<v>.zip et dist/donnees-<v>.zip.
Usage : python -I outils/empaqueter.py <version>"""
import os, sys, zipfile

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ver = sys.argv[1]
os.chdir(BASE)
os.makedirs("dist", exist_ok=True)


def zipper(out, items):
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as zf:
        for item in items:
            if os.path.isfile(item):
                zf.write(item, item)
                continue
            for dp, _, fn in os.walk(item):
                for f in sorted(fn):
                    p = os.path.join(dp, f)
                    zf.write(p, p.replace(os.sep, "/"))
    print(out, round(os.path.getsize(out) / 1e6, 1), "Mo")


zipper(f"dist/stubs-{ver}.zip", [f"stubs/{ver}", "LICENSE", "README.md"])
zipper(f"dist/donnees-{ver}.zip", [f"donnees/{ver}", "LICENSE"])
