# `flowgraph_nodes_debug_stopManager`

*File: `lua/ge/extensions/flowgraph/nodes/debug/stopManager.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/stopManager")` (file under extensions/ but not a regular extension)

Flowgraph node "Stop Project" (category logic). Stops the execution of the flowgraph project (graph.mgr:setRunning(false)) when the flow input has flow.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls graph.mgr:setRunning(false). | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/stopManager.lua`.*
