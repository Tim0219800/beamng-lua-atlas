# `flowgraph_nodes_scene_camera_cameraCircle`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/cameraCircle")` (file under extensions/ but not a regular extension)

Flowgraph node 'Camera Auto Circle' (once_p_duration category). Rotates the free camera in a circle around a vehicle (vehId, default player vehicle) or a point (centerPos): radius 'radius' (5 by default), height 'height', angular speed 'speed' in degrees/s (10 by default, negative for the opposite direction), start angle 'startAngle' (relative to the vehicle's orientation if vehId is given), 'snapHeight' to follow the terrain. The camera always looks at the center.

## Notes

- The angle advances with mgr.dtReal (real time, not simulation).
- The center follows the center of the vehicle's bounding box (OOBB) every frame.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls onNodeReset. | 28 |
| `C:onNodeReset()` | Resets center, offset, camera position and angle to zero. | 32 |
| `C:work()` | Computes the center, the position on the circle, the height (with 5% smoothing if snapHeight), orients the camera toward the center (core_camera.setPosRot) then increments the angle by dtReal * speed. | 54 |
| `C:workOnce()` | Switches to the free camera and sets the start angle (+180 degrees, plus the vehicle's orientation if vehId). | 39 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`, `getSurfaceHeightBelow`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua`.*
