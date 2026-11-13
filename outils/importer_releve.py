# -*- coding: utf-8 -*-
"""Copie le relevé en jeu (atlas_dump/*.json du dossier utilisateur) dans donnees/<v>/.
Usage : python -I importer_releve.py <version>"""
import os, sys, shutil, json

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
USER = os.path.join(os.environ["LOCALAPPDATA"], "BeamNG", "BeamNG.drive", "current", "atlas_dump")
ver = sys.argv[1]
dst = os.path.join(BASE, "donnees", ver)
os.makedirs(dst, exist_ok=True)
for vm in ("ge", "vehicle"):
    src = os.path.join(USER, vm + ".json")
    if not os.path.exists(src):
        print("absent :", src)
        continue
    with open(src, encoding="utf-8") as fh:
        d = json.load(fh)
    shutil.copyfile(src, os.path.join(dst, f"runtime_{vm}.json"))
    print(f"{vm} : {len(d.get('globals', {}))} globales, {len(d.get('classes', {}))} classes")
