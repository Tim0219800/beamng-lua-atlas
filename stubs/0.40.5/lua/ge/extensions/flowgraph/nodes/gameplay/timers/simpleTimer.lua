---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_timers_simpleTimer_C
local flowgraph_nodes_gameplay_timers_simpleTimer_C = {}

--- Sets the duration state to 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:25
function flowgraph_nodes_gameplay_timers_simpleTimer_C:_executionStarted() end

--- Resets the timer's elapsed time to 0 and the duration state to 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:33
function flowgraph_nodes_gameplay_timers_simpleTimer_C:onNodeReset() end

--- Defines the preset values of the ref pin (dtSim, dtReal, dtRaw).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:29
function flowgraph_nodes_gameplay_timers_simpleTimer_C:postInit() end

--- Updates elapsed/remaining/duration/elapsedPercent, switches to 'finished' when the timer is complete.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:47
function flowgraph_nodes_gameplay_timers_simpleTimer_C:work() end

--- Creates the timer via self.mgr.modules.timer:addTimer, publishes timerId and sets the duration state to 'started'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua:42
function flowgraph_nodes_gameplay_timers_simpleTimer_C:workOnce() end

