---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/lowPerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_lowPerformance` : `extensions.load("gameplay_lowPerformance")`, puis la globale `gameplay_lowPerformance`
---@class gameplay_lowPerformance
gameplay_lowPerformance = {}

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:125
function gameplay_lowPerformance.cancelPendingSpawn() end

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:119
function gameplay_lowPerformance.confirmPendingSpawn() end

--- Returns spawnFn's result, or false while the player decides on the warning
---Source : lua/ge/extensions/gameplay/lowPerformance.lua:93
---@param spawnFn any
function gameplay_lowPerformance.confirmSpawn(spawnFn) end

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:141
function gameplay_lowPerformance.getPauseNotice() end

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:88
function gameplay_lowPerformance.isLowPerformance() end

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:129
function gameplay_lowPerformance.muteAndConfirmPendingSpawn() end

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:196
---@param state any
function gameplay_lowPerformance.onScreenFadeState(state) end

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:151
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/lowPerformance.lua:192
function gameplay_lowPerformance.onVehicleSpawned() end

