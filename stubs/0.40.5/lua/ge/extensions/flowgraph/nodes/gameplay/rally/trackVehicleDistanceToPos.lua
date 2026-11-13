---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C
local flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C = {}

--- Oublie la position cible mémorisée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:29
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:_executionStarted() end

--- Calcule le carré de la distance entre le centre avant du véhicule et la position cible.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:74
---@return number|nil  Distance au carré en m², ou nil sans cible.
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:getDistanceSquared() end

--- Initialise targetPos à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:25
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:init(mgr, ...) end

--- Met à jour (variables locales du module) position avant, rotation et vitesse du véhicule suivi à partir de map.objects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:55
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:updateVehicleData2() end

--- Chaque frame : met à jour les données du véhicule, diffuse la distance à l'UI et recopie le flux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:89
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:work(args) end

