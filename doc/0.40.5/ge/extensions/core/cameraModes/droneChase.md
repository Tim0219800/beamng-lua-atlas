# `core_cameraModes_droneChase`

*File: `lua/ge/extensions/core/cameraModes/droneChase.lua` · VM: Game Engine (GE) · 302 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/droneChase")` (file under extensions/ but not a regular extension)

Aerial chase drone camera (disabled by default, icon cameraFocusOnVehicle1): floats above and behind the player's vehicle according to its (smoothed) heading, looks at it and banks in turns. An underdamped spring-damper (visible overshoot, slower rise) moves it; it follows the terrain (aware of tunnels/bridges) and keeps safeDist meters from buildings. Everything runs on dtSim (consistent in fast-forward/slow motion). Movement inputs shift the desired position (positionOffset), rotation inputs make it orbit. Returns a constructor.

## Notes

- data.res.collisionCompatible = false: the camera collision filter does not apply to this mode.
- Adjustable parameters (listParams): dist 12 m (4 to 80), height 6 m (1-40), bank (0-2), float (0.2-3, inertia), safeDist (0-5 m), fov (10-140, 55 by default). No player vehicle: the camera keeps its previous pose.
- Safeguards: minimum altitude 2 m above the ground and 0.8 m below a ceiling (tunnel).
- The extraction reports a global "i": it is actually the `for i = 0, 5` loop of the probe table (local variable); no real leak.

## Class `C`

Drone mode. Fields: camDist, height, fov, bank, floating, safeDist, positionOffset, orbitYaw, orbitPitch, pos, vel, head.

The module returns a constructor: `local obj = require("core_cameraModes_droneChase")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:avoid(x, y, z, car)` | Keeps the safety distance from static meshes: stays on the vehicle's side of any wall, and pushes out of any obstacle closer than safeDist (6 horizontal probes). | 158 |
| `C:clampAltitude(x, y, z, car)` | Corrects the altitude to follow the vehicle: under cover stays between ground+2 m and ceiling-0.8 m; in the open climbs to fly over hills. | 96 |
| `C:deserialize(s)` | Restores the saved state and forces repositioning. | 141 |
| `C:init()` | Sets the default values and calls reset. | 57 |
| `C:listParams()` | List of settings exposed to the camera control UI / video stream (dist, height, bank, float, safeDist, fov). | 114 |
| `C:onCameraChanged(focused)` | Hook: on focus gain, the drone is repositioned. | 86 |
| `C:placeInit(position)` | Places the drone instantly at a position and cancels its velocity. | 88 |
| `C:reset()` | Marks the drone to be repositioned, cancels velocity, offset and orbit. | 73 |
| `C:serialize()` | Saves the mode state (distance, fov, height, bank, float, safeDist, positionOffset, orbit). | 134 |
| `C:setDistance(d)` | Sets the follow distance clamped to [4, 80] m. | 84 |
| `C:setFOV(fov)` | Sets the field of view. | 85 |
| `C:setParam(key, value)` | Changes a listParams setting (values clamped). | 125 |
| `C:update(data)` | Computes the drone pose and writes it to data.res (pos, rot, fov, targetPos). | 183 |

**Globals assigned:** `i`

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/droneChase.lua`.*
