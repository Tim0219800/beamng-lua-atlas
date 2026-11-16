# `gameplay_drag_phaseHandlers`

*File: `lua/ge/extensions/gameplay/drag/phaseHandlers.lua` · VM: Game Engine (GE) · 1232 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_phaseHandlers`: `extensions.load("gameplay_drag_phaseHandlers")`, then the global `gameplay_drag_phaseHandlers`

Phase logic of a drag race: stage (placement on the stage line), countdown (starting tree), race (race up to the last distance timer), stop (vehicle stopping) and emergencyStop. It updates the racers' position/speed/wheels (updateRacer), detects pre-stage and stage by front wheel distance, applies the disqualification rules (false start, out of lane, stationary too long, crash), drives the AI vehicles through queueLuaCommand (ai.setSpeed, transbrake, nitro, throttleOverride), handles phase transitions and re-staging after DQ in freeroam. The phase functions are called by the dragTypes_* extensions (headsUpRace/bracketRace) every frame for each racer.

## Notes

- Constants: stop when speed <= 15 m/s or after 300 m of stop phase; pre-stage at -0.178 m, stage at 0 m (window of ±0.178 m); leaving the lights beyond 0.4 m; stage validated after 1 s continuous with front wheels parallel to the line (|dot| >= 0.70).
- Disqualifications: false start (front wheel < -0.178 - 0.02 or >= 0.178 m during the countdown, reason redLightReason), out of lane (distance < -0.33 m or inLane false), stationary > 5 s (speed < 1 m/s), crash (z of the up vector < 0.2) or stationary (less than 3 m in 3 s) during the race. Never a DQ in phase 1 (stage).
- The DQ reason strings are translation keys missions.dragRace.gameplay.disqualified.*.
- The AIs brake then crawl (0.5 m/s) over the last 0.5 meters before the stage line; their throttle is reduced (min 0.5) if the nose pitches up beyond ~17 to 33 degrees.
- The race phase ends when the timer at the greatest distance (raceEndTimerId) is set, not the important timer.
- Emitted hooks: onPhaseTransition (abortable via setPhaseTransitionAbort), onRacerPhaseTransition, preStageLightOn/Off, stageLightOn/Off, stageStarted, startDragCountdown, dragRaceStarted, dragRaceEndLineReached, stoppingVehicleDrag, dragRaceVehicleStopped, setDisqualifiedLights, onWinnerLightOn.
- In MP, remote racers (isLocalRacer == false or vehId < 0) have no position data and are exempt from the lane test; their staging is held for 1 s via setRemoteStagingState.
- The AI commands are sent as text to the vehicle VM, with the name of the level's waypoints (endLine, drag_stop or autoStopName).

**Dependencies (loaded first):** `gameplay_drag_core`, `gameplay_drag_times`, `gameplay_drag_saveSystem`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_phaseHandlers.areAllRacersStaged(dragData)` | Indicates whether all racers are in staging (phase 1 done, in their lane, or already finished) and whether their number reaches the expected minimum (core.getExpectedStagingRacerCount). | 433 |
| `gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer)` | Computes, for each wheel group of the racer, the vector wheel center minus the position of the stage point of its lane (racer._wheelDistances). | 58 |
| `gameplay_drag_phaseHandlers.changeAllPhases()` | Moves to the next phase all racers whose current phase is completed. | 381 |
| `gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase)` | Advances a racer by one phase (or marks it finished after the last one). Refuses if a transition is already in progress, if the expected phase differs, if the racer is out of lane to enter phase 2 or 3, or if an onPhaseTransition hook calls setPhaseTransitionAbort. Emits onPhaseTransition (before) and onRacerPhaseTransition (after, newPhase nil and name 'finished' if finished). | 313 |
| `gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim)` | In solo/multiseat freeroam (outside the MP drag gamemode), handles re-staging after DQ: 6 s after the DQ, if the player is more than 6 m behind the line, restarts the race (reset then startDragRaceActivity); between -6 and +6 m, shows the message ui.drag.flash.reverseToRestage once. Returns 'leftArea' if the only racer backs up more than 15 m. | 637 |
| `gameplay_drag_phaseHandlers.clearDqRestageState()` | Empties the re-staging state after DQ. | 629 |
| `gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId)` | Removes the transition lock (and the abort flag) of a racer, or of all if vehId is nil. | 299 |
| `gameplay_drag_phaseHandlers.clearRemoteStagingHoldTimers()` | Empties the remote staging hold timers (MP). | 625 |
| `gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim)` | Phase 2 (tree) for a racer. Starts the countdown (emits startDragCountdown with the dial), prepares the AI (aggressiveness 2, two-step, transbrake or freeze, throttleOverride = 1), and disqualifies for a false start or leaving the lane (sets reactionTimeInvalid and calls startRaceFromTree before disqualifyRacer). *(internal)* | 715 |
| `gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason)` | Disqualifies a racer (never in phase 1, nor outside freeroam while the race is not started). For an AI, resets throttleOverride to nil. Emits setDisqualifiedLights. | 236 |
| `gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim)` | Emergency stop phase: for an AI, cuts nitro/jato and throttleOverride, forces ai.setSpeed(0); the phase is completed when speed <= 0.01 m/s. *(internal)* | 1052 |
| `gameplay_drag_phaseHandlers.generateWinData()` | Asks the race type extension (ext.generateWinData) for the sorted list of results and emits onWinnerLightOn for the first one's lane. | 280 |
| `gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer)` | Signed distance (m) of the front wheels to the stage line, projected onto the lane's stage-to-finish axis (negative before the line). | 50 |
| `gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data)` | Value of the important timer for the ranking (delegates to gameplay_drag_times). | 174 |
| `gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer)` | True if all the racer's wheels (centers per group, otherwise the vehicle position) are in its lane's zone and, if there are several racers, not in the zone of another occupied lane. | 93 |
| `gameplay_drag_phaseHandlers.onDragClear()` | Clear hook: empties the remote staging timers and the re-staging state. *(internal)* *(hook)* | 1227 |
| `gameplay_drag_phaseHandlers.onExtensionLoaded()` | Load hook: logs an error if gameplay_drag_core is absent. *(internal)* *(hook)* | 43 |
| `gameplay_drag_phaseHandlers.race(phase, racer, dtSim)` | Phase 3 (race). Launches the AI (jato, transbrake released, throttleOverride = 1, speed and target of the endLine), detects crash/stationary/out of lane, regulates the AIs' pitch-up, and ends when the race end timer is set: emits dragRaceEndLineReached, in MP sends the raw time to the host, otherwise generates the results and the slip when all have finished. *(internal)* | 838 |
| `gameplay_drag_phaseHandlers.setDialsData(data)` | Computes the start delays (dialsData) per vehicle: 1 racer = 0; 2 racers = the dial gap is added to the racer with the lowest dial; more than 2 = each one's dial. | 1178 |
| `gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId)` | To be called from an onPhaseTransition hook to cancel a racer's transition in progress. | 309 |
| `gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged)` | MP: applies the staging state of a lane received from the network. With staged = true, starts a timer (1 s hold before validating phase 1); with false, cancels and reopens phase 1 of the lane's racers. | 592 |
| `gameplay_drag_phaseHandlers.stage(phase, racer, dtSim)` | Phase 1 (staging). Updates the wheel geometry, sends the distance to the UI (updateStageApp) for the local player, validates the phase after 1 s on the line (player) or drives the AI to the line (approach, braking, crawling) then stops it. *(internal)* | 471 |
| `gameplay_drag_phaseHandlers.startRaceFromTree(vehId)` | Ends a racer's countdown phase ('countdown' phase), starts its timers if local and, for an AI, draws a random delay of 0 to 0.5 s before its start. | 393 |
| `gameplay_drag_phaseHandlers.stop(phase, racer, dtSim)` | Stop phase after the finish: for an AI, cuts nitro/jato and orders it to stop toward the stop target. Completed when speed <= 15 m/s or 300 m traveled; emits stoppingVehicleDrag and dragRaceVehicleStopped. *(internal)* | 992 |
| `gameplay_drag_phaseHandlers.updateRacer(racer)` | Updates a racer's data from the vehicle: position, direction, speed, wheel centers, distances to the stage, inLane, pre-stage/stage states (emits the light hooks) and currentDistanceFromOrigin. | 1099 |
| `gameplay_drag_phaseHandlers.updateRemoteStagingHoldTimers()` | Validates phase 1 of the racers of a lane whose remote staging has been held for at least 1 s. Called by core.onUpdate. *(internal)* | 608 |

