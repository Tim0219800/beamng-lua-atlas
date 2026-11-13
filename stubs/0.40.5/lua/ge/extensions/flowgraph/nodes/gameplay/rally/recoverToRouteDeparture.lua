---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C
local flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:44
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:_executionStarted() end

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:48
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:_executionStopped() end

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:40
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:init() end

--- Efface la recovery en attente et l'instantané de carburant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:52
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:onNodeReset() end

--- Appelle rm:recoverVehicleToRouteDeparture puis réapplique le carburant si réparé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:57
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:runRecovery() end

--- Prépare la recovery en attente (véhicule, réparation, backoffDistance) et la lance, après l'instantané de carburant si nécessaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:91
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:startRecovery() end

--- Si flow est actif, appelle startRecovery.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:136
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:work() end

