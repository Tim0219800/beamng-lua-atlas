# `gameplay_crashTest_scenarioManager`

*File: `lua/ge/extensions/gameplay/crashTest/scenarioManager.lua` · VM: Game Engine (GE) · 799 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crashTest_scenarioManager`: `extensions.load("gameplay_crashTest_scenarioManager")`, then the global `gameplay_crashTest_scenarioManager`

Orchestrator of the "crashTest" mission (collision analysis). processData turns the mission definition into steps (player vehicle and targets found by dynamic field, static zones, destinations) then loads the secondary extensions (TaskList, Scoring, Boundaries, Countdown, DamageChecker, freeroam_crashCamMode). For each step: fade, placement in the vehicle, 3 s countdown, unfreezing of the player, crash tracking via gameplay_util_crashDetection, then success or failure depending on the objective ('Simple crash' or 'Crash target vehicle into target area'). It displays markers, target distance/speed and the timer, computes the scores and emits hooks to the UI.

## Notes

- Vehicles are found by a dynamic field whose name matches crashTestVehName / jbeamTargetName (findObjectsWithDynField, search via string.find).
- The player vehicles are frozen (setFreeze) until the countdown is over; the player is also frozen after a 'Simple crash' or at the end of a step.
- Target types: 'A single Jbeam', 'Multiple Jbeams', 'Static object'. aiType: 'ScriptAi' (mission file scriptAi<id>.track.json, replayed in 'firstOnlyTeleport') or 'Stuck Throttle' (electrics.values.throttleOverride = throttleValue/100).
- Failure causes: time elapsed, player out of the zone, target damaged without the player, non-target vehicle damaged, target arrived without damage (ScriptAi), crash outside the zone, not all targets touched.
- Crash detected with: verticallyUnweighted, minAccel 0, maxAccel 40, minDamage 150, maxDamage 40000, enableImpactLocationData.
- Probable inconsistency: in delayedShowStepScoreJob, nextStepId is currentStepIndex + 1, then +1 more if it is not the last step (so currentStepIndex + 2); the exact intent on the UI side is not visible in this file.
- In the 'Crash target vehicle into target area' branch of checkStepFinishedAfterEndOfCrash, the last part of the code is empty.
- isDebug, boolTrace, traceData, endScreenDataDebug and blackI are declared but little or not used; setDebug only changes isDebug.
- Emitted hooks: onCrashTestShowStepDetails({currStepIndex, stepInstructions}), onCrashTestShowEndStepDetails({nextStep, isLastStep, currentStepScoreData}), onCrashScenarioFailed(crashTestData).
- The extension unloads itself when a crashTest-type mission goes to the 'stopped' state.

**Dependencies (loaded first):** `ui_apps_genericMissionData`, `ui_apps_pointsBar`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crashTest_scenarioManager.activatesAllVehForReset()` | Reactivates all the steps' vehicles (useful before a reset when the other steps' vehicles were deactivated). No effect if the deactivateVehiclesFromOtherSteps option is false. | 753 |
| `gameplay_crashTest_scenarioManager.clearMarkers()` | Removes the target markers (race_marker). *(internal)* | 572 |
| `gameplay_crashTest_scenarioManager.getCrashTestData()` | Returns the scenario's global state. | 769 |
| `gameplay_crashTest_scenarioManager.goToNextStepFromUI()` | Goes to the next step (fade, placing the player in their vehicle, onCrashTestShowStepDetails hook). Called by the UI. | 757 |
| `gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission)` | Hook called when a mission's state changes: unloads this extension if a crashTest mission is stopped. *(internal)* *(hook)* | 737 |
| `gameplay_crashTest_scenarioManager.onCrashCamEnded()` | Hook called at the end of the crash camera: puts the 'external' camera back. *(internal)* *(hook)* | 765 |
| `gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension)` | Hook called on unload: clears the markers, unloads the secondary extensions (restores the crash camera settings) and puts the 'orbit' camera back. *(internal)* *(hook)* | 743 |
| `gameplay_crashTest_scenarioManager.onPlayerOutOfBounds()` | Hook called by crashTestBoundaries when the player leaves the zone: step failure ("Player exited the control area"). *(internal)* *(hook)* | 749 |
| `gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim)` | Hook called before rendering: renders the target markers. *(internal)* *(hook)* | 566 |
| `gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim)` | Hook called every frame: while the scenario is not finished, draws the markers and zones, and, once launched, checks the AI stop, displays the targets' distance/speed, counts down the time and updates the UI timer. *(internal)* *(hook)* | 621 |
| `gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData)` | Hook called by the crash detection when a crash ends: stores the end data then evaluates whether the step succeeded or failed. *(internal)* *(hook)* | 728 |
| `gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData)` | Hook called by the crash detection when a tracked vehicle starts a crash: records the start data and the step's elapsed time; freezes the player for a 'Simple crash'; if it is a target, clears the markers and stops its ScriptAi. *(internal)* *(hook)* | 701 |
| `gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_)` | Initializes the scenario: resets the state, loads the secondary extensions, converts each step of the definition into cleaned data (vehicle ids, vec3 for positions and scales, objectives, damage, durations), initializes the UI task list and freezes the player vehicles. | 203 |
| `gameplay_crashTest_scenarioManager.reset()` | Resets the scenario: data, vehicles reactivated for the first step, scores and task list cleared, AIs stopped, player vehicles frozen. | 318 |
| `gameplay_crashTest_scenarioManager.setDebug(_debug)` | Enables or disables the module's debug flag. | 792 |
| `gameplay_crashTest_scenarioManager.startScenario()` | Starts the scenario: resets the points to 0, goes to the first step (with fade), clears the markers and marks the scenario as launched. | 466 |
| `gameplay_crashTest_scenarioManager.startStepFromUI()` | Starts the 3 s countdown of the current step; when it ends, the targets' AI starts, the player is unfrozen and crash tracking begins. Called by the UI. | 761 |
| `gameplay_crashTest_scenarioManager.trackVehiclesForCrash()` | Adds to gameplay_util_crashDetection (group 'crashAnalysis') all the player and target vehicles of all steps, if they are not already tracked. *(internal)* | 342 |

