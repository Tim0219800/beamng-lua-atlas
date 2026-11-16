# `scenario_scenarios`

*File: `lua/ge/extensions/scenario/scenarios.lua` · VM: Game Engine (GE) · 2482 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_scenarios`: `extensions.load("scenario_scenarios")`, then the global `scenario_scenarios`

Core of the "scenario" mode: a state machine that loads a scenario's level, spawns its prefabs and vehicles, handles the intro phase, the countdown, the race (timer, attempts, damage tracking), the end with result aggregation, the statistics and the end screen. A scenario is a table (produced by scenario_scenariosLoader) stored in a single local variable; it is read with getScenario(). A modder uses it to start/stop a scenario (executeScenario, stop, restartScenario), end it (endScenario, finish) or listen to the emitted hooks (onScenarioChange, onRaceStart, onRaceResult...).

## Example

```lua
-- start a scenario already processed by scenario_scenariosLoader:
local sc = scenario_scenariosLoader.loadScenario('/levels/west_coast_usa/scenarios/xxx.json')
scenario_scenarios.executeScenario(sc)
-- in an extension, react to state changes:
local function onScenarioChange(sc) if sc and sc.state == 'running' then log('I','','race started') end end
-- end with a failure:
scenario_scenarios.finish({failed = 'Too slow'})
```

## Notes

- Scenario lifecycle (scenario.state): executeScenario -> core_levels.startLevel(scenario.mission) with spawn.preventPlayerSpawning=true; when the level loads, onClientStartMission removes the old ScenarioObjectsGroup, creates a new SimGroup 'ScenarioObjectsGroup' in MissionGroup, spawns scenario.prefabs, starts the physics, optionally spawns the vehicle chosen by the user (userSelectedVehicle), emits onLoadCustomPrefabs(scenario) then changeState('pre-start').
- State machine, driven from onPreRender according to scenario.state: 'pre-start' (tickPreStart: stage 0 waits for the user vehicle, stage 1 calls completeStartUp: processes vehicles, start transforms, waypoints, level state, action filter, multiseat, emits onScenarioLoaded, then displays the start UI, stage 2 end) -> 'pre-running' (introduction; the UI sends onScenarioUIReady('start') which triggers this state; path camera, check of the scenario's extensions) -> 'running' (triggered by onScenarioUIReady('play')) with scenario.raceState 'countdown' then 'racing' -> 'finished' (endRace) -> 'post' (results, stats, end screen); 'restart' for a restart; 'physicsPaused' during a physics pause; 'deferredRunning' immediately goes back to 'running'. Each changeState emits the onScenarioChange(scenario) hook at the end.
- Entering 'pre-running': initializes raceMarker, scenario_raceUI, scenario_raceGoals.initialiseGoals(), scenario_waypoints.initialise(), freezes all vehicles (controller.setFreeze) and switches to the game camera. Entering 'running': finalizes multiseat, restores the player's camera, hides the intro, starts the countdown (3.5 s with 3-2-1 display, otherwise 1.5 s), initializes the vehicles' AI (initVehicleAIState) and emits onRaceInit.
- Countdown (tickRunning, raceState 'countdown'): decrements countDownTime with dtSim; at <= 3 s emits onCountdownStarted and the 3-2-1 UI messages; at <= 0 displays GO, sets raceState to 'racing', unfreezes the vehicles, resets the timer to 0, emits onCountdownEnded then processRaceStart (except rollingStart: in that case rollingStartTriggered() must be called later). processRaceStart emits onRaceStart and the UI event RaceStart.
- During the race: scenario.timer += dtSim (if timerActive and not paused), UI event raceTime, automatic end (endRace) if timer > maxTime + extraTime, attempts handling (attemptsInfo: onNewAttempt, onLastAttemptTaken, onAttemptFailed/Completed via onBeamNGTrigger), hook onRaceTick(0.25, timer) every 0.25 s of simulated time, hook onFailureTimerFired after failureTriggerTime (real time), vehicle tracking (onObjectCollision, onVehicleTakenDamage, onVehicleStoppedMoving).
- End: endRace/endScenario switch to 'finished' with a delay (endCountDownTime or 3 s, real time); tickFinished emits onRaceResult({finalTime}), aggregates scenario.pooledResults (the first failure wins if alone, otherwise the first success; otherwise default win), sets scenario.result {msg|failed, finalTime, finalTimeStr}, switches to 'post', updates the goals, collects the statistics, saves them in settings/playerStatistics.json, and prepares the end screen (ui_router 'scenario.end' or 'scenario.quickrace.end'). During the end screen time is slowed to 1/8.
- Result: finish(result) adds result to scenario.pooledResults and ends the race; result.failed (string or translation table) = failure, result.msg = success.
- Input filtering: at the start of the scenario, the actions listed in scenario.blackListActions and whiteListActions are applied to player 0 (action group camera_blacklist always added). stop() removes them. During a replay playback that does not allow gameplay, the filter is lifted.
- Restart: restartScenario (also triggered by onResetGameplay) copies the scenario, calls stop(), restores the copy and switches to 'restart'; tickRestart resets the triggers, reinitializes the vehicles, reprocesses the vehicles, then goes back to 'pre-start' and emits onScenarioRestarted.
- Persistence on Lua reload: onSerialize saves state, timer, goals, etc.; onDeserialized reloads the scenario from its source file via scenario_scenariosLoader.loadScenario then reprocesses vehicles and waypoints.
- Compatibility: onExtensionLoaded creates the (obsolete) global scenario_race which redirects every call to scenario_scenarios while logging an error; scenario.vehiclesByName/vehiclesByID/vehicleInitialTransform are obsolete fields (compatibility metatable). spawnPrefab is obsolete (use ge_utils).
- BUG/inconsistency: M.onRaceWaypointReached is assigned from a local variable that is never defined (so nil): the field does not actually exist.
- BUG/inconsistency: the local function onUpdate (imgui debug window "Scenario Runtime Debug") is never exported (the M.onUpdate line is commented out): dead code.
- BUG/inconsistency: in tickRunning, "abs(vehicleData.damage - data.lastDamage)" is tested via "delataDamage > 0"; if vehicleData is nil, delataDamage is nil and the comparison raises a Lua error.
- BUG/inconsistency: in tickFinished, "{msg = scenario.defaultWin} or {...}": the "or" part is never reached (a table is always truthy), so the default translation message is never used; if scenario.defaultWin is nil, msg is nil.
- BUG/inconsistency: initializeVehicle converts degrees to radians with 3.1459 (instead of 3.14159).
- BUG/inconsistency: onClientStartMission does not check that spawnPrefab returns an object before using prefabObj.obj.
- BUG/inconsistency: getscenarioName() crashes if no scenario is loaded (scenario nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_scenarios.changeState(newState)` | Changes scenario.state and runs the entry actions of the state ('pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post'), then emits onScenarioChange(scenario). Does nothing without a scenario. | 252 |
| `scenario_scenarios.continueScenario()` | Resumes simulation time (simTimeAuthority.pause(false)). | 396 |
| `scenario_scenarios.displayEndUI()` | Clears displayEndUIRefs (allows the end screen to be displayed). | 1523 |
| `scenario_scenarios.displayStartUI()` | Navigates to the 'scenario.start' screen (ui_router) and clears displayStartUIRefs. | 1518 |
| `scenario_scenarios.endRace(countDownTime)` | Switches to the 'finished' state (unless already finished/post), sets the delay before results (countDownTime, otherwise scenario.endCountDownTime, otherwise 3 s) and stores the final time. | 401 |
| `scenario_scenarios.endScenario(countDownTime)` | Ends the race (endRace), emits onEndScenario(countDownTime) to let goals and custom Lua decide the result, and slows time to 1/8 if needed. | 1452 |
| `scenario_scenarios.executeScenario(sc)` | Starts a scenario: stops the current scenario if there is one, stores sc, loads its extensions (scenario.extensions), forbids automatic player spawn then starts the level scenario.mission via core_levels.startLevel. The rest happens in onClientStartMission. | 1110 |
| `scenario_scenarios.finish(result)` | Adds a result to scenario.pooledResults and ends the race if it is not already finished (endRace(0), no delay). result.failed (string) = failure; result.msg = success. | 677 |
| `scenario_scenarios.freezeAll(state)` | Freezes or unfreezes all the scenario's vehicles via controller.setFreeze on the vehicle side (used before the end of the countdown). | 118 |
| `scenario_scenarios.getRaceDistance(scenario)` | Length of a lap: sum of the distances between successive points of scenario.lapConfig (map nodes or scene objects). | 336 |
| `scenario_scenarios.getScenario()` | Returns the table of the currently loaded scenario. | 1440 |
| `scenario_scenarios.getScenarioStateAtPauseEvent()` | Scenario state stored at the time of the physics pause. | 2276 |
| `scenario_scenarios.getVehicleName(vehicleID)` | Scenario name of a vehicle from its id. | 1489 |
| `scenario_scenarios.getscenarioName()` | Returns scenario.name of the current scenario (Lua error if there is none). | 2345 |
| `scenario_scenarios.onBeamNGTrigger(data)` | Hook: handles attempts (scenario.attemptsInfo) when the player vehicle enters a trigger: emits onAttemptFailed or onAttemptCompleted according to failAttempts/completeAttempt and arms the wait timer. *(internal)* *(hook)* | 2395 |
| `scenario_scenarios.onCameraModeChanged(modeName)` | Hook: stores the last camera mode (except 'path' and 'observer') in scenario.lastModeName, to restore it at the start of the race. *(internal)* *(hook)* | 1444 |
| `scenario_scenarios.onClientEndMission()` | Level end hook: cleans up raceMarker. *(internal)* *(hook)* | 2426 |
| `scenario_scenarios.onClientStartMission(levelPath)` | Hook called by main.lua when the level is loaded (clientStartMission). If a scenario is pending: creates ScenarioObjectsGroup, spawns the prefabs and the chosen vehicle, emits onLoadCustomPrefabs and switches to 'pre-start'. Always removes the old scenario object group and lifts preventPlayerSpawning. *(internal)* *(hook)* | 999 |
| `scenario_scenarios.onDeserialized(data)` | Deserialization hook after Lua reload: reloads the scenario from sourceFile/scenarioKey and restores the state. *(internal)* *(hook)* | 2314 |
| `scenario_scenarios.onDrawDebug(focusPos)` | Debug draw hook: if the editor is enabled and the BeamNGRaceDrawDebug setting is true, draws spheres and names of the scenario's waypoint nodes within a 200 m radius. *(internal)* *(hook)* | 1168 |
| `scenario_scenarios.onExtensionLoaded()` | Extension load hook: creates the obsolete global scenario_race that redirects to scenario_scenarios. *(internal)* *(hook)* | 2355 |
| `scenario_scenarios.onExtensionUnloaded()` | Unload hook: calls stop() and clears scenario_race. *(internal)* *(hook)* | 2350 |
| `scenario_scenarios.onFilteredInputChanged(devName, action, value)` | Hook: in a multiseat scenario, a steering movement (steering, steer_left, steer_right) from a device changes the assigned vehicle (limited to once per 500 ms, threshold 0.2). *(internal)* *(hook)* | 1354 |
| `scenario_scenarios.onInputBindingsChanged(assignedPlayers)` | Hook: matches devices and multiseat seats when the input assignments change. *(internal)* *(hook)* | 1350 |
| `scenario_scenarios.onPhysicsPaused()` | Hook: stores the current state and switches to 'physicsPaused' (unless the editor is active). *(internal)* *(hook)* | 2267 |
| `scenario_scenarios.onPhysicsUnpaused()` | Hook: restores the state stored at the time of the pause (unless the scenario is in 'restart'). *(internal)* *(hook)* | 2256 |
| `scenario_scenarios.onPreRender(dt, dtSim)` | Hook called every frame from luaPreRender: runs the current state's tick function (tickPreStart, tickPreRunning, tickRunning, tickFinished, tickPost, tickRestart) then draws the race markers. Does nothing during a replay playback that forbids gameplay. *(internal)* *(hook)* | 2119 |
| `scenario_scenarios.onReplayCoreEvent(data)` | Replay hook: lifts or restores the scenario's action filter depending on whether the replay allows gameplay. *(internal)* *(hook)* | 2223 |
| `scenario_scenarios.onResetGameplay(playerID)` | Hook: a gameplay reset restarts the scenario (restartScenario). *(internal)* *(hook)* | 2250 |
| `scenario_scenarios.onScenarioUIReady(state)` | Callback sent by the UI: 'start' (in pre-start) starts the introduction phase (pre-running); 'play' (in pre-running) starts the race (running). Republishes ScenarioChange to the UI. *(internal)* *(hook)* | 1400 |
| `scenario_scenarios.onSerialize()` | Serialization hook before Lua reload: returns the scenario's minimal state. *(internal)* *(hook)* | 2287 |
| `scenario_scenarios.onVehicleSelected(vehicleData)` | Hook called when the player chooses a vehicle in the scenario UI: replaces or spawns the player's vehicle with model/config/color/licenseText, then freezes all vehicles. *(internal)* *(hook)* | 1985 |
| `scenario_scenarios.onVehicleStoppedMoving(vehicleID)` | Hook: if trackPlayerVehicle is active and the vehicle is player 0, sets playerIsDamaged and playerHasStopped. *(internal)* *(hook)* | 2239 |
| `scenario_scenarios.pauseScenario()` | Pauses simulation time (simTimeAuthority.pause(true)). | 391 |
| `scenario_scenarios.prepareStartUI()` | Resets the scenario's displayStartUIRefs counter to 0; the start UI is displayed while this counter is 0 at stage 1 of pre-start. | 413 |
| `scenario_scenarios.restartScenario()` | Restarts the current scenario from the beginning while keeping the loaded level: copies the scenario, calls stop(), then switches to the 'restart' state. Must remain a "reload" and not an "onload" (code comment). | 1136 |
| `scenario_scenarios.rollingStartTriggered()` | To be called for a rolling start (scenario.rollingStart): resets the timer to 0 and runs processRaceStart (onRaceStart). | 1581 |
| `scenario_scenarios.setScenarioStateAtPauseEvent(state)` | Forces the state to restore when physics resumes. | 2280 |
| `scenario_scenarios.spawnPrefab(val, objName, objFileName, objPos, objRotation, objScale)` | OBSOLETE: use spawnPrefab/addPrefab/removePrefab from ge_utils. val 2 = add and load, 1 = add without loading, 0 = unload. | 687 |
| `scenario_scenarios.stop()` | Stops and fully unloads the scenario: turns off multiseat, unloads the scenario's extensions, resets the time speed to 1, removes the action filter, re-enables trailerRespawn, clears the scenario variable, cleans up raceMarker, sends ScenarioChange(nil) to the UI and emits onScenarioChange with no argument. Does nothing if there is no scenario. | 469 |
| `scenario_scenarios.stopRaceTimer()` | Stops the scenario timer (timerActive = false). | 386 |
| `scenario_scenarios.trackVehicleMovementAfterDamage(vehicleName, trackingOptions)` | Registers a vehicle in scenario.vehicleTrackingTable: the tracking then emits onObjectCollision, onVehicleTakenDamage and onVehicleStoppedMoving during the race. | 1493 |
| `scenario_scenarios.uiEventFreeRoam()` | Called by the UI (Free roam button): removes the scenario's AI vehicles, stops the scenario and sets the game state to 'freeroam' without restoring the level state. *(internal)* | 1481 |
| `scenario_scenarios.uiEventRetry()` | Called by the UI (Retry button): restartScenario then prepareStartUI. *(internal)* | 1475 |
| `scenario_scenarios.updateVehicleAiState(vehicleName, data)` | Updates scenario.aiControlledVehiclesById for a vehicle (mode 'disable' removes it) and emits onVehicleAIStateChanged({vehicleId, vehicleName, aiControlled}). | 2374 |

