---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_thread_receiveMessage_C
local flowgraph_nodes_thread_receiveMessage_C = {}

--- done = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:74
function flowgraph_nodes_thread_receiveMessage_C:_executionStarted() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:78
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_thread_receiveMessage_C:drawMiddle(builder, style) end

--- savePins = true, allowCustomOutPins = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:42
function flowgraph_nodes_thread_receiveMessage_C:init() end

--- Hook: stores the received message if it has not already been processed (done = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:47
---@param message any message table
function flowgraph_nodes_thread_receiveMessage_C:onThreadMessageProcess(message) end

--- On reset, resets to zero; otherwise, if a message is pending and name is given, copies its fields to the pins, activates receiving and received.
---Source: lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:55
function flowgraph_nodes_thread_receiveMessage_C:work() end

