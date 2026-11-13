---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_timetrials_onRaceComplete_C
local flowgraph_nodes_timetrials_onRaceComplete_C = {}

--- complete = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:27
function flowgraph_nodes_timetrials_onRaceComplete_C:_executionStarted() end

--- complete = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:23
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_timetrials_onRaceComplete_C:init(mgr, ...) end

--- Hook de fin de scénario : marque la course comme terminée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:37
function flowgraph_nodes_timetrials_onRaceComplete_C:onScenarioFinished() end

--- Hook de redémarrage : réinitialise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:41
function flowgraph_nodes_timetrials_onRaceComplete_C:onScenarioRestarted() end

--- Écrit complete et ongoing.
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:32
function flowgraph_nodes_timetrials_onRaceComplete_C:work() end

