---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_endScreen_C
local flowgraph_nodes_ui_endScreen_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:167
function flowgraph_nodes_ui_endScreen_C:_afterTrigger() end

--- Resets all output pins to false and open = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:63
function flowgraph_nodes_ui_endScreen_C:_executionStarted() end

--- Closes the screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:163
function flowgraph_nodes_ui_endScreen_C:_executionStopped() end

--- Restores the node's state from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:158
---@param nodeData table Saved node data.
function flowgraph_nodes_ui_endScreen_C:_onDeserialized(nodeData) end

--- Writes the node's state to the save table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:154
---@param res table Node save table to fill.
function flowgraph_nodes_ui_endScreen_C:_onSerialize(res) end

--- Called by the UI when a button is clicked; sets the output pin named after the button to true (the others to false) and closes the dialogue.
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:173
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_endScreen_C:buttonPushed(action) end

--- If the screen is open, navigates to the UI state 'play' and open = false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:193
function flowgraph_nodes_ui_endScreen_C:closeDialogue() end

--- Button list editing (rename, delete if text is empty, add, rem).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:70
function flowgraph_nodes_ui_endScreen_C:drawCustomProperties() end

--- Returns the Lua command that finds this node and calls buttonPushed(action).
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:182
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_endScreen_C:getCmd(action) end

--- Initializes options, oldOptions, open = false and data.includeRetryButton = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:43
function flowgraph_nodes_ui_endScreen_C:init() end

--- Hook: closes the screen at the end of the level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:203
function flowgraph_nodes_ui_endScreen_C:onClientEndMission() end

--- Closes the screen and resets the outputs to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:323
function flowgraph_nodes_ui_endScreen_C:onNodeReset() end

--- Hook: closes the screen if the Retry button is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:186
function flowgraph_nodes_ui_endScreen_C:onResetGameplay() end

--- Assembles buttons, text, time, medal, points, stats, portraits and mission data, then navigates to 'scenario.end'.
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:207
function flowgraph_nodes_ui_endScreen_C:openDialogue() end

--- Creates the "cont" (Continue) option, the corresponding pins and the templates of the medal pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:51
function flowgraph_nodes_ui_endScreen_C:postInit() end

--- Recreates the button pins according to options, restoring the existing links.
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:105
function flowgraph_nodes_ui_endScreen_C:updateButtons() end

--- Opens the end screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:330
function flowgraph_nodes_ui_endScreen_C:workOnce() end

