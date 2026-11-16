# `flowgraph_nodes_timetrials_onRaceComplete`

*File: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/timetrials/onRaceComplete")` (file under extensions/ but not a regular extension)

Node "Race Complete" (repeat_instant, tag input). Output pins: complete (flow when the race is finished) and ongoing (flow as long as it is not). Switches to finished on the onScenarioFinished hook.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | complete = false. | 27 |
| `C:init(mgr, ...)` | complete = false. | 23 |
| `C:onScenarioFinished()` | Scenario end hook: marks the race as finished. | 37 |
| `C:onScenarioRestarted()` | Restart hook: resets. | 41 |
| `C:work()` | Writes complete and ongoing. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua`.*
