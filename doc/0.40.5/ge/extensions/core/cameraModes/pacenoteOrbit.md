# `core_cameraModes_pacenoteOrbit`

*File: `lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua` · VM: Game Engine (GE) · 144 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/pacenoteOrbit")` (file under extensions/ but not a regular extension)

Global orbital camera around a fixed point (fixedTargetPos), used by the rally pacenotes annotation tools. Rotation by mouse, by keys (left/right, forward/backward) or by yaw/pitch inputs; zoom between 10 and 1500 m (300 by default), FOV 65. The camera is kept at least 1 m above the terrain (core_terrain). Returns a constructor.

## Notes

- update resets MoveManager.zoomIn/zoomOut to zero after reading them (so continuous zoom is limited to the frame).
- reset tests self.cameraResetted == 0 whereas this field is never defined in this file (nil): the function does nothing (dead code); camLastTargetPos2 neither.
- onSettingsChanged calls core_camera.clearInputs() (code comment: "is this really necessary?").

## Class `C`

Orbit around a point. Fields: fixedTargetPos, fov, camRot (vec3 degrees: x yaw, y pitch), camDist, defaultDistance, camMinDist, camMaxDist.

The module returns a constructor: `local obj = require("core_cameraModes_pacenoteOrbit")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | isGlobal = true, FOV 65, then setupStuff, onSettingsChanged, reset. | 10 |
| `C:onSettingsChanged()` | Hook: re-reads the cameraOrbit* settings (fovModifier, relaxation, maxDynamicFov, maxDynamicPitch, maxDynamicOffset, smoothing). | 35 |
| `C:reset()` | Dead code (see notes). | 45 |
| `C:setDefaultDistance(d)` | Changes defaultDistance (without modifying the current distance camDist). | 56 |
| `C:setRef(center, left, back)` | Sets the point to orbit around; only center is used. | 52 |
| `C:setupStuff()` | Sets default rotation (0, -17, 0), distance limits 10-1500 m and default distance 300 m. | 22 |
| `C:update(data)` | Computes the orbital position, clips it to the terrain and writes data.res (collisionCompatible = true). | 60 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua`.*
