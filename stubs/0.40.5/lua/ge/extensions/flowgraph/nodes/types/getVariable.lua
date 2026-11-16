---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/getVariable.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_types_getVariable_C
local flowgraph_nodes_types_getVariable_C = {}

--- Restores scope and variable.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:136
---@param nodeData any saved data
function flowgraph_nodes_types_getVariable_C:_onDeserialized(nodeData) end

--- Saves the node's state in the given table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:131
---@param res any save table
function flowgraph_nodes_types_getVariable_C:_onSerialize(res) end

--- Scope checkbox, variable list and variable editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:25
function flowgraph_nodes_types_getVariable_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:118
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_types_getVariable_C:drawMiddle(builder, style) end

--- varName = nil, global = false, target = graph variables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:19
function flowgraph_nodes_types_getVariable_C:init() end

--- Hook: updates the node and pin name if the tracked variable is renamed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:85
---@param source any variables table concerned
---@param name any old name
---@param newName any new name
function flowgraph_nodes_types_getVariable_C:renameVariable(source, name, newName) end

--- Changes the scope (project/graph), the node color and removes the current pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:44
---@param global any boolean: project variables
function flowgraph_nodes_types_getVariable_C:setGlobal(global) end

--- Chooses the variable: recreates the output pin with the right type and redoes the compatible links.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:59
---@param name any variable name
function flowgraph_nodes_types_getVariable_C:setVar(name) end

--- Hook: recreates the pin when the variable's type changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:101
---@param source any variables table concerned
---@param name any name
---@param newType any new type
function flowgraph_nodes_types_getVariable_C:typeUpdated(source, name, newType) end

--- Writes target:get(varName) to the pin.
---Source: lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:97
function flowgraph_nodes_types_getVariable_C:work() end

