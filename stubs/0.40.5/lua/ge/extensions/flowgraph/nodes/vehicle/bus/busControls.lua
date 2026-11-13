---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_bus_busControls_C
local flowgraph_nodes_vehicle_bus_busControls_C = {}

--- Remet les deux sorties à false au démarrage (note : nom sans underscore, donc jamais appelé par le gestionnaire qui appelle `_executionStarted`).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua:32
function flowgraph_nodes_vehicle_bus_busControls_C:executionStarted() end

--- Constructeur ; met `isKneeling` et `doorsOpen` à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua:21
function flowgraph_nodes_vehicle_bus_busControls_C:init() end

--- Met à jour `isKneeling`, `doorsOpen` depuis le module `vehicle` du manager et active le flux de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua:26
function flowgraph_nodes_vehicle_bus_busControls_C:work() end

