---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_UpdateDisplayDragRace_C
local flowgraph_nodes_mission_UpdateDisplayDragRace_C = {}

--- Clears the display lists and sets the flow output to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:96
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:_executionStarted() end

--- Same initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:104
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:init() end

--- Searches the scene for the 20 objects display_time_i_l/r and display_speed_i_l/r (i from 1 to 5) and stores them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:80
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:insertDigits() end

--- Defines the offered values for the 'side' pin: left=l, right=r.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:22
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:postInit() end

--- Builds the list of digits (time with 3 decimals, speed with 2) and applies the right model to each of the 5 displays of the chosen side; an 'empty' is added for the leading zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:29
---@param side string 'l' or 'r'
---@param finishTime number time in seconds
---@param finishSpeed number speed in mph
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:updateDisplay(side, finishTime, finishSpeed) end

--- On reset: finds the displays again and resets the display to 0. Otherwise, if time, velocity and side are provided, updates the display; flow=true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:112
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:work() end

