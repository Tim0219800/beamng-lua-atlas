---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_timetrials_onRaceComplete_C
local flowgraph_nodes_timetrials_onRaceComplete_C = {}

--- complete = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:27
function flowgraph_nodes_timetrials_onRaceComplete_C:_executionStarted() end

--- complete = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:23
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_timetrials_onRaceComplete_C:init(mgr, ...) end

--- Scenario end hook: marks the race as finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:37
function flowgraph_nodes_timetrials_onRaceComplete_C:onScenarioFinished() end

--- Restart hook: resets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:41
function flowgraph_nodes_timetrials_onRaceComplete_C:onScenarioRestarted() end

--- Writes complete and ongoing.
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceComplete.lua:32
function flowgraph_nodes_timetrials_onRaceComplete_C:work() end

