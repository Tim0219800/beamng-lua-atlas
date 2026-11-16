# `core_cameraModes_free`

*File: `lua/ge/extensions/core/cameraModes/free.lua` · VM: Game Engine (GE) · 295 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/free")` (file under extensions/ but not a regular extension)

Free camera (free flight, global camera of the 'world' group, hidden, order 10). Position and rotation are driven by MoveManager (translation right/left/forward/backward/up/down + absolute axes, rotation yaw/pitch/roll) with optional 'Newtonian' physics (force, mass, drag) for translation and rotation; a smoothed mode (setSmoothedCam(true), used by smoothFree) is softer. Optional planar translation mode that follows the terrain height (core_terrain). A manualzoom (FOV 65 by default) handles zoom. Returns a constructor.

## Example

```lua
local cam = core_camera.getCameraDataById ... -- or directly:
local free = require('core/cameraModes/free')()
free:setPosition(vec3(0, 0, 100))
free:setRotation(quatFromDir(vec3(0, 1, 0)))
free:setFOV(70)
```

## Notes

- Translation speed: ((speed^2)/30)/40 (speed = the context's data.speed, tripled with data.fastSpeedModifier); without Newtonian physics the speed is this value * 15 m/s.
- Default non-smoothed parameters: angularForce 400, angularDrag 16, mass 1, translationForce 250, translationDrag 17; smoothed: 150, 2.5, 10, 600, 2.
- self.rot is a vec3 (yaw, pitch, roll in radians), pitch limited to ±1.5706. setRotation inverts the sign of y (YXZ conversion).
- The extracted page says setPlanarTranslationInput(active) but the code is setPlanarTranslationInput(velocity, active).

## Class `C`

Free camera mode. Fields: pos (vec3), rot (vec3 radians), velocity, angularVelocity, planarVelocity, manualzoom, smoothed, newtonTranslation, newtonRotation, planarTranslation (and planarTranslationScale/Drag/Response/SpeedMultiplier for the planar mode), group = 'world', groupOrder.

The module returns a constructor: `local obj = require("core_cameraModes_free")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearAngularMotion()` | Cancels the angular velocity. | 122 |
| `C:clearMotion()` | Cancels the translation, planar and angular velocities. | 116 |
| `C:clearPlanarTranslationInput()` | Cancels the external planar input. | 135 |
| `C:clearPlanarTranslationMotion()` | Cancels the planar velocity and the external planar input. | 140 |
| `C:init()` | Sets the default values (isGlobal, group, hidden, canUseVehicleTriggerCrosshair, non-smoothed physics) then reset. | 50 |
| `C:listParams(ctxId)` | Settings exposed to the camera control UI / video stream: speed (2-100 m/s, read via core_camera.getSpeed), smooth, newtonRot, newtonTrans, fov (10-140). | 92 |
| `C:onCameraChanged(focused)` | Hook: on focus gain, calls reset. | 145 |
| `C:reset()` | Cancels velocities and roll, recreates the manual zoom at 65 degrees. | 21 |
| `C:setFOV(fovDeg)` | Resets the manual zoom with this FOV. | 77 |
| `C:setNewtonRotation(enabled)` | Enables rotation with inertia. | 81 |
| `C:setNewtonTranslation(enabled)` | Enables translation with inertia. | 85 |
| `C:setParam(key, value, ctxId)` | Changes a listParams setting (speed goes through core_camera.setSpeed). | 102 |
| `C:setPlanarTranslationInput(velocity, active)` | Provides an external planar velocity (for example from a gamepad) for the frame; cleared after each update. | 126 |
| `C:setPosition(position)` | Sets the camera position (the table is kept by reference). | 73 |
| `C:setRotation(rotation)` | Sets the orientation from a quaternion. | 110 |
| `C:setSmoothedCam(smoothed)` | Chooses the physics parameter set (smoothed or non-smoothed). | 32 |
| `C:update(data)` | Integrates rotation and translation from MoveManager and writes data.res.pos / rot, then applies the zoom. | 237 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/free.lua`.*
