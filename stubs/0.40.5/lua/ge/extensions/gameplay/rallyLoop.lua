---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rallyLoop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Facade extension of the "rally loop" mode (chaining service, liaison, special stages). It owns the RallyLoopManager instance (loop/rallyLoopManager) created by setup(missionId, missionDir), relays the game's updates and hooks to it, and publishes the "rallyLoop" UI stream every frame via guihooks.queueStream. Without a manager, it publishes the StandaloneFallbackStream stream (`standaloneUiBridge` mode); getRuntimeMode returns 'rallyLoop', 'standaloneUiBridge' or 'idle'. It also hosts the "Loop Toolbox" debug imgui window.
--- Access: extension `gameplay_rallyLoop`: `extensions.load("gameplay_rallyLoop")`, then the global `gameplay_rallyLoop`
---@class gameplay_rallyLoop
gameplay_rallyLoop = {}

--- Records a test penalty in the manager (recordTestPenalty).
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:324
---@param amount number Penalty amount (unit inferred from code: time).
---@return boolean|any  Manager result, or false and 'no rally loop manager'.
function gameplay_rallyLoop.addTestPenalty(amount) end

--- Delegates the debug drawing to the manager.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:205
---@param zOnTop boolean Draw in the foreground.
---@param drawRoute boolean Draw the route.
---@param drawLabels boolean Draw the labels.
function gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels) end

--- Debug log state.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:278
---@return boolean  debugLogging.
function gameplay_rallyLoop.getDebugLogging() end

--- Reads a debug drawing flag of the manager.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:374
---@param flagName string Flag name.
---@return boolean  false without a manager.
function gameplay_rallyLoop.getDrawFlag(flagName) end

--- Current LoopToolbox object.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:201
---@return table|nil  Toolbox, nil if the window was never opened or is closed.
function gameplay_rallyLoop.getLoopToolbox() end

--- Current RallyLoopManager instance.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:368
---@return table|nil  Manager.
function gameplay_rallyLoop.getManager() end

--- Reads the execution transfer flag.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:296
---@return boolean  false without a manager.
function gameplay_rallyLoop.getMissionExecutionTransferFlag() end

--- Id of the loop's next mission.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:303
---@return string|nil  Id, nil without a manager.
function gameplay_rallyLoop.getNextMissionId() end

--- Current runtime mode.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:83
---@return string  'rallyLoop', 'standaloneUiBridge' or 'idle'.
function gameplay_rallyLoop.getRuntimeMode() end

--- Number of special stage (SS) reschedules of the manager.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:387
---@return integer  0 without a manager.
function gameplay_rallyLoop.getSSRescheduleCount() end

--- Handles a navigation request from the UI: 'restart' restarts the loop, 'abandon' instantly returns to the loop, 'postServiceIn' and any other value start the next mission.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:331
---@param gotoRallyLoop string 'restart', 'abandon', 'postServiceIn' or other.
function gameplay_rallyLoop.handleGOTO(gotoRallyLoop) end

--- Indicates whether the Loop Toolbox window is shown.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:283
---@return boolean  Visibility.
function gameplay_rallyLoop.isLoopToolboxVisible() end

--- Public API: true if a manager exists.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:75
---@return boolean  true after setup.
function gameplay_rallyLoop.isReady() end

--- Hook called before any mission state change. Removes the manager's traffic exclusion and records a DNF on abandon (except in serviceOut).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:351
---@param state string New mission state (e.g. 'stopped').
---@param mission table|nil Mission concerned.
---@param abandoned boolean true if the mission is abandoned.
function gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned) end

--- Hook called when the ground markers route is created; relayed to the manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:239
function gameplay_rallyLoop.onCreatedRallyGroundMarkerRoute() end

--- Load hook; only writes a log if debugLogging is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:161
function gameplay_rallyLoop.onExtensionLoaded() end

--- Unload hook: publishes a {activeState = inactive} stream and clears the fallback stream.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:169
function gameplay_rallyLoop.onExtensionUnloaded() end

--- Gameplay interaction hook; calls manager:onRallyModeInteract().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:219
function gameplay_rallyLoop.onGameplayInteract() end

--- Hook called on every GUI update; relayed to the manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:136
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook emitted when the rally data changes; relayed to the manager, otherwise to the fallback stream.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:211
---@param data table Rally data.
function gameplay_rallyLoop.onRallyDataUpdated(data) end

--- Hook called when the route recovery is finished; relayed to the manager if it handles the hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:251
---@param data table Recovery data.
function gameplay_rallyLoop.onRallyRouteRecoveryComplete(data) end

--- Hook called on a vehicle recovery; calls manager:trackRecovery.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:245
---@param recoveryType string Recovery type.
function gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType) end

--- Hook called when the route has been recomputed; relayed to the manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:233
function gameplay_rallyLoop.onRecalculatedRoute() end

--- Hook called when the settings change; relayed to the manager (if it handles the hook) and to the fallback stream.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:185
function gameplay_rallyLoop.onSettingsChanged() end

--- Hook called when the UI start button is clicked; relayed to the manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:227
function gameplay_rallyLoop.onUIStartButtonClicked() end

--- Extension hook called every frame. Updates the manager and publishes the 'rallyLoop' stream; also handles the Loop Toolbox window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:101
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw) end

--- Enables the debug log.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:279
---@param val boolean New value.
function gameplay_rallyLoop.setDebugLogging(val) end

--- Sets a debug drawing flag of the manager.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:381
---@param flagName string Flag name.
---@param value boolean Value.
function gameplay_rallyLoop.setDrawFlag(flagName, value) end

--- Sets the manager's mission execution transfer flag.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:291
---@param val boolean Value.
function gameplay_rallyLoop.setMissionExecutionTransferFlag(val) end

--- Creates the RallyLoopManager for the mission and clears the fallback stream.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:64
---@param missionId string Loop mission id.
---@param missionDir string Mission folder.
function gameplay_rallyLoop.setup(missionId, missionDir) end

--- Prepares the manager for the next mission (manager:setupForNewMission).
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:285
function gameplay_rallyLoop.setupForNewMission() end

--- Test helper: skips the liaison.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:317
---@param options table|nil Options passed to the manager (inferred from code).
---@return boolean  Success.
---@return string|nil  'no rally loop manager' without a manager.
function gameplay_rallyLoop.skipLiaisonForTesting(options) end

--- Starts the loop's next mission.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:310
---@return any  Manager result (false without a manager).
function gameplay_rallyLoop.startNextMission() end

--- Shows or hides the Loop Toolbox window.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:193
function gameplay_rallyLoop.toggleDebug() end

--- Destroys the manager and clears the fallback stream.
---Source: lua/ge/extensions/gameplay/rallyLoop.lua:69
function gameplay_rallyLoop.unload() end

