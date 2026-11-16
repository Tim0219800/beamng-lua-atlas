# `flowgraph_nodes_types_vec3`

*File: `lua/ge/extensions/flowgraph/nodes/types/vec3.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/vec3")` (file under extensions/ but not a regular extension)

Flowgraph node "Vec3" (repeat_instant category, tags vec3/vector/direction): builds a 3D vector. Number inputs "x", "y", "z" (0 by default); hidden input "rot" (quat): if it is linked, the output "value" is the vector (0,1,0) rotated by this quaternion (forward direction). Output "value" (vec3 as an {x,y,z} table).

## Notes

- If 'rot' has a value, x/y/z are ignored.
- drawMiddle displays the vector built from x/y/z (even if rot is used).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Empty. | 48 |
| `C:_onSerialize(res)` | Empty (nothing to save). | 45 |
| `C:drawMiddle(builder, style)` | Displays the vector text (x,y,z) at the center of the node. | 37 |
| `C:drawProperties()` | Empty. | 42 |
| `C:work()` | Computes the output: direction (0,1,0) rotated by 'rot' if present, otherwise {x,y,z}. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/vec3.lua`.*
