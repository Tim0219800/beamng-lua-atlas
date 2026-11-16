---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/stateExit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_states_stateExit_C
local flowgraph_nodes_states_stateExit_C = {}

--- Restores transitionName ('' by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:69
---@param data any saved data
function flowgraph_nodes_states_stateExit_C:_onDeserialized(data) end

--- Saves transitionName.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:65
---@param res any save table
function flowgraph_nodes_states_stateExit_C:_onSerialize(res) end

--- "Transition Name" dropdown built from the transition names of the parent state node that targets this graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:30
function flowgraph_nodes_states_stateExit_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:59
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_states_stateExit_C:drawMiddle(builder, style) end

--- autoStart = false, savePins = true, transitionName = ''.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:24
---@param mgr any flowgraph manager
function flowgraph_nodes_states_stateExit_C:init(mgr) end

