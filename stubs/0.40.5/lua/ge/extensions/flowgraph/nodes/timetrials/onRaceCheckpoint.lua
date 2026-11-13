---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_timetrials_onRaceCheckpoint_C
local flowgraph_nodes_timetrials_onRaceCheckpoint_C = {}

--- Remet lap = 1 et enterFlag = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:35
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:_executionStarted() end

--- Initialise enterFlag, lap = 1 et clearOutPinsOnStart = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:29
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:init(mgr, ...) end

--- Hook : mémorise vehId, index (data.cur) et met à jour le tour (data.lapDiff).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:40
---@param data any table {vehId, cur, lapDiff}
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:onRaceWaypointReached(data) end

--- Hook de redémarrage du scénario : réinitialise le noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:53
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:onScenarioRestarted() end

--- Écrit checked = enterFlag puis le remet à false.
---Source : lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:48
---@param args any non utilisé
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:work(args) end

