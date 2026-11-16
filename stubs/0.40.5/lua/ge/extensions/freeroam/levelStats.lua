---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/levelStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Usage statistics of levels and spawn points for the UI: counts how many times each level/spawn point was launched and when. The data is persisted in `/settings/cloud/uiStats.json` (`levels` table with count, lastUsed, spawnPoints, and `vehicles` table). Global: freeroam_levelStats.
--- Access: extension `freeroam_levelStats`: `extensions.load("freeroam_levelStats")`, then the global `freeroam_levelStats`
---@class freeroam_levelStats
freeroam_levelStats = {}

--- Levels sorted by usage (last used first, then by count).
---Source: lua/ge/extensions/freeroam/levelStats.lua:34
---@return table  List of {levelName, count, lastUsed}.
function freeroam_levelStats.getTopLevels() end

--- A level's spawn points sorted the same way.
---Source: lua/ge/extensions/freeroam/levelStats.lua:52
---@param levelName string Level name.
---@return table  List of {spawnPointName|nil, count, lastUsed}.
function freeroam_levelStats.getTopSpawnPoints(levelName) end

--- Groups topLevels and topSpawnPoints (the spawn points of all levels, concatenated, with no level name).
---Source: lua/ge/extensions/freeroam/levelStats.lua:70
---@return table  {topLevels, topSpawnPoints}
function freeroam_levelStats.getUiStats() end

--- Increments the counter and the date of the level and of the spawn point, then saves the stats file.
---Source: lua/ge/extensions/freeroam/levelStats.lua:16
---@param levelName string Level name.
---@param spawnPointName string|nil Spawn point name; nil = default point.
function freeroam_levelStats.recordLevelSpawn(levelName, spawnPointName) end

