---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/variables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_variables', windowDescription 'Variables').
---@class editor_flowgraph_variables_C
local editor_flowgraph_variables_C = {}

--- Deserialization hook: empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:363
---@param data table Restored data.
function editor_flowgraph_variables_C:_onDeserialized(data) end

--- Serialization hook: empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:359
---@param data table Save table.
function editor_flowgraph_variables_C:_onSerialize(data) end

--- Draws the "Current Graph Variables" header, the add button (addVariablePopup popup), the graph's variables then the project's.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:30
function editor_flowgraph_variables_C:draw() end

--- Draws the variables of a graph, with "(current)" if it is the current graph.
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:326
---@param graph table Graph.
function editor_flowgraph_variables_C:drawGraph(graph) end

--- Draws a graph in a TreeNode then its children sorted by id.
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:330
---@param graph table Root graph.
function editor_flowgraph_variables_C:drawRecursive(graph) end

--- Recursively draws the root graphs (without parentId) of a table, sorted by id.
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:346
---@param source table<integer, table> Table of graphs.
function editor_flowgraph_variables_C:drawSortedGraphs(source) end

--- Draws all the variables of a container in customVariableOrder order and handles the drop to change the order.
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:288
---@param target table Variable container.
---@param name string Displayed name.
---@param id string|nil Identifier (default target.id).
---@param global boolean|nil true for project variables.
function editor_flowgraph_variables_C:drawTarget(target, name, id, global) end

--- Draws a variable's card: type icon, name, value, getter/setter buttons, drag handle and expanded editor.
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:200
---@param target table Variable container (graph or project).
---@param varName string Variable name.
---@param global boolean|nil true for a project variable.
function editor_flowgraph_variables_C:drawVariableCard(target, varName, global) end

--- Infers a variable type from a name via ui_flowgraph_editor.getAutoTypeFromName.
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:195
---@param name string Variable name.
---@return string|nil  Guessed type (inferred from code).
function editor_flowgraph_variables_C:getAutoTypeFromName(name) end

--- Initializes the input fields, the drag and drop payload and registers the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/variables.lua:21
function editor_flowgraph_variables_C:init() end

