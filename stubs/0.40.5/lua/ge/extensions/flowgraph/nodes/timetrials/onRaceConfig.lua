---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_timetrials_onRaceConfig_C
local flowgraph_nodes_timetrials_onRaceConfig_C = {}

--- done = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:29
function flowgraph_nodes_timetrials_onRaceConfig_C:_executionStarted() end

--- done = false, clearOutPinsOnStart = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:24
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_timetrials_onRaceConfig_C:init(mgr, ...) end

--- Hook de redémarrage : relit la configuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:46
function flowgraph_nodes_timetrials_onRaceConfig_C:onScenarioRestarted() end

--- Tant que non fait et qu'un scénario existe, copie ses réglages sur les pins.
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:33
function flowgraph_nodes_timetrials_onRaceConfig_C:work() end

