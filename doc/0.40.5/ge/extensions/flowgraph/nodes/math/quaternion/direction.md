# `flowgraph_nodes_math_quaternion_direction`

*File: `lua/ge/extensions/flowgraph/nodes/math/quaternion/direction.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/quaternion/direction")` (file under extensions/ but not a regular extension)

Flowgraph node 'Direction' (simple category). Converts an angle 'deg' in degrees into a rotation quaternion around the Z axis (setFromEuler(0,0,angle)). The result is recomputed only when the angle changes.

## Notes

- The quaternion 'rot' is a module-local variable shared by all instances of the node, whereas the oldIn cache is per instance: two nodes with different angles may overwrite each other.
- If the input angle is nil, work raises an arithmetic error on nil.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | oldIn = nil. | 23 |
| `C:work()` | Recomputes the quaternion (module-local variable) if the angle changed, writes the quaternion table to 'value'. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/quaternion/direction.lua`.*
