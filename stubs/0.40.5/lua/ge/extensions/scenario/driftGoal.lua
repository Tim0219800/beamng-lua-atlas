---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/driftGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objectif de scénario « drift » (goals.vehicles avec id = 'drift'). Il calcule un score de dérive à partir de l'écart entre la direction du véhicule (dirVec) et celle de sa vitesse (vel), avec combos et messages d'encouragement affichés via scenariohelper.realTimeUiDisplay. Le scénario se termine quand le temps imparti (timeAllowance) est dépassé ou à l'état 'onRaceResult'.
--- Accès : extension `scenario_driftGoal` : `extensions.load("scenario_driftGoal")`, puis la globale `scenario_driftGoal`
---@class scenario_driftGoal
---@field instances table Liste des goals 'drift' valides, remplie par init().
scenario_driftGoal = {}

--- Réinitialise instances et l'état de dérive ; ajoute chaque goal id='drift' (minDrift et maxDrift doivent être numériques) avec driftScore = 0 et status.completed = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/driftGoal.lua:118
---@param scenario table Scénario courant.
function scenario_driftGoal.init(scenario) end

--- Appelé à chaque état du scénario : met à jour le score de dérive du véhicule d'après map.objects, affiche le message temps réel, et termine le scénario (sessionEnd) sur 'onRaceResult' ou si timeAllowance est dépassé. Réactive le suivi mapmgr si le véhicule n'est pas encore dans map.objects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/driftGoal.lua:53
---@param scenario table Scénario courant (scenario.timer).
---@param state string Nom de l'état ; 'onRaceResult' termine la session.
---@param stateData table Données de l'état (non utilisées).
function scenario_driftGoal.processState(scenario, state, stateData) end

--- Fixe passed ou failed selon driftScore >= minDrift et envoie points (driftScore) et maxPoints (maxDrift) à statistics_statistics.setGoalProgress.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/driftGoal.lua:147
---@param scenario table Scénario courant.
---@param instance table|nil Non utilisé.
function scenario_driftGoal.updateFinalStatus(scenario, instance) end

