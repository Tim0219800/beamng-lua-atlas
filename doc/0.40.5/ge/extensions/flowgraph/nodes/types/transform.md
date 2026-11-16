# `flowgraph_nodes_types_transform`

*File: `lua/ge/extensions/flowgraph/nodes/types/transform.lua` · VM: Game Engine (GE) · 483 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/transform")` (file under extensions/ but not a regular extension)

Flowgraph node "Transform" (provider category, d_rotation icon): provides a 3D position, rotation and scale editable in the editor. Output pins: "pos" (vec3), "rot" (quat) and "scl" (vec3), as {x,y,z} / {x,y,z,w} tables. Two modes: "gizmo" (edited with the World Editor gizmo, DragFloats or the camera/terrain buttons) and "fromID" (an input pin "objID" is added; the node copies position/rotation/scale from the matching scene object). In the editor it draws a preview volume (display modes default, sphereX/Y/Z, halfBox, fullBox, aproxVehicle) with debugDrawer.

## Notes

- The outputs are only recomputed if 'changed' is true (or every frame in fromID mode); _executionStarted/_executionStopped set 'changed' back to true.
- The initial position is placed 15 m in front of the editor camera.
- The values are serialized in position, rotation, scale, markerClr, mode, useQuatForRotation and displayMode; fromID mode recreates the objID pin on load.
- The 'aproxVehicle' display mode draws a box approximating a vehicle (2 x 4.2 x 1.8 times the scale) around the position.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forces the outputs to be rewritten at start (changed = true). | 317 |
| `C:_executionStopped()` | Forces the outputs to be rewritten at the next start (changed = true). | 341 |
| `C:_onDeserialized(nodeData)` | Restores the node's state from the saved data. | 459 |
| `C:_onSerialize(res)` | Writes the node's state to the save table. | 448 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Draws a solid box (triangles) and its black edges from a corner and three edge vectors. | 392 |
| `C:drawCustom()` | Draws the gizmo mode controls: display mode, position, rotation (euler in degrees or quaternion), scale, color, buttons "Copy from selection", "Position in front of camera / at camera", "Rotation at camera", "Drop to terrain". | 166 |
| `C:drawCustomProperties()` | Mode combo (gizmo/fromID) — adds or removes the objID pin — then drawCustom in gizmo mode. | 123 |
| `C:drawMiddle(builder, style)` | Draws the colored X/Y/Z axes (spheres and lines) and the preview volume according to displayMode. | 346 |
| `C:gizmoBeginDrag()` | Start of a gizmo drag: stores the original rotation, scale and position. | 42 |
| `C:gizmoDragging()` | During the gizmo drag: updates position (translation), rotation (rotation, in local frame or relative to the start) or scale (component by component) depending on the gizmo mode, and draws the axes. | 48 |
| `C:gizmoEndDrag()` | End of a gizmo drag (called by editor.updateAxisGizmo); updates the node's state. | 79 |
| `C:hideProperties()` | Called when the node is deselected: removes the gizmo and goes back to the objectSelect edit mode. | 113 |
| `C:init()` | Sets the position 15 m in front of the camera, identity rotation, scale (1,1,1), semi-transparent red marker color, mode 'gizmo' and displayMode 'halfBox'. | 24 |
| `C:showProperties()` | Called when the node is selected in the editor: plugs in the 'flowgraphTransform' edit mode with the World Editor axis gizmo. | 85 |
| `C:updateTransform()` | Synchronizes the gizmo matrix with the node's position and rotation (rotation ignored if the gizmo is in world alignment). | 153 |
| `C:work()` | In fromID mode, copies position/rotation/scale from the object objID; if 'changed', writes the three output pins. | 321 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`
- `obj:` `getPosition`, `getRotation`, `getScale`
- `scenetree.` `findClassObjects`, `findObjectById`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/transform.lua`.*
