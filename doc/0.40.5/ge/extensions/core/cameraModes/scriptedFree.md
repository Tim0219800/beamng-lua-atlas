# `core_cameraModes_scriptedFree`

*File: `lua/ge/extensions/core/cameraModes/scriptedFree.lua` · VM: Game Engine (GE) · 440 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/scriptedFree")` (file under extensions/ but not a regular extension)

Script-driven free camera (global, hidden): the pose (position, yaw, pitch downward, roll in degrees) is owned by the script every frame, with optional mouse look or manual movement. Allows animated flights (setTarget with duration, curve and callback), continuous smoothing (setSmooth), position locking (locked), disabling rotation (driveRot) or movement. Returns a constructor.

## Example

```lua
core_camera.setByName(0, 'scriptedFree', false, {pos = vec3(0,0,50), yawDeg = 90, locked = true})
local cam = core_camera.getGlobalCameras().scriptedFree
cam:setTarget({pos = vec3(100,0,30), lookAt = vec3(0,0,0), time = 3, ease = 'easeInOut', onDone = function() print('done') end})
```

## Notes

- Convention: positive pitchDeg = looks downward (like setFreeCameraYawPitchRollDeg). Manual pitch limited to ±85 degrees.
- locked = true: the script owns the position (no movement keys); allowLookWhenLocked = true lets the head turn; driveRot = false: setPose/setTarget ignore rotation (the user aims while a path drives the position).
- dt is capped at 0.05 s in update. Default manual speed 30 m/s (x5 with fastSpeedModifier); look sensitivity 2.2; FOV 65.
- setTarget locks the camera during the animation unless lockDuring = false.

## Class `C`

Scripted free camera mode. Fields: pos (vec3), yawDeg, pitchDeg, rollDeg, fov, locked, driveRot, allowLookWhenLocked, allowLook, allowMove, manualSpeed, lookSens, smoothPos, smoothRot, anim.

The module returns a constructor: `local obj = require("core_cameraModes_scriptedFree")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:cancelTarget()` | Cancels the animation in progress (the camera stays at its current position, without calling onDone). | 227 |
| `C:getPose()` | Current pose. | 215 |
| `C:getQuat()` | Current orientation as a quaternion. | 219 |
| `C:init()` | Default values (see module). | 78 |
| `C:isAnimating()` | Indicates whether a setTarget is in progress. | 223 |
| `C:setAllowLookWhenLocked(enabled)` | Allows mouse look while locked. | 202 |
| `C:setCustomData(data)` | Applies settings at once (called by setByName / setGlobalCameraByName): pos, yawDeg, pitchDeg, rollDeg, locked, driveRot, allowLookWhenLocked, manualSpeed, lookSens, fov, allowLook, allowMove, smoothPos, smoothRot; missing keys are unchanged. | 104 |
| `C:setDriveRot(enabled)` | Allows setPose/setTarget to drive the rotation. | 198 |
| `C:setFOV(fovDeg)` | Sets the FOV. | 210 |
| `C:setLocked(locked)` | Locks the position (the script owns it, no WASD). | 194 |
| `C:setManualSpeed(mps)` | Manual movement speed. | 206 |
| `C:setPose(pos, yawDeg, pitchDeg, rollDeg)` | Sets the target pose (instant, or smoothed if smoothPos/smoothRot > 0) and cancels an animation in progress. Rotation is ignored if driveRot is false. | 163 |
| `C:setPosition(position)` | Places the camera (and its smoothing goal) without animation; ignores nil. | 127 |
| `C:setRotation(rotation)` | Orients the camera from a quaternion. | 135 |
| `C:setSmooth(posSec, rotSec)` | Continuous smoothing time (seconds to reach ~63%); 0 = instant setPose. | 189 |
| `C:setTarget(opts)` | Flies to a pose over a duration. Without a duration (<= 0), applies the pose immediately then calls onDone. | 249 |
| `C:setYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg)` | Sets the angles (nil arguments are unchanged). | 148 |
| `C:update(data)` | Applies the animation, look, manual movement or smoothing and writes data.res.pos / rot / fov. | 380 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/scriptedFree.lua`.*
