---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/stateNode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_states_stateNode_C
local flowgraph_nodes_states_stateNode_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:146
function flowgraph_nodes_states_stateNode_C:EndPin() end

--- Stores targetGraphId for _postDeserialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:159
---@param data any saved data
function flowgraph_nodes_states_stateNode_C:_onDeserialized(data) end

--- Saves the target graph id (res.targetGraphId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:151
---@param res any save table
function flowgraph_nodes_states_stateNode_C:_onSerialize(res) end

--- Serializes the node + target graph for the state export (res.type = 'state').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:185
function flowgraph_nodes_states_stateNode_C:_onSerializeState() end

--- After all graphs are loaded, finds the target graph (id + getGraphNodeOffset offset) and associates it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:163
function flowgraph_nodes_states_stateNode_C:_postDeserialize() end

--- Selects the target graph in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:113
function flowgraph_nodes_states_stateNode_C:doubleClicked() end

--- "Target Graph" dropdown (root graphs outside the state graph) and "Export State" button (JSON save via editor_fileDialog).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:64
function flowgraph_nodes_states_stateNode_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:121
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_states_stateNode_C:drawMiddle(builder, style) end

--- Returns the sorted list of output pin names (possible transitions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:104
function flowgraph_nodes_states_stateNode_C:getTransitionNames() end

--- allowCustomOutPins = true, savePins = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:37
---@param mgr any flowgraph manager
function flowgraph_nodes_states_stateNode_C:init(mgr) end

--- Renames the target graph and returns a history message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:176
---@param name any new name
function flowgraph_nodes_states_stateNode_C:onCustomNameChanged(name) end

--- Returns the target graph represented by this node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:31
function flowgraph_nodes_states_stateNode_C:representsGraph() end

--- Empty (unused).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:57
---@param val any ignored
function flowgraph_nodes_states_stateNode_C:setAutoStart(val) end

--- Associates a target graph, takes its name and takes the "groupstate" color if it is a state graph; otherwise name "No Target!".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:43
---@param graph any target graph or nil
function flowgraph_nodes_states_stateNode_C:setTargetGraph(graph) end

