---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_ui_updatedUI_startScreenBegin_C
local flowgraph_nodes_ui_updatedUI_startScreenBegin_C = {}

--- Resets started/done/built and auto-skip when the project starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:25
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:_executionStarted() end

--- Called when the project stops; calls closeDialogue (no real effect).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:34
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:_executionStopped() end

--- Does nothing in practice: the navigation to "play" is commented out.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:42
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:closeDialogue() end

--- End-of-mission hook on the client side; calls closeDialogue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:38
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:onClientEndMission() end

--- Called when the node is reset (reset pin or graph reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:48
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:onNodeReset() end

--- Simulates the click on Start: sets done=true, emits the onUIStartButtonClicked hook, navigates to the "play" screen and clears modules.ui.uiLayout.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:107
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:startFromUi() end

--- Handles reset, builds the screen at the first flow, activates build for one frame, publishes done on the output flow pin, triggers startFromUi if triggerStart is received, and applies auto-skip (startingOptions.autoSkipStartScreen, after 2 s of real time).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:60
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:work() end

--- Variant executed only once by the flowgraph engine (empty body here).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:57
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:workOnce() end

