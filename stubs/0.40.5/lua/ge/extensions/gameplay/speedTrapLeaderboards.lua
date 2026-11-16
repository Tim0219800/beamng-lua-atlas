---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/speedTrapLeaderboards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension that keeps the speed camera leaderboards (top 10), per level and per camera (triggerName), in freeroam mode only. Leaderboards are loaded from settings/cloud/speedTrapLeaderboards/<level>.json at level start and saved at the end of the mission or before career mode activation. An entry contains speed (m/s), modelName (JBeam name) and date (UTC ISO 8601).
--- Access: extension `gameplay_speedTrapLeaderboards`: `extensions.load("gameplay_speedTrapLeaderboards")`, then the global `gameplay_speedTrapLeaderboards`
---@class gameplay_speedTrapLeaderboards
gameplay_speedTrapLeaderboards = {}

--- Adds an entry to the current level's camera leaderboard if there is room (10 entries max) or if it beats the last entry, then sorts by descending speed.
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:58
---@param speedTrapData table Trigger data (uses triggerName).
---@param playerSpeed number Vehicle speed in m/s.
---@param overSpeed number Speed limit excess in m/s (not used for the entry).
---@param veh userdata Vehicle object (its JBeam field gives the model).
---@return boolean  true if the speed equals or exceeds the leaderboard's best score.
---@return table[]  This camera's leaderboard, sorted.
function gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh) end

--- Returns all leaderboards in memory.
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:106
---@return table<string, table>  level -> camera -> list of entries {speed, modelName, date}.
function gameplay_speedTrapLeaderboards.getLeaderboards() end

--- Clears memory then loads all *.json files of the folder; the file name without extension is used as the level name.
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:21
---@param folderPath string|nil Folder; default settings/cloud/speedTrapLeaderboards/.
function gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath) end

--- Hook called before career activation: in freeroam, saves.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:100
function gameplay_speedTrapLeaderboards.onBeforeCareerActivate() end

--- Hook called at the end of the mission: in freeroam, saves the leaderboards.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:94
function gameplay_speedTrapLeaderboards.onClientEndMission() end

--- Hook called after a level starts: in freeroam, loads the leaderboards.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:88
---@param levelPath string Level path.
function gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath) end

--- Restores the state after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:116
---@param data table Table {leaderboards, dirtyLevels}.
function gameplay_speedTrapLeaderboards.onDeserialized(data) end

--- Saves the state before a Lua reload (leaderboards and modified levels); returns nothing if career is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:110
function gameplay_speedTrapLeaderboards.onSerialize() end

--- Writes the modified leaderboards to disk (one file per level).
---Source: lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:35
---@param folderPath string|nil Folder; default settings/cloud/speedTrapLeaderboards/.
---@param forceOverwrite boolean|nil Write all levels, even unmodified ones.
function gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite) end

