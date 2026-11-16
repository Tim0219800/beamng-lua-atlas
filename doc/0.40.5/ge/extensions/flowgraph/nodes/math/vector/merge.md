# `flowgraph_nodes_math_vector_merge`

*File: `lua/ge/extensions/flowgraph/nodes/math/vector/merge.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/vector/merge")` (file under extensions/ but not a regular extension)

Flowgraph node 'Merge' (simple category). Groups up to 4 numbers x, y, z, w into a table {x, y, z, w} (type vec3, color or quat) on the 'value' output.

## Notes

- Nil inputs leave holes in the table; a missing w gives a 3-element table (vec3).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 25 |
| `C:work()` | Builds {x, y, z, w} from the inputs and writes it to the output. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/vector/merge.lua`.*
