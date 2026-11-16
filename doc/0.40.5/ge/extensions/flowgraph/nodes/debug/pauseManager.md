# `flowgraph_nodes_debug_pauseManager`

*File: `lua/ge/extensions/flowgraph/nodes/debug/pauseManager.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/pauseManager")` (file under extensions/ but not a regular extension)

Flowgraph node "Pause Execution" (category logic). Pauses the execution of the flowgraph project (graph.mgr:setPaused(true)) as long as it receives flow on its flow input. Does not pause the game.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls graph.mgr:setPaused(true). | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/pauseManager.lua`.*
