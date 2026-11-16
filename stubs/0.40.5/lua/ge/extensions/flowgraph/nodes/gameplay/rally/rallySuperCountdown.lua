---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_rallySuperCountdown_C
local flowgraph_nodes_gameplay_rally_rallySuperCountdown_C = {}

--- Resets the node state when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:145
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:_executionStarted() end

--- Stops the timer and unfreezes the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:169
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:_executionStopped() end

--- Indicates whether skipping the countdown is possible (waiting, vehicle placed with hysteresis, no debounce).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1030
---@return boolean  Skip possible.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:canSkipCountdown() end

--- Placement check: armed if placed, otherwise reschedule or end if no reschedules remain.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:649
---@return boolean  True if placed.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:checkStagingAt10s() end

--- Sets duration (6 s/5 announcements with voice, 3 s/3 without), voice, visual and freeze according to the rallyAudioPacenotes/rallyVisualPacenotes settings and false starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:572
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:configureCountdownSettings() end

--- Draws the start plane and the debug markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:980
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:drawDebugVisualization() end

--- Draws the countdown state in the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:995
---@param builder table Node constructor.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:drawMiddle(builder, style) end

--- Re-enables the pacenote processing of the rally manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:513
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enableRallyManagerPacenoteProcessing() end

--- Queues an audio pause.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:532
---@param secs number Duration in s.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enqueuePauseSecs(secs) end

--- Queues a random system pacenote.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:522
---@param pacenote_name string Pacenote name.
---@param audioLenOffset number|nil Audio duration offset.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enqueueSystemPacenote(pacenote_name, audioLenOffset) end

--- Ends immediately (skipCountdowns): pacenotes, unfreeze, state finished, flow = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:755
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:finishCountdownImmediately() end

--- Freezes the vehicle via StagedCountdownUtils.freezeVehicle (only once).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:217
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:freezeVehicle() end

--- Current rally epoch time (test mode: test clock).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:396
---@return number|nil  Seconds.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getCurrentEpochTime() end

--- Returns the rally loop manager (nil in test mode or if the extension is not loaded).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:385
---@return table|nil  Manager.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getRallyLoopManager() end

--- Scheduled time of the event eventName (cached per event and mission).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:408
---@return number|nil  Epoch seconds.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getScheduledEventTime() end

--- Simulated wall clock time (environment start + epoch, modulo 86400).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:942
---@return number|nil  Seconds.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getWallClockTime() end

--- True if the signed distance is negative (line crossed).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:380
---@return boolean  Line crossed.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:hasCrossedStartLine() end

--- Initializes states, caches, audio flags and data options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:81
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:init(mgr, ...) end

--- True if the state is finished or false_start.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:767
---@return boolean  Flow passed.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isFlowActive() end

--- True if near the plane (stop not required).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:375
---@return boolean  In the zone.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isInLaunchZone() end

--- Cached proximity state.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:365
---@return boolean  Near the plane.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isNearPlane() end

--- True if the countdown is running.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:771
---@return boolean  In progress.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isOngoing() end

--- True if no reschedule has taken place.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:763
---@return boolean  Original schedule.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isOriginalSchedule() end

--- True if near the plane and stopped.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:370
---@return boolean  Staged.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isStaged() end

--- Cached "stopped" state.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:360
---@return boolean  Stopped.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isStopped() end

--- True in the waiting states (staging check, armed, waiting_for_staged).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:775
---@return boolean  Waiting.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isWaiting() end

--- Monitors false start and leaving the zone during the countdown.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:689
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:monitorCountdown() end

--- Player interaction hook: requests a countdown skip if possible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1100
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:onGameplayInteract() end

--- Triggers the 60/30/15/10 s warnings (message and pacenotes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:781
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:processWarnings() end

--- Audio pause of random integer duration between min and max.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:542
---@param min integer Minimum (s).
---@param max integer Maximum (s).
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:randomPauseSecs(min, max) end

--- Requests postponing the start to the next slot; updates rescheduleCount and the warnings.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:441
---@return boolean  True if postponed; false if the maxReschedules limit is reached (maxReschedulesReached flag).
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:requestReschedule() end

--- Stops the timer, unfreezes the vehicle and sets the outputs to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:174
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:reset() end

--- True if data.drawDebug or the loop's stopZones flag is active.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:975
---@return boolean  Draw.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldDrawDebug() end

--- Voice countdown setting.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:505
---@return boolean|nil  Voice.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldPlayVoiceCountdown() end

--- Visual display setting.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:509
---@return boolean|nil  Display.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldShowVisualCountdown() end

--- True if flow is active, the state is waiting_for_staging_check and no start is scheduled yet.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:565
---@return boolean  Start.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldStartTimer() end

--- Displays a message via the Message channel if useMessages is active (the flash message is commented out).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:547
---@param msg string Text.
---@param big boolean Large format.
---@param duration number|nil Duration in s.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:show(msg, big, duration) end

--- Advances the loop clock to 6 s before the start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1070
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:skipToCountdown() end

--- Reads the scheduled time and computes targetStartTime and stagingCheckTime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:606
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:startTimer() end

--- Resets states, scheduling, counters, warnings, flags and audio.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:191
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:stopTimer() end

--- Unfreezes the vehicle if it was frozen by this node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:225
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:unfreezeVehicle() end

--- Main start state machine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:827
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateCountdownStateMachine() end

--- Computes signed distance, stop (with hysteresis), proximity and "staged" state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:307
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateProximityState() end

--- Looks for the named start position in pathData (with cache) and stores the reason on failure.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:256
---@return boolean  True if valid.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateStartPosition() end

--- Recomputes targetStartTime and stagingCheckTime after a reschedule.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:643
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateTimesAfterReschedule() end

--- Updates the front position and speed of the tracked vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:233
---@return boolean  True if valid.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateVehicleData() end

--- Every frame: position, vehicle, proximity, start, state machine, skip, UI update (proximity/countdown hooks) and outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1106
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:work(args) end

