# `util_decalRoadsEditor`

*Fichier : `lua/ge/extensions/util/decalRoadsEditor.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_decalRoadsEditor` : `extensions.load("util_decalRoadsEditor")`, puis la globale `util_decalRoadsEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_decalRoadsEditor.onExtensionLoaded()` | *(hook)* | 109 |
| `util_decalRoadsEditor.onExtensionUnloaded()` | *(hook)* | 106 |
| `util_decalRoadsEditor.onPreRender(dt)` | *(hook)* | 9 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/decalRoadsEditor.lua`.*
