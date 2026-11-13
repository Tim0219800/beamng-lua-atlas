# `editor_layoutManager`

*Fichier : `lua/ge/extensions/editor/layoutManager.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_layoutManager` : `extensions.load("editor_layoutManager")`, puis la globale `editor_layoutManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_layoutManager.deleteWindowLayout(layoutPath)` |  | 55 |
| `editor_layoutManager.getWindowLayouts(toolName)` |  | 14 |
| `editor_layoutManager.loadCurrentWindowLayout(toolName)` |  | 37 |
| `editor_layoutManager.loadWindowLayout(layout, toolName)` |  | 18 |
| `editor_layoutManager.resetLayouts(toolName)` |  | 63 |
| `editor_layoutManager.saveCurrentWindowLayout(toolName)` |  | 50 |
| `editor_layoutManager.saveWindowLayout(layoutName, toolName)` |  | 30 |

## Appels vers le moteur (C++)

- `FS:` `directoryList`, `directoryRemove`, `findFiles`, `getFileRealPath`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/layoutManager.lua`.*
