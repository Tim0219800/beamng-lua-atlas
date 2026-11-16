# `flowgraph_nodes_scene_camera_getCamPath`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua` · VM: Game Engine (GE) · 85 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/getCamPath")` (file under extensions/ but not a regular extension)

Flowgraph node 'Get Cam Path' (once_f_duration category). Gives information on the state of a camera path (by 'id', otherwise the active one): outputs inactive, complete, completed (impulse once), incomplete and duration. Useful with Simple Cam Path or the procedural path nodes.

## Notes

- The code's description ('Lets the camera follow the path...') is copied from Simple Cam Path; this node only reads the state.
- If 'id' is provided but does not match the active path, the node is considered inactive.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets done and completedFlag to zero. | 35 |
| `C:_executionStopped()` | Empty. | 40 |
| `C:drawMiddle(builder, style)` | Draws the middle of the node (empty). | 79 |
| `C:init()` | Empty. | 32 |
| `C:work()` | On reset, starts again from zero. flow follows the input. With flow, determines whether the path is active, then computes inactive/complete/completed/incomplete/duration via camera:isPathComplete and getPathDuration. | 43 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua`.*
