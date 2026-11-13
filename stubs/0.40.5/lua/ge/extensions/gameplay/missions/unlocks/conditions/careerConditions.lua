---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks/conditions/careerConditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Types de condition de déblocage de missions liés à la carrière : niveau de branche (branchLevel) et ligue débloquée (league). Chargés par gameplay_missions_unlocks, qui appelle conditionMet(self) et getLabel(self) sur la table de condition.
--- Accès : extension `gameplay_missions_unlocks_conditions_careerConditions` : `extensions.load("gameplay_missions_unlocks_conditions_careerConditions")`, puis la globale `gameplay_missions_unlocks_conditions_careerConditions`
---@class gameplay_missions_unlocks_conditions_careerConditions
---@field branchLevel table Condition {type='branchLevel', branchId, level} : le joueur doit avoir au moins le niveau level dans la branche branchId (career_branches.getBranchLevelByPath). Champs : info, editorFunction ('displayBranchLevel'), getLabel, conditionMet.
---@field league table Condition {type='league', leagueId} : la ligue doit être débloquée (career_modules_branches_leagues.isLeagueUnlocked). Champs : info, editorFunction ('displayLeague'), getLabel, conditionMet.
gameplay_missions_unlocks_conditions_careerConditions = {}

