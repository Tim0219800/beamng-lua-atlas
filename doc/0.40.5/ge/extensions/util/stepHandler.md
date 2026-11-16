# `util_stepHandler`

*File: `lua/ge/extensions/util/stepHandler.lua` · VM: Game Engine (GE) · 338 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_stepHandler`: `extensions.load("util_stepHandler")`, then the global `util_stepHandler`

Executor of asynchronous step sequences ("steps") for scenarios and test scripts. You build a list of steps with the makeStepXxx functions (fade to black, wait, vehicle or traffic spawn, level load, custom function) then start it with startStepSequence. On each onUpdate, the current step is processed until it is complete (step.complete); the next one is then started in the same frame. A step that exceeds its timeout (timeout, 120 s by default) is logged as an error and forced to "complete".

## Example

```lua
util_stepHandler.startStepSequence({
  util_stepHandler.makeStepFadeToBlack(),
  util_stepHandler.makeStepSpawnVehicleSimple('pickup', 'vehicles/pickup/d15_4wd_A.pc', function() print('Hello') end),
  util_stepHandler.makeStepFadeFromBlack()
}, function() print('Done') end)
```

## Notes

- A step is a table {name, processTask = function(step, dtTable), timeout, origin, ...}; processTask sets step.complete = true when it is done. dtTable contains dtReal, dtSim and dtRaw.
- startStepSequence replaces any sequence in progress; the end callback becomes a last step appended to the supplied list (the steps table is modified).
- onClientStartMission marks the current step as complete whatever it is (not only level loading); taskLoadLevelStep in fact only ends through this hook, because step.levelLoaded is never set. Timeout of the loading step: 600 s.
- In onUpdate, the logTag variable is not defined in this file (nil value in the "Completed Step" log).
- makeStepReturnTrueFunction is declared twice (the second, local, shadows the first); they are identical. Only the first is exported.
- taskVehicleSpawnStep: if spawnNewVehicle fails, step.veh is nil and the following step.veh:getId() call causes a Lua error.
- If showDebugWindow (local variable, false) is set to true in the code, onUpdate displays an ImGui step debug window.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_stepHandler.makeLoadLevelStep(level)` | Step: loads a level by name (core_levels.startLevel) and waits for onClientStartMission (timeout 600 s). | 246 |
| `util_stepHandler.makeStepFadeFromBlack(duration)` | Step: starts the fade back in (ui_fadeScreen.stop) and waits for state 3 of onScreenFadeState (timeout 10 s). | 59 |
| `util_stepHandler.makeStepFadeToBlack(duration)` | Step: starts the fade to black (ui_fadeScreen.start) and waits for the black screen event (state 1, timeout 10 s). | 49 |
| `util_stepHandler.makeStepReturnTrueFunction(fun)` | Step: calls fun(step, dtTable) every frame until it returns a true value. | 124 |
| `util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator)` | Step: creates a group of traffic vehicles (core_multiSpawn), waits for it to spawn, sets the active count, enables traffic and disperses it (gameplay_traffic). | 204 |
| `util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback)` | Step: spawns a vehicle (core_vehicles.spawnNewVehicle) then waits for it to be ready (isReady); the callback then receives (step, vehId). | 160 |
| `util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback)` | Simple version of makeStepSpawnVehicle: options built by sanitizeVehicleSpawnOptions(model, {config = config}). | 169 |
| `util_stepHandler.makeStepWait(seconds)` | Step: waits for a number of real seconds (os.clockhp). | 78 |
| `util_stepHandler.makeStepWaitFrames(frames)` | Step: waits for a number of onUpdate frames, whatever their duration. | 97 |
| `util_stepHandler.makeUiMessageStep(message)` | Step: displays a message on screen (ui_message) and in the log (tag "test"), then completes immediately. | 132 |
| `util_stepHandler.onClientStartMission(state)` | Hook called when a level starts: marks the current step as complete. *(internal)* *(hook)* | 239 |
| `util_stepHandler.onScreenFadeState(state)` | Hook called by ui_fadeScreen at each fade state: stores fadeState<state> on the current step if it is waiting for a fade. *(internal)* *(hook)* | 43 |
| `util_stepHandler.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: processes the current step, handles timeouts, chains completed steps and disables the sequence at the end. *(internal)* *(hook)* | 282 |
| `util_stepHandler.onVehicleGroupSpawned(vehIds, groupId)` | Hook called when a vehicle group has spawned: if it is the group expected by the current traffic step, sets its state to 2 and stores the identifiers. *(internal)* *(hook)* | 176 |
| `util_stepHandler.skipToLastStepOrCallback()` | Completes the current step and jumps straight to the last step (typically the end callback). | 275 |
| `util_stepHandler.startStepSequence(steps, callbackWhenFinished)` | Starts a step sequence (replaces any sequence in progress). If a callback is given, it is run as the last step. | 262 |
| `util_stepHandler.taskLoadLevelStep(step)` | processTask function of the level loading step: starts the loading on the first call, logs an error if the level is not found. Returns step.levelLoaded (never set). *(internal)* | 218 |
| `util_stepHandler.taskSpawnTrafficStep(step)` | processTask function of the traffic step: state machine 0 (create the group) → 1 (wait for onVehicleGroupSpawned) → 2 (enable traffic). *(internal)* | 188 |

### Parameter details

#### `util_stepHandler.makeLoadLevelStep(level)`

Step: loads a level by name (core_levels.startLevel) and waits for onClientStartMission (timeout 600 s).

- `level` (*string*) : Level name (case-insensitive).
- **returns**: table Step.

#### `util_stepHandler.makeStepFadeFromBlack(duration)`

Step: starts the fade back in (ui_fadeScreen.stop) and waits for state 3 of onScreenFadeState (timeout 10 s).

- `duration` (*number|nil*) : Fade duration in seconds.
- **returns**: table Step.

#### `util_stepHandler.makeStepFadeToBlack(duration)`

Step: starts the fade to black (ui_fadeScreen.start) and waits for the black screen event (state 1, timeout 10 s).

- `duration` (*number|nil*) : Fade duration in seconds.
- **returns**: table Step.

#### `util_stepHandler.makeStepReturnTrueFunction(fun)`

Step: calls fun(step, dtTable) every frame until it returns a true value.

- `fun` (*function*) : Function (step, dtTable) -> boolean.
- **returns**: table Step.

#### `util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator)`

Step: creates a group of traffic vehicles (core_multiSpawn), waits for it to spawn, sets the active count, enables traffic and disperses it (gameplay_traffic).

- `amount` (*integer*) : Number of vehicles to spawn.
- `active` (*integer*) : Number of active vehicles (activeAmount).
- `generator` (*any*) : Generator passed to core_multiSpawn.createGroup (inferred from code).
- **returns**: table Step.

#### `util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback)`

Step: spawns a vehicle (core_vehicles.spawnNewVehicle) then waits for it to be ready (isReady); the callback then receives (step, vehId).

- `spawningOptions` (*table*) : Spawn options with at least model (and config, pos, rot…).
- `callback` (*function|nil*) : Called with (step, vehId) when the vehicle is ready.
- **returns**: table Step.

#### `util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback)`

Simple version of makeStepSpawnVehicle: options built by sanitizeVehicleSpawnOptions(model, {config = config}).

- `model` (*string*) : Model name.
- `config` (*string*) : Configuration path or name (.pc).
- `callback` (*function|nil*) : Called with (step, vehId).
- **returns**: table Step.

#### `util_stepHandler.makeStepWait(seconds)`

Step: waits for a number of real seconds (os.clockhp).

- `seconds` (*number*) : Wait duration in seconds.
- **returns**: table Step (timeout = seconds + 1).

#### `util_stepHandler.makeStepWaitFrames(frames)`

Step: waits for a number of onUpdate frames, whatever their duration.

- `frames` (*integer*) : Number of frames.
- **returns**: table Step.

#### `util_stepHandler.makeUiMessageStep(message)`

Step: displays a message on screen (ui_message) and in the log (tag "test"), then completes immediately.

- `message` (*string*) : Message text.
- **returns**: table Step.

#### `util_stepHandler.onClientStartMission(state)`

Hook called when a level starts: marks the current step as complete.

- `state` (*any*) : Hook argument (not used).

#### `util_stepHandler.onScreenFadeState(state)`

Hook called by ui_fadeScreen at each fade state: stores fadeState<state> on the current step if it is waiting for a fade.

- `state` (*integer*) : Fade state (1 = black reached, 3 = fade removed).

#### `util_stepHandler.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: processes the current step, handles timeouts, chains completed steps and disables the sequence at the end.

