---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_vehiclePing_C
local flowgraph_nodes_vehicle_vehiclePing_C = {}

--- Called by the manager when the flowgraph project execution starts; resets the internal state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:26
function flowgraph_nodes_vehicle_vehiclePing_C:_executionStarted() end

--- Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:23
function flowgraph_nodes_vehicle_vehiclePing_C:init() end

--- Clears the response and goes to `inactive` duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:30
function flowgraph_nodes_vehicle_vehiclePing_C:onNodeReset() end

--- When the ping returns, goes to `finished`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:48
function flowgraph_nodes_vehicle_vehiclePing_C:work() end

--- Sends the ping and switches to `started`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:35
function flowgraph_nodes_vehicle_vehiclePing_C:workOnce() end

