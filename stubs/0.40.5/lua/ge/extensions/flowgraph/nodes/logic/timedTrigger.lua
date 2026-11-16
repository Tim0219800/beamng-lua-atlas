---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_timedTrigger_C
local flowgraph_nodes_logic_timedTrigger_C = {}

--- Resets all counters to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:35
function flowgraph_nodes_logic_timedTrigger_C:_executionStopped() end

--- Reads data.duration back.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:47
---@param res any
function flowgraph_nodes_logic_timedTrigger_C:_onDeserialized(res) end

--- Saves data.duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:43
---@param res any
function flowgraph_nodes_logic_timedTrigger_C:_onSerialize(res) end

--- Two progress bars (charge and reset) with remaining time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:70
---@param builder any
---@param style any
function flowgraph_nodes_logic_timedTrigger_C:drawMiddle(builder, style) end

--- Initializes resetTimer=1, duration=3 and the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:25
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_timedTrigger_C:init(mgr, ...) end

--- Increments timer (dtSim) when charge is active, fires completeTrigger at the duration; otherwise increments reset and resets the timer to zero after resetTimer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:50
function flowgraph_nodes_logic_timedTrigger_C:updateCharge() end

--- Calls updateCharge, flow = (timer >= duration), complete = impulse only once (completeReady).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:80
---@param args any unused
function flowgraph_nodes_logic_timedTrigger_C:work(args) end

