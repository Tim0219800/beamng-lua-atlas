# `gameplay_statistic`

*File: `lua/ge/extensions/gameplay/statistic.lua` · VM: Game Engine (GE) · 837 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_statistic`: `extensions.load("gameplay_statistic")`, then the global `gameplay_statistic`

Game statistics extension. It keeps named metrics (counters, values, timers) recorded in settings/cloud/gameplay_stat.json, and a separate copy per career profile (career/gameplay_stat.json in the save slot). It measures time spent per mode, level and activity, counts events (spawned vehicles, resets, vehicle switches, finished scenarios) and loads the gameplay/statisticModules modules (watchJturn, watchRollover...) whose workload function is called in turn on the player's vehicle. Modders use it to read, increment or observe metrics.

## Example

```lua
gameplay_statistic.metricAdd('mymod/jumps', 1)
local e = gameplay_statistic.metricGet('mymod/jumps')
print(e and e.value)
gameplay_statistic.callbackRegister('mymod/jumps', 10, function(name, old, new) print('10 jumps!') end)
```

## Notes

- A metric entry is {value=...}; with aggregate = true it also contains last (for metricAdd), count, min, max.
- Metric names: paths with "/" (e.g. vehicle/jturn, vehicle/rollover, general/mode/<mode>.time, general/map/<level>.time, scenario/finished). Timers record seconds (real time, or simulated time with useSimTime).
- A callback with trigger runs only once (removed after the call) when newentry.value >= trigger. A name containing "*" is treated as a Lua pattern (string.match) in a table of generic callbacks.
- A module's workload function is only called if the player vehicle is playable, player-controlled and dtSim ~= 0; one function per frame (round-robin).
- Saving: at the latest at the end of the mission, on serialization, on game shutdown or when sendGUIState finds modified entries or more than 60 s without saving; writing goes through a renamed .tmp file.
- Minor bug: in startActivity, the level timer stop test reads the key "general/mapmap/<level>.time" (typo) instead of "general/map/...".
- checkSaveDecay (not called) assigns a never-declared global saveNextFrame.

**Dependencies (loaded first):** `ui_imgui`, `core_gamestate`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_statistic.addSchedule(fn)` | Adds a function to the per-vehicle watch queue. Called fn(vehicleObj, vehicleId, dtSim), one function per frame in round-robin. | 128 |
| `gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career)` | Registers a function called when a metric changes. Callback signature: fn(name, oldEntry, newEntry); newEntry.career indicates the career context. With trigger, called only once when the value reaches the threshold. | 356 |
| `gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career)` | Removes a registered callback (same name, trigger, function and career). | 382 |
| `gameplay_statistic.forceTimerUpdate()` | Records the elapsed time of all running timers (without stopping them). | 782 |
| `gameplay_statistic.metricAdd(name, value, aggregate)` | Adds value to the metric name (creates it if absent), for general statistics and, if career is active, for career statistics. Triggers the associated callbacks. | 230 |
| `gameplay_statistic.metricGet(name, carreer)` | Returns a copy of a metric's entry. | 293 |
| `gameplay_statistic.metricGetMatchPattern(namePattern, carreer)` | Returns copies of all metrics whose name matches a Lua pattern (string.match). | 307 |
| `gameplay_statistic.metricSet(name, value, aggregate)` | Sets the metric value (general and career). Triggers the callbacks. | 273 |
| `gameplay_statistic.onCareerActive(active)` | Hook called when career is activated or deactivated: loads or frees the profile statistics. *(internal)* *(hook)* | 757 |
| `gameplay_statistic.onClientEndMission(levelPath)` | Hook called at the end of a level: ends the activity and saves. *(internal)* *(hook)* | 526 |
| `gameplay_statistic.onClientPostStartMission(levelPath)` | Hook called after the level loads: starts the activity and reloads the submodules. *(internal)* *(hook)* | 531 |
| `gameplay_statistic.onClientStartMission(levelPath)` | Hook called at the start of a level: restarts activity tracking. *(internal)* *(hook)* | 522 |
| `gameplay_statistic.onDeserialized(data)` | Hook: reloads the file and restores the state after a Lua reload. *(internal)* *(hook)* | 94 |
| `gameplay_statistic.onEditorActivated()` | Hook: starts the general/editor.time timer. *(internal)* *(hook)* | 544 |
| `gameplay_statistic.onEditorDeactivated()` | Hook: stops the general/editor.time timer. *(internal)* *(hook)* | 548 |
| `gameplay_statistic.onExit()` | Hook called when the game closes: ends the activity and saves. *(internal)* *(hook)* | 71 |
| `gameplay_statistic.onExtensionLoaded()` | Hook: loads the statistics file and the statisticModules submodules. *(internal)* *(hook)* | 776 |
| `gameplay_statistic.onExtensionUnloaded()` | Hook: saves. *(internal)* *(hook)* | 78 |
| `gameplay_statistic.onGameStateUpdate(newState)` | Hook called on game state change: restarts activity tracking (ignored in career while real time is 0). *(internal)* *(hook)* | 582 |
| `gameplay_statistic.onPlayerVehicleCloned()` | Hook: increments vehicle/spawned. *(internal)* *(hook)* | 595 |
| `gameplay_statistic.onSaveCurrentProfile(currentSavePath)` | Hook called when the career profile is saved: writes career/gameplay_stat.json in the slot. *(internal)* *(hook)* | 747 |
| `gameplay_statistic.onScenarioFinished(scenario)` | Hook called at the end of a scenario: increments scenario/finished. *(internal)* *(hook)* | 566 |
| `gameplay_statistic.onScenarioLoaded(scenario)` | Hook called when a scenario loads: restarts activity tracking. *(internal)* *(hook)* | 559 |
| `gameplay_statistic.onScenarioRestarted(scenario)` | Hook called when a scenario restarts: increments scenario/restarted. *(internal)* *(hook)* | 574 |
| `gameplay_statistic.onSerialize()` | Hook: saves then returns the state (activity, level, mode, timers) before a Lua reload. *(internal)* *(hook)* | 82 |
| `gameplay_statistic.onSpawnDefaultVehicle()` | Hook: increments vehicle/spawned. *(internal)* *(hook)* | 598 |
| `gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: accumulates real and simulated times, runs a watch function on the player vehicle, draws the debug window if open. *(internal)* *(hook)* | 603 |
| `gameplay_statistic.onVehicleDestroyed(vid)` | Hook: forgets the player's vehicle if it is destroyed. *(internal)* *(hook)* | 720 |
| `gameplay_statistic.onVehicleResetted(vid)` | Hook: increments vehicle/reset if it is the player's vehicle. *(internal)* *(hook)* | 716 |
| `gameplay_statistic.onVehicleSelectorReplaceCurrent()` | Hook: increments vehicle/spawned. *(internal)* *(hook)* | 592 |
| `gameplay_statistic.onVehicleSelectorSpawnNew()` | Hook: increments vehicle/spawned. *(internal)* *(hook)* | 589 |
| `gameplay_statistic.onVehicleSpawned(vid, v)` | Hook called when a vehicle spawns; does nothing. *(internal)* *(hook)* | 701 |
| `gameplay_statistic.onVehicleSwitched(oldid, newid, player)` | Hook called on vehicle switch: for player 0, stores the vehicle and increments vehicle/switch. *(internal)* *(hook)* | 704 |
| `gameplay_statistic.onWorldReadyState(worldReadyState)` | Hook called on world state change; does nothing. *(internal)* *(hook)* | 540 |
| `gameplay_statistic.removeSchedule(fn)` | Removes a function from the watch queue. | 133 |
| `gameplay_statistic.sendGUIState()` | Saves if needed then sends the StatisticData event to the UI with {general = entries, career = entries if active}. | 735 |
| `gameplay_statistic.setDebug(newValue)` | Opens or closes the imgui debug window "gameplay_statistic Debugger" (modules, entries, callbacks). | 727 |
| `gameplay_statistic.timerStart(name, increment, aggregate, useSimTime)` | Starts a named timer. If a timer with this name is already running, the call is ignored with a warning. | 323 |
| `gameplay_statistic.timerStop(name)` | Stops the timer and records the elapsed time in the metric. | 346 |

### Parameter details

#### `gameplay_statistic.addSchedule(fn)`

Adds a function to the per-vehicle watch queue. Called fn(vehicleObj, vehicleId, dtSim), one function per frame in round-robin.

- `fn` (*function*) : Watch function.

#### `gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career)`

Registers a function called when a metric changes. Callback signature: fn(name, oldEntry, newEntry); newEntry.career indicates the career context. With trigger, called only once when the value reaches the threshold.

- `name` (*string*) : Metric name, or pattern containing "*".
- `trigger` (*number|nil*) : Value threshold; nil = on every change.
- `callbackFunction` (*function*) : Callback.
- `career` (*boolean|nil*) : Listen to career metrics.

#### `gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career)`

Removes a registered callback (same name, trigger, function and career).

- `name` (*string*) : Name or pattern.
- `trigger` (*number|nil*) : Threshold used at registration.
- `callbackFunction` (*function*) : Callback.
- `career` (*boolean|nil*) : Career context.
- **returns**: boolean true if removed.

#### `gameplay_statistic.metricAdd(name, value, aggregate)`

Adds value to the metric name (creates it if absent), for general statistics and, if career is active, for career statistics. Triggers the associated callbacks.

- `name` (*string*) : Metric name.
- `value` (*number*) : Value to add.
- `aggregate` (*boolean|nil*) : Also track last, count, min, max.

#### `gameplay_statistic.metricGet(name, carreer)`

Returns a copy of a metric's entry.

- `name` (*string*) : Metric name.
- `carreer` (*boolean|nil*) : true to read career data (if active).
- **returns**: table|nil {value, ...} or nil if unknown.

#### `gameplay_statistic.metricGetMatchPattern(namePattern, carreer)`

Returns copies of all metrics whose name matches a Lua pattern (string.match).

- `namePattern` (*string*) : Lua pattern.
- `carreer` (*boolean|nil*) : true for career (if active).
- **returns**: table<string, table> name -> entry.

#### `gameplay_statistic.metricSet(name, value, aggregate)`

Sets the metric value (general and career). Triggers the callbacks.

- `name` (*string*) : Metric name.
- `value` (*number*) : New value.
- `aggregate` (*boolean|nil*) : Also track count, min, max.

#### `gameplay_statistic.onCareerActive(active)`

Hook called when career is activated or deactivated: loads or frees the profile statistics.

- `active` (*boolean*) : true if career becomes active.

#### `gameplay_statistic.onClientEndMission(levelPath)`

Hook called at the end of a level: ends the activity and saves.

- `levelPath` (*string*) : Level path.

#### `gameplay_statistic.onClientPostStartMission(levelPath)`

Hook called after the level loads: starts the activity and reloads the submodules.

- `levelPath` (*string*) : Level path.

#### `gameplay_statistic.onClientStartMission(levelPath)`

Hook called at the start of a level: restarts activity tracking.

- `levelPath` (*string*) : Level path.

#### `gameplay_statistic.onDeserialized(data)`

Hook: reloads the file and restores the state after a Lua reload.

- `data` (*table*) : Data from onSerialize.

#### `gameplay_statistic.onGameStateUpdate(newState)`

Hook called on game state change: restarts activity tracking (ignored in career while real time is 0).

- `newState` (*table|nil*) : New state.

#### `gameplay_statistic.onSaveCurrentProfile(currentSavePath)`

Hook called when the career profile is saved: writes career/gameplay_stat.json in the slot.

- `currentSavePath` (*string*) : Save slot folder.

#### `gameplay_statistic.onScenarioFinished(scenario)`

Hook called at the end of a scenario: increments scenario/finished.

- `scenario` (*table*) : Scenario.

#### `gameplay_statistic.onScenarioLoaded(scenario)`

Hook called when a scenario loads: restarts activity tracking.

- `scenario` (*table*) : Scenario.

#### `gameplay_statistic.onScenarioRestarted(scenario)`

Hook called when a scenario restarts: increments scenario/restarted.

- `scenario` (*table*) : Scenario.

#### `gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: accumulates real and simulated times, runs a watch function on the player vehicle, draws the debug window if open.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulated time elapsed (s).
- `dtRaw` (*number*) : Raw elapsed time (s).

