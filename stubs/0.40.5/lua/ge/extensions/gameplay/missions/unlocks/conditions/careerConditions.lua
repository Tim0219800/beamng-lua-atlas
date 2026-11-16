---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks/conditions/careerConditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career-related mission unlock condition types: branch level (branchLevel) and unlocked league (league). Loaded by gameplay_missions_unlocks, which calls conditionMet(self) and getLabel(self) on the condition table.
--- Access: extension `gameplay_missions_unlocks_conditions_careerConditions`: `extensions.load("gameplay_missions_unlocks_conditions_careerConditions")`, then the global `gameplay_missions_unlocks_conditions_careerConditions`
---@class gameplay_missions_unlocks_conditions_careerConditions
---@field branchLevel table Condition {type='branchLevel', branchId, level}: the player must have at least level `level` in branch branchId (career_branches.getBranchLevelByPath). Fields: info, editorFunction ('displayBranchLevel'), getLabel, conditionMet.
---@field league table Condition {type='league', leagueId}: the league must be unlocked (career_modules_branches_leagues.isLeagueUnlocked). Fields: info, editorFunction ('displayLeague'), getLabel, conditionMet.
gameplay_missions_unlocks_conditions_careerConditions = {}

