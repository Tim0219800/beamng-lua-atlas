---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_timetrials_onRaceRestarted_C
local flowgraph_nodes_timetrials_onRaceRestarted_C = {}

--- restart = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:27
function flowgraph_nodes_timetrials_onRaceRestarted_C:_executionStarted() end

--- restart = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:23
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_timetrials_onRaceRestarted_C:init(mgr, ...) end

--- Scenario restart hook: restart = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:36
function flowgraph_nodes_timetrials_onRaceRestarted_C:onScenarioRestarted() end

--- Writes pinOut.restart with self.started, then restart = false.
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceRestarted.lua:31
function flowgraph_nodes_timetrials_onRaceRestarted_C:work() end

