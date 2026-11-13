---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/goals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Évalue les objectifs (goals) du mode de livraison libre. À partir de delivery.goals, crée un objectif par entrée (types placement, playerInVehicle, engineRunning, coupled, unhitched, damage, distance), gère leurs prérequis (requires, logique ET) et leur état (active, completed), les réévalue à chaque frame en deux passes (complétion puis activation) et fournit l'avancement global et par objectif. Gère aussi le compte à rebours de fin automatique de 5 s quand tous les objectifs requis actifs sont remplis.
--- Accès : extension `gameplay_freeformDelivery_goals` : `extensions.load("gameplay_freeformDelivery_goals")`, puis la globale `gameplay_freeformDelivery_goals`
---@class gameplay_freeformDelivery_goals
---@field dependencies string[] gameplay_freeformDelivery_utils, core_trailerRespawn, core_vehicles, core_vehicleBridge.
gameplay_freeformDelivery_goals = {}

--- Indique si tous les objectifs d'une zone cible sont complétés (false s'il n'y en a aucun).
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:771
---@param areaId string Id de la zone cible.
---@return boolean  true si tous complétés.
function gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId) end

--- Nettoyage complet : vide objectifs, états, caches, requêtes en attente, le cache de véhicules d'utils et le message de fin.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:884
function gameplay_freeformDelivery_goals.cleanup() end

--- Renvoie tous les objectifs créés, actifs ou non, indexés par id.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:732
---@return table<string, table>  Tous les objectifs.
function gameplay_freeformDelivery_goals.getAllGoals() end

--- Renvoie le temps restant du compte à rebours de fin.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:871
---@return number|nil  Secondes restantes, nil s'il n'est pas lancé.
function gameplay_freeformDelivery_goals.getCompletionTimer() end

--- Renvoie l'avancement détaillé d'un objectif : pour un placement multi-véhicules {total, requiredAmount, inArea, partial, complete}, sinon {total = 1, inArea, partial = false, complete}.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:740
---@param goalId string Id de l'objectif.
---@return table|nil  Avancement, nil si l'objectif n'existe pas.
function gameplay_freeformDelivery_goals.getGoalProgress(goalId) end

--- Renvoie l'état d'un objectif.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:736
---@param goalId string Id de l'objectif.
---@return table|nil  {completed, lastCheck, active}
function gameplay_freeformDelivery_goals.getGoalState(goalId) end

--- Renvoie seulement les objectifs actifs (prérequis remplis), indexés par id.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:720
---@return table<string, table>  Objectifs actifs.
function gameplay_freeformDelivery_goals.getGoals() end

--- Liste les objectifs liés à une zone cible.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:751
---@param targetAreaId string Id de la zone cible.
---@return table[]  Tableau d'objectifs.
function gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId) end

--- Liste les objectifs d'un type donné.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:761
---@param goalType string placement, playerInVehicle, engineRunning, coupled, unhitched, damage ou distance.
---@return table[]  Tableau d'objectifs.
function gameplay_freeformDelivery_goals.getGoalsByType(goalType) end

--- Compte les objectifs actifs et complétés, avec la part des objectifs requis.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:692
---@return table  {total, completed, required, requiredCompleted, allRequiredComplete}
function gameplay_freeformDelivery_goals.getProgress() end

--- Retire le message de fin de la tasklist et arrête le compte à rebours, mais garde objectifs et états pour l'évaluation des résultats.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:876
function gameplay_freeformDelivery_goals.hideFromTasklist() end

--- Indique si la distance maximale d'un objectif de type distance dépasse 90 % de son warningThreshold (pour afficher un avertissement).
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:280
---@param goal table Objectif de type distance (vehicleListA, vehicleListB, warningThreshold).
---@return boolean  true si l'avertissement doit être actif.
function gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal) end

--- Indique si les prérequis d'un objectif sont remplis.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:746
---@param goalId string Id de l'objectif.
---@return boolean  true si actif.
function gameplay_freeformDelivery_goals.isGoalActive(goalId) end

--- Réinitialise objectifs, états et caches, pré-remplit le cache des zones cibles et de leurs objets de site, crée les objectifs de delivery.goals et calcule l'activation initiale selon les prérequis.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:492
---@param delivery table Livraison chargée (goals, targetAreas, sites).
function gameplay_freeformDelivery_goals.setup(delivery) end

--- À appeler à chaque frame : met à jour le cache de position des véhicules concernés, évalue la complétion de chaque objectif actif (passe 1) puis recalcule l'activation (passe 2).
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:553
---@param dtReal number Delta temps réel (inutilisé).
---@param dtSim number Delta temps simulé (inutilisé).
---@param dtRaw number Delta temps brut (inutilisé).
---@param profiler table|nil LuaProfiler facultatif.
function gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler) end

--- Gère le compte à rebours de fin automatique : le démarre quand tous les objectifs requis actifs sont complétés (message dans la tasklist), l'annule si l'un redevient incomplet, et renvoie true quand il atteint 0.
---Source : lua/ge/extensions/gameplay/freeformDelivery/goals.lua:826
---@param dtReal number Delta temps réel en secondes.
---@return boolean  true quand la livraison doit se terminer.
function gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal) end

