# `flowgraph_nodes_util_pushActionMap`

*File: `lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/pushActionMap")` (file under extensions/ but not a regular extension)

Node "Push Action Map" (once_instant). Pushes an action map (pushActionMap) to enable its inputs; it is removed automatically when the project stops. Input: name. The todo field points to odd behavior if several projects use the same action map.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Removes the pushed action map (popActionMap) and forgets its name. | 25 |
| `C:drawMiddle(builder, style)` | Displays "<name> pushed." in the node. | 37 |
| `C:init(mgr, ...)` | Calls _executionStopped. | 21 |
| `C:workOnce()` | Stores the name and calls pushActionMap(name). | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua`.*
