---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_stageLightsDragRace_C
local flowgraph_nodes_mission_stageLightsDragRace_C = {}

--- Empties the lights table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:43
function flowgraph_nodes_mission_stageLightsDragRace_C:_executionStarted() end

--- Empties the lights table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:47
function flowgraph_nodes_mission_stageLightsDragRace_C:init() end

--- Searches the scene for the four light objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:32
function flowgraph_nodes_mission_stageLightsDragRace_C:initLights() end

--- Defines the offered values of the pins side (left/right) and light (Pre Stage/Stage).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:21
function flowgraph_nodes_mission_stageLightsDragRace_C:postInit() end

--- On reset: finds the lights again and hides them. Otherwise makes the chosen light visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:51
function flowgraph_nodes_mission_stageLightsDragRace_C:work() end

