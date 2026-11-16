---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/scenarios.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the "scenario" mode: a state machine that loads a scenario's level, spawns its prefabs and vehicles, handles the intro phase, the countdown, the race (timer, attempts, damage tracking), the end with result aggregation, the statistics and the end screen. A scenario is a table (produced by scenario_scenariosLoader) stored in a single local variable; it is read with getScenario(). A modder uses it to start/stop a scenario (executeScenario, stop, restartScenario), end it (endScenario, finish) or listen to the emitted hooks (onScenarioChange, onRaceStart, onRaceResult...).
--- Access: extension `scenario_scenarios`: `extensions.load("scenario_scenarios")`, then the global `scenario_scenarios`
---@class scenario_scenarios
---@field onRaceWaypointReached nil Exported but is nil (local variable not defined in the file).
scenario_scenarios = {}

--- Changes scenario.state and runs the entry actions of the state ('pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post'), then emits onScenarioChange(scenario). Does nothing without a scenario.
---Source: lua/ge/extensions/scenario/scenarios.lua:252
---@param newState string 'pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post', 'restart', 'physicsPaused'
function scenario_scenarios.changeState(newState) end

--- Resumes simulation time (simTimeAuthority.pause(false)).
---Source: lua/ge/extensions/scenario/scenarios.lua:396
function scenario_scenarios.continueScenario() end

--- Clears displayEndUIRefs (allows the end screen to be displayed).
---Source: lua/ge/extensions/scenario/scenarios.lua:1523
function scenario_scenarios.displayEndUI() end

--- Navigates to the 'scenario.start' screen (ui_router) and clears displayStartUIRefs.
---Source: lua/ge/extensions/scenario/scenarios.lua:1518
function scenario_scenarios.displayStartUI() end

--- Switches to the 'finished' state (unless already finished/post), sets the delay before results (countDownTime, otherwise scenario.endCountDownTime, otherwise 3 s) and stores the final time.
---Source: lua/ge/extensions/scenario/scenarios.lua:401
---@param countDownTime number|nil delay in s
function scenario_scenarios.endRace(countDownTime) end

--- Ends the race (endRace), emits onEndScenario(countDownTime) to let goals and custom Lua decide the result, and slows time to 1/8 if needed.
---Source: lua/ge/extensions/scenario/scenarios.lua:1452
---@param countDownTime number|nil delay before the result (s, real time)
function scenario_scenarios.endScenario(countDownTime) end

--- Starts a scenario: stops the current scenario if there is one, stores sc, loads its extensions (scenario.extensions), forbids automatic player spawn then starts the level scenario.mission via core_levels.startLevel. The rest happens in onClientStartMission.
---Source: lua/ge/extensions/scenario/scenarios.lua:1110
---@param sc table scenario table processed by scenario_scenariosLoader
function scenario_scenarios.executeScenario(sc) end

--- Adds a result to scenario.pooledResults and ends the race if it is not already finished (endRace(0), no delay). result.failed (string) = failure; result.msg = success.
---Source: lua/ge/extensions/scenario/scenarios.lua:677
---@param result table {failed = ..., msg = ...}
function scenario_scenarios.finish(result) end

--- Freezes or unfreezes all the scenario's vehicles via controller.setFreeze on the vehicle side (used before the end of the countdown).
---Source: lua/ge/extensions/scenario/scenarios.lua:118
---@param state integer 1 to freeze, 0 to unfreeze
function scenario_scenarios.freezeAll(state) end

--- Length of a lap: sum of the distances between successive points of scenario.lapConfig (map nodes or scene objects).
---Source: lua/ge/extensions/scenario/scenarios.lua:336
---@param scenario table scenario (uses lapConfig)
---@return number  distance in m (0 if no lapConfig)
function scenario_scenarios.getRaceDistance(scenario) end

--- Returns the table of the currently loaded scenario.
---Source: lua/ge/extensions/scenario/scenarios.lua:1440
---@return table|nil  scenario or nil
function scenario_scenarios.getScenario() end

--- Scenario state stored at the time of the physics pause.
---Source: lua/ge/extensions/scenario/scenarios.lua:2276
---@return string|nil  state
function scenario_scenarios.getScenarioStateAtPauseEvent() end

