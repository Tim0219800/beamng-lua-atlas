# `flowgraph_nodes_timetrials_onRaceRestarted`

*File: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/timetrials/onRaceRestarted")` (file under extensions/ but not a regular extension)

Node "Race Restarted" (logic, tag input). Should raise an output impulse 'restart' when the race is restarted (hook onScenarioRestarted).

## Notes

- Bug: work writes pinOut.restart.value = self.started, a field never defined in this node (nil), instead of self.restart: the restart pin never activates.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | restart = false. | 27 |
| `C:init(mgr, ...)` | restart = false. | 23 |
| `C:onScenarioRestarted()` | Scenario restart hook: restart = true. | 36 |
| `C:work()` | Writes pinOut.restart with self.started, then restart = false. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua`.*
