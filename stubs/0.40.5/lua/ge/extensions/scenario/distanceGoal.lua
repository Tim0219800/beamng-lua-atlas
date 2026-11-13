---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/distanceGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objectif de scénario « distance » (goals.vehicles avec id = 'distance') : la distance entre le véhicule du goal et un objet cible du scenetree ne doit pas sortir de [minDistance, maxDistance]. Utile pour des scénarios de poursuite ou de convoi. Appelé par le système de goals de scenario_scenarios.
--- Accès : extension `scenario_distanceGoal` : `extensions.load("scenario_distanceGoal")`, puis la globale `scenario_distanceGoal`
---@class scenario_distanceGoal
---@field instances table Liste des goals 'distance' valides, remplie par init().
scenario_distanceGoal = {}

--- Réinitialise instances et ajoute chaque goal id='distance' dont les options numériques sont valides ; purpose vaut 'fail' si absent ; checkForCarDistance est mis à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/distanceGoal.lua:88
---@param scenario table Scénario courant.
function scenario_distanceGoal.init(scenario) end

--- Appelé à chaque état du scénario ; sur 'onRaceTick' mesure la distance au véhicule cible et termine le scénario (victoire ou défaite selon purpose) si elle sort des bornes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/distanceGoal.lua:37
---@param scenario table Scénario courant.
---@param state string Nom de l'état ; 'onRaceTick' traité.
---@param stateData table Données de l'état (non utilisées).
function scenario_distanceGoal.processState(scenario, state, stateData) end

--- Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress en fin de scénario.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/distanceGoal.lua:118
---@param scenario table Scénario courant.
---@param instance table|nil Non utilisé.
function scenario_distanceGoal.updateFinalStatus(scenario, instance) end

