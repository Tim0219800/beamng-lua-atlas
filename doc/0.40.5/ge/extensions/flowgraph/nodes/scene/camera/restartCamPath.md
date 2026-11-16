# `flowgraph_nodes_scene_camera_restartCamPath`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/restartCamPath.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/restartCamPath")` (file under extensions/ but not a regular extension)

Flowgraph node 'Restart Cam Path' (once_instant category, behaviour once). Restarts the active camera path (or the one with id 'id', hidden pin) via camera:restartActivePath.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the middle of the node (empty). | 26 |
| `C:workOnce()` | Calls self.mgr.modules.camera:restartActivePath(id). | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/restartCamPath.lua`.*
