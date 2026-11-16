# `core_cameraModes_unicycle`

*File: `lua/ge/extensions/core/cameraModes/unicycle.lua` · VM: Game Engine (GE) · 263 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/unicycle")` (file under extensions/ but not a regular extension)

First-person camera of the on-foot character ("unicycle": the player vehicle on foot). Hidden. Head rotation comes from the yaw/pitch inputs (pitch limited to ±89.9 degrees), zoom from data.unicycleZoom (FOV from 55 to 27). The position follows the vehicle's head node (core_camera.getDriverData). Sends the camera rotation to the vehicle controller (playerController.setCameraControlData). Supports OpenXR snap turn. setCustomData sets the position (placed on the ground at 1.6 m from the eyes) and the starting direction. Returns a constructor.

## Notes

- Constants: human height 1.6 m, hip 0.45 * height, crouching 0.7; max fall 10 m, gravity -2 m/s2 in attemptToWalk, which is local to the file and never called in this file (unused code).
- getEyePosition uses the variable `crouching` which does not exist in scope (nil): crouching is therefore never taken into account.
- onCameraChanged does nothing if the player vehicle is itself a unicycle; otherwise loads the "unicycle" apps layout on focus gain and asks again for the game state on loss.
- getRotVecFromFrontUp forces a horizontal pitch (rotVec.y = 180): the code comment says "the math below is broken".
- Settings: openXRsnapTurnUnicycle, openXRsnapTurnUnicycleDegrees.

## Class `C`

Pedestrian camera mode. Fields: pos (vec3), rotVec (vec3 degrees, y = 180 to look horizontally).

The module returns a constructor: `local obj = require("core_cameraModes_unicycle")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:getPosRot()` | Current position and rotation of the camera. | 164 |
| `C:init()` | Prepares the zoom smoothing and reads the settings. | 20 |
| `C:onCameraChanged(focused)` | Hook: loads or leaves the "unicycle" interface layout (see notes). | 33 |
| `C:onSettingsChanged()` | Hook: re-reads the OpenXR snap turn settings. | 28 |
| `C:reset()` | Resets the zoom smoothing to zero. | 47 |
| `C:setCustomData(customData)` | Sets the initial position and/or orientation; called by setGlobalCameraByName. | 153 |
| `C:update(data)` | Applies rotation, zoom and position, and sends the rotation to the player's controller. | 173 |

**UI events (guihooks.trigger):** `appContainer:loadLayoutByType`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/unicycle.lua`.*