### Parameter details

#### `scenario_scenarios.changeState(newState)`

Changes scenario.state and runs the entry actions of the state ('pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post'), then emits onScenarioChange(scenario). Does nothing without a scenario.

- `newState` (*string*) : 'pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post', 'restart', 'physicsPaused'

#### `scenario_scenarios.endRace(countDownTime)`

Switches to the 'finished' state (unless already finished/post), sets the delay before results (countDownTime, otherwise scenario.endCountDownTime, otherwise 3 s) and stores the final time.

- `countDownTime` (*number|nil*) : delay in s

#### `scenario_scenarios.endScenario(countDownTime)`

Ends the race (endRace), emits onEndScenario(countDownTime) to let goals and custom Lua decide the result, and slows time to 1/8 if needed.

- `countDownTime` (*number|nil*) : delay before the result (s, real time)

#### `scenario_scenarios.executeScenario(sc)`

Starts a scenario: stops the current scenario if there is one, stores sc, loads its extensions (scenario.extensions), forbids automatic player spawn then starts the level scenario.mission via core_levels.startLevel. The rest happens in onClientStartMission.

- `sc` (*table*) : scenario table processed by scenario_scenariosLoader

#### `scenario_scenarios.finish(result)`

Adds a result to scenario.pooledResults and ends the race if it is not already finished (endRace(0), no delay). result.failed (string) = failure; result.msg = success.

