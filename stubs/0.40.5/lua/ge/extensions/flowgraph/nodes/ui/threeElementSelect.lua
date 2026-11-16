---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_threeElementSelect_C
local flowgraph_nodes_ui_threeElementSelect_C = {}

--- Outputs to false, _active = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:44
function flowgraph_nodes_ui_threeElementSelect_C:_executionStarted() end

--- Closes and resets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:63
function flowgraph_nodes_ui_threeElementSelect_C:_executionStopped() end

--- Sets the chosen pick output to true, the others to false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:76
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_threeElementSelect_C:buttonPushed(action) end

--- Marks the screen as closed.
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:86
function flowgraph_nodes_ui_threeElementSelect_C:closeDialogue() end

--- done = true.
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:114
function flowgraph_nodes_ui_threeElementSelect_C:closed() end

--- Returns the Lua command that calls buttonPushed(action) back.
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:82
---@param action string Name of the activated button or output pin.
function flowgraph_nodes_ui_threeElementSelect_C:getCmd(action) end

--- open = false, done = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:39
function flowgraph_nodes_ui_threeElementSelect_C:init() end

--- Hook: resets open and _active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:127
function flowgraph_nodes_ui_threeElementSelect_C:onClientEndMission() end

--- Builds the three elements (image, name, description, button code) and navigates to 'menu.threeElementSelect'.
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:91
function flowgraph_nodes_ui_threeElementSelect_C:openDialogue() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:53
function flowgraph_nodes_ui_threeElementSelect_C:postInit() end

--- Resets done, open and _active to false.
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:70
function flowgraph_nodes_ui_threeElementSelect_C:reset() end

--- Closes the screen then writes pinOut.flow (see notes).
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:120
function flowgraph_nodes_ui_threeElementSelect_C:started() end

--- Handles reset; opens the screen when the input flow is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:132
function flowgraph_nodes_ui_threeElementSelect_C:work() end

