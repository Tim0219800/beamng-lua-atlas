---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_timers_simpleTimer_C
local flowgraph_nodes_gameplay_timers_simpleTimer_C = {}

--- Met l'état de durée à 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:25
function flowgraph_nodes_gameplay_timers_simpleTimer_C:_executionStarted() end

--- Remet le temps écoulé du timer à 0 et l'état de durée à 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:33
function flowgraph_nodes_gameplay_timers_simpleTimer_C:onNodeReset() end

--- Définit les valeurs prédéfinies du pin ref (dtSim, dtReal, dtRaw).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:29
function flowgraph_nodes_gameplay_timers_simpleTimer_C:postInit() end

--- Met à jour elapsed/remaining/duration/elapsedPercent, passe à 'finished' quand le timer est complet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:47
function flowgraph_nodes_gameplay_timers_simpleTimer_C:work() end

--- Crée le timer via self.mgr.modules.timer:addTimer, publie timerId et passe l'état de durée à 'started'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:42
function flowgraph_nodes_gameplay_timers_simpleTimer_C:workOnce() end

