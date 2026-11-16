# `core_cameraUtils_bigMapPan`

*File: `lua/ge/extensions/core/cameraUtils/bigMapPan.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_cameraUtils_bigMapPan`: `extensions.load("core_cameraUtils_bigMapPan")`, then the global `core_cameraUtils_bigMapPan`

Shared helper for smooth movement and zoom for the big map camera modes (bigMap / bigMapOrtho). Placed outside cameraModes/ because the files in that folder are automatically loaded as camera constructors. The functions directly modify the fields of the camera mode passed as a parameter (cam).

## Example

```lua
local pan = core_cameraUtils_bigMapPan
pan.setTarget(cam, vec3(100, 200, 0), cam.camToLookAtPoint)
pan.zoomToFactor(cam, 0.5)
-- every frame in cam:update:
pan.update(cam, data.dt, userMoving)
```

## Notes

- Fields read/written on cam: bigMapCamPosition (vec3), panTarget, zoomTarget, fovMin, fovMax, manualzoom.fov.
- Smoothing uses t = clamp(dt*6, 0, 1); the target is removed when the gap is below 0.1 m (squared < 0.01) for movement, or 0.01 for zoom (fov).
- update reads MoveManager.zoomIn / zoomOut: a manual zoom cancels zoomTarget; a user movement cancels panTarget and zoomTarget.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_cameraUtils_bigMapPan.setTarget(cam, worldPos, lookAtOffset)` | Sets cam.panTarget to center the view on worldPos: x,y = worldPos minus the offset; z = that of cam.bigMapCamPosition (otherwise that of worldPos). Does nothing if worldPos is nil. | 11 |
| `core_cameraUtils_bigMapPan.update(cam, dt, userMoving)` | To call every frame: moves manualzoom.fov toward zoomTarget and bigMapCamPosition (x,y) toward panTarget, and cancels the targets if the user moves or zooms. | 25 |
| `core_cameraUtils_bigMapPan.zoomToFactor(cam, factor)` | Sets cam.zoomTarget by interpolation between fovMax (factor 0, zoomed out) and fovMin (factor 1, zoomed in). | 19 |

### Parameter details

#### `core_cameraUtils_bigMapPan.setTarget(cam, worldPos, lookAtOffset)`

Sets cam.panTarget to center the view on worldPos: x,y = worldPos minus the offset; z = that of cam.bigMapCamPosition (otherwise that of worldPos). Does nothing if worldPos is nil.

- `cam` (*table*) : calling camera mode
- `worldPos` (*vec3|nil*) : world point to center on
- `lookAtOffset` (*vec3|nil*) : camera -> aimed point vector (camToLookAtPoint) of the calling mode; (0,0,0) by default

#### `core_cameraUtils_bigMapPan.update(cam, dt, userMoving)`

To call every frame: moves manualzoom.fov toward zoomTarget and bigMapCamPosition (x,y) toward panTarget, and cancels the targets if the user moves or zooms.

- `cam` (*table*) : calling camera mode
- `dt` (*number*) : frame duration in seconds
- `userMoving` (*boolean*) : true if the user is moving the camera (cancels the targets)

#### `core_cameraUtils_bigMapPan.zoomToFactor(cam, factor)`

Sets cam.zoomTarget by interpolation between fovMax (factor 0, zoomed out) and fovMin (factor 1, zoomed in).

- `cam` (*table*) : calling camera mode
- `factor` (*number*) : 0 = zoomed out (fovMax), 1 = zoomed in (fovMin); clamped to [0,1], non-numeric = 0

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraUtils/bigMapPan.lua`.*
