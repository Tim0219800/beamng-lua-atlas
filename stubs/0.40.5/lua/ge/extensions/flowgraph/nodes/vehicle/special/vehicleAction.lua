---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_vehicleAction_C
local flowgraph_nodes_vehicle_special_vehicleAction_C = {}

--- Restores model, type, name and action.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:183
---@param nodeData table Saved node data.
function flowgraph_nodes_vehicle_special_vehicleAction_C:_onDeserialized(nodeData) end

--- Saves model, type, name and action.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:176
---@param res table Save table to fill.
function flowgraph_nodes_vehicle_special_vehicleAction_C:_onSerialize(res) end

--- Vehicle selector and list of available actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:71
function flowgraph_nodes_vehicle_special_vehicleAction_C:drawCustomProperties() end

--- Replaces VALUE, FILTERTYPE and ANGLE in the command with the pin values.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:149
---@param cmd string Command with tokens VALUE, FILTERTYPE, ANGLE.
function flowgraph_nodes_vehicle_special_vehicleAction_C:formatCommand(cmd) end

--- Constructor; no action selected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:34
function flowgraph_nodes_vehicle_special_vehicleAction_C:init() end

--- Loads and caches the actions of a model (`key`) from `file` (default `vehicles/<key>/input_actions.json`).
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:47
---@param key string Vehicle model key or 'allVehicles'.
---@param file string|nil Actions file (default vehicles/<key>/input_actions.json).
function flowgraph_nodes_vehicle_special_vehicleAction_C:loadActions(key, file) end

--- Sends `onDown`, `onChange`, `onUp` of the action to the vehicle according to the active flow pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:156
function flowgraph_nodes_vehicle_special_vehicleAction_C:work() end

