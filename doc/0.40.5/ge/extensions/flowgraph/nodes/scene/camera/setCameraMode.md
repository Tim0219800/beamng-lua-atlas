# `flowgraph_nodes_scene_camera_setCameraMode`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraMode.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/setCameraMode")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Camera Mode" (repeat_instant, depends on core_camera). Input pin: mode (string), name of the camera mode. On each execution, if the name is not empty, calls core_camera.setByName(0, mode).

**Dependencies (loaded first):** `core_camera`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Changes the camera mode of player 0 via core_camera.setByName if the mode pin is not empty. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraMode.lua`.*
