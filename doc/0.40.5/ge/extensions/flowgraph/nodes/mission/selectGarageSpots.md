# `flowgraph_nodes_mission_selectGarageSpots`

*File: `lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua` · VM: Game Engine (GE) · 193 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/selectGarageSpots")` (file under extensions/ but not a regular extension)

Flowgraph node 'Select Garage Spots' (once_p_duration category, author BeamNG). Picks a start spot and an end spot among sitesData.parkingSpots: in isLocal mode, the start spot must belong to the zone 'zone' (zone with the lowest prio); the end spot is chosen at random between minDist and maxDist distance. Outputs: flow (once found), impulse loaded, startSpot, endSpot, startLocation, endLocation. The input pin descriptions are empty in the code.

## Notes

- The log message mentions 'G2G Route' (carried over from the garage-to-garage node).
- The reset (pin) is not read in work; only resetData via workOnce/_executionStarted resets to zero.
- If possibleStartingSpots is empty (no spot in the zone), self.startSpot is nil and the node crashes.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls resetData. | 52 |
| `C:findEndSpotForStartingSpot(startSpot)` | Picks an end spot at an acceptable distance from the start spot (see Select Garage Sites), otherwise the best candidate. | 77 |
| `C:init()` | Initializes the lists, state=1 and the outputs. | 37 |
| `C:resetData()` | Empties the used spots and resets everything to zero. | 56 |
| `C:work()` | If flow: state 1 selects start and end, writes the outputs, flow and loaded to true; state 2 keeps flow=true and loaded=false. | 119 |
| `C:workOnce()` | Calls resetData. | 72 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua`.*
