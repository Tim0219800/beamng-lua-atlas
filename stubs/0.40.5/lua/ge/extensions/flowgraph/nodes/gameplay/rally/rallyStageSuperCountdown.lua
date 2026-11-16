---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C
local flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C = {}

--- Loads the rally loop bridge, resets the countdown and the start position cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:114
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:_executionStarted() end

--- Resets the countdown.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:124
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:_executionStopped() end

--- Computes the clock and the launch time of an immediate countdown (StagedCountdownUtils.calculateImmediateMinuteCountdown).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:279
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:calculateScheduledEventTime() end

--- Loads duration, number of announcements and visual/sound/voice options from StagedCountdownUtils.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:270
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:configureCountdownSettings() end

--- Draws the plane, the vehicle-plane line and the vehicle point if debug is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:260
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:drawDebugVisualization() end

--- Progress bar and state in the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:572
---@param builder table Node constructor.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:drawMiddle(builder, style) end

--- Re-enables the pacenote processing of the rally manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:389
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:enableRallyManagerPacenoteProcessing() end

--- Queues a random system pacenote in the rally manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:379
---@param pacenoteName string Name (countdown3, countdowngo, falseStart...).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:enqueueSystemPacenote(pacenoteName) end

--- Ends the countdown: "Go!", sound, unfreeze, pacenotes, state launched, flow = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:415
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:finishCountdown() end

--- Computes the countdown phase (time remaining, integer value, announced value, progress).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:292
---@param showingGo boolean True while "Go!" is displayed.
---@return table  {timeUntilLaunch, countdownValue, announcedCountdown, countdownElapsed, progress}.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getCountdownPhase(showingGo) end

--- Builds the rally clock data for the UI.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:331
---@return table  Clock data.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getRallyClockData() end

--- Time remaining before launch.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:288
---@return number  Seconds (>= 0).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getTimeUntilLaunch() end

--- Simulated wall clock time (seconds) via StagedCountdownUtils.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:327
---@return number  Seconds.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getWallClockTime() end

--- Intended to detect a false start; always returns false.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:249
---@return boolean  Always false.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:hasCrossedStartLine() end

--- Initializes all state variables and data options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:67
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:init(mgr, ...) end

--- Stops the timer and sets all outputs to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:128
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:reset() end

--- Broadcasts the proximity and countdown state via the onRallyDataUpdated hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:530
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:sendRallyDataUpdate() end

--- Returns data.drawDebug.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:256
---@return boolean  Draw the debug.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldDrawDebug() end

--- Returns the sound effects setting.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:375
---@return boolean|nil  Sounds.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldPlaySoundEffects() end

--- Returns the voice countdown setting.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:371
---@return boolean|nil  Voice.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldPlayVoiceCountdown() end

--- Returns the visual countdown display setting.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:367
---@return boolean|nil  Display.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldShowVisualCountdown() end

--- Displays a flash message (ScenarioFlashMessage) and optionally a UI Message.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:399
---@param msg string Text.
---@param big boolean Large format.
---@param duration number|nil Duration in s.
---@param luaCall string|nil Lua code executed by the UI (sound).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:show(msg, big, duration, luaCall) end

--- Starts the countdown: settings, launch time computation, state countdown_running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:352
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:startTimer() end

--- Resets state, timers, rally clock and flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:137
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:stopTimer() end

--- Declares a false start (log, pacenote, state false_start, flow = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:442
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:triggerFalseStart() end

--- Unfreezes the vehicle (setFreeze false) via core_vehicleBridge.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:335
---@return boolean  True if a vehicle was unfrozen.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:unfreezeVehicle() end

--- Advances the countdown clock by dtSim while it is running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:319
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateClock() end

--- Countdown state machine: 3-2-1 announcements and end.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:459
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateCountdown() end

--- Counts down the display of "Go!" then switches to the finished state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:519
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateGoDisplay() end

--- Computes signed distance, lateral distance, proximity, stop, "staged" and display distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:204
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateProximityState() end

--- Looks for the named start position in pathData (with cache) and stores pos/rot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:156
---@return boolean  True if the position is valid.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateStartPosition() end

--- Updates the front position and speed of the tracked vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:184
---@return boolean  True if valid.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateVehicleData() end

--- Every frame: handles reset, start position, vehicle, start, countdown, UI and outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:579
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:work(args) end

