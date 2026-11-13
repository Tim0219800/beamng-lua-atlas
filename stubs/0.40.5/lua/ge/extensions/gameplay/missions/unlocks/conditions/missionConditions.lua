---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Types de condition de déblocage fondés sur la progression d'autres missions : missionPassed (réussie) et missionCompleted (complétée). Elles lisent mission.saveData.progress[clé].aggregate. La clé de progression peut être 'default' (ou vide), 'any' (n'importe laquelle) ou une clé précise.
--- Accès : extension `gameplay_missions_unlocks_conditions_missionConditions` : `extensions.load("gameplay_missions_unlocks_conditions_missionConditions")`, puis la globale `gameplay_missions_unlocks_conditions_missionConditions`
---@class gameplay_missions_unlocks_conditions_missionConditions
---@field missionCompleted table Condition {type='missionCompleted', missionId, progressKey} : vraie si aggregate.completed est vrai. editorFunction 'displayMissionConditionWithProgressKey'.
---@field missionPassed table Condition {type='missionPassed', missionId, progressKey} : vraie si aggregate.passed est vrai. editorFunction 'displayMissionCondition'.
gameplay_missions_unlocks_conditions_missionConditions = {}

--- Table locale d'aides (non exportée) utilisée par missionPassed et missionCompleted.
---@class gameplay_missions_unlocks_conditions_missionConditions_F
local gameplay_missions_unlocks_conditions_missionConditions_F = {}

--- Vérifie si, pour la mission donnée, au moins une des clés de progression a le champ aggregate[field] vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua:8
---@param id string Id de la mission.
---@param progressKey string|nil 'default'/nil/'' = defaultProgressKey, 'any' = toutes les clés, sinon une clé précise.
---@param field string Champ de aggregate à tester (passed, completed…).
---@return boolean  true si une clé satisfait le champ.
function gameplay_missions_unlocks_conditions_missionConditions_F.checkAggregateWithKey(id, progressKey, field) end

--- Construit le label traduisible de la condition (clés missions.missions.unlock.<verb>.default|any|custom).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua:28
---@param id string Id de la mission.
---@param progressKey string|nil Clé de progression.
---@param verb string 'pass' ou 'complete'.
---@return table|string  {txt, context} ou texte d'erreur 'Missing Mission: …'.
function gameplay_missions_unlocks_conditions_missionConditions_F.getTargetLabel(id, progressKey, verb) end

