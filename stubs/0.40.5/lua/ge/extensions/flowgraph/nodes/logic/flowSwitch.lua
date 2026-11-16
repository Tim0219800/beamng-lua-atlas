---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_flowSwitch_C
local flowgraph_nodes_logic_flowSwitch_C = {}

--- Restores the saved state (storedOn).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:46
function flowgraph_nodes_logic_flowSwitch_C:_executionStarted() end

--- Restores the saved state (storedOn).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:42
function flowgraph_nodes_logic_flowSwitch_C:_executionStopped() end

--- Reads storedOn back from the 'on' field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:54
---@param nodeData any
function flowgraph_nodes_logic_flowSwitch_C:_onDeserialized(nodeData) end

--- Saves storedOn in the 'on' field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:50
---@param res any
function flowgraph_nodes_logic_flowSwitch_C:_onSerialize(res) end

--- Draws a clickable checkbox; a click toggles the state and, if editing is allowed, stores storedOn.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:30
---@param builder any
---@param style any
function flowgraph_nodes_logic_flowSwitch_C:drawMiddle(builder, style) end

--- Initial state: off.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:26
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_flowSwitch_C:init(mgr, ...) end

--- If 'on' has flow, switches to ON; if 'off' has flow, switches to OFF (off wins if both). Output flow = state AND input flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:58
---@param args any unused
function flowgraph_nodes_logic_flowSwitch_C:work(args) end

