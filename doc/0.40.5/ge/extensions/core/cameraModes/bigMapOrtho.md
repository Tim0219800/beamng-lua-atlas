# `core_cameraModes_bigMapOrtho`

*File: `lua/ge/extensions/core/cameraModes/bigMapOrtho.lua` · VM: Game Engine (GE) · 248 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/bigMapOrtho")` (file under extensions/ but not a regular extension)

'bigMapOrtho' global camera (isGlobal, hidden): orthographic variant of the big map camera. Same logic as bigMap (zoom, movement, mouse drag, animated recentering, map limits), but the view is orthographic via core_orthoCamera: data.res.fov is used as the size of the ortho view (fovMin 50, fovMax 1000, then fovMax = average map size). Mode selection: freeroam/bigMapMode.lua chooses the name 'bigMapOrtho' if useOrthoCamera is true (a local constant set to false in this version: so the camera is normally never activated) and activates it with core_camera.setByName(0, 'bigMapOrtho', false, {initialCamData = {...}}). It does not appear in the camera cycle. The module returns a constructor: require('core/cameraModes/bigMapOrtho')(options).

## Example

```lua
core_camera.setByName(0, 'bigMapOrtho', false, {initialCamData = {pos = vec3(0,0,500), rot = quatFromDir(vec3(0,0,-1), vec3(0,1,0))}})
```

## Notes

- setCustomData requires mapBoundaries (self.mapBoundaries:getExtents()) and enables core_orthoCamera.enable(true, {size = averageMapSize}).
- On deactivation (onCameraChanged(false)), core_orthoCamera.enable(false) is called.
- update sets core_orthoCamera.setOptions({size = fov, nearClip, farClip}): nearClip = altitude * lerp(0.5, 0.6, 1 - relativeZoom), farClip = altitude * 5.
- Difference from bigMap: no data.res.nearClip, no perspective blending; the step zoom still calls freeroam_bigMapMode.updateMergeRadius.
- The same missing-parentheses flaw as bigMap exists in setCustomData (camLookAtPoint - initialCamData.pos or ...).
- The object is not exposed under any name other than the file's (bigMapOrtho).

## Class `C`

Instance of the bigMapOrtho camera. Fields: fovMin (50), fovMax (1000, replaced by the map size), angle, rotAngle, posTransitionTime (2.4), movementSpeed (20), nearClipValue, drawIcons, initialCamData, mapBoundaries, manualzoom, bigMapCamPosition, bigMapCamRotation.

The module returns a constructor: `local obj = require("core_cameraModes_bigMapOrtho")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:getZoomStage(fov)` | Relative zoom level in three stages: 0, 0.5 or 1. | 108 |
| `C:init()` | Initializes the default parameters, marks the camera as global and hidden, creates the manual zoom. | 19 |
| `C:onCameraChanged(focused)` | Focus gain or loss: the vehicle's render distance is raised to 5000 (then restored); on focus loss, disables the orthographic camera (core_orthoCamera.enable(false)) and abandons the drag. | 47 |
| `C:onDeserialized()` | After Lua reload: init then rebuilds mapBoundaries as a Box3F. | 230 |
| `C:onMouseButton(buttonDown, mouseDragging)` | Start/end of the map drag. | 215 |
| `C:onSerialize()` | Converts mapBoundaries (Box3F) to a table before Lua reload. | 224 |
| `C:panToWorldPos(worldPos)` | Smoothly recenters on a world position (bigMapPan.setTarget). | 116 |
| `C:reset()` | Resets the manual zoom to zero. | 39 |
| `C:setCustomData(data)` | Receives {initialCamData = {pos, rot}}, computes the point looked at, enables the orthographic camera at the average map size and sets fovMax. | 90 |
| `C:setLevelProperties()` | Reinitializes (calls init) to apply the level properties. | 43 |
| `C:update(data)` | Per-frame computation (like bigMap) then sets the ortho camera options (size, nearClip, farClip) via core_orthoCamera.setOptions. | 125 |
| `C:zoom(value)` | Applies one zoom notch (wheel) with acceleration and stores the ground point under the mouse. | 76 |
| `C:zoomToFactor(factor)` | Smoothly zooms toward a given factor. | 120 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/bigMapOrtho.lua`.*
