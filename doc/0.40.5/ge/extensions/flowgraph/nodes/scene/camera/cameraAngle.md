# `flowgraph_nodes_scene_camera_cameraAngle`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAngle.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/cameraAngle")` (file under extensions/ but not a regular extension)

Flowgraph node 'Camera Transform' (repeat_instant category, file cameraAngle). Gives the position (vec3), rotation (quat) and field of view (degrees) of the current camera via core_camera. pos and rot are only computed if their output pin is used.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 22 |
| `C:work()` | fov = core_camera.getFovDeg(); pos = getPosition():toTable() and rot = getQuat():toTable() if the pins are used. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAngle.lua`.*
