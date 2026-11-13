---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/statistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_statistic` : `extensions.load("gameplay_statistic")`, puis la globale `gameplay_statistic`
---@class gameplay_statistic
---@field dependencies table
gameplay_statistic = {}

---Source : lua/ge/extensions/gameplay/statistic.lua:128
---@param fn any
function gameplay_statistic.addSchedule(fn) end

---Source : lua/ge/extensions/gameplay/statistic.lua:356
---@param name any
---@param trigger any
---@param callbackFunction any
---@param career any
function gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career) end

---Source : lua/ge/extensions/gameplay/statistic.lua:382
---@param name any
---@param trigger any
---@param callbackFunction any
---@param career any
function gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career) end

---Source : lua/ge/extensions/gameplay/statistic.lua:782
function gameplay_statistic.forceTimerUpdate() end

---Source : lua/ge/extensions/gameplay/statistic.lua:230
---@param name any
---@param value any
---@param aggregate any
function gameplay_statistic.metricAdd(name, value, aggregate) end

---Source : lua/ge/extensions/gameplay/statistic.lua:293
---@param name any
---@param carreer any
function gameplay_statistic.metricGet(name, carreer) end

---Source : lua/ge/extensions/gameplay/statistic.lua:307
---@param namePattern any
---@param carreer any
function gameplay_statistic.metricGetMatchPattern(namePattern, carreer) end

---Source : lua/ge/extensions/gameplay/statistic.lua:273
---@param name any
---@param value any
---@param aggregate any
function gameplay_statistic.metricSet(name, value, aggregate) end

---Source : lua/ge/extensions/gameplay/statistic.lua:757
---@param active any
function gameplay_statistic.onCareerActive(active) end

---Source : lua/ge/extensions/gameplay/statistic.lua:526
---@param levelPath any
function gameplay_statistic.onClientEndMission(levelPath) end

---Source : lua/ge/extensions/gameplay/statistic.lua:531
---@param levelPath any
function gameplay_statistic.onClientPostStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/statistic.lua:522
---@param levelPath any
function gameplay_statistic.onClientStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/statistic.lua:94
---@param data any
function gameplay_statistic.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/statistic.lua:544
function gameplay_statistic.onEditorActivated() end

---Source : lua/ge/extensions/gameplay/statistic.lua:548
function gameplay_statistic.onEditorDeactivated() end

---Source : lua/ge/extensions/gameplay/statistic.lua:71
function gameplay_statistic.onExit() end

---Source : lua/ge/extensions/gameplay/statistic.lua:776
function gameplay_statistic.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/statistic.lua:78
function gameplay_statistic.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/statistic.lua:582
---@param newState any
function gameplay_statistic.onGameStateUpdate(newState) end

---Source : lua/ge/extensions/gameplay/statistic.lua:595
function gameplay_statistic.onPlayerVehicleCloned() end

---Source : lua/ge/extensions/gameplay/statistic.lua:747
---@param currentSavePath any
function gameplay_statistic.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/gameplay/statistic.lua:566
---@param scenario any
function gameplay_statistic.onScenarioFinished(scenario) end

--- M.onUiChangedState = onUiChangedState
---Source : lua/ge/extensions/gameplay/statistic.lua:559
---@param scenario any
function gameplay_statistic.onScenarioLoaded(scenario) end

---Source : lua/ge/extensions/gameplay/statistic.lua:574
---@param scenario any
function gameplay_statistic.onScenarioRestarted(scenario) end

---Source : lua/ge/extensions/gameplay/statistic.lua:82
function gameplay_statistic.onSerialize() end

---Source : lua/ge/extensions/gameplay/statistic.lua:598
function gameplay_statistic.onSpawnDefaultVehicle() end

---Source : lua/ge/extensions/gameplay/statistic.lua:603
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/statistic.lua:720
---@param vid any
function gameplay_statistic.onVehicleDestroyed(vid) end

---Source : lua/ge/extensions/gameplay/statistic.lua:716
---@param vid any
function gameplay_statistic.onVehicleResetted(vid) end

---Source : lua/ge/extensions/gameplay/statistic.lua:592
function gameplay_statistic.onVehicleSelectorReplaceCurrent() end

---Source : lua/ge/extensions/gameplay/statistic.lua:589
function gameplay_statistic.onVehicleSelectorSpawnNew() end

---Source : lua/ge/extensions/gameplay/statistic.lua:701
---@param vid any
---@param v any
function gameplay_statistic.onVehicleSpawned(vid, v) end

---Source : lua/ge/extensions/gameplay/statistic.lua:704
---@param oldid any
---@param newid any
---@param player any
function gameplay_statistic.onVehicleSwitched(oldid, newid, player) end

---Source : lua/ge/extensions/gameplay/statistic.lua:540
---@param worldReadyState any
function gameplay_statistic.onWorldReadyState(worldReadyState) end

---Source : lua/ge/extensions/gameplay/statistic.lua:133
---@param fn any
function gameplay_statistic.removeSchedule(fn) end

---Source : lua/ge/extensions/gameplay/statistic.lua:735
function gameplay_statistic.sendGUIState() end

---Source : lua/ge/extensions/gameplay/statistic.lua:727
---@param newValue any
function gameplay_statistic.setDebug(newValue) end

---Source : lua/ge/extensions/gameplay/statistic.lua:323
---@param name any
---@param increment any
---@param aggregate any
---@param useSimTime any
function gameplay_statistic.timerStart(name, increment, aggregate, useSimTime) end

---Source : lua/ge/extensions/gameplay/statistic.lua:346
---@param name any
function gameplay_statistic.timerStop(name) end

