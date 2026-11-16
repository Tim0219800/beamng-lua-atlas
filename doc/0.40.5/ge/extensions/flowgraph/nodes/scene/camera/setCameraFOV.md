# `flowgraph_nodes_scene_camera_setCameraFOV`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/setCameraFOV")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Camera FOV" (repeat_instant category, camera color/icon). Input pin: value (number), the field of view in degrees. On each execution (work), switches to the free camera if not already, then calls core_camera.setFOV(0, value). When the graph starts it stores the current FOV (core_camera.getFovDeg) and restores it on stop.

## Notes

- If the value pin has no value, core_camera.setFOV is still called with nil (no guard in the code).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the graph starts: stores the current FOV in self._storedFov. | 30 |
| `C:_executionStopped()` | Called when the graph stops: restores the stored FOV then forgets it. | 33 |
| `C:drawMiddle(builder, style)` | Draws the FOV value (2 decimals) in the middle of the node in the editor. | 39 |
| `C:work()` | Forces the free camera (commands.setFreeCamera) if needed, then applies the FOV of the value pin via core_camera.setFOV(0, ...). | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua`.*
