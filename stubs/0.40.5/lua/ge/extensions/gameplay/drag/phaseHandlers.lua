---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/phaseHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Phase logic of a drag race: stage (placement on the stage line), countdown (starting tree), race (race up to the last distance timer), stop (vehicle stopping) and emergencyStop. It updates the racers' position/speed/wheels (updateRacer), detects pre-stage and stage by front wheel distance, applies the disqualification rules (false start, out of lane, stationary too long, crash), drives the AI vehicles through queueLuaCommand (ai.setSpeed, transbrake, nitro, throttleOverride), handles phase transitions and re-staging after DQ in freeroam. The phase functions are called by the dragTypes_* extensions (headsUpRace/bracketRace) every frame for each racer.
--- Access: extension `gameplay_drag_phaseHandlers`: `extensions.load("gameplay_drag_phaseHandlers")`, then the global `gameplay_drag_phaseHandlers`
---@class gameplay_drag_phaseHandlers
---@field dependencies string[] gameplay_drag_core, gameplay_drag_times, gameplay_drag_saveSystem.
---@field redLightReason string DQ reason key for the false start: 'missions.dragRace.gameplay.disqualified.jumping'. display.setDisqualifiedLights uses it to turn on the red light.
gameplay_drag_phaseHandlers = {}

--- Indicates whether all racers are in staging (phase 1 done, in their lane, or already finished) and whether their number reaches the expected minimum (core.getExpectedStagingRacerCount).
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:433
---@param dragData table|nil Race data; default core.getData().
---@return boolean  true if all in staging.
---@return integer  Number of racers in staging.
---@return integer  Total number of racers.
function gameplay_drag_phaseHandlers.areAllRacersStaged(dragData) end

--- Computes, for each wheel group of the racer, the vector wheel center minus the position of the stage point of its lane (racer._wheelDistances).
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:58
---@param racer table Racer.
function gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer) end

--- Moves to the next phase all racers whose current phase is completed.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:381
function gameplay_drag_phaseHandlers.changeAllPhases() end

--- Advances a racer by one phase (or marks it finished after the last one). Refuses if a transition is already in progress, if the expected phase differs, if the racer is out of lane to enter phase 2 or 3, or if an onPhaseTransition hook calls setPhaseTransitionAbort. Emits onPhaseTransition (before) and onRacerPhaseTransition (after, newPhase nil and name 'finished' if finished).
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:313
---@param racer table Racer.
---@param expectedCurrentPhase integer|nil Expected phase (validation).
---@return boolean  true if done or not applicable (racer removed, finished), false if refused.
function gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase) end

--- In solo/multiseat freeroam (outside the MP drag gamemode), handles re-staging after DQ: 6 s after the DQ, if the player is more than 6 m behind the line, restarts the race (reset then startDragRaceActivity); between -6 and +6 m, shows the message ui.drag.flash.reverseToRestage once. Returns 'leftArea' if the only racer backs up more than 15 m.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:637
---@param dtSim number Simulated time delta (s).
---@return string|nil  'leftArea' or nil.
function gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim) end

--- Empties the re-staging state after DQ.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:629
function gameplay_drag_phaseHandlers.clearDqRestageState() end

--- Removes the transition lock (and the abort flag) of a racer, or of all if vehId is nil.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:299
---@param vehId integer|nil Vehicle ID; nil = all.
function gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId) end

--- Empties the remote staging hold timers (MP).
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:625
function gameplay_drag_phaseHandlers.clearRemoteStagingHoldTimers() end

--- Phase 2 (tree) for a racer. Starts the countdown (emits startDragCountdown with the dial), prepares the AI (aggressiveness 2, two-step, transbrake or freeze, throttleOverride = 1), and disqualifies for a false start or leaving the lane (sets reactionTimeInvalid and calls startRaceFromTree before disqualifyRacer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:715
---@param phase table Racer's current phase.
---@param racer table Racer.
---@param dtSim number Simulated time delta (s).
function gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim) end

--- Disqualifies a racer (never in phase 1, nor outside freeroam while the race is not started). For an AI, resets throttleOverride to nil. Emits setDisqualifiedLights.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:236
---@param racer table Racer.
---@param reason string Translation key of the reason.
function gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason) end

