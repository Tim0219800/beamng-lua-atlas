---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/missionWrapper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Links the mission system (gameplay_missions_*) with the career save. Mission progress data is stored in <save>/career/missions/; the module tracks "dirty" (modified) missions and writes them on each profile save. It also triggers a save before and after a mission if autosave is active.
--- Access: extension `career_modules_missionWrapper`: `extensions.load("career_modules_missionWrapper")`, then the global `career_modules_missionWrapper`
---@class career_modules_missionWrapper
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_missionWrapper = {}

--- Marks the mission as modified (to be saved) with the given date or the current UTC date.
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:46
---@param id string Mission identifier.
---@param dirtyDate string|nil ISO 8601 date, now by default.
function career_modules_missionWrapper.cacheMissionData(id, dirtyDate) end

--- Hook: in the "stopped" state, resets the player state and, if autosave is active, saves the mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:59
---@param state string Mission state.
---@param mission table|nil Mission concerned.
function career_modules_missionWrapper.onAnyMissionChanged(state, mission) end

--- Hook: if the career is active, sets the mission save path and reloads the mission system (returns false otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:20
function career_modules_missionWrapper.onExtensionLoaded() end

--- Hook: removes the mission save path and reloads the mission system.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:27
function career_modules_missionWrapper.onExtensionUnloaded() end

--- Hook called when a mission's data is loaded: registers it as tracked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:50
---@param id string Mission identifier.
---@param dirtyDate string|nil Associated date.
function career_modules_missionWrapper.onMissionLoaded(id, dirtyDate) end

--- Save hook: writes the data of each modified mission to career/missions/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:33
---@param currentSavePath string Save folder.
function career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath) end

--- Hook called when the vehicle save is finished: unblocks the pending mission start step.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:69
function career_modules_missionWrapper.onVehicleSaveFinished() end

--- Step called before a mission starts: if autosave is active, saves and waits for onVehicleSaveFinished to set step.handlingComplete = true; otherwise marks the step as complete right away.
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:76
---@param step table Mission start step (handlingComplete field).
---@param task any Not used.
function career_modules_missionWrapper.preMissionHandling(step, task) end

--- Marks the mission as modified and starts a full career save (career_saveSystem.saveCurrent).
---Source: lua/ge/extensions/career/modules/missionWrapper.lua:54
---@param id string Mission identifier.
function career_modules_missionWrapper.saveMission(id) end

