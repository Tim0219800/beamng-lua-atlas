---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceGoals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Distributeur des objectifs (goals) d'un scénario. À l'initialisation il lit les goals déclarés dans scenario.vehicles[nom].goal du JSON, crée scenario.goals.vehicles, valide les options avec un schéma, charge dynamiquement le module de chaque goal ('scenario/<id>' ou 'scenario/<id>goal') et appelle son init. Ensuite il relaie les évènements de course (onRaceInit, onRaceStart, onRaceTick, onRaceWaypointReached, onRaceResult, onCountdownEnded) vers goal.processState(scenario, nomEtat, données).
--- Accès : extension `scenario_raceGoals` : `extensions.load("scenario_raceGoals")`, puis la globale `scenario_raceGoals`
---@class scenario_raceGoals
---@field onRaceEnd any
---@field state table {goals = {}} : table nom de goal -> module chargé, remplie par initialiseGoals.
scenario_raceGoals = {}

--- Construit scenario.goals.vehicles à partir des véhicules du scénario (scenario.vehicleNameToId), valide le schéma, charge les modules de goals et appelle init sur chacun, puis émet le hook onRaceGoalsInitilised.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:128
function scenario_raceGoals.initialiseGoals() end

--- Hook appelé à la fin du compte à rebours : relaie 'onCountdownEnded' aux goals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:240
function scenario_raceGoals.onCountdownEnded() end

--- Hook de course : relaie l'état 'onRaceInit' à tous les goals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:201
function scenario_raceGoals.onRaceInit() end

--- Hook appelé à la fin de la course : enregistre scenario.finalStatus et relaie 'onRaceResult' aux goals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:229
---@param status table Résultat final de la course.
function scenario_raceGoals.onRaceResult(status) end

--- Hook de course : relaie l'état 'onRaceStart' à tous les goals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:192
function scenario_raceGoals.onRaceStart() end

--- Hook appelé périodiquement pendant la course : relaie 'onRaceTick' avec {raceTickTime, scenarioTimer} à tous les goals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:219
---@param raceTickTime number Temps du tick de course.
---@param scenarioTimer number Chronomètre du scénario.
function scenario_raceGoals.onRaceTick(raceTickTime, scenarioTimer) end

--- Hook appelé quand un véhicule atteint un waypoint : relaie 'onRaceWaypointReached' avec les données reçues aux goals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:210
---@param data table Données du waypoint (vehicleId, next, time...).
function scenario_raceGoals.onRaceWaypointReached(data) end

--- Appelle updateFinalStatus(scenario) sur chaque goal chargé, pour enregistrer les résultats finaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceGoals.lua:182
function scenario_raceGoals.updateGoalsFinalStatus() end

