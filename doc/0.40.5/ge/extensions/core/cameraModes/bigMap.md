# `core_cameraModes_bigMap`

*File: `lua/ge/extensions/core/cameraModes/bigMap.lua` · VM: Game Engine (GE) · 236 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/bigMap")` (file under extensions/ but not a regular extension)

'bigMap' global camera (isGlobal, hidden): perspective top-down view of the big map (the freeroam 'BigMap' mode). It handles zoom (by FOV via manualzoom, from fovMin to fovMax), keyboard movement and mouse dragging, animated recentering (bigMapPan) and keeps the camera within the map limits (mapBoundaries). Mode selection: freeroam_bigMapMode (extension freeroam/bigMapMode.lua) selects it with core_camera.setByName(0, 'bigMap', false, {initialCamData = {pos, rot}}) when the map opens and returns to the previous camera when it closes; it does not appear in the camera cycle (hidden). An orthographic variant, 'bigMapOrtho', exists but bigMapMode.lua has useOrthoCamera = false. The module returns a constructor: require('core/cameraModes/bigMap')(options).

## Example

```lua
-- Managed by freeroam_bigMapMode. Access to the instance:
local cam = core_camera.getGlobalCameras().bigMap
cam:panToWorldPos(vec3(100, 200, 0))
```

## Notes

- setCustomData(data) must receive {initialCamData = {pos, rot}} (starting position and rotation). It computes the point looked at on the terrain plane.
- bigMapMode.lua overrides fovMin according to the map size (code comment) and provides mapBoundaries (Box3F); without mapBoundaries, update crashes (self.mapBoundaries:getExtents()).
- While the camera is active, the player vehicle's render distance is raised to 5000 m (and restored afterwards).
- Zoom: C:zoom(value) accumulates a growing factor (stopZooming += 0.1 per call, then decays) and calls core_camera.cameraZoom; the zoom is centered on the mouse position. The change of zoom step (0, 0.5, 1 depending on fov) calls freeroam_bigMapMode.updateMergeRadius.
- Inconsistency: setCustomData(nil) then `camLookAtPoint - self.initialCamData.pos or ...` has no parentheses: the or operator does not protect the indexing of a nil initialCamData; do not call with data lacking initialCamData.pos.
- onSerialize/onDeserialized convert mapBoundaries between Box3F and table to survive a Lua reload.

## Class `C`

Instance of the bigMap camera. Fields: fovMin (25), fovMax (42), angle (53), rotAngle (25), posTransitionTime (2.4), transitionActive, movementSpeed (20), nearClipValue (100), drawIcons, initialCamData, mapBoundaries (Box3F), manualzoom, bigMapCamPosition, bigMapCamRotation.

The module returns a constructor: `local obj = require("core_cameraModes_bigMap")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:getZoomStage(fov)` | Relative zoom level in three stages from the FOV: 0 (close, <= 33%), 0.5, 1 (wide). | 102 |
| `C:init()` | Initializes the default parameters, marks the camera as global and hidden, creates the manual zoom (from fovMax to fovMin). | 18 |
| `C:onCameraChanged(focused)` | Called by camera.lua when the camera gains or loses focus: on activation, stores and raises the vehicle's render distance to 5000; on deactivation, restores the distance and abandons any mouse drag. | 46 |
| `C:onDeserialized()` | After Lua reload: reinitializes (init) and rebuilds mapBoundaries as a Box3F. | 218 |
| `C:onMouseButton(buttonDown, mouseDragging)` | Called on mouse button press/release: starts or stops the map drag. | 203 |
| `C:onSerialize()` | Prepares serialization before Lua reload: converts mapBoundaries (Box3F) to a table. | 212 |
| `C:panToWorldPos(worldPos)` | Smoothly recenters the camera so that the world position (on the ground) is at the center of the screen (bigMapPan.setTarget). | 110 |
| `C:reset()` | Resets the manual zoom to zero. | 38 |
| `C:setCustomData(data)` | Receives the activation data {initialCamData = {pos, rot}} from setByName, computes the camera vector toward the point looked at and prepares the zoom. | 88 |
| `C:setLevelProperties()` | Reinitializes (calls init) to apply the level properties (map size). | 42 |
| `C:update(data)` | Per-frame computation: applies zoom, mouse drag, keyboard movement (MoveManager.forward/backward/left/right), animated recentering, map limits, then writes data.res.pos, rot, fov and nearClip (100). | 118 |
| `C:zoom(value)` | Applies one zoom notch (wheel): accelerates progressively and stores the ground point under the mouse to keep the cursor in place. | 74 |
| `C:zoomToFactor(factor)` | Smoothly zooms toward a given factor (bigMapPan.zoomToFactor). | 114 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/bigMap.lua`.*