- `result` (*table*) : {failed = ..., msg = ...}

#### `scenario_scenarios.freezeAll(state)`

Freezes or unfreezes all the scenario's vehicles via controller.setFreeze on the vehicle side (used before the end of the countdown).

- `state` (*integer*) : 1 to freeze, 0 to unfreeze

#### `scenario_scenarios.getRaceDistance(scenario)`

Length of a lap: sum of the distances between successive points of scenario.lapConfig (map nodes or scene objects).

- `scenario` (*table*) : scenario (uses lapConfig)
- **returns**: number distance in m (0 if no lapConfig)

#### `scenario_scenarios.getScenario()`

Returns the table of the currently loaded scenario.

- **returns**: table|nil scenario or nil

#### `scenario_scenarios.getScenarioStateAtPauseEvent()`

Scenario state stored at the time of the physics pause.

- **returns**: string|nil state

#### `scenario_scenarios.getVehicleName(vehicleID)`

Scenario name of a vehicle from its id.

- `vehicleID` (*integer*) : vehicle id
- **returns**: string|nil name, nil if no scenario or unknown

#### `scenario_scenarios.getscenarioName()`

Returns scenario.name of the current scenario (Lua error if there is none).

- **returns**: string scenario name

#### `scenario_scenarios.onBeamNGTrigger(data)`

