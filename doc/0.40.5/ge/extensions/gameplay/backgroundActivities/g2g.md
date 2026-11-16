# `gameplay_backgroundActivities_g2g`

*File: `lua/ge/extensions/gameplay/backgroundActivities/g2g.lua` · VM: Game Engine (GE) · 146 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_backgroundActivities_g2g`: `extensions.load("gameplay_backgroundActivities_g2g")`, then the global `gameplay_backgroundActivities_g2g`

"g2g" background activity: on activation, fade to black, spawn of a random vehicle (car or truck with Top Speed > 10), then fade from black, all via util_stepHandler. On deactivation, the created vehicles are deleted. getVehicleOptions builds (and caches) the list of candidate models and configs from core_vehicles.getVehicleList().

## Example

```lua
gameplay_backgroundActivities_g2g.toggleActive()
```

## Notes

- vehicleCount is 1: only one vehicle is created.
- The filter mode is frozen to 'Default' in getVehicleOptions; the other modes (Old Cars, Race and Rally, Off-road...) are never active.
- activate() sets active = true right at the start, activateFinished sets it to true again at the end of the sequence.
- deactivate() does not set active back to false: after a deactivation, isActive() stays true and toggleActive()/activate() recreate nothing (activate returns if active is true). Probable game bug.
- onUpdate and onDeserialized are empty functions; onVehicleSwitched does nothing (call commented out).
- Typo "backrgound" in the logs.

**Dependencies (loaded first):** `util_stepHandler`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_backgroundActivities_g2g.activate()` | Activates the activity: no effect if already active. Launches a sequence of steps (fade to black, spawn of a random vehicle among getVehicleOptions, fade from black) that calls activateFinished at the end. The ids of the created vehicles are stored. | 13 |
| `gameplay_backgroundActivities_g2g.activateFinished()` | End callback of the activation sequence: logs and forces active = true. *(internal)* | 30 |
| `gameplay_backgroundActivities_g2g.deactivate()` | Deletes the created vehicles (notifies the editor if present, then obj:delete()) and empties the id list. No effect if the activity is not active. | 35 |
| `gameplay_backgroundActivities_g2g.getVehicleOptions()` | Returns (and caches) the list of candidate vehicles: models of type Car or Truck, excluding buses and auxiliaries, with at least one config whose Top Speed > 10 and that is not auxiliary. | 89 |
| `gameplay_backgroundActivities_g2g.isActive()` | Tells whether the activity is active. | 70 |
| `gameplay_backgroundActivities_g2g.onCareerActive(enabled)` | Hook called when career mode changes state; deactivates the activity if career becomes active. *(internal)* *(hook)* | 81 |
| `gameplay_backgroundActivities_g2g.onClientEndMission()` | Hook called at the end of a level: deactivates the activity. *(internal)* *(hook)* | 62 |
| `gameplay_backgroundActivities_g2g.onDeserialized()` | Hook called after the extensions reload: empty body. *(internal)* *(hook)* | 78 |
| `gameplay_backgroundActivities_g2g.onSerialize()` | Hook called before the extensions reload: deactivates the activity. *(internal)* *(hook)* | 74 |
| `gameplay_backgroundActivities_g2g.onUpdate(dtReal, dtSim, dtRaw)` | Update hook: empty body. *(internal)* *(hook)* | 59 |
| `gameplay_backgroundActivities_g2g.onVehicleSwitched()` | Hook called when the controlled vehicle changes: does nothing. *(internal)* *(hook)* | 66 |
| `gameplay_backgroundActivities_g2g.toggleActive()` | Deactivates the activity if it is active, otherwise activates it. | 50 |

### Parameter details

#### `gameplay_backgroundActivities_g2g.getVehicleOptions()`

Returns (and caches) the list of candidate vehicles: models of type Car or Truck, excluding buses and auxiliaries, with at least one config whose Top Speed > 10 and that is not auxiliary.

- **returns**: table<integer, {model: string, configs: table[], paints: string[]}> Each entry: model key, configs {config, name} and paint names.

#### `gameplay_backgroundActivities_g2g.isActive()`

Tells whether the activity is active.

- **returns**: boolean|nil true if active; nil as long as it has never been activated.

#### `gameplay_backgroundActivities_g2g.onCareerActive(enabled)`

Hook called when career mode changes state; deactivates the activity if career becomes active.

- `enabled` (*boolean*) : true if career is enabled.

#### `gameplay_backgroundActivities_g2g.onUpdate(dtReal, dtSim, dtRaw)`

Update hook: empty body.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: {"util_stepHandler"}. |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/backgroundActivities/g2g.lua`.*