#### `gameplay_statistic.onVehicleDestroyed(vid)`

Hook: forgets the player's vehicle if it is destroyed.

- `vid` (*integer*) : Vehicle identifier.

#### `gameplay_statistic.onVehicleResetted(vid)`

Hook: increments vehicle/reset if it is the player's vehicle.

- `vid` (*integer*) : Vehicle identifier.

#### `gameplay_statistic.onVehicleSpawned(vid, v)`

Hook called when a vehicle spawns; does nothing.

- `vid` (*integer*) : Vehicle identifier.
- `v` (*userdata*) : Vehicle object.

#### `gameplay_statistic.onVehicleSwitched(oldid, newid, player)`

Hook called on vehicle switch: for player 0, stores the vehicle and increments vehicle/switch.

- `oldid` (*integer*) : Old vehicle.
- `newid` (*integer*) : New vehicle (-1 if none).
- `player` (*integer*) : Player index.

#### `gameplay_statistic.onWorldReadyState(worldReadyState)`

Hook called on world state change; does nothing.

- `worldReadyState` (*integer*) : State.

#### `gameplay_statistic.removeSchedule(fn)`

Removes a function from the watch queue.

- `fn` (*function*) : Function added with addSchedule.
- **returns**: boolean true if removed.

#### `gameplay_statistic.setDebug(newValue)`

Opens or closes the imgui debug window "gameplay_statistic Debugger" (modules, entries, callbacks).

- `newValue` (*boolean*) : true to show.

#### `gameplay_statistic.timerStart(name, increment, aggregate, useSimTime)`

Starts a named timer. If a timer with this name is already running, the call is ignored with a warning.

- `name` (*string*) : Name (also the name of the metric fed).
- `increment` (*boolean|nil*) : true (default): adds the time with metricAdd; false: metricSet.
- `aggregate` (*boolean|nil*) : Aggregate mode (default false).
- `useSimTime` (*boolean|nil*) : Use simulated time rather than real time (default false).

#### `gameplay_statistic.timerStop(name)`

Stops the timer and records the elapsed time in the metric.

- `name` (*string*) : Timer name.
- **returns**: number Seconds elapsed since the last recording (0 if the timer does not exist).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded beforehand: ui_imgui and core_gamestate. |

**UI events (guihooks.trigger):** `StatisticData`

## Calls into the engine (C++)

- `FS:` `findFiles`, `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/statistic.lua`.*
