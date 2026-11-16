# `flowgraph_nodes_math_vector_split`

*File: `lua/ge/extensions/flowgraph/nodes/math/vector/split.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/vector/split")` (file under extensions/ but not a regular extension)

Flowgraph node 'Split' (simple category). Decomposes a table (vec3, color or quat, 4 elements max) into numbers x, y, z, w.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 25 |
| `C:work()` | Writes table[1..4] to x, y, z, w (empty table if the input is nil). | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/vector/split.lua`.*
