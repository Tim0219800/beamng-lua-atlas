---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_loop_loopInit_C
local flowgraph_nodes_gameplay_rally_loop_loopInit_C = {}

--- Décharge l'extension rally loop si chargée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:30
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:_executionStopped() end

--- Charge l'extension rally loop si elle n'est pas chargée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:45
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:loadExt() end

--- Décharge l'extension rally loop si elle est chargée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:38
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:unloadExt() end

--- Recharge l'extension, détecte la mission, configure l'environnement et lance gameplay_rallyLoop.setup ; met success ou failed à vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:52
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:workOnce() end

