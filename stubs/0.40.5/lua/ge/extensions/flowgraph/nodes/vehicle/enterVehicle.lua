---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_enterVehicle_C
local flowgraph_nodes_vehicle_enterVehicle_C = {}

--- Trouve le véhicule (`vehId` ou joueur), appelle `gameplay_walk.getInVehicle` et `commands.setGameCamera`.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua:37
function flowgraph_nodes_vehicle_enterVehicle_C:enterVehicle() end

--- Si `dynamicMode == 'repeat'`, répète l'entrée dans le véhicule à chaque frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua:31
function flowgraph_nodes_vehicle_enterVehicle_C:work() end

--- Fait entrer le joueur dans le véhicule une fois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua:27
function flowgraph_nodes_vehicle_enterVehicle_C:workOnce() end

