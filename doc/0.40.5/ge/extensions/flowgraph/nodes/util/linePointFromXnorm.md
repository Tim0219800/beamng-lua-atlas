# `flowgraph_nodes_util_linePointFromXnorm`

*File: `lua/ge/extensions/flowgraph/nodes/util/linePointFromXnorm.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/linePointFromXnorm")` (file under extensions/ but not a regular extension)

Node "Line Point From Xnorm" (repeat_instant). Returns the position located between two points of a line according to a ratio xnorm (0 = posA, 1 = posB; 0.5 by default if not provided). Inputs: posA, posB (vec3), xnorm. Output: pos (vec3 as a table).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If posA and posB are connected, calls the global function linePointFromXnorm and writes the result to pos. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/linePointFromXnorm.lua`.*
