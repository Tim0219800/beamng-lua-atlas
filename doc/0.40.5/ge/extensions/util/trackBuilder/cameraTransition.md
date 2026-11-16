# `util_trackBuilder_cameraTransition`

*File: `lua/ge/extensions/util/trackBuilder/cameraTransition.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_cameraTransition`: `extensions.load("util_trackBuilder_cameraTransition")`, then the global `util_trackBuilder_cameraTransition`

Small Track Builder utility that smoothly moves the free camera to a target position and rotation. It interpolates position (linear) and rotation (nlerp) with an inverted quadratic ease curve (1-(1-t)²), on each onPreRender, via core_camera.setPosRot.

## Example

```lua
util_trackBuilder_cameraTransition.lerpTo(vec3(0,0,50), quatFromEuler(0,0,0), 2)
```

## Notes

- The interpolation is applied only if commands.isFreeCamera() is true (free camera); otherwise the transition runs with no visible effect.
- Bug: in lerpTo, the time <= 0 branch passes quat.w (the field of the quat class, probably nil) instead of rot.w to core_camera.setPosRot.
- currentQuat is initialized with vec3(0,0,0) but then receives a quat; harmless since it is overwritten before use.
- The pos and rot arguments are stored by reference (no copy).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_cameraTransition.lerpTo(pos, rot, time)` | Starts a transition from the current camera to (pos, rot) over time seconds. If time <= 0, places the camera immediately. | 39 |
| `util_trackBuilder_cameraTransition.onPreRender(dt)` | Hook called before each render: advances the transition, computes the interpolated position and rotation and applies them to the free camera. *(internal)* *(hook)* | 22 |

### Parameter details

#### `util_trackBuilder_cameraTransition.lerpTo(pos, rot, time)`

Starts a transition from the current camera to (pos, rot) over time seconds. If time <= 0, places the camera immediately.

- `pos` (*vec3*) : Target position in the world.
- `rot` (*quat*) : Target rotation.
- `time` (*number*) : Duration in seconds; 0 or less for an immediate jump.

#### `util_trackBuilder_cameraTransition.onPreRender(dt)`

Hook called before each render: advances the transition, computes the interpolated position and rotation and applies them to the free camera.

- `dt` (*number*) : Time elapsed since the previous frame (s).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/cameraTransition.lua`.*
