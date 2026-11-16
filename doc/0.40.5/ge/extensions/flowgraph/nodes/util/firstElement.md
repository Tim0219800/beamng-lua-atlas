# `flowgraph_nodes_util_firstElement`

*File: `lua/ge/extensions/flowgraph/nodes/util/firstElement.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/firstElement")` (file under extensions/ but not a regular extension)

Node "Get First Element of Table" (repeat_instant). Returns the first element (index 1) of a table. Input: table. Output: firstElement (any).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Sets oldPos to nil (field unused afterwards). | 23 |
| `C:getFirstElement(table)` | Returns table[1] of the input pin table (the argument is not used). | 27 |
| `C:init(mgr)` | Does nothing. | 20 |
| `C:work()` | Writes the first element to firstElement if the table is connected. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/firstElement.lua`.*
