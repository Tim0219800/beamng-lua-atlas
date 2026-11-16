---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_ui_updatedUI_endScreenBegin_C
local flowgraph_nodes_ui_updatedUI_endScreenBegin_C = {}

--- Called when the flowgraph project starts executing; resets the node state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:46
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_executionStarted() end

--- Called when the project stops; closes the dialogue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:54
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_executionStopped() end

--- Reloads the custom buttons then recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:156
---@param nodeData any
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_onDeserialized(nodeData) end

--- Saves the list of custom buttons (options).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:152
---@param res any
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:_onSerialize(res) end

--- Called when a button is clicked: sets the output pin with the same name as the action to true, then closes the dialogue (navigation to "play").
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:161
---@param action string Name of the output pin (contStart, contHere, or name of a custom button).
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:buttonPushed(action) end

--- If the screen was built, navigates to the "play" screen to close the end screen.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:325
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:closeDialogue() end

--- Draws the custom button list in the flowgraph editor (text field per button, "add" and "rem" buttons). Returns the reason for the change (string) or nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:62
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:drawCustomProperties() end

--- Initializes open=false, the list of custom buttons, data.includeRetryButton=true and the auto-skip timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:33
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:init() end

--- Hook called at the end of the mission on the client side; closes the dialogue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:58
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:onClientEndMission() end

--- Resets the output pins to false and resets open/built.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:331
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:onNodeReset() end

--- Hook called on a gameplay reset; if the screen is open and the Retry button is included, navigates to "play" and activates the retry pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:171
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:onResetGameplay() end

--- Emits the onEndScreenUIOpened hook and builds the button list: Retry (with career entry fee, disabled if the player cannot pay), Continue at start (or return to scenarios if launched as a scenario), Continue here (outside career, or career with the player's vehicle), tutorial restriction, custom buttons, then "Start Next Mission" buttons. The order is reversed and the first button gets the focus.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:179
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:openDialogue() end

--- Called right after init, once the pins are created.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:41
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:postInit() end

--- Recreates the node's pins for each button name in self.options: string input pin (label), bool input pin "<name>_active" (hidden, true by default) and flow output pin. Reconnects the existing links when the name has not changed.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:97
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:updateButtons() end

--- If reset is active, resets the node. When flow is active and the screen is not yet built, starts the UI building and opens the dialogue. Handles auto-skip: if startingOptions.autoSkipEndScreen is set, stops the mission after 2 s of real time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:342
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:work() end

--- Variant executed only once by the flowgraph engine (empty body here).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua:339
function flowgraph_nodes_ui_updatedUI_endScreenBegin_C:workOnce() end

