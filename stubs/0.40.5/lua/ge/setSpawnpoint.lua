---@meta
-- tim19Atlas stub generated from lua/ge/setSpawnpoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Stores and rereads the default spawn point chosen for each level. The data is stored in settings/cloud/game-state.json (key levels[levelName].defaultSpawnPointName, plus lastLevelName). It is used by spawn.pickSpawnPoint and by the level selection menu.
--- Access: global `setSpawnpoint`
---@class setSpawnpoint
---@field settingsFilePath string Path of the JSON save file: 'settings/cloud/game-state.json'.
setSpawnpoint = {}

--- Reads lastLevelName from the save file.
---Source: lua/ge/setSpawnpoint.lua:58
---@return string|nil  Name of the last level recorded by setDefaultSP, nil if absent.
function setSpawnpoint.getLastLevelName() end

--- Returns the name of the level's default spawn point: the one recorded by the user if it is in the spawnPoints list of the level's info file and exists in the scene, otherwise defaultSpawnPointName from the level's info file, otherwise ''.
---Source: lua/ge/setSpawnpoint.lua:30
---@param levelName string|nil Level name (current level by default, via core_levels.getLevelName(getMissionFilename())).
---@return string  Name (editor name) of the spawn point, or ''; also '' if the level's info file is unreadable.
function setSpawnpoint.loadDefaultSpawnpoint(levelName) end

--- Records in settings/cloud/game-state.json the default spawn point for a level and remembers this level as the last level. Logs a warning if the write fails.
---Source: lua/ge/setSpawnpoint.lua:14
---@param defaultSPName string Name (editor name) of the spawn point.
---@param levelName string Level name (converted to lowercase).
function setSpawnpoint.setDefaultSP(defaultSPName, levelName) end

