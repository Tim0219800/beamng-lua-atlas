# `flowgraph_nodes_types_quat`

*File: `lua/ge/extensions/flowgraph/nodes/types/quat.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/quat")` (file under extensions/ but not a regular extension)

Node "Quat" (repeat_instant). Builds a quaternion from the pins x, y, z, w (0 by default) and writes it as a {x,y,z,w} table on the value pin (quat).

## Notes

- The quaternion is not normalized; with all pins at 0 you get (0,0,0,0), which is invalid.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores nothing. | 41 |
| `C:_onSerialize(res)` | Saves nothing. | 38 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 30 |
| `C:drawProperties()` | Empty. | 35 |
| `C:work()` | Composes the quaternion and writes the table. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/quat.lua`.*
