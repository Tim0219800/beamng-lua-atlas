# `editor_aiViz`

*Fichier : `lua/ge/extensions/editor/aiViz.lua` · VM : Game Engine (GE) · 410 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_aiViz` : `extensions.load("editor_aiViz")`, puis la globale `editor_aiViz`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_aiViz.enableDrawMode(mode, enabled)` |  | 389 |
| `editor_aiViz.getDrawMode()` |  | 401 |
| `editor_aiViz.onEditorGui()` | *(hook)* | 305 |
| `editor_aiViz.onNavgraphReloaded()` | *(hook)* | 300 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/aiViz.lua`.*
