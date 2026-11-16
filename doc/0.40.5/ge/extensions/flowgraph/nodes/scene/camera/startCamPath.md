# `flowgraph_nodes_scene_camera_startCamPath`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/startCamPath")` (file under extensions/ but not a regular extension)

Flowgraph node "Start Cam Path" (once_instant). Makes the camera follow the path of a CameraPath object (.camPath.json file). Inputs: pathName (string), loop (bool). Outputs: activated (flow impulse, a single frame) and id (number) of the path. Uses the flowgraph camera module (self.mgr.modules.camera).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Central area of the node (nothing displayed). | 49 |
| `C:init()` | Nothing to initialize. | 24 |
| `C:postInit()` | Restricts the pathName pin to the "Camera Path Files" file selector (.camPath.json). | 27 |
| `C:work()` | Drops activated back to false on the frame following the activation (flag activatedFlag). | 41 |
| `C:workOnce()` | Finds the path (modules.camera:findPath), starts it (startPath with loop), writes id and raises the activated impulse. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua`.*
