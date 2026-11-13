---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_multiseat_gamemodeManager` : `extensions.load("gameplay_multiseat_gamemodeManager")`, puis la globale `gameplay_multiseat_gamemodeManager`
---@class gameplay_multiseat_gamemodeManager
---@field ModuleName string
gameplay_multiseat_gamemodeManager = {}

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:372
function gameplay_multiseat_gamemodeManager.deferReady() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:503
function gameplay_multiseat_gamemodeManager.getGamemodeId() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:507
function gameplay_multiseat_gamemodeManager.getMaxPlayers() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:512
function gameplay_multiseat_gamemodeManager.getPhase() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:128
---@param playerIndex any
function gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:394
function gameplay_multiseat_gamemodeManager.getVehiclePool() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:319
function gameplay_multiseat_gamemodeManager.goToMainMenu() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:499
function gameplay_multiseat_gamemodeManager.isActive() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:516
function gameplay_multiseat_gamemodeManager.isStartScreenPending() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:378
function gameplay_multiseat_gamemodeManager.notifyReady() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:591
---@param context any
function gameplay_multiseat_gamemodeManager.onAfterRouteChange(context) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:686
function gameplay_multiseat_gamemodeManager.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:599
function gameplay_multiseat_gamemodeManager.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:581
---@param screensActive any
function gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:587
function gameplay_multiseat_gamemodeManager.onLoadingScreenFadeout() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:557
---@param button any
function gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:681
---@param changeSet any
---@param result any
function gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:624
---@param actions any
---@param context any
---@param registerButton any
function gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:533
---@param dtReal any
---@param dtSim any
function gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:550
---@param mode any
function gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:527
---@param state any
function gameplay_multiseat_gamemodeManager.onScreenFadeState(state) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:675
---@param oldId any
---@param newId any
---@param player any
function gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:520
function gameplay_multiseat_gamemodeManager.playPendingRound() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:144
function gameplay_multiseat_gamemodeManager.requestGamemodeData() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:481
---@param name any
---@param settings any
function gameplay_multiseat_gamemodeManager.restart(name, settings) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:368
---@param callback any
function gameplay_multiseat_gamemodeManager.setReadyCallback(callback) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:399
function gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool() end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:252
---@param resultData any
function gameplay_multiseat_gamemodeManager.showEndScreen(resultData) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:432
---@param name any
---@param settings any
---@param options any
function gameplay_multiseat_gamemodeManager.start(name, settings, options) end

---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:364
function gameplay_multiseat_gamemodeManager.stop() end

