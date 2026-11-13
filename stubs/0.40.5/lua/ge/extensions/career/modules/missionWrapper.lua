---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/missionWrapper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_missionWrapper` : `extensions.load("career_modules_missionWrapper")`, puis la globale `career_modules_missionWrapper`
---@class career_modules_missionWrapper
---@field dependencies table
career_modules_missionWrapper = {}

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:46
---@param id any
---@param dirtyDate any
function career_modules_missionWrapper.cacheMissionData(id, dirtyDate) end

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:59
---@param state any
---@param mission any
function career_modules_missionWrapper.onAnyMissionChanged(state, mission) end

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:20
function career_modules_missionWrapper.onExtensionLoaded() end

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:27
function career_modules_missionWrapper.onExtensionUnloaded() end

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:50
---@param id any
---@param dirtyDate any
function career_modules_missionWrapper.onMissionLoaded(id, dirtyDate) end

--- this should only be loaded when the career is active
---Source : lua/ge/extensions/career/modules/missionWrapper.lua:33
---@param currentSavePath any
function career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:69
function career_modules_missionWrapper.onVehicleSaveFinished() end

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:76
---@param step any
---@param task any
function career_modules_missionWrapper.preMissionHandling(step, task) end

---Source : lua/ge/extensions/career/modules/missionWrapper.lua:54
---@param id any
function career_modules_missionWrapper.saveMission(id) end

