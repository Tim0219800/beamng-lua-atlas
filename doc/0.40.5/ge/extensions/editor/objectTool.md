# `editor_objectTool`

*File: `lua/ge/extensions/editor/objectTool.lua` · VM: Game Engine (GE) · 1545 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_objectTool`: `extensions.load("editor_objectTool")`, then the global `editor_objectTool`

Main edit mode of the World Editor, "Manipulate Object(s)" (editor.editModes.objectSelect, pencil icon). It handles object selection (click, rectangle, hover), the axis gizmo (move, rotate, scale, local/world alignment, snapping, Shift drag-duplicate, surface alignment with Ctrl+Alt), the drawn bounding boxes (orange, red if locked; for a vehicle, the sphere and axes of the reference node), copy/paste/duplicate/delete with undo (editor.history), as well as the registration of the "gizmos" (general, brush, object icons) and "snapping" (general, terrain, grid) preferences. It also adds "Move Selection At Camera" and "Align Objects Individually To The Grid" to the scene tree menu. At initialization it registers functions on the global editor table (see class "editor").

## Example

```lua
-- functions added to `editor` by this module
editor.selectObjectById(id)
editor.duplicateSelectionAtCamera() -- copies the selection 10 m in front of the camera
editor.moveSelectionAtCamera()      -- moves the selection 10 m in front of the camera
```

## Notes

- onCut is a stub: it checks the selection then does nothing (TODO in the code); cut is therefore not implemented.
- The internal clipboard (copyObjectsArray) belongs to the module and is not the system clipboard (TODO in the code).
- The copy/paste/duplicate/delete shortcuts only work if the 3D view has focus (editor.isViewportFocused()). Locked objects are not deleted ("Some locked objects were not deleted!" notification).
- The functions drawSelectionBBox, drawSelectedObjectBBox, updateObjectSelectionAxisGizmo, duplicateSelectionAtCamera, duplicateSceneObjects and moveSelectionAtCamera are exposed via the editor table (registerApi), not via the module M.
- onEditorInspectorFieldChanged: when the startTime field of a TimeOfDay object changes, the current time (core_environment) is set to startTime.
- Each edit mode remembers the gizmo state (plane, grid, flag profiles, alignment, mode) when deactivated and restores it when activated.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_objectTool.onEditorAxisGizmoAligmentChanged()` | Hook called when the gizmo alignment changes (name with a typo in the game: "Aligment"). If the current edit mode is "Manipulate Object(s)", repositions the gizmo on the selection. *(internal)* *(hook)* | 1134 |
| `editor_objectTool.onEditorEditModeActivated(editMode)` | Hook called when an edit mode is activated: restores the gizmo state (editMode.axisGizmoRestoreState) remembered at its last deactivation. *(internal)* *(hook)* | 1503 |
| `editor_objectTool.onEditorEditModeDeactivated(editMode)` | Hook called when an edit mode is deactivated: remembers the gizmo state in editMode.axisGizmoRestoreState. *(internal)* *(hook)* | 1520 |
| `editor_objectTool.onEditorInitialized()` | Hook called at editor initialization: creates editor.editModes.objectSelect (action map ObjectTool, shortcuts for copy, paste, duplicate, delete), registers the API on editor, applies the default local alignment if the preference is active and adds two entries to the scene tree context menu. *(internal)* *(hook)* | 1427 |
| `editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook called when an inspector field is modified. Only handles the startTime field of a TimeOfDay. *(internal)* *(hook)* | 1489 |
| `editor_objectTool.onEditorPreferenceValueChanged(path, value)` | Hook called when a preference changes: forwards the gizmos.* settings (object icons, colors, scales, fine snapping, etc.) to worldEditorCppApi. *(internal)* *(hook)* | 1258 |
| `editor_objectTool.onEditorRegisterPreferences(prefsRegistry)` | Preferences registration hook: creates the gizmos and snapping categories and their preferences (selection highlight, object icons, colors, gizmo sizes, grid, etc.). *(internal)* *(hook)* | 1326 |

### Parameter details

#### `editor_objectTool.onEditorEditModeActivated(editMode)`

Hook called when an edit mode is activated: restores the gizmo state (editMode.axisGizmoRestoreState) remembered at its last deactivation.

- `editMode` (*table*) : Edit mode activated.

#### `editor_objectTool.onEditorEditModeDeactivated(editMode)`

Hook called when an edit mode is deactivated: remembers the gizmo state in editMode.axisGizmoRestoreState.

- `editMode` (*table*) : Edit mode deactivated.

#### `editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook called when an inspector field is modified. Only handles the startTime field of a TimeOfDay.

- `selectedIds` (*integer[]*) : Ids of the selected objects; only the first is examined.
- `fieldName` (*string*) : Name of the modified field.
- `fieldValue` (*any*) : New value (unused).
- `arrayIndex` (*integer|nil*) : Index in an array field (unused).