Hook: handles attempts (scenario.attemptsInfo) when the player vehicle enters a trigger: emits onAttemptFailed or onAttemptCompleted according to failAttempts/completeAttempt and arms the wait timer.

- `data` (*table*) : {event, subjectID, triggerName, ...}

#### `scenario_scenarios.onCameraModeChanged(modeName)`

Hook: stores the last camera mode (except 'path' and 'observer') in scenario.lastModeName, to restore it at the start of the race.

- `modeName` (*string*) : camera mode name

#### `scenario_scenarios.onClientStartMission(levelPath)`

Hook called by main.lua when the level is loaded (clientStartMission). If a scenario is pending: creates ScenarioObjectsGroup, spawns the prefabs and the chosen vehicle, emits onLoadCustomPrefabs and switches to 'pre-start'. Always removes the old scenario object group and lifts preventPlayerSpawning.

- `levelPath` (*string*) : level path

#### `scenario_scenarios.onDeserialized(data)`

Deserialization hook after Lua reload: reloads the scenario from sourceFile/scenarioKey and restores the state.

- `data` (*table*) : data produced by onSerialize

#### `scenario_scenarios.onDrawDebug(focusPos)`

Debug draw hook: if the editor is enabled and the BeamNGRaceDrawDebug setting is true, draws spheres and names of the scenario's waypoint nodes within a 200 m radius.

