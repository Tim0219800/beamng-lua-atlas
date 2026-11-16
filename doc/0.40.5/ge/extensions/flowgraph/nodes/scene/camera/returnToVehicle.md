# `flowgraph_nodes_scene_camera_returnToVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/returnToVehicle.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/returnToVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node 'Return camera to vehicle' (once_instant category). Brings the camera back to the active vehicle from another mode (free camera, etc.) with commands.setGameCamera(). No pins.

## Notes

- In the warning branch, 'logTag' is not defined in the file (nil global variable), so the log tag is nil.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | If a player vehicle exists, calls commands.setGameCamera(); otherwise logs a warning. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/returnToVehicle.lua`.*
