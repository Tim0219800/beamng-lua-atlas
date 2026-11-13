---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/speedTrapLeaderboards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_speedTrapLeaderboards` : `extensions.load("gameplay_speedTrapLeaderboards")`, puis la globale `gameplay_speedTrapLeaderboards`
---@class gameplay_speedTrapLeaderboards
gameplay_speedTrapLeaderboards = {}

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:58
---@param speedTrapData any
---@param playerSpeed any
---@param overSpeed any
---@param veh any
function gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh) end

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:106
function gameplay_speedTrapLeaderboards.getLeaderboards() end

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:21
---@param folderPath any
function gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath) end

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:100
function gameplay_speedTrapLeaderboards.onBeforeCareerActivate() end

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:94
function gameplay_speedTrapLeaderboards.onClientEndMission() end

--- TODO need some "onFreeroamStart" function
---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:88
---@param levelPath any
function gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:116
---@param data any
function gameplay_speedTrapLeaderboards.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:110
function gameplay_speedTrapLeaderboards.onSerialize() end

---Source : lua/ge/extensions/gameplay/speedTrapLeaderboards.lua:35
---@param folderPath any
---@param forceOverwrite any
function gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite) end

