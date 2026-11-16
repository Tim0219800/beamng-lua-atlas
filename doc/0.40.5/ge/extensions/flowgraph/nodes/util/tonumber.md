# `flowgraph_nodes_util_tonumber`

*File: `lua/ge/extensions/flowgraph/nodes/util/tonumber.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/tonumber")` (file under extensions/ but not a regular extension)

Node "To Number" (simple category). Converts the input to a number with tonumber. Input: value (any). Output: value (number). The todo field warns that the result can be nil.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Writes tonumber(input) to the output. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/tonumber.lua`.*
