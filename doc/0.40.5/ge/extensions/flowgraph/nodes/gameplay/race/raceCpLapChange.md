# `flowgraph_nodes_gameplay_race_raceCpLapChange`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceCpLapChange.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceCpLapChange")` (file under extensions/ but not a regular extension)

Flowgraph node "Race CP/Lap Change" (category repeat_instant). Lets a flow (changed pulse) through when a vehicle's checkpoint or lap changes, based on the race state events (rollingStarted, pathnodeReached, raceStarted, lapComplete, raceComplete). Outputs: flow, changed, curCP (linear index of the current checkpoint), maxCP (number of pathnodes), curLap (current lap, 1-based), maxLap (race.lapCount), recoveryReached and usedRecovery.

## Notes

- A block of code is disabled by "if false and ..." (reset of the race markers): it is dead.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame: copies flow, and if a checkpoint/lap event occurred for vehId, updates curCP, maxCP, curLap, maxLap, changed, recoveryReached and usedRecovery. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceCpLapChange.lua`.*
