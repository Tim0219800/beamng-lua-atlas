# `editor_dynamicDecals_gizmo`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/gizmo.lua` · VM : Game Engine (GE) · 160 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_gizmo` : `extensions.load("editor_dynamicDecals_gizmo")`, puis la globale `editor_dynamicDecals_gizmo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw)` |  | 116 |
| `editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value)` |  | 112 |
| `editor_dynamicDecals_gizmo.getDragCount()` |  | 54 |
| `editor_dynamicDecals_gizmo.getTransformMode()` |  | 40 |
| `editor_dynamicDecals_gizmo.gizmoBeginDrag()` | called when the axis gizmo started to be dragged | 59 |
| `editor_dynamicDecals_gizmo.gizmoDragging()` |  | 72 |
| `editor_dynamicDecals_gizmo.gizmoEndDrag()` |  | 66 |
| `editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry)` |  | 100 |
| `editor_dynamicDecals_gizmo.resetTransformFn()` |  | 48 |
| `editor_dynamicDecals_gizmo.setTransformMode(value)` |  | 44 |
| `editor_dynamicDecals_gizmo.setup(tool_in)` |  | 142 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `data` | table |  |
| `rotateFn` | nil |  |
| `scaleFn` | nil |  |
| `transform` | any | M.data.uid = `layer.uid`<br>M.data.type = "drag", "rotate", ...<br>M.data.objectType = "decal", "group", "path", "path_dataPoint"<br>[optional] M.data.dataPointIndex = `index of point in array`<br>M.data.objectDataCopy = -- data of the object at the begin of the drag |
| `transformModes` | table |  |
| `translateFn` | nil |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/gizmo.lua`.*
