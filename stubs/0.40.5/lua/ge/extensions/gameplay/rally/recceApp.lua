---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recceApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_recceApp` : `extensions.load("gameplay_rally_recceApp")`, puis la globale `gameplay_rally_recceApp`
---@class gameplay_rally_recceApp
gameplay_rally_recceApp = {}

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:522
function gameplay_rally_recceApp.closeWindow() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:80
function gameplay_rally_recceApp.isEnabled() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:764
function gameplay_rally_recceApp.isRecording() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:770
function gameplay_rally_recceApp.isWindowVisible() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:113
---@param missionId any
---@param missionDir any
function gameplay_rally_recceApp.loadMission(missionId, missionDir) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:301
function gameplay_rally_recceApp.moveVehicleBackward() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:297
function gameplay_rally_recceApp.moveVehicleForward() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:305
function gameplay_rally_recceApp.moveVehicleToMission() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:212
function gameplay_rally_recceApp.moveVehicleToStart() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:329
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:516
function gameplay_rally_recceApp.openWindow() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:397
function gameplay_rally_recceApp.recordDrivelineClearAll() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:354
function gameplay_rally_recceApp.recordDrivelineCut() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:372
---@param recordVoice any
function gameplay_rally_recceApp.recordDrivelineStart(recordVoice) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:382
function gameplay_rally_recceApp.recordDrivelineStop() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:178
function gameplay_rally_recceApp.release() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:492
---@param rallyExt any
function gameplay_rally_recceApp.reload(rallyExt) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:76
---@param val any
function gameplay_rally_recceApp.setEnabled(val) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:107
---@param state any
function gameplay_rally_recceApp.setLastLoadState(state) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:101
---@param mid any
function gameplay_rally_recceApp.setLastMissionId(mid) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:342
---@param val any
function gameplay_rally_recceApp.setShowNotes(val) end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:416
function gameplay_rally_recceApp.toggleDebug() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:633
function gameplay_rally_recceApp.toggleMouseLikeVehicle() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:526
function gameplay_rally_recceApp.toggleWindow() end

---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:167
function gameplay_rally_recceApp.unloadMission() end