### Parameter details

#### `gameplay_crashTest_scenarioManager.getCrashTestData()`

Returns the scenario's global state.

- **returns**: table {scoreData, accepted, endScreenText, scenarioFinished, targetCrashInfo?}.

#### `gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission)`

Hook called when a mission's state changes: unloads this extension if a crashTest mission is stopped.

- `status` (*string*) : Mission state (e.g. 'stopped').
- `mission` (*table*) : Mission concerned (missionType).

#### `gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension)`

Hook called on unload: clears the markers, unloads the secondary extensions (restores the crash camera settings) and puts the 'orbit' camera back.

- `extension` (*string*) : Name of the unloaded extension (unused).

#### `gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim)`

Hook called before rendering: renders the target markers.

- `dt` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).

#### `gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim)`

Hook called every frame: while the scenario is not finished, draws the markers and zones, and, once launched, checks the AI stop, displays the targets' distance/speed, counts down the time and updates the UI timer.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).

#### `gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData)`

Hook called by the crash detection when a crash ends: stores the end data then evaluates whether the step succeeded or failed.

- `crashEndData` (*table*) : Crash end data (vehId, sanitizedData with touchedVehIds and initialImpactPos, impacts, jbeamsInvolved).

#### `gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData)`

Hook called by the crash detection when a tracked vehicle starts a crash: records the start data and the step's elapsed time; freezes the player for a 'Simple crash'; if it is a target, clears the markers and stops its ScriptAi.

- `crashStartData` (*table*) : Crash start data (vehId, vehImpactSpeed...).

#### `gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_)`

Initializes the scenario: resets the state, loads the secondary extensions, converts each step of the definition into cleaned data (vehicle ids, vec3 for positions and scales, objectives, damage, durations), initializes the UI task list and freezes the player vehicles.

- `crashTestData` (*table<integer, table>*) : Raw mission steps (crashTestVehName, jbeamTargetName, objective, impactSpeed, maxTime, staticCrashTransformPos, etc.).
- `deactivateVehiclesFromOtherSteps_` (*boolean*) : If true, only the current step's vehicles are active (setActive) and screen fades are played between steps.

#### `gameplay_crashTest_scenarioManager.setDebug(_debug)`

Enables or disables the module's debug flag.

- `_debug` (*boolean*) : New value.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: {'ui_apps_genericMissionData', 'ui_apps_pointsBar'}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCrashScenarioFailed`
- `onCrashTestShowEndStepDetails`
- `onCrashTestShowStepDetails`

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

**Loads extensions:** `freeroam_crashCamMode`, `gameplay_crashTest_crashTestBoundaries`, `gameplay_crashTest_crashTestCountdown`, `gameplay_crashTest_crashTestDamageChecker`, `gameplay_crashTest_crashTestScoring`, `gameplay_crashTest_crashTestTaskList`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crashTest/scenarioManager.lua`.*
