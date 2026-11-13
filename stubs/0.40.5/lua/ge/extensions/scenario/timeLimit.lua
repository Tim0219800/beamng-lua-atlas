---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/timeLimit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- But de scénario « timeLimit » : le scénario doit être terminé en moins de maxTime secondes. Chargé par scenario_raceGoals (init, processState, updateFinalStatus) ; déclaré dans goals.vehicles avec id 'timeLimit'. Peut afficher un compte à rebours sur les dernières secondes et échoue si le temps est dépassé.
--- Accès : extension `scenario_timeLimit` : `extensions.load("scenario_timeLimit")`, puis la globale `scenario_timeLimit`
---@class scenario_timeLimit
---@field instances table<integer, table> Instances du but 'timeLimit' pour le scénario courant, remplies par init.
scenario_timeLimit = {}

--- Reconstruit M.instances à partir de scenario.goals.vehicles (id == 'timeLimit') après validation des types de maxTime/waitTime/countdown ; instance.wait reçoit countdown.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/timeLimit.lua:55
---@param scenario table scénario courant
function scenario_timeLimit.init(scenario) end

--- Appelée par scenario_raceGoals à chaque évènement : gère 'onRaceTick' (compte à rebours et dépassement de maxTime + waitTime) et 'onRaceResult' (comparaison du temps final à maxTime).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/timeLimit.lua:21
---@param scenario table scénario courant
---@param state string nom du hook
---@param stateData table|nil données du hook (non utilisées)
function scenario_timeLimit.processState(scenario, state, stateData) end

--- Appelée en fin de scénario : publie le statut de chaque instance dans statistics_statistics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/timeLimit.lua:76
---@param scenario table scénario courant
---@param instance table non utilisé (déduit du code)
function scenario_timeLimit.updateFinalStatus(scenario, instance) end

