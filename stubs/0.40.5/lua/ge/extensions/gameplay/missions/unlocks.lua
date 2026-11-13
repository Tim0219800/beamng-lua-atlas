---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE qui évalue les conditions de déblocage et de visibilité des missions (champs startCondition et visibleCondition). Au chargement, elle charge tous les types de condition du dossier gameplay/missions/unlocks/conditions/. Elle construit aussi des caches : mission précédentes (backward), missions suivantes (forward), profondeur dans l'arbre et niveau de branche de carrière requis. Un moddeur s'en sert pour savoir si une mission est démarrable/visible ou pour forcer ces états.
--- Accès : extension `gameplay_missions_unlocks` : `extensions.load("gameplay_missions_unlocks")`, puis la globale `gameplay_missions_unlocks`
---@class gameplay_missions_unlocks
---@field startConditionMet nil Exporté depuis une variable non définie : vaut toujours nil.
gameplay_missions_unlocks = {}

--- Vide le cache d'état ainsi que les caches backward et forward.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:478
function gameplay_missions_unlocks.clearCache() end

--- Vide le cache d'état démarrable/visible (et celui des ligues de carrière si présent).
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:471
function gameplay_missions_unlocks.clearUnlockStatusCache() end

--- Évalue récursivement une condition. Cherche le type dans les types chargés (retombe sur 'missing' si inconnu), appelle sa conditionMet et son getLabel.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:16
---@param condition table Condition avec un champ type (ex. missionPassed, branchLevel, multiAnd) et ses paramètres.
---@return table  {met = boolean, condition = table, nested = table|nil (résultats des sous-conditions), label = string|table, hidden = boolean|nil}
function gameplay_missions_unlocks.conditionMet(condition) end

--- Assemble le champ unlocks d'une mission.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:399
---@param mission table Mission.
---@return table  {startable, visible, startableDetails, backward, forward, maxBranchLevel, branchTags, depth}
function gameplay_missions_unlocks.constructUnlocksField(mission) end

--- Comparateur pour table.sort sur des missions : par profondeur croissante puis par id.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:450
---@param a table Mission.
---@param b table Mission.
---@return boolean  true si a doit précéder b.
function gameplay_missions_unlocks.depthIdSort(a, b) end

--- Comme depthIdSort mais à partir d'ids de missions. Renvoie false si l'une des missions n'existe pas.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:459
---@param aId string Id de mission.
---@param bId string Id de mission.
---@return boolean  true si a doit précéder b.
function gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId) end

--- Ids des missions requises par la startCondition de cette mission (mis en cache).
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:363
---@param mission table Mission.
---@return string[]  Liste d'ids.
function gameplay_missions_unlocks.getBackwardMissionIds(mission) end

--- Collecte récursivement les niveaux de branche de carrière exigés (conditions branchLevel, et league via la branche de la ligue, niveau 1).
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:112
---@param cond table Condition à parcourir.
---@param list table<string, integer> Table branchId -> niveau, remplie en place.
function gameplay_missions_unlocks.getBranchLevelForCondition(cond, list) end

--- Informations vers l'avant : missions débloquées, niveau de branche max, étiquettes de branche et profondeur. Reconstruit le cache complet si besoin (charge toutes les missions).
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:374
---@param mission table Mission.
---@return table  {forwardIds = string[], maxBranchLevel = integer, branchTags = table<string, boolean>, depth = integer}
function gameplay_missions_unlocks.getForwardMissionInfo(mission) end

--- Pour une mission, liste les missions directement débloquées par elle (forwardIds), avec leur état démarrable et si elles ont changé dans diff.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:82
---@param mission table Mission source.
---@param diff table Résultat de getUnlockDiff (utilise diff.byId).
---@return table  {list = {{missionId, changed, startable}}}
function gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff) end

--- Collecte récursivement les ids de missions référencés par les conditions missionPassed et missionCompleted.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:98
---@param cond table Condition (parcourt cond.nested).
---@param list string[] Liste remplie en place.
function gameplay_missions_unlocks.getMissionsForCondition(cond, list) end

--- Construit une table plate (id de mission -> copie profonde de constructUnlocksField) pour comparer l'état de déblocage avant/après une action.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:33
---@return table<string, table>  Données de déblocage par id de mission.
function gameplay_missions_unlocks.getSimpleUnlockedStatus() end

--- Détails (mis en cache) de l'évaluation de startCondition. Renvoie nil pour une mission présente en carrière et en freeroam quand la carrière n'est pas active.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:277
---@param mission table Mission.
---@return table|nil  Résultat de conditionMet (met, label, nested…).
function gameplay_missions_unlocks.getStartableDetails(mission) end

--- Compare deux résultats de getSimpleUnlockedStatus sur les clés startable et visible.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:58
---@param before table État avant.
---@param after table État après.
---@return table  {list = {{missionId, change = {{key, old, new}}}}, byId = table, missionsList = {{name, id}} (missions devenues démarrables)}
function gameplay_missions_unlocks.getUnlockDiff(before, after) end

--- Indique si la mission est démarrable. Un override posé par overrideStartable prime, sinon le résultat de startCondition est utilisé.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:296
---@param mission table Mission.
---@return boolean  true si démarrable.
function gameplay_missions_unlocks.isMissionStartable(mission) end

--- Indique si la mission est visible (selon le mode carrière/freeroam et visibleCondition). Un override posé par overrideVisible prime. Résultat mis en cache.
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:346
---@param mission table Mission.
---@return boolean  true si visible.
function gameplay_missions_unlocks.isMissionVisible(mission) end

--- Hook appelé au chargement de l'extension : charge tous les fichiers de /lua/ge/extensions/gameplay/missions/unlocks/conditions et enregistre chaque type de condition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:435
function gameplay_missions_unlocks.onExtensionLoaded() end

--- Force l'état démarrable d'une mission (nil pour retirer l'override).
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:391
---@param mission table Mission.
---@param value boolean|nil Valeur forcée.
function gameplay_missions_unlocks.overrideStartable(mission, value) end

--- Force la visibilité d'une mission (nil pour retirer l'override).
---Source : lua/ge/extensions/gameplay/missions/unlocks.lua:395
---@param mission table Mission.
---@param value boolean|nil Valeur forcée.
function gameplay_missions_unlocks.overrideVisible(mission, value) end

