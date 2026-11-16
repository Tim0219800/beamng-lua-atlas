---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_customPartsConfigProvider_C
local flowgraph_nodes_vehicle_customPartsConfigProvider_C = {}

--- Called when the project loads; restores the node's settings from `nodeData`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:235
---@param nodeData table Saved node data.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:_onDeserialized(nodeData) end

--- Called when the project is saved; copies the node's settings into the `res` table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:225
---@param res table Save table to fill.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:_onSerialize(res) end

--- ImGui display of the node's properties in the editor panel; returns a string describing the change made, or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:44
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:drawCustomProperties() end

--- ImGui display in the center of the node in the flowgraph editor; purely visual.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:214
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:drawMiddle(builder, style) end

--- Constructor; clears models/configs and creates `partConfig = {parts = {}, vars = {}}`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:25
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:init() end

--- Displays an editable table of key/value pairs (`field` = 'parts' with string values, or 'vars' with number values), with sorting, adding and deleting.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:122
---@param name string Displayed title.
---@param field string 'parts' or 'vars'.
---@param tpe string 'string' or 'number': type of the values.
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:showKVPairs(name, field, tpe) end

--- Rebuilds `sortedKeys` (keys of `parts` and `vars` sorted alphabetically).
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:197
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:sortKeys() end

--- Copies `partConfig` and `model` to the output pins `config` and `model`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/customPartsConfigProvider.lua:220
function flowgraph_nodes_vehicle_customPartsConfigProvider_C:work() end

