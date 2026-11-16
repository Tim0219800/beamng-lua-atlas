# `flowgraph_nodes_scene_camera_stopCamPath`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/stopCamPath.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/stopCamPath")` (file under extensions/ but not a regular extension)

Flowgraph node "Stop Cam Path" (once_instant). Stops a camera path: the active path is not considered completed but becomes inactive. Optional (hidden) input id: without id, tries to use the active path.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Central area of the node (nothing displayed). | 26 |
| `C:workOnce()` | Calls self.mgr.modules.camera:endActivePath(id). | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/stopCamPath.lua`.*
