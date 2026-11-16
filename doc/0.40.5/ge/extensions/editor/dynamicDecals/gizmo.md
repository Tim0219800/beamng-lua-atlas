# `editor_dynamicDecals_gizmo`

*File: `lua/ge/extensions/editor/dynamicDecals/gizmo.lua` · VM: Game Engine (GE) · 160 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_gizmo`: `extensions.load("editor_dynamicDecals_gizmo")`, then the global `editor_dynamicDecals_gizmo`

Manages the axis gizmo (move / rotate / scale) of the Dynamic Decals tool. Other modules (decal, path, group...) choose the mode with setTransformMode, install their translateFn / rotateFn / scaleFn callback, and update M.transform. On each edit frame, editModeUpdate displays the gizmo, the bounding box of the selected decal and a debug sphere.

## Notes

- Callbacks translateFn / rotateFn / scaleFn: called during the drag with the matrix returned by editor.getAxisGizmoTransform(); if they are nil, a "not yet implemented" message is written to the log.
- The first call of gizmoDragging (dragCount == 1) is ignored.
- Bug: editModeUpdate tests `data and data.debugObjPos` with the global `data` (not defined here, M.data is not used); the debug sphere therefore never appears, unless a global `data` exists.
- M.data describes the manipulated object: uid, type ("drag", "rotate"...), objectType ("decal", "group", "path", "path_dataPoint"), optional dataPointIndex, objectDataCopy (state at the start of the drag). It is not filled by this module.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw)` | Called every frame by the editor's edit mode: updates and draws the gizmo if a mode is active, draws the bounding box of the selected decal, then the debug sphere of the control points. *(internal)* | 116 |
| `editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 112 |
| `editor_dynamicDecals_gizmo.getDragCount()` | Number of drag updates since the start of the current drag. | 54 |
| `editor_dynamicDecals_gizmo.getTransformMode()` | Returns the current transform mode. | 40 |
| `editor_dynamicDecals_gizmo.gizmoBeginDrag()` | Callback passed to editor.updateAxisGizmo: called when the gizmo drag starts. Resets the counter to 0. *(internal)* | 59 |
| `editor_dynamicDecals_gizmo.gizmoDragging()` | Callback called on every drag update: increments the counter then, depending on the mode, calls translateFn / rotateFn / scaleFn with editor.getAxisGizmoTransform(). *(internal)* | 72 |
| `editor_dynamicDecals_gizmo.gizmoEndDrag()` | Callback called at the end of the drag. Resets the counter to 0 (no undo action is added here). *(internal)* | 66 |
| `editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry)` | Registers `dynamicDecalsTool.gizmo`: displayBoundingBox (bool, true), boundingBoxColor (RGBA {1,0,0,0.75}, with color picker) and displayDebugObjWhileMovingControlPoints (bool, true). *(internal)* | 100 |
| `editor_dynamicDecals_gizmo.resetTransformFn()` | Resets translateFn, rotateFn and scaleFn to nil. | 48 |
| `editor_dynamicDecals_gizmo.setTransformMode(value)` | Sets the transform mode; with none, the gizmo is no longer displayed. | 44 |
| `editor_dynamicDecals_gizmo.setup(tool_in)` | Called by the tool: stores the tool and the editor_api_dynamicDecals API. *(internal)* | 142 |

### Parameter details

#### `editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw)`

Called every frame by the editor's edit mode: updates and draws the gizmo if a mode is active, draws the bounding box of the selected decal, then the debug sphere of the control points.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_gizmo.getDragCount()`

Number of drag updates since the start of the current drag.

- **returns**: integer Counter.

#### `editor_dynamicDecals_gizmo.getTransformMode()`

Returns the current transform mode.

- **returns**: integer Value of transformModes.

#### `editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry)`

Registers `dynamicDecalsTool.gizmo`: displayBoundingBox (bool, true), boundingBoxColor (RGBA {1,0,0,0.75}, with color picker) and displayDebugObjWhileMovingControlPoints (bool, true).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_gizmo.setTransformMode(value)`

Sets the transform mode; with none, the gizmo is no longer displayed.

- `value` (*integer*) : A value of transformModes.

#### `editor_dynamicDecals_gizmo.setup(tool_in)`

Called by the tool: stores the tool and the editor_api_dynamicDecals API.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

## Fields

| Field | Type | Description |
|---|---|---|
| `data` | table | Information about the object being manipulated (uid, type, objectType, dataPointIndex, objectDataCopy), filled by the calling modules. |
| `rotateFn` | function|nil | Rotation callback. |
| `scaleFn` | function|nil | Scale callback. |
| `transform` | MatrixF | Gizmo matrix (MatrixF(true) initially). |
| `transformModes` | table<string, integer> | none = 0, translate = 1, rotate = 2, scale = 3. |
| `translateFn` | function|nil | Translation callback, receives the gizmo matrix. |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/gizmo.lua`.*
