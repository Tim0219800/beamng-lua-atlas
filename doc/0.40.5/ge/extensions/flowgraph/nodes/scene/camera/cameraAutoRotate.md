# `flowgraph_nodes_scene_camera_cameraAutoRotate`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAutoRotate.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/cameraAutoRotate")` (file under extensions/ but not a regular extension)

Flowgraph node 'Camera Look at Position' (repeat_instant category, file cameraAutoRotate). Switches to the free camera and orients the camera to constantly look at the target position 'position', without moving it (up vector (0,0,1)).

## Notes

- Crashes if the 'position' pin is nil (vec3(nil)).
- The setPosRot call uses player index 0.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Enables the free camera if needed then applies core_camera.setPosRot with the rotation quatFromDir(position - camPos, up). | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraAutoRotate.lua`.*
