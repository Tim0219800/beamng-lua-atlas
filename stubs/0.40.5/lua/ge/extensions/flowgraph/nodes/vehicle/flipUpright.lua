---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_flipUpright_C
local flowgraph_nodes_vehicle_flipUpright_C = {}

--- Constructeur vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua:24
function flowgraph_nodes_vehicle_flipUpright_C:init() end

--- Téléporte le véhicule sur place, redressé, et appelle `extensions.hook('onVehicleFlippedUpright', vehId)`.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua:33
function flowgraph_nodes_vehicle_flipUpright_C:resetVehicle() end

--- Appelle `resetVehicle` et recopie le flux d'entrée sur la sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua:28
function flowgraph_nodes_vehicle_flipUpright_C:work() end

