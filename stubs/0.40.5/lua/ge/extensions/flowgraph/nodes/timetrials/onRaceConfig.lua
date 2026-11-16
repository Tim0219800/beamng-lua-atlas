---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_timetrials_onRaceConfig_C
local flowgraph_nodes_timetrials_onRaceConfig_C = {}

--- done = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:29
function flowgraph_nodes_timetrials_onRaceConfig_C:_executionStarted() end

--- done = false, clearOutPinsOnStart = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:24
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_timetrials_onRaceConfig_C:init(mgr, ...) end

--- Restart hook: reads the configuration again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:46
function flowgraph_nodes_timetrials_onRaceConfig_C:onScenarioRestarted() end

--- As long as not done and a scenario exists, copies its settings to the pins.
---Source: lua/ge/extensions/flowgraph/nodes/timetrials/onRaceConfig.lua:33
function flowgraph_nodes_timetrials_onRaceConfig_C:work() end

