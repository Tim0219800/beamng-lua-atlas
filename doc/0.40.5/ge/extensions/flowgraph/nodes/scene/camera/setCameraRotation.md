# `flowgraph_nodes_scene_camera_setCameraRotation`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/setCameraRotation")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Camera Rotation" (repeat_instant). Applies a rotation (quaternion) to the free camera, entered in the node ('custom' mode) or supplied by a quat pin 'rot' ('from Pin' mode). The camera's current position is kept. The output pin value (quat) returns the applied rotation.

## Notes

- The default rotation quat(0,0,0,0) is not a valid quaternion (not normalized): it is only normalized if the user edits the fields.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:SetCamera()` | Calls core_camera.setPosRot(0, ...) with the camera's current position and the node's rotation. | 88 |
| `C:_onDeserialized(nodeData)` | Restores rotation and mode; recreates the 'rot' pin if needed. | 102 |
| `C:_onSerialize(res)` | Saves the rotation (res.rot) and the mode. | 97 |
| `C:drawCustomProperties()` | Editor properties panel: mode choice, x/y/z/w fields (normalized), buttons "Set from camera" and "Preview". Creates/deletes the 'rot' pin. | 28 |
| `C:drawMiddle(builder, style)` | Central area of the node (nothing displayed). | 84 |
| `C:init()` | Initializes the rotation to quat(0,0,0,0), the mode to 'custom' and the mode list. | 22 |
| `C:work()` | Switches to the free camera if needed, reads the 'rot' pin in 'from Pin' mode, applies the rotation (SetCamera) and writes the value pin. | 73 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua`.*
