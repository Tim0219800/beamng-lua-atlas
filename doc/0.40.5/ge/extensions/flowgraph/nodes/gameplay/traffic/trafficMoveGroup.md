# `flowgraph_nodes_gameplay_traffic_trafficMoveGroup`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua` · VM: Game Engine (GE) · 93 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup")` (file under extensions/ but not a regular extension)

Flowgraph node "Move Vehicle Group" (default category). Teleports all vehicles of a group (vehicleIds) to a new position, rotation and formation with core_multiSpawn.placeGroup. Pins: shuffle, spawnMode (roadAhead, roadBehind, traffic, lineAhead, lineBehind, lineLeft, lineRight, lineAbove, raceGrid, raceGridAlt; default road), spawnGap (15), startPos, startRot; option data.instantTeleport. Outputs: flow (after the move) and moved pulse.

## Notes

- The default of spawnMode is 'road', which is not in the list of offered modes (inferred from code).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 37 |
| `C:init()` | Calls onNodeReset() and sets data.instantTeleport=false. | 32 |
| `C:onNodeReset()` | Resets the state to 0 and forgets the ids. | 41 |
| `C:onVehicleGroupRespawned(vehIds)` | Hook called when a group has been replaced; goes to state 2 if the first id matches. | 54 |
| `C:postInit()` | Defines the preset values of the spawnMode pin. | 46 |
| `C:work()` | State machine: 0 launches placeGroup, 1 waits for onVehicleGroupRespawned, 2 emits moved, 3 lets the flow through. | 60 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficMoveGroup.lua`.*
