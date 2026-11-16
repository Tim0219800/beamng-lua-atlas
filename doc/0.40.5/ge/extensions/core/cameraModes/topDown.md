# `core_cameraModes_topDown`

*File: `lua/ge/extensions/core/cameraModes/topDown.lua` · VM: Game Engine (GE) · 133 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/topDown")` (file under extensions/ but not a regular extension)

Top-down camera (disabled by default), presented in the code as "an example of a custom camera mode". Follows the vehicle from above with look-ahead toward the actual direction of travel (up to 10 m), smooths position and heading. Options: alignToCar (the top of the screen follows the vehicle's heading instead of north +Y), tilt (0 to 80 degrees from vertical; 45 + ortho = isometric), ortho (orthographic projection, data.res.ortho). Camera distance = 50 + 0.9 * smoothed speed. Default FOV 20. Returns a constructor.

## Notes

- A minimal mode to copy to create your own camera: update must fill data.res.pos (vec3), data.res.rot (quat), data.res.fov, and may fill targetPos; return true.
- init calls `C:onVehicleCameraConfigChanged()` (with the class C, not self): the default FOV is therefore written to the class C and not to the instance, which only works because self.fov falls back to C.fov through the metatable (inferred from code).

## Class `C`

Top-down mode. Fields: alignToCar, tilt, ortho, fov, refNodes.

The module returns a constructor: `local obj = require("core_cameraModes_topDown")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:deserialize(s)` | Restores the state from serialize. | 99 |
| `C:init()` | Creates the smoothers and default values. | 10 |
| `C:listParams()` | UI settings: align, tilt (0-80), ortho, fov (10-140). | 109 |
| `C:onVehicleCameraConfigChanged()` | Hook: default FOV to 20. | 28 |
| `C:serialize()` | State for video stream views: alignToCar, fov, tilt, ortho. | 95 |
| `C:setParam(key, value)` | Changes align, tilt, ortho or fov. | 118 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Sets the vehicle's reference nodes (used for alignToCar). | 86 |
| `C:update(data)` | Computes the pose from speed and heading, writes data.res (pos, rot, fov, targetPos, ortho). | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/topDown.lua`.*
