# `flowgraph_nodes_gameplay_traffic_trafficSpawnGroup`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua` · VM: Game Engine (GE) · 136 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup")` (file under extensions/ but not a regular extension)

Flowgraph node "Spawn Vehicle Group" (default category). Spawns a group of vehicles with core_multiSpawn.spawnGroup. Pins: group (without a group: default traffic group), quantity (-1 or nil: trafficAmount value from the game settings), shuffle, spawnMode (roadAhead, roadBehind, traffic, lineAhead, lineBehind, lineLeft, lineRight, lineAbove, raceGrid, raceGridAlt; default road), spawnGap (15), startPos, startRot, randomColors, dontDelete; reset deletes the created vehicles. Outputs: flow, loaded pulse, vehicleIds. The vehicles are added to the flowgraph vehicle module.

## Notes

- The default of spawnMode ('road') is not in the list of offered modes (inferred from code).
- State machine self.state: 0 waiting, 1 spawning in progress, 2 loaded, 3 finished.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls resetState(). | 44 |
| `C:init()` | Calls resetState(). | 40 |
| `C:onNodeReset()` | Deletes the vehicles created by this node (scene and editor) then resets the state. | 48 |
| `C:onVehicleGroupSpawned(vehIds, groupId)` | Hook called when a group has been created; if groupId matches, registers the vehicles, publishes vehicleIds and goes to state 2. | 77 |
| `C:postInit()` | Defines the preset values of the spawnMode pin. | 69 |
| `C:resetState()` | Resets state, groupId, id list and flow output. | 62 |
| `C:work()` | On the first flow, launches spawnGroup (or finishes directly if the quantity is 0), then emits loaded and lets the flow through once loaded. | 90 |

## Calls into the engine (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua`.*
