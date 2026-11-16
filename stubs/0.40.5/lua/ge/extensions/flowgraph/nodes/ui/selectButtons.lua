---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_selectButtons_C
local flowgraph_nodes_ui_selectButtons_C = {}

--- Closes the dialogue if the input flow is false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:164
function flowgraph_nodes_ui_selectButtons_C:_afterTrigger() end

--- Resets the outputs to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:39
function flowgraph_nodes_ui_selectButtons_C:_executionStarted() end

--- Closes the dialogue if it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:158
function flowgraph_nodes_ui_selectButtons_C:_executionStopped() end

--- Restores options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:147
---@param nodeData table Saved node data.
function flowgraph_nodes_ui_selectButtons_C:_onDeserialized(nodeData) end

--- Saves options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:143
---@param res table Node save table to fill.
function flowgraph_nodes_ui_selectButtons_C:_onSerialize(res) end

--- Sets the output of the clicked button to true (the others to false) and closes the dialogue.
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:169
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_selectButtons_C:buttonPushed(action) end

--- Closes the dialogue (ui_missionInfo) and shows the apps again if hidden.
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:182
function flowgraph_nodes_ui_selectButtons_C:closeDialogue() end

--- Button list editing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:45
function flowgraph_nodes_ui_selectButtons_C:drawCustomProperties() end

--- Returns the Lua command that calls buttonPushed(action) back.
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:178
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_selectButtons_C:getCmd(action) end

--- Options {accept, decline}, count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:27
function flowgraph_nodes_ui_selectButtons_C:init() end

--- Closes the dialogue and resets the outputs to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:209
function flowgraph_nodes_ui_selectButtons_C:onNodeReset() end

--- Builds the buttons and opens the dialogue; hides the apps if hideApps.
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:192
function flowgraph_nodes_ui_selectButtons_C:openDialogue() end

--- Creates the option pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:35
function flowgraph_nodes_ui_selectButtons_C:postInit() end

--- Recreates the pins per option, restoring the links.
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:94
function flowgraph_nodes_ui_selectButtons_C:updateButtons() end

--- Opens the dialogue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:218
function flowgraph_nodes_ui_selectButtons_C:workOnce() end

