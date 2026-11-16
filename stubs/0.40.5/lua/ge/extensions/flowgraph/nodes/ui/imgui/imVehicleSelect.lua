---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_imgui_imVehicleSelect_C
local flowgraph_nodes_ui_imgui_imVehicleSelect_C = {}

--- Creates the selection utility with the data options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:33
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:_executionStarted() end

--- Draws the "Vehicle Select" window (widget, Select and Reset buttons) and updates the outputs.
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:48
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:displayWindow() end

--- Empty central area.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:44
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:drawMiddle(builder, style) end

--- Default data options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:27
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:init() end

--- Closes the window and resets selected to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:79
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:onNodeReset() end

--- Displays the window if open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:90
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:work() end

--- Opens the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:85
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:workOnce() end

