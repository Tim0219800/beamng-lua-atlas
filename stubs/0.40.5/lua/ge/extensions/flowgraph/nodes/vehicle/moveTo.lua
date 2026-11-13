---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_moveTo_C
local flowgraph_nodes_vehicle_moveTo_C = {}

--- Constructeur vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua:31
function flowgraph_nodes_vehicle_moveTo_C:init() end

--- Déplace le véhicule selon `pos`/`rot` et les options, puis `extensions.hook('trackVehReset')`.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua:39
function flowgraph_nodes_vehicle_moveTo_C:resetVehicle() end

--- Appelle `resetVehicle`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua:35
function flowgraph_nodes_vehicle_moveTo_C:work() end

