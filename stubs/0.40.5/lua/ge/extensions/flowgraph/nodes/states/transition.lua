---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/transition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_states_transition_C
local flowgraph_nodes_states_transition_C = {}

--- Restores transitionName ('success' by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:122
---@param data any saved data
function flowgraph_nodes_states_transition_C:_onDeserialized(data) end

--- Saves transitionName.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:118
---@param res any save table
function flowgraph_nodes_states_transition_C:_onSerialize(res) end

--- Adds to the context menu "Go to target..." listing the target graphs of this transition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:126
function flowgraph_nodes_states_transition_C:customContextMenu() end

--- "Transition Name" dropdown based on the parent state node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:72
function flowgraph_nodes_states_transition_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:112
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_states_transition_C:drawMiddle(builder, style) end

--- Frees the pin template cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:91
function flowgraph_nodes_states_transition_C:hideProperties() end

--- savePins = true, allowCustomInPins = true, transitionName = 'success'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:36
function flowgraph_nodes_states_transition_C:init() end

--- Builds the pin templates (name/type) from the other transition and transitionStack nodes of the project.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:42
function flowgraph_nodes_states_transition_C:makePinTemplates() end

--- If flow, triggers the transition with the pins' data (nil if there are none).
---Source: lua/ge/extensions/flowgraph/nodes/states/transition.lua:97
function flowgraph_nodes_states_transition_C:work() end

