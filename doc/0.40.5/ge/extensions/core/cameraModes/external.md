# `core_cameraModes_external`

*File: `lua/ge/extensions/core/cameraModes/external.lua` · VM: Game Engine (GE) · 441 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/external")` (file under extensions/ but not a regular extension)

External "TV / fan" camera (disabled by default): places random fixed cameras along the vehicle's predicted path, changes viewpoint every 1.5 to ~4 s (or if the vehicle is hidden > 0.5 s, or moves too far away), and passes the result through a chain of filters: predictor, autozoom, autopoint, noise, smooth, handheld, bobbing. Two randomly drawn styles: fan (camera at human height, shaky) or TV (stable); the fan probability comes from the 'cameraFanVsTV' setting (0.66 for TV by default, see notes). Checks visibility with static rays (up to 40 tries). Returns a constructor.

## Notes

- No fan camera under OpenXR (isFanMode = false); aiming offsets are ignored in OpenXR.
- Bug: in update, the line `self:applyOffset(nx, ny, nz, findRandomAttachedNodePosition(data.veh), openxrSessionRunning)` uses a global variable openxrSessionRunning (nil) instead of data.openxrSessionRunning.
- Inconsistency: switchCamera writes self.predictor.future while the predictor filter reads dtFuture; the randomly drawn value therefore has no effect (dtFuture stays 0.1).
- tvModeOdds = 'cameraFanVsTV' setting and the test is `math.random() > tvModeOdds` for fan mode: a high value therefore gives more TV (inferred from code).
- The signatures of the extracted page are inaccurate: switchCamera(carVel, carPos, veh, nx, ny, nz, carStopped, openxrSessionRunning), shouldSwitchCamera(carPos, carVel, dt), applyOffset(nx, ny, nz, offset, openxrSessionRunning), findNewCamPosVel(carPos, futureCarPos, velLength, chancesMultiplier, carStopped), randomizeOffsetSpeeds(paused, carStopped).

## Class `C`

External mode. Fields: isFanMode, camPos, camVel, camChangeTimeMin/Base/Max, invisibleTime, and the filters autozoom, autopoint, noise, smooth, bobbing, handheld, predictor.

The module returns a constructor: `local obj = require("core_cameraModes_external")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:applyOffset(nx, ny, nz, offset, openxrSessionRunning)` | Sets the point aimed at by autopoint (vehicle-local offset, ignored in OpenXR). | 186 |
| `C:camTeleported()` | The camera teleported: resets autozoom and handheld. | 373 |
| `C:carTeleported()` | The vehicle teleported: calls reset. | 370 |
| `C:findNewCamPosVel(carPos, futureCarPos, velLength, chancesMultiplier, carStopped)` | Chooses a camera position near the vehicle's predicted future position, and the pan speed (zero in fan mode). | 117 |
| `C:init()` | Initializes the state, timers and filters, then calls onSettingsChanged, onVehicleCameraConfigChanged and reset. | 19 |
| `C:onSettingsChanged()` | Hook: re-reads cameraFanVsTV and relays to the bobbing filter. | 67 |
| `C:onVehicleCameraConfigChanged()` | Hook: forwards refNodes to autopoint. | 63 |
| `C:randomizeOffsetSpeeds(paused, carStopped)` | Draws the change period of the aimed point and the autopoint spring. | 347 |
| `C:reset()` | Forces the choice of a new camera on the next frame ("switch to a new camera"). | 96 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Sets the vehicle's reference nodes (also for autopoint). | 72 |
| `C:shouldSwitchCamera(carPos, carVel, dt)` | Says whether to change camera: start, or minimum delay elapsed and (vehicle invisible too long or too far after the maximum delay). | 306 |
| `C:switchCamera(carVel, carPos, veh, nx, ny, nz, carStopped, openxrSessionRunning)` | Chooses a new viewpoint: draws the style (fan/TV), the zoom steps and the durations, then looks for a clear location (40 tries), and sets handheld, noise, smooth. | 193 |
| `C:update(data)` | Main loop: handles teleports, the change of aimed point and camera, moves the camera, then passes data through the filters. | 380 |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/external.lua`.*
