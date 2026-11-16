---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/setVariable.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_types_setVariable_C
local flowgraph_nodes_types_setVariable_C = {}

--- Restores scope and variable.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:145
---@param nodeData any saved data
function flowgraph_nodes_types_setVariable_C:_onDeserialized(nodeData) end

--- Saves the node's state in the given table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:140
---@param res any save table
function flowgraph_nodes_types_setVariable_C:_onSerialize(res) end

--- Scope checkbox, variable list and variable editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:43
function flowgraph_nodes_types_setVariable_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:127
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_types_setVariable_C:drawMiddle(builder, style) end

--- varName = nil, target = graph variables, useSuffix = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:22
function flowgraph_nodes_types_setVariable_C:init() end

--- Hook: updates node and pin if the variable is renamed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:88
---@param source any variables table concerned
---@param name any old name
---@param newName any new name
function flowgraph_nodes_types_setVariable_C:renameVariable(source, name, newName) end

--- Changes the scope (project/graph), the color and removes the current pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:28
---@param global any boolean: project variables
function flowgraph_nodes_types_setVariable_C:setGlobal(global) end

--- Chooses the variable: recreates the input pin and redoes the links.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:62
---@param name any variable name
function flowgraph_nodes_types_setVariable_C:setVar(name) end

--- Hook: recreates the pin when the variable's type changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:109
---@param source any variables table concerned
---@param name any name
---@param newType any new type
function flowgraph_nodes_types_setVariable_C:typeUpdated(source, name, newType) end

--- Calls target:change(varName, pin value) and copies flow.
---Source: lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:104
function flowgraph_nodes_types_setVariable_C:work() end