#### `editor_objectTool.onEditorPreferenceValueChanged(path, value)`

Hook called when a preference changes: forwards the gizmos.* settings (object icons, colors, scales, fine snapping, etc.) to worldEditorCppApi.

- `path` (*string*) : Preference path, e.g. "gizmos.general.drawObjectIcons".
- `value` (*any*) : New value.

#### `editor_objectTool.onEditorRegisterPreferences(prefsRegistry)`

Preferences registration hook: creates the gizmos and snapping categories and their preferences (selection highlight, object icons, colors, gizmo sizes, grid, etc.).

- `prefsRegistry` (*table*) : Editor preferences registry.

## Class `editor`

Not a class: functions that this module adds to the global editor table during onEditorInitialized (registerApi).

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.drawSelectedObjectBBox(obj, color)` | Draws the bounding box of a scene object (ignores objects without getTransform). For a BeamNGVehicle, instead draws a magenta sphere and three cylinders (red, blue, green axes) at the reference node, whose size follows the camera distance unless gizmos.general.fixedRefnodeVisualization is active. | 72 |
| `editor.drawSelectionBBox(objMat, color)` | Draws with debugDrawer:drawLineInstance the 12 edges of a unit box transformed by the given matrix. | 47 |
| `editor.duplicateSceneObjects()` | Duplicates the selection: if the left mouse button is held down, immediately pastes a copy of the manipulable objects and switches to drag-duplicate; otherwise records an undoable "DuplicateObjects" action. | 1198 |
| `editor.duplicateSelectionAtCamera()` | Creates, with possible undo (action "DuplicateObjectsAtCamera"), a copy of the selection moved so the gizmo ends up 10 m in front of the camera. | 238 |
| `editor.moveSelectionAtCamera()` | Moves the selection (outside SimGroup) 10 m in front of the camera, with possible undo (action "MoveSelectionAtCamera"). | 272 |
| `editor.updateObjectSelectionAxisGizmo()` | Places the axis gizmo on the object selection: orientation of the last object in local mode, position of the last object, of the selection box center or of the centroid depending on the preferences (snapping and gizmos.general.useObjectBoxCenter). | 108 |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `Sim.` `upcast`
- `core_environment.` `getTimeOfDay`, `setTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawLine`, `drawLineInstance`, `drawSphere`
- `obj:` `delete`, `disableCollision`, `enableCollision`, `getClassName`, `getField`, `getId`, `getName`, `getObjBox`, `getPosition`, `getScale`, `getTransform`, `getWorldBox`, `isLocked`, `isSubClassOf`, `setPosition`, `setTransform`, `updateInstanceRenderData`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `getAxisGizmoAlignment`, `getAxisGizmoHideDisabledRotateAxes`, `getAxisGizmoHideDisabledScaleAxes`, `getAxisGizmoHideDisabledTranslateAxes`, `getAxisGizmoMode`, `getAxisGizmoRenderMoveGrid`, `getAxisGizmoRenderPlane`, `getAxisGizmoRenderPlaneHashes`, `getAxisGizmoRotateProfileFlags`, `getAxisGizmoScaleOffset`, `getAxisGizmoScaleProfileFlags`, `getAxisGizmoTranslateProfileFlags`, `getClassIsSelectable`, `getObjectClassNames`, `setAxisGizmoAlignment`, `setAxisGizmoHideDisabledRotateAxes`, `setAxisGizmoHideDisabledScaleAxes`, `setAxisGizmoHideDisabledTranslateAxes`, `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoMode`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`, `setAxisGizmoRotateProfileFlags`, `setAxisGizmoScaleProfileFlags`, `setAxisGizmoSelectedElement`, `setAxisGizmoTranslateProfileFlags`, `setConstantSizeIconScale`, `setConstantSizeIcons`, `setDrawIconShadow`, `setDrawObjectIcons`, `setDrawObjectsText`, `setFadeIcons`, `setFadeIconsDistance`, `setFineMoveScalar`, `setFineRotationScalar`, `setFineScaleScalar`, `setGizmoLineThicknessScale`, `setGizmoPlaneColor`, `setGizmoPlaneGridLineColor`, `setGizmoPlaneSize`, `setHideIconClass`, `setHoveredObjectId`, `setIconBackgroundColor`, `setIconBackgroundScale`, `setIconBackgroundType`, `setIconShadowColor`, `setIconShadowOffset`, `setIconWorldScale`, `setMonoIconColor`, `setObjectTextBackgroundColor`, `setObjectTextColor`, `setRandomIconColorSeed`, `setSelectedIconBgColor`, `setSelectedIconColor`, `setUseIconColor`, `setUseObjectsBoxCenter`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/objectTool.lua`.*
