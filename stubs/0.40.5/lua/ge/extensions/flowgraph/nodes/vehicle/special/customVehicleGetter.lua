---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_customVehicleGetter_C
local flowgraph_nodes_vehicle_special_customVehicleGetter_C = {}

--- Clears the received value.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:97
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:_executionStarted() end

--- Dropdown list of predefined functions and text field for a custom function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:42
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:drawCustomProperties() end

--- Builds the Lua command sent to the vehicle.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:102
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:getCmd() end

--- Constructor; `data.fun` = first function of the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:38
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:init() end

--- Called back by the vehicle VM with the serialized value; deserializes it into `returnedValue`.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:106
---@param value string Serialized value returned by the vehicle VM.
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:returnValue(value) end

--- Sends the command to the vehicle once, then exposes `value`/`valBool` upon reception.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:67
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:work() end

