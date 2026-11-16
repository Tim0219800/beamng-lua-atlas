---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_thread_sendMessage_C
local flowgraph_nodes_thread_sendMessage_C = {}

--- done = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:71
function flowgraph_nodes_thread_sendMessage_C:_executionStarted() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:75
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_thread_sendMessage_C:drawMiddle(builder, style) end

--- savePins = true, allowCustomInPins = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:41
function flowgraph_nodes_thread_sendMessage_C:init() end

--- On reset, done = false; otherwise, on flow with an id, assembles the non-fixed pins into a table and sends the message, then copies flow.
---Source: lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:47
function flowgraph_nodes_thread_sendMessage_C:work() end

