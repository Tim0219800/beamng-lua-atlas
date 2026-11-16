---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_vehicleConfigProvider_C
local flowgraph_nodes_vehicle_vehicleConfigProvider_C = {}

--- Restores model, config, path, type and names.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:65
---@param nodeData table Saved node data.
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:_onDeserialized(nodeData) end

--- Saves model, config, path, type and names.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:56
---@param res table Save table to fill.
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:_onSerialize(res) end

--- Displays the vehicle selector.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:36
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:drawCustomProperties() end

--- Empty central display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:42
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:drawMiddle(builder, style) end

--- Constructor; clears the model/config fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:26
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:init() end

--- Writes the chosen model and config to the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:49
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:work() end

