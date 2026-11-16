---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/message.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_message_C
local flowgraph_nodes_ui_message_C = {}

--- Resets the timer to 0 if the input flow is cut.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/message.lua:41
function flowgraph_nodes_ui_message_C:_afterTrigger() end

--- Resets the timer to 0 and prepares the default category.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/message.lua:28
function flowgraph_nodes_ui_message_C:_executionStarted() end

--- Clears the displayed message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/message.lua:33
function flowgraph_nodes_ui_message_C:_executionStopped() end

--- "Open Icons overview" button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/message.lua:47
function flowgraph_nodes_ui_message_C:drawCustomProperties() end

--- Periodically resends the message to the UI and propagates the flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/message.lua:55
function flowgraph_nodes_ui_message_C:work() end

