---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Procedural mission generator for "generatedTimeTrial" based on each level's quick races (quickraces). It loads scenario_quickRaceLoader, iterates over the tracks, converts those without a .race.json file (via gameplay/race/path:fromTrack) into a cache file in gameplay/temp/timeTrials/, then creates a mission with the race file, the prefabs (normal, forward, reverse), the preview and the trigger placed on the default start position.
--- Access: extension `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`: `extensions.load("gameplay_missions_proceduralMissionGenerators_timeTrialMissions")`, then the global `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`
---@class gameplay_missions_proceduralMissionGenerators_timeTrialMissions
gameplay_missions_proceduralMissionGenerators_timeTrialMissions = {}

--- Generates the "generatedTimeTrial" missions for one or more levels (all if nil) from scenario_quickRaceLoader.getQuickraceList. Writes cache files for the tracks to convert and logs the number of hidden missions.
---Source: lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua:74
---@param levelIdentifier string|table|nil Level name or list of names; nil = all levels.
---@return table  List of mission definitions.
function gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate(levelIdentifier) end

