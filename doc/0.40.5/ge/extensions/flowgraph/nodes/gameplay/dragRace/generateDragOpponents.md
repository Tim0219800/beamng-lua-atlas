# `flowgraph_nodes_gameplay_dragRace_generateDragOpponents`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents")` (file under extensions/ but not a regular extension)

Flowgraph node "Generate Drag Race Opponents" (category once_instant, depends on gameplay_drag_dragBridge). Generates a list of opponent vehicle configurations (model, config, paint, dial) suited to the player's vehicle. Input pins: vehId, numberOfOpponents (1), playerDial (-1 = automatic). Output: vehicleGroup (table). In bracketRace, random opponents with dial reduced by 0.5; otherwise opponents with a 1/4 mile time close to the player's dial ([dial-0.1; dial+0.4[).

## Notes

- Only models of type Car or Truck, non-auxiliary and outside simple_traffic configs, are candidates.
- If nothing fits, the player's vehicle is duplicated (getPlayerVehicleAsFallback).
- The default dial is 12 if no performance data exists.
- The vehId pin is declared but never read: the current vehicle is taken via core_vehicles.getCurrentVehicleDetails().

**Dependencies (loaded first):** `gameplay_drag_dragBridge`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears the selection and sets playerId to 0. | 214 |
| `C:createVehicleEntry(config)` | Builds {model, config, random paint, dial} from a config (dial = time_1_4 from the performance data, otherwise 12). | 69 |
| `C:drawCustomProperties()` | Editor: no properties. | 31 |
| `C:drawMiddle(builder, style)` | Node drawing in the editor. | 36 |
| `C:filterValidVehicleConfigs()` | Lists the configurations of core_vehicles.getConfigList that are valid as opponents. | 50 |
| `C:generateBracketRaceOpponents(vehConfigs, count)` | Picks random configs with dial - 0.5. | 138 |
| `C:generateSimilarOpponents(vehConfigs, dial, count, currentVeh)` | Picks configs whose 1/4 mile time is close to the given dial. | 157 |
| `C:getPlayerDial(currentVeh)` | Determines the player's dial: playerDial pin if >= 0, otherwise the recorded dial (dragBridge.getDialTimes), otherwise performance data, otherwise 12. | 113 |
| `C:getPlayerVehicleAsFallback(count)` | Returns count copies of the player's vehicle as fallback opponents. | 85 |
| `C:init()` | Initializes selectedOpponents and playerId. | 26 |
| `C:selectVehicle()` | Chooses the strategy (bracketRace or similar) and returns the list of opponents. | 189 |
| `C:workOnce()` | Initializes the randomness and writes vehicleGroup. | 219 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua`.*
