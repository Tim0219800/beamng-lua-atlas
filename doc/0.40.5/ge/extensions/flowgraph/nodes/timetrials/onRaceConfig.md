# `flowgraph_nodes_timetrials_onRaceConfig`

*File: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/timetrials/onRaceConfig")` (file under extensions/ but not a regular extension)

Node "Race Config" (provider, tag input). Gives the configuration chosen by the player for the race, read once from scenario_scenarios.getScenario(): laps (scenario.lapCount), reverse (scenario.isReverse), rollingStart (scenario.rollingStart).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | done = false. | 29 |
| `C:init(mgr, ...)` | done = false, clearOutPinsOnStart = false. | 24 |
| `C:onScenarioRestarted()` | Restart hook: reads the configuration again. | 46 |
| `C:work()` | As long as not done and a scenario exists, copies its settings to the pins. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua`.*
