---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/waypointAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- But de scénario « wayPointAction » : affiche un message à l'écran quand un véhicule atteint certains waypoints de la course. Chargé par scenario_raceGoals (init, processState, updateFinalStatus) ; déclaré dans goals.vehicles avec id 'wayPointAction'.
--- Accès : extension `scenario_waypointAction` : `extensions.load("scenario_waypointAction")`, puis la globale `scenario_waypointAction`
---@class scenario_waypointAction
---@field instances table<integer, table> Instances du but 'wayPointAction' pour le scénario courant, remplies par init.
scenario_waypointAction = {}

--- Reconstruit M.instances à partir de scenario.goals.vehicles (id == 'wayPointAction') après validation du type de wayPointNum (tableau).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypointAction.lua:38
---@param scenario table scénario courant
function scenario_waypointAction.init(scenario) end

--- Appelée par scenario_raceGoals ; ne réagit qu'à 'onRaceWaypointReached' pendant la course et affiche le message du waypoint atteint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypointAction.lua:9
---@param scenario table scénario courant
---@param state string nom du hook
---@param stateData table|nil données du hook (non utilisées)
function scenario_waypointAction.processState(scenario, state, stateData) end

--- Appelée en fin de scénario ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypointAction.lua:55
---@param scenario table scénario courant
---@param instance table non utilisé
function scenario_waypointAction.updateFinalStatus(scenario, instance) end

