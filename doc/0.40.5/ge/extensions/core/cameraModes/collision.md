# `core_cameraModes_collision`

*File: `lua/ge/extensions/core/cameraModes/collision.lua` · VM: Game Engine (GE) · 154 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/collision")` (file under extensions/ but not a regular extension)

Filter that prevents the camera passing through scenery: casts static rays (castRayStatic) from the target to the four corners of the camera's near plane and moves the camera closer to the target if a wall is in the way (minimum distance 0.5 m). With no obstacle, only one corner is tested per frame (in turn); on first contact, all four are tested every frame until a clear frame. Active only if the 'cameraCollision' setting is true. Returns a constructor.

## Notes

- Per-instance state (each view/split-screen has its own filter). Safety margin 0.1 m; near plane assumed 0.4 x 0.2 m. Smoothing only acts when the camera moves away (gradual return); moving closer is immediate.
- The extracted page says isObstacleInFrontOfCam(cornerIdx) but the code takes (rayDestinations, cornerIdx).

## Class `C`

Camera collision filter.

The module returns a constructor: `local obj = require("core_cameraModes_collision")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:collidingCamDistance()` | Target -> camera distance imposed by collision. | 142 |
| `C:init()` | Resets the state (distances, ray index, smoothing) and reads the cameraCollision setting. | 18 |
| `C:isObstacleInFrontOfCam(rayDestinations, cornerIdx)` | Detects geometry that the corner rays do not see: full crossing of a wall in one frame, or a near-plane edge that cuts a surface. | 36 |
| `C:onSettingsChanged()` | Hook: re-reads the 'cameraCollision' setting (true by default). | 30 |
| `C:onVehicleSwitched()` | Hook: resets the filter (calls init). | 138 |
| `C:update(data)` | Computes the new camera position on the target -> camera axis and writes data.res.pos. | 54 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/collision.lua`.*
