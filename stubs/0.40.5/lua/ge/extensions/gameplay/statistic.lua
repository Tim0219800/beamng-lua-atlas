---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/statistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Game statistics extension. It keeps named metrics (counters, values, timers) recorded in settings/cloud/gameplay_stat.json, and a separate copy per career profile (career/gameplay_stat.json in the save slot). It measures time spent per mode, level and activity, counts events (spawned vehicles, resets, vehicle switches, finished scenarios) and loads the gameplay/statisticModules modules (watchJturn, watchRollover...) whose workload function is called in turn on the player's vehicle. Modders use it to read, increment or observe metrics.
--- Access: extension `gameplay_statistic`: `extensions.load("gameplay_statistic")`, then the global `gameplay_statistic`
---@class gameplay_statistic
---@field dependencies string[] Extensions loaded beforehand: ui_imgui and core_gamestate.
gameplay_statistic = {}

--- Adds a function to the per-vehicle watch queue. Called fn(vehicleObj, vehicleId, dtSim), one function per frame in round-robin.
---Source: lua/ge/extensions/gameplay/statistic.lua:128
---@param fn function Watch function.
function gameplay_statistic.addSchedule(fn) end

--- Registers a function called when a metric changes. Callback signature: fn(name, oldEntry, newEntry); newEntry.career indicates the career context. With trigger, called only once when the value reaches the threshold.
---Source: lua/ge/extensions/gameplay/statistic.lua:356
---@param name string Metric name, or pattern containing "*".
---@param trigger number|nil Value threshold; nil = on every change.
---@param callbackFunction function Callback.
---@param career boolean|nil Listen to career metrics.
function gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career) end

--- Removes a registered callback (same name, trigger, function and career).
---Source: lua/ge/extensions/gameplay/statistic.lua:382
---@param name string Name or pattern.
---@param trigger number|nil Threshold used at registration.
---@param callbackFunction function Callback.
---@param career boolean|nil Career context.
---@return boolean  true if removed.
function gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career) end

--- Records the elapsed time of all running timers (without stopping them).
---Source: lua/ge/extensions/gameplay/statistic.lua:782
function gameplay_statistic.forceTimerUpdate() end

--- Adds value to the metric name (creates it if absent), for general statistics and, if career is active, for career statistics. Triggers the associated callbacks.
---Source: lua/ge/extensions/gameplay/statistic.lua:230
---@param name string Metric name.
---@param value number Value to add.
---@param aggregate boolean|nil Also track last, count, min, max.
function gameplay_statistic.metricAdd(name, value, aggregate) end

--- Returns a copy of a metric's entry.
---Source: lua/ge/extensions/gameplay/statistic.lua:293
---@param name string Metric name.
---@param carreer boolean|nil true to read career data (if active).
---@return table|nil  {value, ...} or nil if unknown.
function gameplay_statistic.metricGet(name, carreer) end

--- Returns copies of all metrics whose name matches a Lua pattern (string.match).
---Source: lua/ge/extensions/gameplay/statistic.lua:307
---@param namePattern string Lua pattern.
---@param carreer boolean|nil true for career (if active).
---@return table<string, table>  name -> entry.
function gameplay_statistic.metricGetMatchPattern(namePattern, carreer) end

--- Sets the metric value (general and career). Triggers the callbacks.
---Source: lua/ge/extensions/gameplay/statistic.lua:273
---@param name string Metric name.
---@param value number New value.
---@param aggregate boolean|nil Also track count, min, max.
function gameplay_statistic.metricSet(name, value, aggregate) end

--- Hook called when career is activated or deactivated: loads or frees the profile statistics.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:757
---@param active boolean true if career becomes active.
function gameplay_statistic.onCareerActive(active) end

--- Hook called at the end of a level: ends the activity and saves.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:526
---@param levelPath string Level path.
function gameplay_statistic.onClientEndMission(levelPath) end

--- Hook called after the level loads: starts the activity and reloads the submodules.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:531
---@param levelPath string Level path.
function gameplay_statistic.onClientPostStartMission(levelPath) end

--- Hook called at the start of a level: restarts activity tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:522
---@param levelPath string Level path.
function gameplay_statistic.onClientStartMission(levelPath) end

--- Hook: reloads the file and restores the state after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:94
---@param data table Data from onSerialize.
function gameplay_statistic.onDeserialized(data) end

--- Hook: starts the general/editor.time timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:544
function gameplay_statistic.onEditorActivated() end

--- Hook: stops the general/editor.time timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:548
function gameplay_statistic.onEditorDeactivated() end

