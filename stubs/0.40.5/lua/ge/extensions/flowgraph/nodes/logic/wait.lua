---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/wait.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_wait_C
local flowgraph_nodes_logic_wait_C = {}

--- Resets timer and running to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/wait.lua:32
function flowgraph_nodes_logic_wait_C:_executionStarted() end

--- Migrates the old field 'duration' to the hard-coded pin 'duration'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/wait.lua:37
---@param res any
function flowgraph_nodes_logic_wait_C:_onDeserialized(res) end

--- Progress bar and Reset button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/wait.lua:53
---@param builder any
---@param style any
function flowgraph_nodes_logic_wait_C:drawMiddle(builder, style) end

--- timer=0, running=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/wait.lua:27
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_wait_C:init(mgr, ...) end

--- If running, adds dtSim or dtReal to the timer; at the end stops and emits the impulse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/wait.lua:44
function flowgraph_nodes_logic_wait_C:updateTimer() end

--- Handles flow/reset, calls updateTimer; flow = (timer >= duration) AND input flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/wait.lua:64
---@param args any unused
function flowgraph_nodes_logic_wait_C:work(args) end

