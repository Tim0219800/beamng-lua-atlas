---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/positionGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objectif de scénario « position » (goals.vehicles avec id = 'position') : en fin de course, le véhicule doit se trouver dans la zone d'un objet du scenetree (par exemple une zone de freinage). La zone est définie par la distance au centre de l'objet endPoint, comparée à son scale.x.
--- Accès : extension `scenario_positionGoal` : `extensions.load("scenario_positionGoal")`, puis la globale `scenario_positionGoal`
---@class scenario_positionGoal
---@field instances table Liste des goals 'position' valides, remplie par init().
scenario_positionGoal = {}

--- Réinitialise instances et ajoute chaque goal id='position' ; purpose vaut 'fail' si absent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/positionGoal.lua:60
---@param scenario table Scénario courant.
function scenario_positionGoal.init(scenario) end

--- Appelé à chaque état du scénario. Sur 'onRaceResult', vérifie que le véhicule est dans la zone de l'objet endPoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/positionGoal.lua:38
---@param scenario table Scénario courant.
---@param state string Nom de l'état.
---@param stateData table Données de l'état (non utilisées).
function scenario_positionGoal.processState(scenario, state, stateData) end

--- Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/positionGoal.lua:78
---@param scenario table Scénario courant.
---@param instance table|nil Non utilisé.
function scenario_positionGoal.updateFinalStatus(scenario, instance) end

