---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/finishRaceGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objectif de scénario « finishRace » (goals.vehicles avec id = 'finishRace') : le véhicule doit terminer la course. Il écoute le dernier waypoint atteint, puis, à l'état 'onRaceResult', termine le scénario en réussite ou en échec.
--- Accès : extension `scenario_finishRaceGoal` : `extensions.load("scenario_finishRaceGoal")`, puis la globale `scenario_finishRaceGoal`
---@class scenario_finishRaceGoal
---@field instances table Liste des goals 'finishRace', remplie par init().
scenario_finishRaceGoal = {}

--- Réinitialise instances et ajoute chaque goal id='finishRace' en remettant status.result à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/finishRaceGoal.lua:66
---@param scenario table Scénario courant.
function scenario_finishRaceGoal.init(scenario) end

--- Appelé à chaque état du scénario. Traite 'onRaceWaypointReached' (stateData.next, stateData.vehicleId) et 'onRaceResult'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/finishRaceGoal.lua:31
---@param scenario table Scénario courant.
---@param state string Nom de l'état.
---@param stateData table Pour 'onRaceWaypointReached' : next (prochain waypoint, nil si dernier) et vehicleId.
function scenario_finishRaceGoal.processState(scenario, state, stateData) end

--- Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress en fin de scénario.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/finishRaceGoal.lua:76
---@param scenario table Scénario courant.
function scenario_finishRaceGoal.updateFinalStatus(scenario) end

