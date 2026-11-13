---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_vehiclePool_createPool_C
local flowgraph_nodes_gameplay_vehiclePool_createPool_C = {}

--- Appelle onNodeReset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:27
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:_executionStopped() end

--- Affiche la case « Keep Inactive Vehicles » (data.keepVehicles).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:38
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:drawCustomProperties() end

--- Appelle onNodeReset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:23
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:init() end

--- Supprime le pool créé (deletePool) et l'oublie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:31
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:onNodeReset() end

--- Crée le pool s'il n'existe pas et le publie sur vehPool.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua:45
function flowgraph_nodes_gameplay_vehiclePool_createPool_C:workOnce() end

