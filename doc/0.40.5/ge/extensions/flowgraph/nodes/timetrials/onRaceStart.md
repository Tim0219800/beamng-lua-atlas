# `flowgraph_nodes_timetrials_onRaceStart`

*File: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceStart.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/timetrials/onRaceStart")` (file under extensions/ but not a regular extension)

Node "Race Started" (logic, tag input). Output pins: started (flow when the race has started) and stopped (flow before the start). Switches to started on the onRaceStart hook.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | started = false. | 28 |
| `C:init(mgr, ...)` | started = false. | 24 |
| `C:onRaceStart()` | Race start hook: started = true. | 37 |
| `C:onScenarioRestarted()` | Restart hook: resets. | 41 |
| `C:work()` | Writes started and stopped. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceStart.lua`.*
