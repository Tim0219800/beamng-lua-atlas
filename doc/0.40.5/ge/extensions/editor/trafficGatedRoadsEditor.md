# `editor_trafficGatedRoadsEditor`

*Fichier : `lua/ge/extensions/editor/trafficGatedRoadsEditor.lua` · VM : Game Engine (GE) · 444 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficGatedRoadsEditor` : `extensions.load("editor_trafficGatedRoadsEditor")`, puis la globale `editor_trafficGatedRoadsEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficGatedRoadsEditor.allowGizmo()` |  | 441 |
| `editor_trafficGatedRoadsEditor.loadData(fp)` |  | 209 |
| `editor_trafficGatedRoadsEditor.onDeserialized(d)` | *(hook)* | 423 |
| `editor_trafficGatedRoadsEditor.onEditorGui()` | *(hook)* | 230 |
| `editor_trafficGatedRoadsEditor.onEditorInitialized()` | *(hook)* | 389 |
| `editor_trafficGatedRoadsEditor.onEditorToolWindowHide(windowName)` | *(hook)* | 402 |
| `editor_trafficGatedRoadsEditor.onSerialize()` | *(hook)* | 414 |
| `editor_trafficGatedRoadsEditor.onWindowGotFocus(windowName)` | *(hook)* | 408 |
| `editor_trafficGatedRoadsEditor.saveData(fp)` |  | 203 |
| `editor_trafficGatedRoadsEditor.show()` |  | 375 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficGatedRoadsEditor.lua`.*
