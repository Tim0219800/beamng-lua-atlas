---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_dragRace_dragTimes_C
local flowgraph_nodes_gameplay_dragRace_dragTimes_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:42
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:_executionStarted() end

--- Creates the flow_<id> and number <id> pins for each timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:34
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:postInit() end

--- Gets the vehicle's timers via the bridge; reports a node error if vehId is missing or unknown.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:45
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:updateInfos() end

--- Calls updateInfos and copies the set timers to the pins.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:70
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:work() end