### Parameter details

#### `gameplay_drag_phaseHandlers.areAllRacersStaged(dragData)`

Indicates whether all racers are in staging (phase 1 done, in their lane, or already finished) and whether their number reaches the expected minimum (core.getExpectedStagingRacerCount).

- `dragData` (*table|nil*) : Race data; default core.getData().
- **returns**: boolean true if all in staging.
- **returns**: integer Number of racers in staging.
- **returns**: integer Total number of racers.

#### `gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer)`

Computes, for each wheel group of the racer, the vector wheel center minus the position of the stage point of its lane (racer._wheelDistances).

- `racer` (*table*) : Racer.

#### `gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase)`

Advances a racer by one phase (or marks it finished after the last one). Refuses if a transition is already in progress, if the expected phase differs, if the racer is out of lane to enter phase 2 or 3, or if an onPhaseTransition hook calls setPhaseTransitionAbort. Emits onPhaseTransition (before) and onRacerPhaseTransition (after, newPhase nil and name 'finished' if finished).

- `racer` (*table*) : Racer.
- `expectedCurrentPhase` (*integer|nil*) : Expected phase (validation).
- **returns**: boolean true if done or not applicable (racer removed, finished), false if refused.

#### `gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim)`

In solo/multiseat freeroam (outside the MP drag gamemode), handles re-staging after DQ: 6 s after the DQ, if the player is more than 6 m behind the line, restarts the race (reset then startDragRaceActivity); between -6 and +6 m, shows the message ui.drag.flash.reverseToRestage once. Returns 'leftArea' if the only racer backs up more than 15 m.

- `dtSim` (*number*) : Simulated time delta (s).
- **returns**: string|nil 'leftArea' or nil.

