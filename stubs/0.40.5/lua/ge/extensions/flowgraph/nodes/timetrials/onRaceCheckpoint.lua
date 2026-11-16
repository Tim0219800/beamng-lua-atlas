---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_timetrials_onRaceCheckpoint_C
local flowgraph_nodes_timetrials_onRaceCheckpoint_C = {}

--- Resets lap = 1 and enterFlag = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:35
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:_executionStarted() end

--- Initializes enterFlag, lap = 1 and clearOutPinsOnStart = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:29
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:init(mgr, ...) end

--- Hook: stores vehId, index (data.cur) and updates the lap (data.lapDiff).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:40
---@param data any {vehId, cur, lapDiff} table
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:onRaceWaypointReached(data) end

--- Scenario restart hook: resets the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:53
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:onScenarioRestarted() end

--- Writes checked = enterFlag then resets it to false.
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceCheckpoint.lua:48
---@param args any unused
function flowgraph_nodes_timetrials_onRaceCheckpoint_C:work(args) end

