# `flowgraph_nodes_scene_camera_setCameraPosition`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua` · VM: Game Engine (GE) · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/setCameraPosition")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Camera Position" (repeat_instant). Moves the free camera to a position, entered in the node ('custom' mode) or supplied by a vec3 pin 'pos' ('from Pin' mode, dynamically created pin). The camera's current rotation is kept. The output pin value (vec3) returns the applied position.

## Notes

- The 'value' pin is declared with direction 'out' (vec3) whereas the description says "position to set camera to": it is indeed an output that reflects the applied position.
- The vec3 values are {x,y,z} tables.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:SetCamera()` | Calls core_camera.setPosRot(0, ...) with the node's position and the camera's current rotation (core_camera.getQuat). | 88 |
| `C:_onDeserialized(nodeData)` | Restores position and mode; recreates the 'pos' pin in 'from Pin' mode. | 101 |
| `C:_onSerialize(res)` | Saves the position (res.ppos) and the mode (res.mode). | 95 |
| `C:drawCustomProperties()` | Editor properties panel: mode choice, x/y/z fields, buttons "Set from camera" and "Preview". Creates or deletes the 'pos' pin depending on the mode. Returns a reason string if a change occurred. | 27 |
| `C:drawMiddle(builder, style)` | Central area of the node in the editor (nothing displayed). | 84 |
| `C:init()` | Initializes the position to (0,0,0), the mode to 'custom' and the mode list {'custom','from Pin'}. | 21 |
| `C:work()` | Switches to the free camera if needed, reads the position from the 'pos' pin in 'from Pin' mode, applies the position (SetCamera) and writes the value pin. | 73 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua`.*
