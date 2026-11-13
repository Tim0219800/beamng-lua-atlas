# `editor_mapJsonEditor`

*Fichier : `lua/ge/extensions/editor/mapJsonEditor.lua` · VM : Game Engine (GE) · 820 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_mapJsonEditor` : `extensions.load("editor_mapJsonEditor")`, puis la globale `editor_mapJsonEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_mapJsonEditor.loadFile(fp)` |  | 133 |
| `editor_mapJsonEditor.onDeserialized(d)` | *(hook)* | 798 |
| `editor_mapJsonEditor.onEditorExitLevel()` | *(hook)* | 784 |
| `editor_mapJsonEditor.onEditorGui()` | *(hook)* | 659 |
| `editor_mapJsonEditor.onEditorInitialized()` | *(hook)* | 758 |
| `editor_mapJsonEditor.onEditorToolWindowHide(windowName)` | *(hook)* | 772 |
| `editor_mapJsonEditor.onSerialize()` | *(hook)* | 794 |
| `editor_mapJsonEditor.onWindowGotFocus(windowName)` | *(hook)* | 778 |
| `editor_mapJsonEditor.saveFile(fp)` |  | 200 |
| `editor_mapJsonEditor.show()` |  | 745 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/mapJsonEditor.lua`.*
