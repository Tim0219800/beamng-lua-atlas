---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_onCannonFired_C
local flowgraph_nodes_vehicle_onCannonFired_C = {}

--- Hook called when a cannon fires; raises the internal flag. `id`: vehicle/object identifier (inferred from the name, unused).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua:35
---@param id any Identifier passed by the hook (unused).
function flowgraph_nodes_vehicle_onCannonFired_C:onCannonFired(id) end

--- Sets `cannonFired` to true for one frame if a shot was signaled, otherwise false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua:26
---@param args any
function flowgraph_nodes_vehicle_onCannonFired_C:work(args) end

--- Sets the internal flag `flag` to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua:22
function flowgraph_nodes_vehicle_onCannonFired_C:workOnce() end

