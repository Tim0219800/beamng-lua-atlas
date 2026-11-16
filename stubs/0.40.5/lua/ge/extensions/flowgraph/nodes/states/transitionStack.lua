---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_states_transitionStack_C
local flowgraph_nodes_states_transitionStack_C = {}

--- Forgets the stack on stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:47
function flowgraph_nodes_states_transitionStack_C:_executionStopped() end

--- Prepares the pin templates if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:90
function flowgraph_nodes_states_transitionStack_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:98
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_states_transitionStack_C:drawMiddle(builder, style) end

--- Frees the pin template cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:94
function flowgraph_nodes_states_transitionStack_C:hideProperties() end

--- savePins = true, allowCustomOutPins = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:37
function flowgraph_nodes_states_transitionStack_C:init() end

--- Builds the pin templates like the transition node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:60
function flowgraph_nodes_states_transitionStack_C:makePinTemplates() end

--- Hook: on entering the state, stores state.transitionStack.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:42
---@param state any started state object
function flowgraph_nodes_states_transitionStack_C:onStateStarted(state) end

--- Copies _stack[name] to each output pin and copies flow.
---Source: lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:51
function flowgraph_nodes_states_transitionStack_C:work() end

