# `core_cameraModes_steadycam`

*File: `lua/ge/extensions/core/cameraModes/steadycam.lua` · VM: Game Engine (GE) · 242 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/steadycam")` (file under extensions/ but not a regular extension)

Steadycam: first-person on-foot camera of the "world" group (order 30, after free and smoothFree, hidden). Walks with the movement keys, looks with the mouse, runs with the fast modifier, jumps with the space bar ("Steadycam" action map). Gravity and a downward ray keep the operator on the ground (steps up to 0.4 m are climbed, higher = wall, lower drop = falls). With groundWalk = false, it is free vertical flight. Walking sway via the bobbing filter. Returns a constructor.

## Notes

- Constants: walking speed 2.45 m/s (adjustable 1 to 12), run x2, gravity 14 m/s2, jump 5.5 m/s (about 1.1 m), body radius 0.35 m, eye height 1.7 m (setting cameraSteadycamEyeHeight, 1.0 to 2.5), FOV setting cameraSteadycamFov (60).
- With no ground under the camera (void), it floats instead of falling indefinitely.
- data.res.collisionCompatible = false.

## Class `C`

Steadycam mode. Fields: pos (vec3 eyes), yaw, pitch (radians), vel, vz, grounded, walkSpeed, groundWalk, eyeHeight, manualzoom, bobbing.

The module returns a constructor: `local obj = require("core_cameraModes_steadycam")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:deserialize(s)` | Restores the state (accepts the old key bob). | 129 |
| `C:init()` | Sets group, feel constants and creates zoom and bobbing. | 30 |
| `C:listParams()` | UI settings: height, walkSpeed, walkBob, standingBob, groundWalk, fov. | 104 |
| `C:onCameraChanged(focused)` | Hook: pushes the "Steadycam" action map on focus gain and removes it on loss. | 94 |
| `C:onSettingsChanged()` | Hook: re-reads eye height, FOV and bobbing settings. | 55 |
| `C:reset()` | Cancels velocities, jump and grounded state, resets bobbing and zoom. | 65 |
| `C:serialize()` | State for video stream views. | 124 |
| `C:setFOV(fov)` | Sets the configured FOV (10 to 140). | 87 |
| `C:setParam(key, value)` | Changes a listParams setting. | 115 |
| `C:setPosition(p)` | Places the camera (fed on entering the camera group so it does not jump) and cancels the velocity. | 80 |
| `C:setRotation(q)` | Orients the look from a quaternion (the camera looks toward +Y). | 81 |
| `C:update(data)` | Integrates look, walking, gravity, jump and writes data.res (pos, rot, fov, targetPos 10 m ahead). | 139 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/steadycam.lua`.*
