---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_ui_updatedUI_endScreenWhole_C
local flowgraph_nodes_ui_updatedUI_endScreenWhole_C = {}

--- Called after the node is triggered; empty body (commented-out code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:167
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_afterTrigger() end

--- Called when the flowgraph project starts executing; resets the node state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:51
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_executionStarted() end

--- Called when the project stops; closes the dialogue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:159
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_executionStopped() end

--- Reloads the custom buttons then recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:154
---@param nodeData any
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_onDeserialized(nodeData) end

--- Saves the list of custom buttons (options).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:150
---@param res any
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_onSerialize(res) end

--- Called when a button is clicked: sets the output pin with the same name as the action to true, then closes the dialogue (navigation to "play").
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:173
---@param action string Name of the output pin (contStart, contHere, or name of a custom button).
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:buttonPushed(action) end

--- If built, navigates to "play".
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:195
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:closeDialogue() end

--- Draws the custom button list in the flowgraph editor (text field per button, "add" and "rem" buttons). Returns the reason for the change (string) or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:60
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:drawCustomProperties() end

--- Returns the Lua command (string) that finds this node via core_flowgraphManager.getManagerGraphNode and calls buttonPushed(action); usable from the UI.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:183
---@param action string Name of the button/pin.
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:getCmd(action) end

--- Initializes open, options, data.includeRetryButton=true, data.autoBuild=true and auto-skip.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:36
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:init() end

--- Hook called at the end of the mission on the client side; closes the dialogue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:163
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:onClientEndMission() end

--- Called when the node is reset (reset pin or graph reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:359
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:onNodeReset() end

--- Gameplay reset hook; if the screen is open and Retry is included, closes the dialogue and activates the retry pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:187
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:onResetGameplay() end

--- Builds the buttons (see EndScreen Begin) and, if autoBuild, fills the screen (header, Results textPanel, objectives, ratings) then calls finishUIBuilding.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:204
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:openDialogue() end

--- Called right after init, once the pins are created.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:46
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:postInit() end

--- Recreates the node's pins for each button name in self.options: string input pin (label), bool input pin "<name>_active" (hidden, true by default) and flow output pin. Reconnects the existing links when the name has not changed.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:95
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:updateButtons() end

--- Handles reset, builds the screen on the first frame of flow, activates build for one frame, and applies auto-skip (startingOptions.autoSkipStartScreen, 2 s) by stopping the mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:368
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:work() end

