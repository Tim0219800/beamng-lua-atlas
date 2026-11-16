---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_missionEndScreen_C
local flowgraph_nodes_ui_missionEndScreen_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:153
function flowgraph_nodes_ui_missionEndScreen_C:_afterTrigger() end

--- Outputs to false, open = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:43
function flowgraph_nodes_ui_missionEndScreen_C:_executionStarted() end

--- Closes the screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:149
function flowgraph_nodes_ui_missionEndScreen_C:_executionStopped() end

--- Restores options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:144
---@param nodeData table Saved node data.
function flowgraph_nodes_ui_missionEndScreen_C:_onDeserialized(nodeData) end

--- Saves options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:140
---@param res table Node save table to fill.
function flowgraph_nodes_ui_missionEndScreen_C:_onSerialize(res) end

--- Sets the output pin of the clicked button to true (without resetting the others to false) and closes the screen.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:159
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_missionEndScreen_C:buttonPushed(action) end

--- If open, navigates to 'play'.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:181
function flowgraph_nodes_ui_missionEndScreen_C:closeDialogue() end

--- Editing of the custom button list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:50
function flowgraph_nodes_ui_missionEndScreen_C:drawCustomProperties() end

--- Returns the Lua command that calls buttonPushed(action) back.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:169
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_missionEndScreen_C:getCmd(action) end

--- Empty options and includeRetryButton = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:31
function flowgraph_nodes_ui_missionEndScreen_C:init() end

--- Hook: closes the screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:191
function flowgraph_nodes_ui_missionEndScreen_C:onClientEndMission() end

--- Closes the screen and resets the outputs to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:304
function flowgraph_nodes_ui_missionEndScreen_C:onNodeReset() end

--- Hook: sets retry to true and closes the screen if Retry is enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:173
function flowgraph_nodes_ui_missionEndScreen_C:onResetGameplay() end

--- Builds the button list and the mission data, then navigates to 'scenario.end'.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:195
function flowgraph_nodes_ui_missionEndScreen_C:openDialogue() end

--- Creates the option pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:38
function flowgraph_nodes_ui_missionEndScreen_C:postInit() end

--- Recreates the pins (text, active, output) per option, restoring the links.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:85
function flowgraph_nodes_ui_missionEndScreen_C:updateButtons() end

--- Opens the end screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:311
function flowgraph_nodes_ui_missionEndScreen_C:workOnce() end

