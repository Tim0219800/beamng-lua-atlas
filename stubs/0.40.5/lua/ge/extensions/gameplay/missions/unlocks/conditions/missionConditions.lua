---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mission unlock condition types based on the progress of other missions: missionPassed (passed) and missionCompleted (completed). They read mission.saveData.progress[key].aggregate. The progress key can be 'default' (or empty), 'any' (any of them) or a specific key.
--- Access: extension `gameplay_missions_unlocks_conditions_missionConditions`: `extensions.load("gameplay_missions_unlocks_conditions_missionConditions")`, then the global `gameplay_missions_unlocks_conditions_missionConditions`
---@class gameplay_missions_unlocks_conditions_missionConditions
---@field missionCompleted table Condition {type='missionCompleted', missionId, progressKey}: true if aggregate.completed is true. editorFunction 'displayMissionConditionWithProgressKey'.
---@field missionPassed table Condition {type='missionPassed', missionId, progressKey}: true if aggregate.passed is true. editorFunction 'displayMissionCondition'.
gameplay_missions_unlocks_conditions_missionConditions = {}

--- Local helper table (not exported) used by missionPassed and missionCompleted.
---@class gameplay_missions_unlocks_conditions_missionConditions_F
local gameplay_missions_unlocks_conditions_missionConditions_F = {}

--- Checks whether, for the given mission, at least one of the progress keys has the aggregate[field] field true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua:8
---@param id string Mission id.
---@param progressKey string|nil 'default'/nil/'' = defaultProgressKey, 'any' = all keys, otherwise a specific key.
---@param field string Field of aggregate to test (passed, completed...).
---@return boolean  true if a key satisfies the field.
function gameplay_missions_unlocks_conditions_missionConditions_F.checkAggregateWithKey(id, progressKey, field) end

--- Builds the condition's translatable label (keys missions.missions.unlock.<verb>.default|any|custom).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua:28
---@param id string Mission id.
---@param progressKey string|nil Progress key.
---@param verb string 'pass' or 'complete'.
---@return table|string  {txt, context} or error text 'Missing Mission: ...'.
function gameplay_missions_unlocks_conditions_missionConditions_F.getTargetLabel(id, progressKey, verb) end

