---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Procedural mission generator for "busMode" (bus driving in freeroam). For each level that has /levels/<level>/buslines/*.buslines.json files, it creates one mission per "bus" scenario of scenario_scenariosLoader, with the route data (task list, navigation helpers, color, vehicle, reverse route) and a trigger placed on the bus spawn point. Called by gameplay_missions_missions to add these missions to the list.
--- Access: extension `gameplay_missions_proceduralMissionGenerators_busModeMissions`: `extensions.load("gameplay_missions_proceduralMissionGenerators_busModeMissions")`, then the global `gameplay_missions_proceduralMissionGenerators_busModeMissions`
---@class gameplay_missions_proceduralMissionGenerators_busModeMissions
gameplay_missions_proceduralMissionGenerators_busModeMissions = {}

--- Generates the list of busMode missions for one or more levels (all if nil). Keeps only levels with at least one bus route. Places the trigger (startTrigger) on missionStartTriggerPos if it exists, otherwise on the bus spawn point, and fills missionTypeData.spawnPos / spawnRot.
---Source: lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua:32
---@param levelIdentifier string|table|nil Level name or list of names; nil = all levels.
---@return table  List of mission definitions (tables not saved to disk).
function gameplay_missions_proceduralMissionGenerators_busModeMissions.generate(levelIdentifier) end

