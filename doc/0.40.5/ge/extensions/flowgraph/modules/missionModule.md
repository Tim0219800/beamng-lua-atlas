# `flowgraph_modules_missionModule`

*File: `lua/ge/extensions/flowgraph/modules/missionModule.lua` · VM: Game Engine (GE) · 133 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/missionModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder -100) that links a flowgraph project to the mission that launched it (self.mgr.activity). It manages mission vehicles (keeping or hiding the player vehicle and the traffic), prepares a vehicle (headlights at night, dummy driver), deletes the stashed player vehicle and relays custom events to the mission. On stop, it stops the mission if it is running and emits onMissionFinished.

## Notes

- Without mgr.activity (project launched outside a mission), most functions do nothing.
- processVehicles runs only once (processed flag) and only if params is not empty.
- onClear is empty and is not declared as a hook.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_missionModule.clear()` | Sets processed back to false. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_missionModule.executionStarted()` | Called when the project starts: triggers the UI event hotlappingReevaluateControlsEnabled and calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_missionModule.executionStopped()` | Called when the project stops: stops the mission if it is running (gameplay_missions_missionManager.stop), emits extensions.hook('onMissionFinished') and triggers the UI event hotlappingReevaluateControlsEnabled. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_missionModule.getOriginalPlayerId()` | Returns the id of the player vehicle from before the mission (mission._startingInfo.vehId). (dynamically assigned) | dyn |
| `flowgraph_modules_missionModule.init()` | Called when the module is created: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_missionModule.missionHook(name, data)` | Calls mission:onMissionCustomEvent(name, data) if the mission defines it, and logs the event. (dynamically assigned) | dyn |
| `flowgraph_modules_missionModule.onClear()` | Empty function. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_missionModule.prepareVehicle(id, addDummyDriver)` | Prepares a vehicle for the mission: if the game time is within the solar night window, turns on the headlights (electrics.setLightsState(2)); if addDummyDriver and the enableSeatOccupants setting, places a dummy occupant in the driver seat. (dynamically assigned) | dyn |
| `flowgraph_modules_missionModule.processVehicles(params)` | Applies the mission's keepPlayer and keepTraffic options: enables or disables the original player vehicle and updates mission.setupData.stashedVehicles, and unfreezes the traffic via gameplay_traffic.unfreezeState if keepTraffic is true. Warns if already called. (dynamically assigned) | dyn |
| `flowgraph_modules_missionModule.removeStashedPlayerVehicle()` | Permanently deletes the stashed player vehicle (it will no longer be reactivated at the end of the project). (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_missionModule.getOriginalPlayerId()`

Returns the id of the player vehicle from before the mission (mission._startingInfo.vehId). (dynamically assigned)

- **returns**: integer|nil id or nil

#### `flowgraph_modules_missionModule.missionHook(name, data)`

Calls mission:onMissionCustomEvent(name, data) if the mission defines it, and logs the event. (dynamically assigned)

- `name` (*string*) : event name
- `data` (*any*) : data

#### `flowgraph_modules_missionModule.prepareVehicle(id, addDummyDriver)`

Prepares a vehicle for the mission: if the game time is within the solar night window, turns on the headlights (electrics.setLightsState(2)); if addDummyDriver and the enableSeatOccupants setting, places a dummy occupant in the driver seat. (dynamically assigned)

- `id` (*integer|nil*) : vehicle id (default: player vehicle 0)
- `addDummyDriver` (*boolean|nil*) : add a dummy driver

#### `flowgraph_modules_missionModule.processVehicles(params)`

Applies the mission's keepPlayer and keepTraffic options: enables or disables the original player vehicle and updates mission.setupData.stashedVehicles, and unfreezes the traffic via gameplay_traffic.unfreezeState if keepTraffic is true. Warns if already called. (dynamically assigned)

- `params` (*table*) : fields keepPlayer (boolean) and keepTraffic (boolean)

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:clear()` |  | 11 |
| `C:executionStarted()` |  | 127 |
| `C:executionStopped()` |  | 114 |
| `C:getOriginalPlayerId()` |  | 87 |
| `C:init()` |  | 7 |
| `C:missionHook(name, data)` |  | 107 |
| `C:onClear()` |  | 124 |
| `C:prepareVehicle(id, addDummyDriver)` |  | 63 |
| `C:processVehicles(params)` |  | 15 |
| `C:removeStashedPlayerVehicle()` |  | 93 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onMissionFinished`

**UI events (guihooks.trigger):** `hotlappingReevaluateControlsEnabled`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getTimeOfDay`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/missionModule.lua`.*
