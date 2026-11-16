# `flowgraph_nodes_ui_updatedUI_endScreenDriftStats`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenDriftStats.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenDriftStats")` (file under extensions/ but not a regular extension)

Node "EndScreen Drift Stats" (category repeat_instant, color ui). Adds a drift statistics panel to the end screen. Chain: flow input, flow output (chainFlow). To be placed between EndScreen Begin and Screen Finish.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Copies flow to the output, then calls modules.ui:addDriftStats with gameplay_drift_scoreboard.getPerformanceStats(), getTiersStats() and getDriftEventStats(). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenDriftStats.lua`.*
