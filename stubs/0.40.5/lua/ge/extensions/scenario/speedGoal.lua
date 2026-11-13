---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/speedGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- But de scénario « speed » : surveille la vitesse d'un véhicule et gagne ou échoue quand elle reste hors de la plage [minSpeed, maxSpeed] plus de maxTimeout secondes. Chargé par scenario_raceGoals qui appelle init, processState et updateFinalStatus ; un scénario le déclare dans goals.vehicles avec id 'speed'.
--- Accès : extension `scenario_speedGoal` : `extensions.load("scenario_speedGoal")`, puis la globale `scenario_speedGoal`
---@class scenario_speedGoal
---@field instances table<integer, table> Instances du but 'speed' actives pour le scénario courant, remplies par init.
scenario_speedGoal = {}

--- Appelée par scenario_raceGoals au démarrage : reconstruit M.instances à partir de scenario.goals.vehicles (entrées id == 'speed'), valide les types (minSpeed, maxSpeed, delay nombres ; wayPointNum tableau ; purpose chaîne), met maxTimeout à 0 et purpose à 'fail' par défaut, et Timeout à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/speedGoal.lua:98
---@param scenario table scénario courant
function scenario_speedGoal.init(scenario) end

--- Appelée par scenario_raceGoals à chaque évènement de course ; n'agit que pour state == 'onRaceTick' : vérifie la vitesse des véhicules concernés (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/speedGoal.lua:58
---@param scenario table scénario courant
---@param state string nom du hook : 'onRaceStart','onRaceInit','onRaceWaypointReached','onRaceTick','onRaceResult','onCountdownEnded'
---@param stateData table|nil données du hook (non utilisées ici)
function scenario_speedGoal.processState(scenario, state, stateData) end

--- Appelée en fin de scénario : publie dans statistics_statistics le statut (passed/failed) de chaque instance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/speedGoal.lua:140
---@param scenario table scénario courant
---@param instance table non utilisé (déduit du code)
function scenario_speedGoal.updateFinalStatus(scenario, instance) end

