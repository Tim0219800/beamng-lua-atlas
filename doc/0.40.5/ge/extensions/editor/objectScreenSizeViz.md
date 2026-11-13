# `editor_objectScreenSizeViz`

*Fichier : `lua/ge/extensions/editor/objectScreenSizeViz.lua` · VM : Game Engine (GE) · 268 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_objectScreenSizeViz` : `extensions.load("editor_objectScreenSizeViz")`, puis la globale `editor_objectScreenSizeViz`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_objectScreenSizeViz.onEditorGui()` | *(hook)* | 160 |
| `editor_objectScreenSizeViz.onEditorInitialized()` | *(hook)* | 259 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`
- `obj:` `getClassName`, `getID`, `getName`, `getWorldBox`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/objectScreenSizeViz.lua`.*
