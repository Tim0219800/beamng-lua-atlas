# `editor_sitesEditor_parkingSpots`

*File: `lua/ge/extensions/editor/sitesEditor/parkingSpots.lua` · VM: Game Engine (GE) · 412 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/sitesEditor/parkingSpots")` (file under extensions/ but not a regular extension)

'Parking Spots' sub-editor of the sites editor. The module returns a class constructor C. A spot is an oriented box (pos, rot, scl); the editor provides a transform gizmo (transformUtil), size presets (Car 2.5x6x3, LargeCar 3.25x8x4, Bus 4x14x8), angle input in degrees, and the 'MultiSpot' mode that repeats the spot N times (1 to 25) in a direction (Left, Right, Front, Back) with an offset and a rotation. Creation, deletion, duplication (Shift + drag) and transforms go through editor.history (undoable).

## Notes

- The entered angles are in degrees; internal rotations are quaternions (XYZ euler conversion in radians).
- setSites restores rot from rotOrig if present (fixes rotations automatically adjusted for multispots) then removes rotOrig.
- A duplicated spot gets a unique name 'Name (n)' via makeUniqueName.
- hitTest returns nothing (nil) while the mouse is not pressed (mouseInfo.down); it tests the oriented box of each spot of the multispot with intersectsRay_OBB (the camera must be outside the box).

## Class `C`

Object returned by the constructor. Fields: sitesEditor, key, current (selected spot), list, isMultiSpot, multiSpotData (spotAmount, spotOffset, spotDirection, spotRotation), listDisplay (assigned by sitesEditor), requestGizmo.

The module returns a constructor: `local obj = require("editor_sitesEditor_parkingSpots")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_beginShiftDuplicate()` | Duplicates the current spot (undoable action 'Duplicate Parking Spot') when a drag starts with Shift, and makes the list adopt the copy. | 258 |
| `C:create(pos)` | Creates a spot at the given position with the 'Car' scale (undoable action 'Create Parking Spot') and returns it. | 197 |
| `C:drawElement(ps, mouseInfo)` | Draws the spot editor: gizmo, size choice, rotation angles, 'Is MultiSpot' checkbox and its sliders (Amount of Spots 1 to 25, Offset 0 to 5, Spot Rotation -1.55 to 1.55). | 277 |
| `C:hitTest(mouseInfo, objects)` | Returns the spot whose box (or one of the multispot boxes) is hit closest by the mouse ray, only on click. | 111 |
| `C:init(sitesEditor, key)` | Constructor: prepares the multispot values, the drag state and the transformUtil utility ('Edit Sites', 'Transform'). Also defines the method C:requestGizmo(mode) which schedules the gizmo (re)configuration over 3 frames. | 57 |
| `C:remove(ps)` | Removes a spot (undoable action 'Remove Parking Spot'). | 204 |
| `C:select(ps)` | Selects a spot: places the transform, enables editing and copies its multispot settings into the UI. | 97 |
| `C:setSites(sites)` | Sets the edited sites, restores the original rotations of the multispots and deselects. | 84 |
| `C:setTransform()` | Copies pos, rot, scl of the current spot into transformUtil. | 210 |
| `C:updateFromTransform()` | Copies pos, rot, scl from transformUtil to the current spot (during a drag). | 214 |
| `C:updateMultiSpot()` | Copies the multispot settings from the UI to the current spot. | 248 |
| `C:updateTransform()` | Records an undoable action 'Update Transform of ...' with the old and new values. | 240 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sitesEditor/parkingSpots.lua`.*
