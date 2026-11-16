# `flowgraph_nodes_scene_camera_getCameraFOV`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/getCameraFOV.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/getCameraFOV")` (file under extensions/ but not a regular extension)

Flowgraph node 'Get Camera FOV' (repeat_instant category). Gives the camera's current field of view in degrees (core_camera.getFovDeg) on the output 'curFOV'.

## Notes

- Side effect: merely reading the FOV forces the free camera (commands.setFreeCamera).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays 'Current FOV'. | 30 |
| `C:work()` | Switches to the free camera if not already, then reads the FOV. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/getCameraFOV.lua`.*