--- Hook called when the game closes: ends the activity and saves.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:71
function gameplay_statistic.onExit() end

--- Hook: loads the statistics file and the statisticModules submodules.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:776
function gameplay_statistic.onExtensionLoaded() end

--- Hook: saves.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:78
function gameplay_statistic.onExtensionUnloaded() end

--- Hook called on game state change: restarts activity tracking (ignored in career while real time is 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:582
---@param newState table|nil New state.
function gameplay_statistic.onGameStateUpdate(newState) end

--- Hook: increments vehicle/spawned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:595
function gameplay_statistic.onPlayerVehicleCloned() end

--- Hook called when the career profile is saved: writes career/gameplay_stat.json in the slot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:747
---@param currentSavePath string Save slot folder.
function gameplay_statistic.onSaveCurrentProfile(currentSavePath) end

--- Hook called at the end of a scenario: increments scenario/finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:566
---@param scenario table Scenario.
function gameplay_statistic.onScenarioFinished(scenario) end

--- Hook called when a scenario loads: restarts activity tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:559
---@param scenario table Scenario.
function gameplay_statistic.onScenarioLoaded(scenario) end

--- Hook called when a scenario restarts: increments scenario/restarted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:574
---@param scenario table Scenario.
function gameplay_statistic.onScenarioRestarted(scenario) end

--- Hook: saves then returns the state (activity, level, mode, timers) before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:82
function gameplay_statistic.onSerialize() end

--- Hook: increments vehicle/spawned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:598
function gameplay_statistic.onSpawnDefaultVehicle() end

--- Hook called every frame: accumulates real and simulated times, runs a watch function on the player vehicle, draws the debug window if open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:603
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulated time elapsed (s).
---@param dtRaw number Raw elapsed time (s).
function gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: forgets the player's vehicle if it is destroyed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:720
---@param vid integer Vehicle identifier.
function gameplay_statistic.onVehicleDestroyed(vid) end

--- Hook: increments vehicle/reset if it is the player's vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:716
---@param vid integer Vehicle identifier.
function gameplay_statistic.onVehicleResetted(vid) end

--- Hook: increments vehicle/spawned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:592
function gameplay_statistic.onVehicleSelectorReplaceCurrent() end

--- Hook: increments vehicle/spawned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:589
function gameplay_statistic.onVehicleSelectorSpawnNew() end

--- Hook called when a vehicle spawns; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:701
---@param vid integer Vehicle identifier.
---@param v userdata Vehicle object.
function gameplay_statistic.onVehicleSpawned(vid, v) end

--- Hook called on vehicle switch: for player 0, stores the vehicle and increments vehicle/switch.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:704
---@param oldid integer Old vehicle.
---@param newid integer New vehicle (-1 if none).
---@param player integer Player index.
function gameplay_statistic.onVehicleSwitched(oldid, newid, player) end

--- Hook called on world state change; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statistic.lua:540
---@param worldReadyState integer State.
function gameplay_statistic.onWorldReadyState(worldReadyState) end

--- Removes a function from the watch queue.
---Source: lua/ge/extensions/gameplay/statistic.lua:133
---@param fn function Function added with addSchedule.
---@return boolean  true if removed.
function gameplay_statistic.removeSchedule(fn) end

--- Saves if needed then sends the StatisticData event to the UI with {general = entries, career = entries if active}.
---Source: lua/ge/extensions/gameplay/statistic.lua:735
function gameplay_statistic.sendGUIState() end

--- Opens or closes the imgui debug window "gameplay_statistic Debugger" (modules, entries, callbacks).
---Source: lua/ge/extensions/gameplay/statistic.lua:727
---@param newValue boolean true to show.
function gameplay_statistic.setDebug(newValue) end

--- Starts a named timer. If a timer with this name is already running, the call is ignored with a warning.
---Source: lua/ge/extensions/gameplay/statistic.lua:323
---@param name string Name (also the name of the metric fed).
---@param increment boolean|nil true (default): adds the time with metricAdd; false: metricSet.
---@param aggregate boolean|nil Aggregate mode (default false).
---@param useSimTime boolean|nil Use simulated time rather than real time (default false).
function gameplay_statistic.timerStart(name, increment, aggregate, useSimTime) end

--- Stops the timer and records the elapsed time in the metric.
---Source: lua/ge/extensions/gameplay/statistic.lua:346
---@param name string Timer name.
---@return number  Seconds elapsed since the last recording (0 if the timer does not exist).
function gameplay_statistic.timerStop(name) end