--- Emergency stop phase: for an AI, cuts nitro/jato and throttleOverride, forces ai.setSpeed(0); the phase is completed when speed <= 0.01 m/s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1052
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Simulated time delta (s).
function gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim) end

--- Asks the race type extension (ext.generateWinData) for the sorted list of results and emits onWinnerLightOn for the first one's lane.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:280
---@return table[]  List of results (empty if no data).
function gameplay_drag_phaseHandlers.generateWinData() end

--- Signed distance (m) of the front wheels to the stage line, projected onto the lane's stage-to-finish axis (negative before the line).
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:50
---@param racer table Racer.
---@return number|nil  Distance or nil if the wheel data is missing.
function gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer) end

--- Value of the important timer for the ranking (delegates to gameplay_drag_times).
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:174
---@param racer table Racer.
---@param data table Race data.
---@return number  Value, 0 if unavailable.
function gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data) end

--- True if all the racer's wheels (centers per group, otherwise the vehicle position) are in its lane's zone and, if there are several racers, not in the zone of another occupied lane.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:93
---@param racer table Racer.
---@return boolean  true if in the lane.
function gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer) end

--- Clear hook: empties the remote staging timers and the re-staging state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1227
function gameplay_drag_phaseHandlers.onDragClear() end

--- Load hook: logs an error if gameplay_drag_core is absent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:43
function gameplay_drag_phaseHandlers.onExtensionLoaded() end

--- Phase 3 (race). Launches the AI (jato, transbrake released, throttleOverride = 1, speed and target of the endLine), detects crash/stationary/out of lane, regulates the AIs' pitch-up, and ends when the race end timer is set: emits dragRaceEndLineReached, in MP sends the raw time to the host, otherwise generates the results and the slip when all have finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:838
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Simulated time delta (s).
function gameplay_drag_phaseHandlers.race(phase, racer, dtSim) end

--- Computes the start delays (dialsData) per vehicle: 1 racer = 0; 2 racers = the dial gap is added to the racer with the lowest dial; more than 2 = each one's dial.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1178
---@param data table[] List of entries {vehId, dial}.
function gameplay_drag_phaseHandlers.setDialsData(data) end

--- To be called from an onPhaseTransition hook to cancel a racer's transition in progress.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:309
---@param vehId integer Vehicle ID.
function gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId) end

--- MP: applies the staging state of a lane received from the network. With staged = true, starts a timer (1 s hold before validating phase 1); with false, cancels and reopens phase 1 of the lane's racers.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:592
---@param data table dragData.
---@param lane integer Lane.
---@param staged boolean Staging active or not.
function gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged) end

--- Phase 1 (staging). Updates the wheel geometry, sends the distance to the UI (updateStageApp) for the local player, validates the phase after 1 s on the line (player) or drives the AI to the line (approach, braking, crawling) then stops it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:471
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Simulated time delta (s).
function gameplay_drag_phaseHandlers.stage(phase, racer, dtSim) end

--- Ends a racer's countdown phase ('countdown' phase), starts its timers if local and, for an AI, draws a random delay of 0 to 0.5 s before its start.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:393
---@param vehId integer Vehicle ID.
function gameplay_drag_phaseHandlers.startRaceFromTree(vehId) end

--- Stop phase after the finish: for an AI, cuts nitro/jato and orders it to stop toward the stop target. Completed when speed <= 15 m/s or 300 m traveled; emits stoppingVehicleDrag and dragRaceVehicleStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:992
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Simulated time delta (s).
function gameplay_drag_phaseHandlers.stop(phase, racer, dtSim) end

--- Updates a racer's data from the vehicle: position, direction, speed, wheel centers, distances to the stage, inLane, pre-stage/stage states (emits the light hooks) and currentDistanceFromOrigin.
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1099
---@param racer table Racer.
function gameplay_drag_phaseHandlers.updateRacer(racer) end

--- Validates phase 1 of the racers of a lane whose remote staging has been held for at least 1 s. Called by core.onUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/phaseHandlers.lua:608
function gameplay_drag_phaseHandlers.updateRemoteStagingHoldTimers() end

