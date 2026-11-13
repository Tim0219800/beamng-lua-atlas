---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/damageGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objectif de scénario « damage » (goals.vehicles avec id = 'damage'). Il surveille le dégât du véhicule (map.objects[...].damage) à chaque tick de course et fait gagner ou perdre le scénario quand le dégât dépasse damageLimit. Il est appelé par le système de goals de scenario_scenarios (init au chargement, processState à chaque état, updateFinalStatus à la fin).
--- Accès : extension `scenario_damageGoal` : `extensions.load("scenario_damageGoal")`, puis la globale `scenario_damageGoal`
---@class scenario_damageGoal
---@field instances table Liste des goals 'damage' valides, remplie par init().
scenario_damageGoal = {}

--- Réinitialise instances et y ajoute chaque goal id='damage' de scenario.goals.vehicles après vérification des types (purpose vaut 'fail' si absent, lastProgress initialisé à 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/damageGoal.lua:68
---@param scenario table Table du scénario courant.
function scenario_damageGoal.init(scenario) end

--- Appelé par le système de goals à chaque changement d'état du scénario. Sur 'onRaceTick', compare le dégât du véhicule à damageLimit, affiche la progression et termine le scénario (scenario_scenarios.finish) en victoire ou défaite selon purpose.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/damageGoal.lua:36
---@param scenario table Scénario courant (scenario.timer sert à formater le temps).
---@param state string Nom de l'état ; seul 'onRaceTick' est traité.
---@param stateData table Données de l'état (non utilisées).
function scenario_damageGoal.processState(scenario, state, stateData) end

--- Enregistre le résultat de chaque instance dans statistics_statistics.setGoalProgress en fin de scénario.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/damageGoal.lua:95
---@param scenario table Scénario courant.
---@param instance table|nil Non utilisé : la boucle parcourt M.instances.
function scenario_damageGoal.updateFinalStatus(scenario, instance) end

