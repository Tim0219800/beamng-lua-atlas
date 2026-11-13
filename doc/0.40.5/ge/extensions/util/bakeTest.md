# `util_bakeTest`

*Fichier : `lua/ge/extensions/util/bakeTest.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_bakeTest` : `extensions.load("util_bakeTest")`, puis la globale `util_bakeTest`

Dev-only: drives the GPU material baker + glTF exporter over a hardcoded set of
 complex, multi-material meshes to validate the pipeline end to end. Load via:
   -lua "extensions.load('util/bakeTest')"
 Outputs go to /temp/bakeTest/<name>/ (atlas PNGs + <name>.gltf, co-located).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_bakeTest.onClientPostStartMission()` | *(hook)* | 50 |
| `util_bakeTest.onUpdate()` | *(hook)* | 55 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/bakeTest.lua`.*