- `dtReal` (*number*) : Real frame time (s).
- `dtSim` (*number*) : Simulated duration (s).
- `dtRaw` (*number*) : Raw duration (s).

#### `util_stepHandler.onVehicleGroupSpawned(vehIds, groupId)`

Hook called when a vehicle group has spawned: if it is the group expected by the current traffic step, sets its state to 2 and stores the identifiers.

- `vehIds` (*integer[]*) : Identifiers of the group's vehicles.
- `groupId` (*any*) : Group identifier.

#### `util_stepHandler.startStepSequence(steps, callbackWhenFinished)`

Starts a step sequence (replaces any sequence in progress). If a callback is given, it is run as the last step.

- `steps` (*table[]*) : List of steps created with the makeStepXxx functions.
- `callbackWhenFinished` (*function|nil*) : Called with no argument once all the steps are complete.

#### `util_stepHandler.taskLoadLevelStep(step)`

processTask function of the level loading step: starts the loading on the first call, logs an error if the level is not found. Returns step.levelLoaded (never set).

- `step` (*table*) : Loading step.
- **returns**: boolean Always false in practice.

#### `util_stepHandler.taskSpawnTrafficStep(step)`

processTask function of the traffic step: state machine 0 (create the group) → 1 (wait for onVehicleGroupSpawned) → 2 (enable traffic).

- `step` (*table*) : Traffic step.

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/stepHandler.lua`.*
