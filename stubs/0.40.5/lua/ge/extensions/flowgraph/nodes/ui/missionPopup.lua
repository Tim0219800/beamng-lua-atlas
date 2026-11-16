---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_missionPopup_C
local flowgraph_nodes_ui_missionPopup_C = {}

--- Resets outputs and state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:30
function flowgraph_nodes_ui_missionPopup_C:_executionStarted() end

--- Closes the popup if open and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:50
function flowgraph_nodes_ui_missionPopup_C:_executionStopped() end

--- Closes the tutorial popup if open.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:67
function flowgraph_nodes_ui_missionPopup_C:closeDialogue() end

--- Returns the unique identifier of the popup (manager, graph, node).
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:63
function flowgraph_nodes_ui_missionPopup_C:getPopupId() end

--- open = false, done = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:25
function flowgraph_nodes_ui_missionPopup_C:init() end

--- Hook: resets open and _active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:103
function flowgraph_nodes_ui_missionPopup_C:onClientEndMission() end

--- Filtered input hook; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:99
---@param devName string Name of the input device.
---@param action string Name of the activated button or output pin.
---@param value number Input value.
function flowgraph_nodes_ui_missionPopup_C:onFilteredInputChanged(devName, action, value) end

--- Hook: popup closed (id); if it is this node's, sets the output flow to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:91
---@param id string Identifier of the closed popup.
function flowgraph_nodes_ui_missionPopup_C:onIntroPopupCareerClosed(id) end

--- Opens the popup with title, text and button label.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:75
function flowgraph_nodes_ui_missionPopup_C:openDialogue() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:39
function flowgraph_nodes_ui_missionPopup_C:postInit() end

--- Resets done, open and _active to false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:57
function flowgraph_nodes_ui_missionPopup_C:reset() end

--- Handles the reset; opens the popup when the input flow is active and it is not already open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:108
function flowgraph_nodes_ui_missionPopup_C:work() end

