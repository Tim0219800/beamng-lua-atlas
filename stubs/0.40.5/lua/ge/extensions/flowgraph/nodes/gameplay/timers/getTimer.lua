---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_timers_getTimer_C
local flowgraph_nodes_gameplay_timers_getTimer_C = {}

--- Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.lua:26
function flowgraph_nodes_gameplay_timers_getTimer_C:_executionStarted() end

--- Si le timer existe, remplit les sorties et déclenche completed une seule fois à la fin ; sinon flow reste false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.lua:30
function flowgraph_nodes_gameplay_timers_getTimer_C:work() end

