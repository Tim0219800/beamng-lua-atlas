---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of multiseat game modes (split screen). It loads the gameplay/discover/multiseat/*Rules.lua providers, collects their info via the onGetMultiseatGamemodeInfos hook, starts/stops/restarts a mode, handles the fade, the blocking of input actions, the waiting for vehicles, and the start and end screens (via ui_router and mission.control). A modder adding a multiseat mode goes through it: it calls ext.start(settings), ext.onReady(vehicles), ext.stop(), buildStartScreen, buildEndScreen.
--- Access: extension `gameplay_multiseat_gamemodeManager`: `extensions.load("gameplay_multiseat_gamemodeManager")`, then the global `gameplay_multiseat_gamemodeManager`
---@class gameplay_multiseat_gamemodeManager
---@field ModuleName string Module name: 'gamemodeManager'.
gameplay_multiseat_gamemodeManager = {}

--- Moves the phase from 'starting' to 'waiting': the mode announces that it will itself notify when it is ready with notifyReady.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:372
function gameplay_multiseat_gamemodeManager.deferReady() end

--- Name of the current mode.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:503
---@return string|nil  Name, or nil.
function gameplay_multiseat_gamemodeManager.getGamemodeId() end

--- Maximum number of players of the current mode (info.playerCount.max).
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:507
---@return integer|nil  Maximum, or nil.
function gameplay_multiseat_gamemodeManager.getMaxPlayers() end

--- Current phase of the mode.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:512
---@return string|nil  nil, 'starting', 'waiting' or 'running'.
function gameplay_multiseat_gamemodeManager.getPhase() end

--- Display name of the local player with the given index, based on the joined participant's persona.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:128
---@param playerIndex integer Player index (0-based).
---@return string|nil  displayName, or nil if unknown.
function gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex) end

--- Returns info.vehiclePool of the current mode.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:394
---@return table|nil  Vehicle pool declared by the mode.
function gameplay_multiseat_gamemodeManager.getVehiclePool() end

--- Returns to the main menu (returnToMainMenu).
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:319
function gameplay_multiseat_gamemodeManager.goToMainMenu() end

--- Indicates whether a mode is running.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:499
---@return boolean  true if a mode is active.
function gameplay_multiseat_gamemodeManager.isActive() end

--- Indicates whether the start screen is waiting for the pause to end (the variable is never set to true in this file).
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:516
---@return boolean  Always false in practice.
function gameplay_multiseat_gamemodeManager.isStartScreenPending() end

--- Moves to the 'running' phase, ends the fade if active and runs the callback set by setReadyCallback. Has no effect outside the 'starting'/'waiting' phases.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:378
function gameplay_multiseat_gamemodeManager.notifyReady() end

--- Hook after a UI route change: if a start screen is pending and the target route is 'play' or 'multiseat', plays it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:591
---@param context table Contains toRoute.name.
function gameplay_multiseat_gamemodeManager.onAfterRouteChange(context) end

--- End-of-level hook: stops the mode without reactivating freeroam.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:686
function gameplay_multiseat_gamemodeManager.onClientEndMission() end

--- Unload hook: unblocks the actions, calls ext.stop() and resets all state, including the mode registry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:599
function gameplay_multiseat_gamemodeManager.onExtensionUnloaded() end

--- Hook: adds the active screen mode to the screensActive list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:581
---@param screensActive string[] List filled in place.
function gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive) end

--- Empty hook: the "vehicles ready" flow of onPreRender already handles the transition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:587
function gameplay_multiseat_gamemodeManager.onLoadingScreenFadeout() end

--- Hook: runs the callback of the clicked button (mgrId 'multiseatGamemode'). For the end screen, immediately; for the start screen, after returning to the multiseat route, onUIStartButtonClicked and a 0.1 s delay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:557
---@param button table Button with mgrId and funId.
function gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button) end

--- Hook after multiseat settings are applied: restarts the mode if changeSet.requiresRestart and if the application succeeded without exitAfterApply.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:681
---@param changeSet table Changes (requiresRestart).
---@param result table Result (success, exitAfterApply).
function gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result) end

--- Multiseat pause menu build hook: adds the Game modes button if there is no active mode, otherwise Settings, Quit and Restart mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:624
---@param actions table[] List of actions to complete.
---@param context table Context (unused).
---@param registerButton function Function that registers a button and its callback.
function gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton) end

--- Called every frame. In the 'waiting' phase with vehicles pending: waits for them to be ready (or the 5 s timeout), notifies ready, calls ext.onReady(vehicles), freezes the vehicles then shows the start screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:533
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim) end

--- Hook: when the UI requests the mission screen data (mode not containing 'test'), returns the active screen via onRequestMissionScreenDataReady and emits onMissionScreenReady.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:550
---@param mode string Requested screen mode.
function gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode) end

--- Screen fade hook: when state is 1 (black screen) and a launch is deferred, launches the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:527
---@param state integer Fade state; 1 = fully faded.
function gameplay_multiseat_gamemodeManager.onScreenFadeState(state) end

--- Vehicle switch hook: restarts the mode if in the 'running' phase and outside vehicle synchronization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:675
---@param oldId integer Old vehicle id.
---@param newId integer New id.
---@param player integer Player concerned.
function gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player) end

--- Shows the start screen if it was pending.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:520
---@return boolean  true if the screen was shown.
function gameplay_multiseat_gamemodeManager.playPendingRound() end

--- Sends the UI (guihooks OnGamemodeData, context 'multiseat') the list of available modes, the current mode, its settings and the list of players. Modes that are mapUnsupported or exceed the number of players are counted but not listed.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:144
function gameplay_multiseat_gamemodeManager.requestGamemodeData() end

--- Restarts the mode (the current one if name is nil) with fade. If the requested mode is not the active mode, calls start.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:481
---@param name string|nil Mode to restart.
---@param settings table|nil New settings; nil = keep the current ones.
---@return boolean  false if there is no mode to restart.
function gameplay_multiseat_gamemodeManager.restart(name, settings) end

--- Sets a function called once, when the mode enters the 'running' phase (notifyReady).
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:368
---@param callback function|nil Function with no argument.
function gameplay_multiseat_gamemodeManager.setReadyCallback(callback) end

--- Indicates whether the start was requested with options.assignVehiclePool = true.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:399
---@return boolean  true if the pool must be assigned.
function gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool() end

--- Shows the end screen: emits onMultiseatGamemodeFinished, pauses the simulation time, then builds the screen from resultData and the mode's buildEndScreen overrides (header, headerColor, body, layout, pages, buttons). By default: Replay, Freeroam, Main menu buttons.
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:252
---@param resultData table|nil Fields read: title, tied, winnerPlayer (index), text.
function gameplay_multiseat_gamemodeManager.showEndScreen(resultData) end

--- Starts a mode: loads ui_multiseat_freeroam, stops the previous mode, loads the mode's extension (info.extensionPath), assigns it ext.info, stores the settings (info.settings defaults if nil), disables multiseat freeroam then launches the mode (with fade unless options.withFade == false).
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:432
---@param name string Mode name in the registry.
---@param settings table|nil Settings; nil = default values.
---@param options table|nil withFade (boolean, false = no fade), assignVehiclePool (boolean).
---@return boolean  true if the launch is started, false on error.
function gameplay_multiseat_gamemodeManager.start(name, settings, options) end

--- Stops the current mode, calls ext.stop() and reactivates multiseat freeroam (ui_multiseat_freeroam.activate).
---Source: lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:364
function gameplay_multiseat_gamemodeManager.stop() end

