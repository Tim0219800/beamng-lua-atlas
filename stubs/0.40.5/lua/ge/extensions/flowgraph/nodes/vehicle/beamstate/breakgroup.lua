---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_beamstate_breakgroup_C
local flowgraph_nodes_vehicle_beamstate_breakgroup_C = {}

--- If `group` is `*`, breaks all breakgroups; otherwise calls `beamstate.breakBreakGroup('<group>')` on the vehicle. Exits if `group` is nil or if the vehicle is not found (E log).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua:27
function flowgraph_nodes_vehicle_beamstate_breakgroup_C:work() end

