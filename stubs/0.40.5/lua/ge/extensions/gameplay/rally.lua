---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally` : `extensions.load("gameplay_rally")`, puis la globale `gameplay_rally`
---@class gameplay_rally
---@field dependencies table
---@field recceApp any
gameplay_rally = {}

---Source : lua/ge/extensions/gameplay/rally.lua:307
function gameplay_rally.actionCodriverCallsEarlier() end

---Source : lua/ge/extensions/gameplay/rally.lua:311
function gameplay_rally.actionCodriverCallsLater() end

---Source : lua/ge/extensions/gameplay/rally.lua:266
function gameplay_rally.actionRecceMoveVehicleBackward() end

---Source : lua/ge/extensions/gameplay/rally.lua:261
function gameplay_rally.actionRecceMoveVehicleForward() end

---Source : lua/ge/extensions/gameplay/rally.lua:252
function gameplay_rally.actionToggleMouseLikeVehicle() end

---Source : lua/ge/extensions/gameplay/rally.lua:257
function gameplay_rally.actionTranscribeRecordingCut() end

---Source : lua/ge/extensions/gameplay/rally.lua:79
---@param owner any
function gameplay_rally.canManageMission(owner) end

--- rally API
---Source : lua/ge/extensions/gameplay/rally.lua:179
---@param val any
function gameplay_rally.enableRecceApp(val) end

---Source : lua/ge/extensions/gameplay/rally.lua:457
function gameplay_rally.getDebugLogging() end

---Source : lua/ge/extensions/gameplay/rally.lua:432
function gameplay_rally.getErrorMsgForUser() end

---Source : lua/ge/extensions/gameplay/rally.lua:498
function gameplay_rally.getRace() end

---Source : lua/ge/extensions/gameplay/rally.lua:430
function gameplay_rally.getRallyManager() end

---Source : lua/ge/extensions/gameplay/rally.lua:431
function gameplay_rally.getRallyManagerOwner() end

---Source : lua/ge/extensions/gameplay/rally.lua:303
function gameplay_rally.getRallyToolbox() end

---Source : lua/ge/extensions/gameplay/rally.lua:433
function gameplay_rally.getRecoveryRepairVehicle() end

---Source : lua/ge/extensions/gameplay/rally.lua:452
function gameplay_rally.getStageObserverState() end

---Source : lua/ge/extensions/gameplay/rally.lua:449
function gameplay_rally.getStageRuntimeAuthorityMode() end

---Source : lua/ge/extensions/gameplay/rally.lua:487
function gameplay_rally.getUiColor() end

---Source : lua/ge/extensions/gameplay/rally.lua:490
function gameplay_rally.getUiColorOverride() end

---Source : lua/ge/extensions/gameplay/rally.lua:496
function gameplay_rally.isRallyToolboxVisible() end

---Source : lua/ge/extensions/gameplay/rally.lua:171
function gameplay_rally.isReady() end

---Source : lua/ge/extensions/gameplay/rally.lua:130
---@param missionId any
---@param missionDir any
---@param drivelineMode any
---@param voicepackPick any
---@param options any
function gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options) end

--- M.onVehicleActiveChanged = onVehicleActiveChanged
---Source : lua/ge/extensions/gameplay/rally.lua:233
function gameplay_rally.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/rally.lua:240
function gameplay_rally.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/rally.lua:320
---@param event any
function gameplay_rally.onRacePathnodeReached(event) end

---Source : lua/ge/extensions/gameplay/rally.lua:380
---@param raceData any
function gameplay_rally.onRallyRegisterRace(raceData) end

---Source : lua/ge/extensions/gameplay/rally.lua:388
---@param recoveryType any
function gameplay_rally.onRallyVehicleRecovery(recoveryType) end

--- M.onVehicleSpawned = onVehicleSpawned
---  M.onVehicleSwitched = onVehicleSwitched
---Source : lua/ge/extensions/gameplay/rally.lua:111
function gameplay_rally.onSeatOccupantEnter() end

---Source : lua/ge/extensions/gameplay/rally.lua:111
function gameplay_rally.onSeatOccupantExit() end

---Source : lua/ge/extensions/gameplay/rally.lua:417
function gameplay_rally.onSettingsChanged() end

--- extension hooks
---Source : lua/ge/extensions/gameplay/rally.lua:183
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally.onUpdate(dtReal, dtSim, dtRaw) end

--- M.onGuiUpdate = onGuiUpdate
---Source : lua/ge/extensions/gameplay/rally.lua:210
---@param vehicleID any
function gameplay_rally.onVehicleResetted(vehicleID) end

---Source : lua/ge/extensions/gameplay/rally.lua:458
---@param val any
function gameplay_rally.setDebugLogging(val) end

---Source : lua/ge/extensions/gameplay/rally.lua:444
---@param mode any
function gameplay_rally.setStageRuntimeAuthorityMode(mode) end

---Source : lua/ge/extensions/gameplay/rally.lua:484
---@param hex any
function gameplay_rally.setUiColor(hex) end

---Source : lua/ge/extensions/gameplay/rally.lua:291
function gameplay_rally.toggleDebug() end

---Source : lua/ge/extensions/gameplay/rally.lua:156
---@param options any
function gameplay_rally.unloadMission(options) end

