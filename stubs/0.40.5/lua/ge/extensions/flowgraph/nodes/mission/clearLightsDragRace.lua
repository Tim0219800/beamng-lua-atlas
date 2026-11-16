---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_clearLightsDragRace_C
local flowgraph_nodes_mission_clearLightsDragRace_C = {}

--- Clears the lights table and sets flow to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:71
function flowgraph_nodes_mission_clearLightsDragRace_C:_executionStarted() end

--- Hides the displays display_time_i_l/r and display_speed_i_l/r (i from 1 to 5).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:55
function flowgraph_nodes_mission_clearLightsDragRace_C:clearDigits() end

--- Same initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:76
function flowgraph_nodes_mission_clearLightsDragRace_C:init() end

--- Searches the scene for the light objects and hides them all (setHidden(true)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:18
function flowgraph_nodes_mission_clearLightsDragRace_C:initLights() end

--- Calls initLights and clearDigits on every frame of flow (no check of the input flow) and sets flow to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:81
function flowgraph_nodes_mission_clearLightsDragRace_C:work() end

