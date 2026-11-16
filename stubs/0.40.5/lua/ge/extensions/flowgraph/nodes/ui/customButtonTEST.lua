---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_customButtonTEST_C
local flowgraph_nodes_ui_customButtonTEST_C = {}

--- open = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:25
function flowgraph_nodes_ui_customButtonTEST_C:_executionStarted() end

--- Closes the dialogue if it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:29
function flowgraph_nodes_ui_customButtonTEST_C:_executionStopped() end

--- Sets the output pin matching the clicked button to true, the others to false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:35
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_customButtonTEST_C:buttonPushed(action) end

--- Sends an empty list to 'CustomFGButtons' (hides the buttons).
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:45
function flowgraph_nodes_ui_customButtonTEST_C:closeDialogue() end

--- Builds the Lua command that calls buttonPushed(action) back on this node.
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:41
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_customButtonTEST_C:getCmd(action) end

--- open = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:21
function flowgraph_nodes_ui_customButtonTEST_C:init() end

--- Closes the dialogue if it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:60
function flowgraph_nodes_ui_customButtonTEST_C:onNodeReset() end

--- Sends the "Click me!" button to the UI and sets done = true.
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:49
function flowgraph_nodes_ui_customButtonTEST_C:openDialogue() end

--- Sends the "Click me!" button to the UI (guihooks 'CustomFGButtons').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:66
function flowgraph_nodes_ui_customButtonTEST_C:workOnce() end

