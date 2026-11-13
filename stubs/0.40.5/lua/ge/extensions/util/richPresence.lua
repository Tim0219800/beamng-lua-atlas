---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/richPresence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_richPresence` : `extensions.load("util_richPresence")`, puis la globale `util_richPresence`
---@class util_richPresence
---@field onDeserialized any
---@field richPresenceEnabled boolean
---@field setActivity any
---@field state table
util_richPresence = {}

---Source : lua/ge/extensions/util/richPresence.lua:526
---@param levelpath any
function util_richPresence.clientEndMission(levelpath) end

---Source : lua/ge/extensions/util/richPresence.lua:526
---@param levelpath any
function util_richPresence.clientPreStartMission(levelpath) end

---Source : lua/ge/extensions/util/richPresence.lua:398
function util_richPresence.onAnyMissionChanged() end

---Source : lua/ge/extensions/util/richPresence.lua:616
---@param attemptData any
function util_richPresence.onAttemptCompleted(attemptData) end

---Source : lua/ge/extensions/util/richPresence.lua:606
---@param attemptData any
function util_richPresence.onAttemptFailed(attemptData) end

---Source : lua/ge/extensions/util/richPresence.lua:230
function util_richPresence.onCareerActive() end

---Source : lua/ge/extensions/util/richPresence.lua:357
---@param levelPath any
function util_richPresence.onClientPostStartMission(levelPath) end

---Source : lua/ge/extensions/util/richPresence.lua:242
function util_richPresence.onCrawlCleared() end

---Source : lua/ge/extensions/util/richPresence.lua:241
function util_richPresence.onCrawlStarted() end

---Source : lua/ge/extensions/util/richPresence.lua:231
function util_richPresence.onDeliveryModeStarted() end

---Source : lua/ge/extensions/util/richPresence.lua:232
function util_richPresence.onDeliveryModeStopped() end

---Source : lua/ge/extensions/util/richPresence.lua:239
function util_richPresence.onDragClear() end

---Source : lua/ge/extensions/util/richPresence.lua:240
function util_richPresence.onDragClearComplete() end

---Source : lua/ge/extensions/util/richPresence.lua:238
function util_richPresence.onDragDataSet() end

---Source : lua/ge/extensions/util/richPresence.lua:237
function util_richPresence.onDragReset() end

---Source : lua/ge/extensions/util/richPresence.lua:243
function util_richPresence.onDriftContextChanged() end

---Source : lua/ge/extensions/util/richPresence.lua:379
function util_richPresence.onEditorActivated() end

---Source : lua/ge/extensions/util/richPresence.lua:386
function util_richPresence.onEditorDeactivated() end

---Source : lua/ge/extensions/util/richPresence.lua:440
function util_richPresence.onExtensionLoaded() end

---Source : lua/ge/extensions/util/richPresence.lua:460
function util_richPresence.onExtensionUnloaded() end

---Source : lua/ge/extensions/util/richPresence.lua:393
---@param state any
function util_richPresence.onGameStateUpdate(state) end

---Source : lua/ge/extensions/util/richPresence.lua:669
---@param attempt any
---@param mission any
function util_richPresence.onMissionAttemptAggregated(attempt, mission) end

--- M.onPursuitOffense = onPursuitOffense
---Source : lua/ge/extensions/util/richPresence.lua:596
---@param attemptData any
function util_richPresence.onNewAttempt(attemptData) end

---Source : lua/ge/extensions/util/richPresence.lua:236
function util_richPresence.onPartShoppingCancelled() end

---Source : lua/ge/extensions/util/richPresence.lua:233
function util_richPresence.onPartShoppingStarted() end

---Source : lua/ge/extensions/util/richPresence.lua:234
function util_richPresence.onPartShoppingTransactionComplete() end

---Source : lua/ge/extensions/util/richPresence.lua:647
---@param data any
function util_richPresence.onRaceBranchChosen(data) end

---Source : lua/ge/extensions/util/richPresence.lua:636
---@param data any
function util_richPresence.onRaceLap(data) end

---Source : lua/ge/extensions/util/richPresence.lua:658
---@param data any
function util_richPresence.onRaceResult(data) end

---Source : lua/ge/extensions/util/richPresence.lua:626
---@param data any
function util_richPresence.onRaceWaypointReached(data) end

--- M.onScenarioFinished = onScenarioFinished
---  M.onScenarioChange = onScenarioChange
---  M.onScenarioRestarted = onScenarioRestarted
---Source : lua/ge/extensions/util/richPresence.lua:586
function util_richPresence.onResetGameplay() end

---Source : lua/ge/extensions/util/richPresence.lua:235
function util_richPresence.onScenarioChange() end

---Source : lua/ge/extensions/util/richPresence.lua:493
function util_richPresence.onSettingsChanged() end

---Source : lua/ge/extensions/util/richPresence.lua:562
---@param toState any
---@param fromState any
function util_richPresence.onUiChangedState(toState, fromState) end

---Source : lua/ge/extensions/util/richPresence.lua:533
function util_richPresence.onUiReady() end

---Source : lua/ge/extensions/util/richPresence.lua:339
---@param oldId any
---@param newId any
---@param player any
function util_richPresence.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/util/richPresence.lua:244
---@param levelpath any
function util_richPresence.onWorldReadyState(levelpath) end

