# `flowgraph_nodes_mission_selectGarage2GarageVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua` · VM: Game Engine (GE) · 181 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node 'Select Garage Vehicle' (once_instant category, author BeamNG) for the garage-to-garage mission. Randomly picks a model/config from mission.vehicleOptions (calling mission:generateVehicleOptions if needed), avoiding configs already used until exhausted. Outputs: impulse 'loaded', 'model', 'config', 'name' (display name).

## Notes

- The local function getAllAvailableConfigs turns the options into a list {model, config, name}.
- When all configs have been used, usedConfigs is emptied and math.randomseed(os.time()) is called again.
- On error (no mission, no options), the node logs an error and does nothing.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the selection and the outputs to zero. | 37 |
| `C:init()` | Initializes the selection, state=1 and usedConfigs. | 23 |
| `C:resetData()` | Resets the selection, state=1 and the outputs to zero (usedConfigs is kept). | 51 |
| `C:work()` | state 1: picks an unused config, records it in usedConfigs, writes model/config/name, loaded=true, goes to state 2. state 2: loaded=false. | 90 |
| `C:workOnce()` | Calls resetData. | 65 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua`.*
