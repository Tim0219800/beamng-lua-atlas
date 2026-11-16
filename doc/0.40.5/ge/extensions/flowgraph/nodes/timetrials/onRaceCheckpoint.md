# `flowgraph_nodes_timetrials_onRaceCheckpoint`

*File: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/timetrials/onRaceCheckpoint")` (file under extensions/ but not a regular extension)

Node "Race CP Reached" (repeat_instant). Lets an impulse through when the player crosses a race checkpoint. Outputs: checked (impulse), vehId (hidden), index (checkpoint), lap (current lap, counted with data.lapDiff). Receives the hook onRaceWaypointReached.

## Notes

- Old pin name: vehicleID -> vehId (legacyPins).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets lap = 1 and enterFlag = false. | 35 |
| `C:init(mgr, ...)` | Initializes enterFlag, lap = 1 and clearOutPinsOnStart = false. | 29 |
| `C:onRaceWaypointReached(data)` | Hook: stores vehId, index (data.cur) and updates the lap (data.lapDiff). | 40 |
| `C:onScenarioRestarted()` | Scenario restart hook: resets the node. | 53 |
| `C:work(args)` | Writes checked = enterFlag then resets it to false. | 48 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua`.*
