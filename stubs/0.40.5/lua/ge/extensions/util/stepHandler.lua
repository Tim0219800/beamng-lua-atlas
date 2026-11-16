---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/stepHandler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Executor of asynchronous step sequences ("steps") for scenarios and test scripts. You build a list of steps with the makeStepXxx functions (fade to black, wait, vehicle or traffic spawn, level load, custom function) then start it with startStepSequence. On each onUpdate, the current step is processed until it is complete (step.complete); the next one is then started in the same frame. A step that exceeds its timeout (timeout, 120 s by default) is logged as an error and forced to "complete".
--- Access: extension `util_stepHandler`: `extensions.load("util_stepHandler")`, then the global `util_stepHandler`
---@class util_stepHandler
util_stepHandler = {}

--- Step: loads a level by name (core_levels.startLevel) and waits for onClientStartMission (timeout 600 s).
---Source: lua/ge/extensions/util/stepHandler.lua:246
---@param level string Level name (case-insensitive).
---@return table  Step.
function util_stepHandler.makeLoadLevelStep(level) end

--- Step: starts the fade back in (ui_fadeScreen.stop) and waits for state 3 of onScreenFadeState (timeout 10 s).
---Source: lua/ge/extensions/util/stepHandler.lua:59
---@param duration number|nil Fade duration in seconds.
---@return table  Step.
function util_stepHandler.makeStepFadeFromBlack(duration) end

--- Step: starts the fade to black (ui_fadeScreen.start) and waits for the black screen event (state 1, timeout 10 s).
---Source: lua/ge/extensions/util/stepHandler.lua:49
---@param duration number|nil Fade duration in seconds.
---@return table  Step.
function util_stepHandler.makeStepFadeToBlack(duration) end

--- Step: calls fun(step, dtTable) every frame until it returns a true value.
---Source: lua/ge/extensions/util/stepHandler.lua:124
---@param fun function Function (step, dtTable) -> boolean.
---@return table  Step.
function util_stepHandler.makeStepReturnTrueFunction(fun) end

--- Step: creates a group of traffic vehicles (core_multiSpawn), waits for it to spawn, sets the active count, enables traffic and disperses it (gameplay_traffic).
---Source: lua/ge/extensions/util/stepHandler.lua:204
---@param amount integer Number of vehicles to spawn.
---@param active integer Number of active vehicles (activeAmount).
---@param generator any Generator passed to core_multiSpawn.createGroup (inferred from code).
---@return table  Step.
function util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator) end

--- Step: spawns a vehicle (core_vehicles.spawnNewVehicle) then waits for it to be ready (isReady); the callback then receives (step, vehId).
---Source: lua/ge/extensions/util/stepHandler.lua:160
---@param spawningOptions table Spawn options with at least model (and config, pos, rot…).
---@param callback function|nil Called with (step, vehId) when the vehicle is ready.
---@return table  Step.
function util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback) end

--- Simple version of makeStepSpawnVehicle: options built by sanitizeVehicleSpawnOptions(model, {config = config}).
---Source: lua/ge/extensions/util/stepHandler.lua:169
---@param model string Model name.
---@param config string Configuration path or name (.pc).
---@param callback function|nil Called with (step, vehId).
---@return table  Step.
function util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback) end

--- Step: waits for a number of real seconds (os.clockhp).
---Source: lua/ge/extensions/util/stepHandler.lua:78
---@param seconds number Wait duration in seconds.
---@return table  Step (timeout = seconds + 1).
function util_stepHandler.makeStepWait(seconds) end

--- Step: waits for a number of onUpdate frames, whatever their duration.
---Source: lua/ge/extensions/util/stepHandler.lua:97
---@param frames integer Number of frames.
---@return table  Step.
function util_stepHandler.makeStepWaitFrames(frames) end

--- Step: displays a message on screen (ui_message) and in the log (tag "test"), then completes immediately.
---Source: lua/ge/extensions/util/stepHandler.lua:132
---@param message string Message text.
---@return table  Step.
function util_stepHandler.makeUiMessageStep(message) end

--- Hook called when a level starts: marks the current step as complete.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/stepHandler.lua:239
---@param state any Hook argument (not used).
function util_stepHandler.onClientStartMission(state) end

--- Hook called by ui_fadeScreen at each fade state: stores fadeState<state> on the current step if it is waiting for a fade.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/stepHandler.lua:43
---@param state integer Fade state (1 = black reached, 3 = fade removed).
function util_stepHandler.onScreenFadeState(state) end

--- Hook called every frame: processes the current step, handles timeouts, chains completed steps and disables the sequence at the end.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/stepHandler.lua:282
---@param dtReal number Real frame time (s).
---@param dtSim number Simulated duration (s).
---@param dtRaw number Raw duration (s).
function util_stepHandler.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle group has spawned: if it is the group expected by the current traffic step, sets its state to 2 and stores the identifiers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/stepHandler.lua:176
---@param vehIds integer[] Identifiers of the group's vehicles.
---@param groupId any Group identifier.
function util_stepHandler.onVehicleGroupSpawned(vehIds, groupId) end

--- Completes the current step and jumps straight to the last step (typically the end callback).
---Source: lua/ge/extensions/util/stepHandler.lua:275
function util_stepHandler.skipToLastStepOrCallback() end

--- Starts a step sequence (replaces any sequence in progress). If a callback is given, it is run as the last step.
---Source: lua/ge/extensions/util/stepHandler.lua:262
---@param steps table[] List of steps created with the makeStepXxx functions.
---@param callbackWhenFinished function|nil Called with no argument once all the steps are complete.
function util_stepHandler.startStepSequence(steps, callbackWhenFinished) end

--- processTask function of the level loading step: starts the loading on the first call, logs an error if the level is not found. Returns step.levelLoaded (never set).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/stepHandler.lua:218
---@param step table Loading step.
---@return boolean  Always false in practice.
function util_stepHandler.taskLoadLevelStep(step) end

--- processTask function of the traffic step: state machine 0 (create the group) → 1 (wait for onVehicleGroupSpawned) → 2 (enable traffic).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/stepHandler.lua:188
---@param step table Traffic step.
function util_stepHandler.taskSpawnTrafficStep(step) end

