# `editor_ezObjectSelect_selectionDebug`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua` · VM : Game Engine (GE) · 284 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionDebug` : `extensions.load("editor_ezObjectSelect_selectionDebug")`, puis la globale `editor_ezObjectSelect_selectionDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionDebug.drawScreen(snapshot, options)` |  | 275 |
| `editor_ezObjectSelect_selectionDebug.drawWorld(snapshot, options)` |  | 177 |
| `editor_ezObjectSelect_selectionDebug.reset()` |  | 279 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `getPosition`, `getTransform`, `getWorldBox`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua`.*