--- Scenario name of a vehicle from its id.
---Source: lua/ge/extensions/scenario/scenarios.lua:1489
---@param vehicleID integer vehicle id
---@return string|nil  name, nil if no scenario or unknown
function scenario_scenarios.getVehicleName(vehicleID) end

--- Returns scenario.name of the current scenario (Lua error if there is none).
---Source: lua/ge/extensions/scenario/scenarios.lua:2345
---@return string  scenario name
function scenario_scenarios.getscenarioName() end

--- Hook: handles attempts (scenario.attemptsInfo) when the player vehicle enters a trigger: emits onAttemptFailed or onAttemptCompleted according to failAttempts/completeAttempt and arms the wait timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2395
---@param data table {event, subjectID, triggerName, ...}
function scenario_scenarios.onBeamNGTrigger(data) end

--- Hook: stores the last camera mode (except 'path' and 'observer') in scenario.lastModeName, to restore it at the start of the race.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1444
---@param modeName string camera mode name
function scenario_scenarios.onCameraModeChanged(modeName) end

--- Level end hook: cleans up raceMarker.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2426
function scenario_scenarios.onClientEndMission() end

--- Hook called by main.lua when the level is loaded (clientStartMission). If a scenario is pending: creates ScenarioObjectsGroup, spawns the prefabs and the chosen vehicle, emits onLoadCustomPrefabs and switches to 'pre-start'. Always removes the old scenario object group and lifts preventPlayerSpawning.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:999
---@param levelPath string level path
function scenario_scenarios.onClientStartMission(levelPath) end

--- Deserialization hook after Lua reload: reloads the scenario from sourceFile/scenarioKey and restores the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2314
---@param data table data produced by onSerialize
function scenario_scenarios.onDeserialized(data) end

--- Debug draw hook: if the editor is enabled and the BeamNGRaceDrawDebug setting is true, draws spheres and names of the scenario's waypoint nodes within a 200 m radius.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1168
---@param focusPos vec3 debug focus position
function scenario_scenarios.onDrawDebug(focusPos) end

--- Extension load hook: creates the obsolete global scenario_race that redirects to scenario_scenarios.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2355
function scenario_scenarios.onExtensionLoaded() end

--- Unload hook: calls stop() and clears scenario_race.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2350
function scenario_scenarios.onExtensionUnloaded() end

--- Hook: in a multiseat scenario, a steering movement (steering, steer_left, steer_right) from a device changes the assigned vehicle (limited to once per 500 ms, threshold 0.2).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1354
---@param devName string device
---@param action string action
---@param value number axis value
function scenario_scenarios.onFilteredInputChanged(devName, action, value) end

--- Hook: matches devices and multiseat seats when the input assignments change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1350
---@param assignedPlayers table assigned players
function scenario_scenarios.onInputBindingsChanged(assignedPlayers) end

--- Hook: stores the current state and switches to 'physicsPaused' (unless the editor is active).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2267
function scenario_scenarios.onPhysicsPaused() end

--- Hook: restores the state stored at the time of the pause (unless the scenario is in 'restart').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2256
function scenario_scenarios.onPhysicsUnpaused() end

--- Hook called every frame from luaPreRender: runs the current state's tick function _anon(tickPreStart, tickPreRunning, tickRunning, tickFinished, tickPost, tickRestart) then draws the race markers. Does nothing during a replay playback that forbids gameplay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2119
---@param dt number dtReal (s)
---@param dtSim number simulated time (s)
function scenario_scenarios.onPreRender(dt, dtSim) end

--- Replay hook: lifts or restores the scenario's action filter depending on whether the replay allows gameplay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2223
---@param data table event data (unused)
function scenario_scenarios.onReplayCoreEvent(data) end

--- Hook: a gameplay reset restarts the scenario (restartScenario).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2250
---@param playerID integer player
function scenario_scenarios.onResetGameplay(playerID) end

--- Callback sent by the UI: 'start' (in pre-start) starts the introduction phase (pre-running); 'play' (in pre-running) starts the race (running). Republishes ScenarioChange to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1400
---@param state string 'start' or 'play'
function scenario_scenarios.onScenarioUIReady(state) end

--- Serialization hook before Lua reload: returns the scenario's minimal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2287
---@return table  data (empty if no scenario)
function scenario_scenarios.onSerialize() end

