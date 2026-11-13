---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_beamstate_breakgroup_C
local flowgraph_nodes_vehicle_beamstate_breakgroup_C = {}

--- Si `group` est `*`, casse tous les breakgroups ; sinon appelle `beamstate.breakBreakGroup('<group>')` sur le véhicule. Sort si `group` vaut nil ou si le véhicule est introuvable (log E).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua:27
function flowgraph_nodes_vehicle_beamstate_breakgroup_C:work() end

