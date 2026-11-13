---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_onCannonFired_C
local flowgraph_nodes_vehicle_onCannonFired_C = {}

--- Hook appelé quand un canon tire ; lève le drapeau interne. `id` : identifiant du véhicule/objet (déduit du nom, non utilisé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua:35
---@param id any Identifiant transmis par le hook (non utilisé).
function flowgraph_nodes_vehicle_onCannonFired_C:onCannonFired(id) end

--- Met `cannonFired` à true pendant une frame si un tir a été signalé, sinon false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua:26
---@param args any
function flowgraph_nodes_vehicle_onCannonFired_C:work(args) end

--- Met le drapeau interne `flag` à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua:22
function flowgraph_nodes_vehicle_onCannonFired_C:workOnce() end