- `focusPos` (*vec3*) : debug focus position

#### `scenario_scenarios.onFilteredInputChanged(devName, action, value)`

Hook: in a multiseat scenario, a steering movement (steering, steer_left, steer_right) from a device changes the assigned vehicle (limited to once per 500 ms, threshold 0.2).

- `devName` (*string*) : device
- `action` (*string*) : action
- `value` (*number*) : axis value

#### `scenario_scenarios.onInputBindingsChanged(assignedPlayers)`

Hook: matches devices and multiseat seats when the input assignments change.

- `assignedPlayers` (*table*) : assigned players

#### `scenario_scenarios.onPreRender(dt, dtSim)`

Hook called every frame from luaPreRender: runs the current state's tick function (tickPreStart, tickPreRunning, tickRunning, tickFinished, tickPost, tickRestart) then draws the race markers. Does nothing during a replay playback that forbids gameplay.

- `dt` (*number*) : dtReal (s)
- `dtSim` (*number*) : simulated time (s)

#### `scenario_scenarios.onReplayCoreEvent(data)`

Replay hook: lifts or restores the scenario's action filter depending on whether the replay allows gameplay.

- `data` (*table*) : event data (unused)

#### `scenario_scenarios.onResetGameplay(playerID)`

Hook: a gameplay reset restarts the scenario (restartScenario).

- `playerID` (*integer*) : player

#### `scenario_scenarios.onScenarioUIReady(state)`

Callback sent by the UI: 'start' (in pre-start) starts the introduction phase (pre-running); 'play' (in pre-running) starts the race (running). Republishes ScenarioChange to the UI.

- `state` (*string*) : 'start' or 'play'

#### `scenario_scenarios.onSerialize()`

Serialization hook before Lua reload: returns the scenario's minimal state.

- **returns**: table data (empty if no scenario)

