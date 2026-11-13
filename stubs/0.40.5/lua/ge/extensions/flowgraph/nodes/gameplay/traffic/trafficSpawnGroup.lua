---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C
local flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C = {}

--- Appelle resetState().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:44
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:_executionStopped() end

--- Appelle resetState().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:40
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:init() end

--- Supprime les véhicules créés par ce nœud (scène et éditeur) puis réinitialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:48
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:onNodeReset() end

--- Hook appelé quand un groupe a été créé ; si groupId correspond, enregistre les véhicules, publie vehicleIds et passe à l'état 2.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:77
---@param vehIds any table des ids de véhicules créés
---@param groupId any identifiant du groupe créé par core_multiSpawn
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:onVehicleGroupSpawned(vehIds, groupId) end

--- Définit les valeurs prédéfinies du pin spawnMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:69
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:postInit() end

--- Remet état, groupId, liste d'ids et sortie flow à zéro.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:62
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:resetState() end

--- Au premier flux, lance spawnGroup (ou termine directement si la quantité est 0), puis émet loaded et laisse passer le flux une fois chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficSpawnGroup.lua:90
function flowgraph_nodes_gameplay_traffic_trafficSpawnGroup_C:work() end

