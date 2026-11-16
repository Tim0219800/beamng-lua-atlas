# `gameplayStatistic`

*File: `lua/vehicle/extensions/gameplayStatistic.lua` · VM: Vehicle · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayStatistic`: `extensions.load (vehicle VM)("gameplayStatistic")`, then the global `gameplayStatistic`

Vehicle-side gameplay statistics relay: forwards metrics to the GE module gameplay_statistic (metricAdd/metricSet) and runs registered watch functions in turn, one per frame (scheduler). On load it enables the watchAirtime (airtime) and watchBurnout (burnout time) modules.

## Example

```lua
extensions.gameplayStatistic.metricAdd('vehicle/monCompteur', 3.5, true)
```

## Notes

- metricAdd/metricSet send a Lua command to the GE: gameplay_statistic.metricAdd(name, value, aggregate). The name is serialized with dumps, value and aggregate with tostring.
- The scheduler runs a single statSchedule function per frame, in rotation. Nothing is run if no player is seated and ai.mode is not 'disabled' (condition `not anyPlayerSeated and ai.mode ~= 'disabled'`).
- onExtensionLoaded returns false (unload) if the vehicle has no wheels and uses neither hydros nor powertrain in physics step.
- updateGFX is nil at rest and is enabled by addSchedule via extensions.hookUpdate.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayStatistic.addSchedule(fn)` | Adds a function to the scheduler (run once every N frames where N = number of functions) and enables updateGFX. | 31 |
| `gameplayStatistic.metricAdd(name, value, aggregate)` | Adds a value to a GE metric. | 14 |
| `gameplayStatistic.metricSet(name, value, aggregate)` | Sets the value of a GE metric. | 18 |
| `gameplayStatistic.onExtensionLoaded()` | Called on load: unloads itself for vehicles without wheels or powertrain/hydros physics, otherwise loads watchAirtime and watchBurnout and registers their workload in the scheduler. *(internal)* *(hook)* | 53 |
| `gameplayStatistic.removeSchedule(fn)` | Removes a function from the scheduler; disables updateGFX if none remain. | 38 |
| `gameplayStatistic.updateGFX(dt)` | Is nil at rest; when active, runs one scheduler function per frame. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `gameplayStatistic.addSchedule(fn)`

Adds a function to the scheduler (run once every N frames where N = number of functions) and enables updateGFX.

- `fn` (*function*) : Argument-less function to run periodically.

#### `gameplayStatistic.metricAdd(name, value, aggregate)`

Adds a value to a GE metric.

- `name` (*string*) : Metric name (e.g. 'vehicle/airtime.time').
- `value` (*number*) : Value to add.
- `aggregate` (*boolean|nil*) : Passed as is to the GE (aggregation, inferred from code).

#### `gameplayStatistic.metricSet(name, value, aggregate)`

Sets the value of a GE metric.

- `name` (*string*) : Metric name.
- `value` (*number*) : Value.
- `aggregate` (*boolean|nil*) : Passed as is to the GE.

#### `gameplayStatistic.onExtensionLoaded()`

Called on load: unloads itself for vehicles without wheels or powertrain/hydros physics, otherwise loads watchAirtime and watchBurnout and registers their workload in the scheduler.

- **returns**: boolean|nil false to request unloading.

#### `gameplayStatistic.removeSchedule(fn)`

Removes a function from the scheduler; disables updateGFX if none remain.

- `fn` (*function*) : Previously added function.
- **returns**: boolean true if removed, false if not found.

#### `gameplayStatistic.updateGFX(dt)`

Is nil at rest; when active, runs one scheduler function per frame. (dynamically assigned)

- `dt` (*number*) : Time step in seconds.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `updateGFX`

## Calls into the engine (C++)

- `obj:` `queueGameEngineLua`

**Loads extensions:** `gameplayStatisticModules/watchAirtime`, `gameplayStatisticModules/watchBurnout`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayStatistic.lua`.*
