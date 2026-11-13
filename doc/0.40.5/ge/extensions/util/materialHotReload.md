# `util_materialHotReload`

*Fichier : `lua/ge/extensions/util/materialHotReload.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_materialHotReload` : `extensions.load("util_materialHotReload")`, puis la globale `util_materialHotReload`

Hot-reloads *.materials.json files on disk change: re-parses the file (patching
 the in-memory Material objects) and reloads each affected material instance.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_materialHotReload.onFileChanged(filename, type)` | *(hook)* | 30 |
| `util_materialHotReload.onInit()` | *(hook)* | 36 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/materialHotReload.lua`.*
