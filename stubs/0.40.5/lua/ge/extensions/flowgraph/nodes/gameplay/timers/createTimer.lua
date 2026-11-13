---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_timers_createTimer_C
local flowgraph_nodes_gameplay_timers_createTimer_C = {}

--- Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua:18
function flowgraph_nodes_gameplay_timers_createTimer_C:_executionStarted() end

--- Définit les valeurs prédéfinies du pin ref (dtSim, dtReal, dtRaw).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua:22
function flowgraph_nodes_gameplay_timers_createTimer_C:postInit() end

--- Appelle self.mgr.modules.timer:addTimer({duration, mode=ref}) et publie l'id sur timerId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua:26
function flowgraph_nodes_gameplay_timers_createTimer_C:workOnce() end

