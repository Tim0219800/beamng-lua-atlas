---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_startScreen_C
local flowgraph_nodes_ui_startScreen_C = {}

--- Outputs to false, _active = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:34
function flowgraph_nodes_ui_startScreen_C:_executionStarted() end

--- Closes and resets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:58
function flowgraph_nodes_ui_startScreen_C:_executionStopped() end

--- Converts the old portraitMode format into a layout.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:174
---@param data table Saved / received data.
function flowgraph_nodes_ui_startScreen_C:_onDeserialized(data) end

--- Sets the button's output to true; the others to false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:71
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_startScreen_C:buttonPushed(action) end

--- Marks the screen as closed.
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:81
function flowgraph_nodes_ui_startScreen_C:closeDialogue() end

--- done = true, _active = false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:136
function flowgraph_nodes_ui_startScreen_C:closed() end

--- Returns the Lua command that calls buttonPushed(action) back.
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:77
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_startScreen_C:getCmd(action) end

--- open = false, done = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:29
function flowgraph_nodes_ui_startScreen_C:init() end

--- Hook: closes the screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:152
function flowgraph_nodes_ui_startScreen_C:onClientEndMission() end

--- Filtered input hook; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:141
---@param devName string Name of the input device.
---@param action string Name of the activated button or output pin.
---@param value number Input value.
function flowgraph_nodes_ui_startScreen_C:onFilteredInputChanged(devName, action, value) end

--- Hook: the UI is ready; sends the stored data back via 'ScenarioChange' if the screen is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:130
---@param state integer Screen fade state (1 = black reached, 3 = fade finished).
function flowgraph_nodes_ui_startScreen_C:onScenarioUIReady(state) end

--- Prepares the data and navigates to 'scenario.start'.
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:90
function flowgraph_nodes_ui_startScreen_C:openDialogue() end

--- Layout templates.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:43
function flowgraph_nodes_ui_startScreen_C:postInit() end

--- Resets done, open and _active to false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:65
function flowgraph_nodes_ui_startScreen_C:reset() end

--- Closes the screen and sets the output flow to true.
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:145
function flowgraph_nodes_ui_startScreen_C:started() end

--- Handles reset; opens the screen when the input flow is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:156
function flowgraph_nodes_ui_startScreen_C:work() end

