---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_setGearbox_C
local flowgraph_nodes_vehicle_setGearbox_C = {}

--- Called by the manager when the flowgraph project execution starts; resets the internal state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua:31
function flowgraph_nodes_vehicle_setGearbox_C:_executionStarted() end

--- Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua:24
function flowgraph_nodes_vehicle_setGearbox_C:init() end

--- Clears the response and goes to `inactive` duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua:35
function flowgraph_nodes_vehicle_setGearbox_C:onNodeReset() end

--- Defines the values offered for `mode`: arcade, realistic.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua:27
function flowgraph_nodes_vehicle_setGearbox_C:postInit() end

--- When the ping returns, goes to `finished`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua:55
function flowgraph_nodes_vehicle_setGearbox_C:work() end

--- Sends the action and a ping to the vehicle, goes to `started`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua:40
function flowgraph_nodes_vehicle_setGearbox_C:workOnce() end