--- Hook called when the player chooses a vehicle in the scenario UI: replaces or spawns the player's vehicle with model/config/color/licenseText, then freezes all vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1985
---@param vehicleData table {model, config, color, licenseText}
function scenario_scenarios.onVehicleSelected(vehicleData) end

--- Hook: if trackPlayerVehicle is active and the vehicle is player 0, sets playerIsDamaged and playerHasStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:2239
---@param vehicleID integer vehicle id
function scenario_scenarios.onVehicleStoppedMoving(vehicleID) end

--- Pauses simulation time (simTimeAuthority.pause(true)).
---Source: lua/ge/extensions/scenario/scenarios.lua:391
function scenario_scenarios.pauseScenario() end

--- Resets the scenario's displayStartUIRefs counter to 0; the start UI is displayed while this counter is 0 at stage 1 of pre-start.
---Source: lua/ge/extensions/scenario/scenarios.lua:413
function scenario_scenarios.prepareStartUI() end

--- Restarts the current scenario from the beginning while keeping the loaded level: copies the scenario, calls stop(), then switches to the 'restart' state. Must remain a "reload" and not an "onload" (code comment).
---Source: lua/ge/extensions/scenario/scenarios.lua:1136
function scenario_scenarios.restartScenario() end

--- To be called for a rolling start (scenario.rollingStart): resets the timer to 0 and runs processRaceStart (onRaceStart).
---Source: lua/ge/extensions/scenario/scenarios.lua:1581
function scenario_scenarios.rollingStartTriggered() end

--- Forces the state to restore when physics resumes.
---Source: lua/ge/extensions/scenario/scenarios.lua:2280
---@param state string|nil state
function scenario_scenarios.setScenarioStateAtPauseEvent(state) end

--- OBSOLETE: use spawnPrefab/addPrefab/removePrefab from ge_utils. val 2 = add and load, 1 = add without loading, 0 = unload.
---Source: lua/ge/extensions/scenario/scenarios.lua:687
---@param val integer 0, 1 or 2
---@param objName string name
---@param objFileName string file
---@param objPos string position
---@param objRotation string rotation
---@param objScale string scale
---@return table|nil  prefab
function scenario_scenarios.spawnPrefab(val, objName, objFileName, objPos, objRotation, objScale) end

--- Stops and fully unloads the scenario: turns off multiseat, unloads the scenario's extensions, resets the time speed to 1, removes the action filter, re-enables trailerRespawn, clears the scenario variable, cleans up raceMarker, sends ScenarioChange(nil) to the UI and emits onScenarioChange with no argument. Does nothing if there is no scenario.
---Source: lua/ge/extensions/scenario/scenarios.lua:469
function scenario_scenarios.stop() end

--- Stops the scenario timer (timerActive = false).
---Source: lua/ge/extensions/scenario/scenarios.lua:386
function scenario_scenarios.stopRaceTimer() end

--- Registers a vehicle in scenario.vehicleTrackingTable: the tracking then emits onObjectCollision, onVehicleTakenDamage and onVehicleStoppedMoving during the race.
---Source: lua/ge/extensions/scenario/scenarios.lua:1493
---@param vehicleName string vehicle object name
---@param trackingOptions table|nil {waitTimerLimit (s, default 1.0), vehDisplacementLimit (m, default 0.25)}
function scenario_scenarios.trackVehicleMovementAfterDamage(vehicleName, trackingOptions) end

--- Called by the UI (Free roam button): removes the scenario's AI vehicles, stops the scenario and sets the game state to 'freeroam' without restoring the level state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1481
function scenario_scenarios.uiEventFreeRoam() end

--- Called by the UI (Retry button): restartScenario then prepareStartUI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenarios.lua:1475
function scenario_scenarios.uiEventRetry() end

--- Updates scenario.aiControlledVehiclesById for a vehicle (mode 'disable' removes it) and emits onVehicleAIStateChanged({vehicleId, vehicleName, aiControlled}).
---Source: lua/ge/extensions/scenario/scenarios.lua:2374
---@param vehicleName string vehicle name
---@param data table {mode = 'disable'|other}
function scenario_scenarios.updateVehicleAiState(vehicleName, data) end

