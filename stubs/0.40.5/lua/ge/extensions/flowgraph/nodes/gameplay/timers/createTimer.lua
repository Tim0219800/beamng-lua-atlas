---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_timers_createTimer_C
local flowgraph_nodes_gameplay_timers_createTimer_C = {}

--- Called when the flowgraph project execution starts; resets the node's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua:18
function flowgraph_nodes_gameplay_timers_createTimer_C:_executionStarted() end

--- Defines the preset values of the ref pin (dtSim, dtReal, dtRaw).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua:22
function flowgraph_nodes_gameplay_timers_createTimer_C:postInit() end

--- Calls self.mgr.modules.timer:addTimer({duration, mode=ref}) and publishes the id on timerId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua:26
function flowgraph_nodes_gameplay_timers_createTimer_C:workOnce() end

