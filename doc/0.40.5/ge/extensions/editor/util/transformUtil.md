# `editor_util_transformUtil`

*File: `lua/ge/extensions/editor/util/transformUtil.lua` · VM: Game Engine (GE) · 761 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/util/transformUtil")` (file under extensions/ but not a regular extension)

Editor utility class: a "transform helper" (position vec3, rotation quat, scale vec3 or number) with axis gizmo, imgui fields, dedicated edit mode and helper buttons (place on terrain, place in front of the camera, align to the slope, teleport the player vehicle...). Useful to an editor tool that needs to edit an object's transform. The module returns a constructor: `local t = require('editor/util/transformUtil')(editName, objectName)`.

## Example

```lua
local tu = require('editor/util/transformUtil')('Mon outil', 'Marker')
tu:set(vec3(0,0,0), quat(0,0,0,1), vec3(1,1,1))
-- in onEditorGui:
local changed = tu:update(mouseInfo)
if changed then print(tu.pos, tu.rot, tu.scl) end
```

## Notes

- Each instance gets a unique id and registers an edit mode `editor.editModes["<editName> (<id>)"]`; Escape or a click outside the gizmo returns to objectSelect mode.
- Shift + click-drag = Quick Edit: sets the position to the targeted point and orients (quatFromDir) in the direction of the drag; the 1D scale follows the length of the drag.
- If the scale is 1D (setOneDimensionalScale(true)), self.scl is a number; otherwise a vec3. set() converts automatically.
- While the gizmo is dragged, 2000 m lines (red/green/blue) are drawn along the local axes.
- Inconsistency: contextMenu() tests self.hasPos / self.hasRot which are never initialized in init() (so nil unless assigned externally): the context menu then only shows the separator.
- getValidButtons() uses `break`: as soon as a button is incompatible with allowTranslate/allowRotate, the following ones are also ignored.
- Rotations are quaternions (x, y, z, w); distances in meters. 'Move before Camera' places the point 15 m in front of the camera.
- The module calls `editor.*` without checking everywhere that it exists; init() exits early if `editor.editModes` is absent.

## Class `C`

Object returned by the module constructor. Notable public fields: pos (vec3), rot (quat), scl (vec3|number), allowTranslate/allowRotate/allowScale (booleans), oneDimensionalScale, showWidgets, showGizmo, widgetSettings.width, switchRotationForMouse, isDragging.

The module returns a constructor: `local obj = require("editor_util_transformUtil")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of the gizmo drag: remembers the starting pos/rot/scl. | 674 |
| `C:combinedWidget()` | Draws the combined interface (gizmo, help buttons, fields) in the available width. | 418 |
| `C:contextMenu()` | Draws the help context menu (position/rotation to camera, camera to position, etc.). | 366 |
| `C:correctEditMode()` | Tells whether the editor's active edit mode is that of this helper. | 742 |
| `C:dragging()` | During the drag: updates pos, rot or scl according to the gizmo mode (translation, rotation, scale) and draws the axes. | 681 |
| `C:enableEditing(cooldown)` | Activates this helper's edit mode, with a delay of a few frames before processing clicks. | 306 |
| `C:endDragging()` | End of the gizmo drag. | 732 |
| `C:getValidButtons()` | Returns the list of help buttons compatible with allowTranslate/allowRotate (stops at the first incompatible one). | 547 |
| `C:gizmo()` | Draws the 'Edit <object>' / 'Exit Editing' button, the axis gizmo in edit mode, and the '...' menu. | 559 |
| `C:helperAlignWithTerrain()` | Aligns the up axis to the smoothed terrain normal while keeping the projected forward direction (no effect without terrain). | 355 |
| `C:helperCameraToPosition()` | Switches to the free camera and moves the camera to the position, keeping its orientation. | 329 |
| `C:helperCameraToPositionRotation()` | Switches to the free camera and applies position and rotation to the camera. | 343 |
| `C:helperCameraToRotation()` | Switches to the free camera and applies the rotation to the camera, keeping its position. | 336 |
| `C:helperFocus()` | Centers the editor view on the position (editor.fitViewToSelectionSmooth). | 313 |
| `C:helperMoveToTransform()` | Teleports the player vehicle (spawn.safeTeleport) to the position/rotation. | 349 |
| `C:helperPositionDownToTerrain()` | Sets the position to the terrain height (no effect if there is no terrain). | 322 |
| `C:helperPositionInFrontOfToCamera()` | Places the position 15 m in front of the camera. | 319 |
| `C:helperPositionToCamera()` | Sets the position to the camera's. | 316 |
| `C:helperRotateWithCamera()` | Copies the camera rotation (identical to helperRotationToCamera; the button tooltip says 'face away from the camera'). | 361 |
| `C:helperRotationToCamera()` | Copies the camera rotation. | 326 |
| `C:init(editName, objectName)` | Constructor: creates the state (pos 0, identity rot, scl 1), the imgui fields and registers the editor edit mode. | 68 |
| `C:onActivate()` | Edit mode callback: clears the object selection and resets via set(). | 747 |
| `C:onDeactivate()` | Edit mode callback: clears the object selection. | 751 |
| `C:resetDragging()` | Clears the drag start values (manual call). | 737 |
| `C:set(pos, rot, scl)` | Sets position, rotation and scale; nil arguments are ignored. Updates the gizmo transform and the input fields. | 146 |
| `C:setOneDimensionalScale(ods)` | Switches between scalar scale and vec3 scale and recreates the corresponding input field. | 116 |
| `C:shiftUpdate(mouseInfo)` | Handles the Quick Edit (Shift + mouse): sets the position at the targeted point and orients the object according to the drag. | 201 |
| `C:start()` | Enters this helper's edit mode if not already in it. | 131 |
| `C:stop()` | Exits the edit mode (editor.selectEditMode(nil)) if it is active. | 138 |
| `C:update(mouseInfo)` | To be called every frame: handles clicks, help messages and the Quick Edit when the edit mode is active, then draws the widgets (combinedWidget). | 254 |
| `C:updateInputFields()` | Copies pos, rot and scl into the imgui arrays (inputPos, inputRot, inputScl). | 182 |
| `C:updateTransform()` | Recomputes the gizmo matrix from pos/rot (local or world orientation depending on the gizmo alignment) and applies it if this edit mode is active. | 164 |
| `C:widget()` | Draws the Position, Rotation (quaternion) and Scale input fields according to the permissions. | 597 |
| `C:widgetCondensed()` | Compact version of widget() (labels Pos, Rot, Scl). | 635 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/util/transformUtil.lua`.*
