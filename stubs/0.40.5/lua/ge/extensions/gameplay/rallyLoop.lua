---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rallyLoop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rallyLoop` : `extensions.load("gameplay_rallyLoop")`, puis la globale `gameplay_rallyLoop`
---@class gameplay_rallyLoop
gameplay_rallyLoop = {}

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:324
---@param amount any
function gameplay_rallyLoop.addTestPenalty(amount) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:205
---@param zOnTop any
---@param drawRoute any
---@param drawLabels any
function gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:278
function gameplay_rallyLoop.getDebugLogging() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:374
---@param flagName any
function gameplay_rallyLoop.getDrawFlag(flagName) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:201
function gameplay_rallyLoop.getLoopToolbox() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:368
function gameplay_rallyLoop.getManager() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:296
function gameplay_rallyLoop.getMissionExecutionTransferFlag() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:303
function gameplay_rallyLoop.getNextMissionId() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:83
function gameplay_rallyLoop.getRuntimeMode() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:387
function gameplay_rallyLoop.getSSRescheduleCount() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:331
---@param gotoRallyLoop any
function gameplay_rallyLoop.handleGOTO(gotoRallyLoop) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:283
function gameplay_rallyLoop.isLoopToolboxVisible() end

--- gameplay_rallyLoop API
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:75
function gameplay_rallyLoop.isReady() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:351
---@param state any
---@param mission any
---@param abandoned any
function gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:239
function gameplay_rallyLoop.onCreatedRallyGroundMarkerRoute() end

--- M.onVehicleResetted = onVehicleResetted
---  M.onVehicleSpawned = onVehicleSpawned
---  M.onVehicleSwitched = onVehicleSwitched
---  M.onVehicleActiveChanged = onVehicleActiveChanged
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:161
function gameplay_rallyLoop.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:169
function gameplay_rallyLoop.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:219
function gameplay_rallyLoop.onGameplayInteract() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:136
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:211
---@param data any
function gameplay_rallyLoop.onRallyDataUpdated(data) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:251
---@param data any
function gameplay_rallyLoop.onRallyRouteRecoveryComplete(data) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:245
---@param recoveryType any
function gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:233
function gameplay_rallyLoop.onRecalculatedRoute() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:185
function gameplay_rallyLoop.onSettingsChanged() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:227
function gameplay_rallyLoop.onUIStartButtonClicked() end

--- extension hooks API
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:101
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:279
---@param val any
function gameplay_rallyLoop.setDebugLogging(val) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:381
---@param flagName any
---@param value any
function gameplay_rallyLoop.setDrawFlag(flagName, value) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:291
---@param val any
function gameplay_rallyLoop.setMissionExecutionTransferFlag(val) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:64
---@param missionId any
---@param missionDir any
function gameplay_rallyLoop.setup(missionId, missionDir) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:285
function gameplay_rallyLoop.setupForNewMission() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:317
---@param options any
function gameplay_rallyLoop.skipLiaisonForTesting(options) end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:310
function gameplay_rallyLoop.startNextMission() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:193
function gameplay_rallyLoop.toggleDebug() end

---Source : lua/ge/extensions/gameplay/rallyLoop.lua:69
function gameplay_rallyLoop.unload() end

