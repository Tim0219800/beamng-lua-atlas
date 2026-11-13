---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_timetrials_onRaceRestarted_C
local flowgraph_nodes_timetrials_onRaceRestarted_C = {}

--- restart = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:27
function flowgraph_nodes_timetrials_onRaceRestarted_C:_executionStarted() end

--- restart = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:23
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_timetrials_onRaceRestarted_C:init(mgr, ...) end

--- Hook de redémarrage du scénario : restart = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:36
function flowgraph_nodes_timetrials_onRaceRestarted_C:onScenarioRestarted() end

--- Écrit pinOut.restart avec self.started, puis restart = false.
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:31
function flowgraph_nodes_timetrials_onRaceRestarted_C:work() end

