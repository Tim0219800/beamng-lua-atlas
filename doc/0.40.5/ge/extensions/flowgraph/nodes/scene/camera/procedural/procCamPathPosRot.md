# `flowgraph_nodes_scene_camera_procedural_procCamPathPosRot`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procCamPathPosRot.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/procedural/procCamPathPosRot")` (file under extensions/ but not a regular extension)

Flowgraph node 'Procedural Static CamPath' (once_p_duration category). Creates a camera path with two identical keys (position pos, rotation rot, FOV 60) to display a fixed viewpoint, registers it via camera:addCustomPath and outputs its unique name on 'pathName'.

## Notes

- The code comment says the category should be f_duration but that there is no end callback.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Builds the two markers (duration 1000), generates a unique name (node id + 'pcp') and adds the path to the camera module. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procCamPathPosRot.lua`.*