#### `scenario_scenarios.onVehicleSelected(vehicleData)`

Hook called when the player chooses a vehicle in the scenario UI: replaces or spawns the player's vehicle with model/config/color/licenseText, then freezes all vehicles.

- `vehicleData` (*table*) : {model, config, color, licenseText}

#### `scenario_scenarios.onVehicleStoppedMoving(vehicleID)`

Hook: if trackPlayerVehicle is active and the vehicle is player 0, sets playerIsDamaged and playerHasStopped.

- `vehicleID` (*integer*) : vehicle id

#### `scenario_scenarios.setScenarioStateAtPauseEvent(state)`

Forces the state to restore when physics resumes.

- `state` (*string|nil*) : state

#### `scenario_scenarios.spawnPrefab(val, objName, objFileName, objPos, objRotation, objScale)`

OBSOLETE: use spawnPrefab/addPrefab/removePrefab from ge_utils. val 2 = add and load, 1 = add without loading, 0 = unload.

- `val` (*integer*) : 0, 1 or 2
- `objName` (*string*) : name
- `objFileName` (*string*) : file
- `objPos` (*string*) : position
- `objRotation` (*string*) : rotation
- `objScale` (*string*) : scale
- **returns**: table|nil prefab

#### `scenario_scenarios.trackVehicleMovementAfterDamage(vehicleName, trackingOptions)`

Registers a vehicle in scenario.vehicleTrackingTable: the tracking then emits onObjectCollision, onVehicleTakenDamage and onVehicleStoppedMoving during the race.

- `vehicleName` (*string*) : vehicle object name
- `trackingOptions` (*table|nil*) : {waitTimerLimit (s, default 1.0), vehDisplacementLimit (m, default 0.25)}

#### `scenario_scenarios.updateVehicleAiState(vehicleName, data)`

Updates scenario.aiControlledVehiclesById for a vehicle (mode 'disable' removes it) and emits onVehicleAIStateChanged({vehicleId, vehicleName, aiControlled}).

- `vehicleName` (*string*) : vehicle name
- `data` (*table*) : {mode = 'disable'|other}

## Fields

| Field | Type | Description |
|---|---|---|
| `onRaceWaypointReached` | nil | Exported but is nil (local variable not defined in the file). ⚠ reference `onRaceWaypointReached` not defined in the file (probably nil) |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAttemptCompleted` — listened to by 1 module(s)
- `onAttemptFailed` — listened to by 1 module(s)
- `onCountdownEnded` — listened to by 2 module(s)
- `onCountdownStarted`
- `onCustomWaypoints` — listened to by 1 module(s)
- `onEndScenario`
- `onFailureTimerFired`
- `onLastAttemptTaken`
- `onLoadCustomPrefabs` — listened to by 1 module(s)
- `onNewAttempt` — listened to by 1 module(s)
- `onObjectCollision`
- `onRaceInit` — listened to by 2 module(s)
- `onRaceResult` — listened to by 6 module(s)
- `onRaceStart` — listened to by 5 module(s)
- `onRaceTick` — listened to by 2 module(s)
- `onScenarioChange` — listened to by 9 module(s)
- `onScenarioFinished` — listened to by 2 module(s)
- `onScenarioLoaded` — listened to by 5 module(s)
- `onScenarioRestarted` — listened to by 7 module(s)
- `onScenarioUIReady` — listened to by 1 module(s)
- `onVehicleAIStateChanged` — listened to by 1 module(s)
- `onVehicleStoppedMoving` — listened to by 1 module(s)
- `onVehicleTakenDamage`

**UI events (guihooks.trigger):** `HotlappingResetApp`, `PlayersChanged`, `RaceStart`, `ScenarioChange`, `ScenarioFlashMessage`, `ScenarioFlashMessageReset`, `ScenarioNotRunning`, `ScenarioResetTimer`, `raceTime`, `scenarioStart:showStartButton`, `setQuickRaceMode`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `be:` `enterVehicle`, `exitVehicle`, `getEnabled`, `getPlayerVehicleID`, `physicsStartSimulation`, `resetVehicle`, `setDynamicCollisionEnabled`, `toggleEnabled`
- `core_environment.` `getTimeOfDay`, `reset_init`, `setTimeOfDay`
- `debugDrawer:` `drawSphere`, `drawText`
- `scenetree.` `findClassObjects`, `findObject`

**Loads extensions:** `scenario_`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/scenarios.lua`.*
