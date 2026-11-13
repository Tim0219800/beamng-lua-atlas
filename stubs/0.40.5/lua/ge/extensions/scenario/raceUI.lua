---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre la course de scénario et l'interface : envoie à l'UI la progression des waypoints (WayPointChange), des tours (RaceLapChange) et les comparaisons de temps avec le tour précédent (RaceCheckpointComparison, RaceTimeComparison). Ne réagit qu'aux évènements du véhicule du joueur 0.
--- Accès : extension `scenario_raceUI` : `extensions.load("scenario_raceUI")`, puis la globale `scenario_raceUI`
---@class scenario_raceUI
scenario_raceUI = {}

--- Vide les temps de waypoints mémorisés et efface côté UI les affichages de waypoint et de tour.
---Source : lua/ge/extensions/scenario/raceUI.lua:10
---@param scenario table Scénario (non utilisé).
function scenario_raceUI.initialise(scenario) end

--- Hook appelé à chaque tour terminé. Pour le véhicule du joueur, met à jour le numéro de tour (plafonné à lapCount), remet la progression de waypoint à fond et affiche le temps du tour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceUI.lua:70
---@param data table Données du tour : vehicleId, lap, time (secondes).
function scenario_raceUI.onRaceLap(data) end

--- Hook de début de course : envoie WayPointChange {current = 0, count = N} si la configuration de tour a plus d'un waypoint, et RaceLapChange {current = 1, count = lapCount} si lapCount > 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceUI.lua:17
function scenario_raceUI.onRaceStart() end

--- Hook appelé à chaque waypoint atteint. Pour le véhicule du joueur, mémorise le temps, émet les comparaisons de temps avec le tour précédent et met à jour la progression de waypoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceUI.lua:38
---@param data table Données du waypoint : vehicleId, time, cur, currentLapConfig.
function scenario_raceUI.onRaceWaypointReached(data) end

--- Hook de changement d'état du scénario : efface l'affichage de waypoint quand le scénario est absent ou en 'pre-start'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceUI.lua:30
---@param scenario table|nil Scénario courant.
function scenario_raceUI.onScenarioChange(scenario) end

