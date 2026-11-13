---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_stop_C
local flowgraph_nodes_vehicle_ai_stop_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:30
function flowgraph_nodes_vehicle_ai_stop_C:_executionStarted() end

--- Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:34
function flowgraph_nodes_vehicle_ai_stop_C:getVeh() end

--- Initialise complete=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:22
function flowgraph_nodes_vehicle_ai_stop_C:init() end

--- Remet complete à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:26
function flowgraph_nodes_vehicle_ai_stop_C:onNodeReset() end

--- Si l'arrêt est constaté, active stopped ; sinon compare la vitesse (map.objects[vehId].vel) au seuil et mémorise complete.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:51
function flowgraph_nodes_vehicle_ai_stop_C:work() end

--- Envoie au véhicule ai.setState({mode = "stop"}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua:44
function flowgraph_nodes_vehicle_ai_stop_C:workOnce() end

