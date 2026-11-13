---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/nomoveGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objectif de scénario « nomove » (goals.vehicles avec id = 'nomove') : le véhicule ne doit pas bouger de plus de 0.1 m par rapport à sa position de départ. Appelé par le système de goals de scenario_scenarios.
--- Accès : extension `scenario_nomoveGoal` : `extensions.load("scenario_nomoveGoal")`, puis la globale `scenario_nomoveGoal`
---@class scenario_nomoveGoal
---@field instances table Liste des goals 'nomove' valides, remplie par init().
scenario_nomoveGoal = {}

--- Réinitialise instances et ajoute chaque goal id='nomove' dont le véhicule existe, en mémorisant sa position de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/nomoveGoal.lua:45
---@param scenario table Scénario courant.
function scenario_nomoveGoal.init(scenario) end

--- Appelé à chaque état du scénario. Met à jour la position de départ sur 'onCountdownEnded' puis vérifie l'immobilité sur 'onRaceTick' et 'onRaceResult'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/nomoveGoal.lua:9
---@param scenario table Scénario courant.
---@param state string Nom de l'état.
---@param stateData table Données de l'état (non utilisées).
function scenario_nomoveGoal.processState(scenario, state, stateData) end

--- Sauf si triggerEndOnly, envoie le résultat à statistics_statistics.setGoalProgress pour le véhicule du goal et pour le véhicule du joueur 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/nomoveGoal.lua:61
---@param scenario table Scénario courant.
---@param instance table|nil Non utilisé.
function scenario_nomoveGoal.updateFinalStatus(scenario, instance) end