#### `gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId)`

Removes the transition lock (and the abort flag) of a racer, or of all if vehId is nil.

- `vehId` (*integer|nil*) : Vehicle ID; nil = all.

#### `gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim)`

Phase 2 (tree) for a racer. Starts the countdown (emits startDragCountdown with the dial), prepares the AI (aggressiveness 2, two-step, transbrake or freeze, throttleOverride = 1), and disqualifies for a false start or leaving the lane (sets reactionTimeInvalid and calls startRaceFromTree before disqualifyRacer).

- `phase` (*table*) : Racer's current phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason)`

Disqualifies a racer (never in phase 1, nor outside freeroam while the race is not started). For an AI, resets throttleOverride to nil. Emits setDisqualifiedLights.

- `racer` (*table*) : Racer.
- `reason` (*string*) : Translation key of the reason.

#### `gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim)`

Emergency stop phase: for an AI, cuts nitro/jato and throttleOverride, forces ai.setSpeed(0); the phase is completed when speed <= 0.01 m/s.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_drag_phaseHandlers.generateWinData()`

Asks the race type extension (ext.generateWinData) for the sorted list of results and emits onWinnerLightOn for the first one's lane.

- **returns**: table[] List of results (empty if no data).

#### `gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer)`

Signed distance (m) of the front wheels to the stage line, projected onto the lane's stage-to-finish axis (negative before the line).

- `racer` (*table*) : Racer.
- **returns**: number|nil Distance or nil if the wheel data is missing.

#### `gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data)`

Value of the important timer for the ranking (delegates to gameplay_drag_times).

- `racer` (*table*) : Racer.
- `data` (*table*) : Race data.
- **returns**: number Value, 0 if unavailable.

#### `gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer)`

True if all the racer's wheels (centers per group, otherwise the vehicle position) are in its lane's zone and, if there are several racers, not in the zone of another occupied lane.

- `racer` (*table*) : Racer.
- **returns**: boolean true if in the lane.

#### `gameplay_drag_phaseHandlers.race(phase, racer, dtSim)`

Phase 3 (race). Launches the AI (jato, transbrake released, throttleOverride = 1, speed and target of the endLine), detects crash/stationary/out of lane, regulates the AIs' pitch-up, and ends when the race end timer is set: emits dragRaceEndLineReached, in MP sends the raw time to the host, otherwise generates the results and the slip when all have finished.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_drag_phaseHandlers.setDialsData(data)`

Computes the start delays (dialsData) per vehicle: 1 racer = 0; 2 racers = the dial gap is added to the racer with the lowest dial; more than 2 = each one's dial.

- `data` (*table[]*) : List of entries {vehId, dial}.

#### `gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId)`

To be called from an onPhaseTransition hook to cancel a racer's transition in progress.

- `vehId` (*integer*) : Vehicle ID.

#### `gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged)`

MP: applies the staging state of a lane received from the network. With staged = true, starts a timer (1 s hold before validating phase 1); with false, cancels and reopens phase 1 of the lane's racers.

- `data` (*table*) : dragData.
- `lane` (*integer*) : Lane.
- `staged` (*boolean*) : Staging active or not.

#### `gameplay_drag_phaseHandlers.stage(phase, racer, dtSim)`

Phase 1 (staging). Updates the wheel geometry, sends the distance to the UI (updateStageApp) for the local player, validates the phase after 1 s on the line (player) or drives the AI to the line (approach, braking, crawling) then stops it.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_drag_phaseHandlers.startRaceFromTree(vehId)`

Ends a racer's countdown phase ('countdown' phase), starts its timers if local and, for an AI, draws a random delay of 0 to 0.5 s before its start.

- `vehId` (*integer*) : Vehicle ID.

#### `gameplay_drag_phaseHandlers.stop(phase, racer, dtSim)`

Stop phase after the finish: for an AI, cuts nitro/jato and orders it to stop toward the stop target. Completed when speed <= 15 m/s or 300 m traveled; emits stoppingVehicleDrag and dragRaceVehicleStopped.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_drag_phaseHandlers.updateRacer(racer)`

Updates a racer's data from the vehicle: position, direction, speed, wheel centers, distances to the stage, inLane, pre-stage/stage states (emits the light hooks) and currentDistanceFromOrigin.

- `racer` (*table*) : Racer.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_times, gameplay_drag_saveSystem. |
| `redLightReason` | string | DQ reason key for the false start: 'missions.dragRace.gameplay.disqualified.jumping'. display.setDisqualifiedLights uses it to turn on the red light. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `dragRaceEndLineReached`
- `dragRaceStarted`
- `dragRaceVehicleStopped`
- `onPhaseTransition`
- `onRacerPhaseTransition` — listened to by 2 module(s)
- `onWinnerLightOn` — listened to by 1 module(s)
- `setDisqualifiedLights`
- `stageStarted`
- `startDragCountdown`
- `stoppingVehicleDrag`

**UI events (guihooks.trigger):** `DragRaceTreeFlashMessage`, `ScenarioFlashMessage`, `updateStageApp`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/phaseHandlers.lua`.*
