---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/scenarioManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orchestrator of the "crashTest" mission (collision analysis). processData turns the mission definition into steps (player vehicle and targets found by dynamic field, static zones, destinations) then loads the secondary extensions (TaskList, Scoring, Boundaries, Countdown, DamageChecker, freeroam_crashCamMode). For each step: fade, placement in the vehicle, 3 s countdown, unfreezing of the player, crash tracking via gameplay_util_crashDetection, then success or failure depending on the objective ('Simple crash' or 'Crash target vehicle into target area'). It displays markers, target distance/speed and the timer, computes the scores and emits hooks to the UI.
--- Access: extension `gameplay_crashTest_scenarioManager`: `extensions.load("gameplay_crashTest_scenarioManager")`, then the global `gameplay_crashTest_scenarioManager`
---@class gameplay_crashTest_scenarioManager
---@field dependencies table<integer, string> Extensions loaded before: {'ui_apps_genericMissionData', 'ui_apps_pointsBar'}.
gameplay_crashTest_scenarioManager = {}

--- Reactivates all the steps' vehicles (useful before a reset when the other steps' vehicles were deactivated). No effect if the deactivateVehiclesFromOtherSteps option is false.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:753
function gameplay_crashTest_scenarioManager.activatesAllVehForReset() end

--- Removes the target markers (race_marker).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:572
function gameplay_crashTest_scenarioManager.clearMarkers() end

--- Returns the scenario's global state.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:769
---@return table  {scoreData, accepted, endScreenText, scenarioFinished, targetCrashInfo?}.
function gameplay_crashTest_scenarioManager.getCrashTestData() end

--- Goes to the next step (fade, placing the player in their vehicle, onCrashTestShowStepDetails hook). Called by the UI.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:757
function gameplay_crashTest_scenarioManager.goToNextStepFromUI() end

--- Hook called when a mission's state changes: unloads this extension if a crashTest mission is stopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:737
---@param status string Mission state (e.g. 'stopped').
---@param mission table Mission concerned (missionType).
function gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission) end

--- Hook called at the end of the crash camera: puts the 'external' camera back.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:765
function gameplay_crashTest_scenarioManager.onCrashCamEnded() end

--- Hook called on unload: clears the markers, unloads the secondary extensions (restores the crash camera settings) and puts the 'orbit' camera back.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:743
---@param extension string Name of the unloaded extension (unused).
function gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension) end

--- Hook called by crashTestBoundaries when the player leaves the zone: step failure ("Player exited the control area").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:749
function gameplay_crashTest_scenarioManager.onPlayerOutOfBounds() end

--- Hook called before rendering: renders the target markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:566
---@param dt number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim) end

--- Hook called every frame: while the scenario is not finished, draws the markers and zones, and, once launched, checks the AI stop, displays the targets' distance/speed, counts down the time and updates the UI timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:621
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim) end

--- Hook called by the crash detection when a crash ends: stores the end data then evaluates whether the step succeeded or failed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:728
---@param crashEndData table Crash end data (vehId, sanitizedData with touchedVehIds and initialImpactPos, impacts, jbeamsInvolved).
function gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData) end

--- Hook called by the crash detection when a tracked vehicle starts a crash: records the start data and the step's elapsed time; freezes the player for a 'Simple crash'; if it is a target, clears the markers and stops its ScriptAi.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:701
---@param crashStartData table Crash start data (vehId, vehImpactSpeed...).
function gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData) end

--- Initializes the scenario: resets the state, loads the secondary extensions, converts each step of the definition into cleaned data (vehicle ids, vec3 for positions and scales, objectives, damage, durations), initializes the UI task list and freezes the player vehicles.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:203
---@param crashTestData table<integer, table> Raw mission steps (crashTestVehName, jbeamTargetName, objective, impactSpeed, maxTime, staticCrashTransformPos, etc.).
---@param deactivateVehiclesFromOtherSteps_ boolean If true, only the current step's vehicles are active (setActive) and screen fades are played between steps.
function gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_) end

--- Resets the scenario: data, vehicles reactivated for the first step, scores and task list cleared, AIs stopped, player vehicles frozen.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:318
function gameplay_crashTest_scenarioManager.reset() end

--- Enables or disables the module's debug flag.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:792
---@param _debug boolean New value.
function gameplay_crashTest_scenarioManager.setDebug(_debug) end

--- Starts the scenario: resets the points to 0, goes to the first step (with fade), clears the markers and marks the scenario as launched.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:466
function gameplay_crashTest_scenarioManager.startScenario() end

--- Starts the 3 s countdown of the current step; when it ends, the targets' AI starts, the player is unfrozen and crash tracking begins. Called by the UI.
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:761
function gameplay_crashTest_scenarioManager.startStepFromUI() end

--- Adds to gameplay_util_crashDetection (group 'crashAnalysis') all the player and target vehicles of all steps, if they are not already tracked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:342
function gameplay_crashTest_scenarioManager.trackVehiclesForCrash() end

