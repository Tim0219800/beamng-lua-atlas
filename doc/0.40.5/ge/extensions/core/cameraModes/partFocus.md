# `core_cameraModes_partFocus`

*File: `lua/ge/extensions/core/cameraModes/partFocus.lua` · VM: Game Engine (GE) · 192 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/partFocus")` (file under extensions/ but not a regular extension)

Camera that frames a vehicle part when the parts menu highlights it. Hidden (absent from the camera cycle): core_vehicle_partFocusCamera enables and disables it itself, and pushes to it the aimed point (setRef) and the distance (setDefaultDistance). The offset relative to the vehicle is smoothed (vehicle motion is followed exactly, only the change of part glides). Orbit and zoom by mouse/keyboard. update returns false when the driver is no longer active, which falls back to the vehicle camera. Returns a constructor.

## Notes

- Values: yaw 135 degrees, pitch -14, FOV 35, distance from 0.6 to 80 m (4 by default), easeRate 3. Zoom is proportional to the current distance (0.007 per ms of press, 0.12 per wheel notch).
- collisionCompatible = false (the point of interest is often inside the vehicle). dt is capped at 0.1 s.
- The extracted page says retarget(duration, brisk); the code is retarget(snap, duration, brisk).

## Class `C`

Part framing mode. Fields: camRot, targetPos, currentPos, targetDistance, currentDistance, fov, transitionElapsed/Duration, hopDistance.

The module returns a constructor: `local obj = require("core_cameraModes_partFocus")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Default values (see notes). | 21 |
| `C:reset()` | Forgets the current offset and distance (next update: jump) and resets the orbit to default. | 83 |
| `C:retarget(snap, duration, brisk)` | Prepares the switch to the next part: snap jumps directly (when the global camera transition does the blend); otherwise the view glides from its current position over duration, with a faster start if brisk. During the glide the camera pulls back in proportion to the distance traveled (up to 6 m). | 53 |
| `C:setDefaultDistance(d)` | Sets the target distance, clamped to [0.6, 80] m. | 77 |
| `C:setRef(pos)` | Sets the aimed point; if the part moved more than 5 m at once outside a glide (vehicle reset/teleport), the view jumps to it. | 66 |
| `C:update(data)` | Calls extensions.core_vehicle_partFocusCamera.updateTarget(dt, self), smooths the position, handles orbit/zoom and writes data.res.pos/rot/fov. | 90 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/partFocus.lua`.*
