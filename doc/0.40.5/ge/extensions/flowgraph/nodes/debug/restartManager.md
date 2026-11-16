# `flowgraph_nodes_debug_restartManager`

*File: `lua/ge/extensions/flowgraph/nodes/debug/restartManager.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/restartManager")` (file under extensions/ but not a regular extension)

Flowgraph node "Restart Project" (category logic, behaviour duration). Restarts the flowgraph project: calls graph.mgr:queueForRestart() when the flow input has flow.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Queues the manager for restart. | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/restartManager.lua`.*
