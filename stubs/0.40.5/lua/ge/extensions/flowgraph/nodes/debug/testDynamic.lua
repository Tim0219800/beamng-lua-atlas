---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_debug_testDynamic_C
local flowgraph_nodes_debug_testDynamic_C = {}

--- Resets on execution.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:18
function flowgraph_nodes_debug_testDynamic_C:_executionStarted() end

--- Editor: progress bar timer/5.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:28
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_debug_testDynamic_C:drawMiddle(builder, style) end

--- Timer at 0 and state 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:13
---@param mgr table unused
---@param ... any
function flowgraph_nodes_debug_testDynamic_C:init(mgr, ...) end

--- Resets the timer and the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:23
function flowgraph_nodes_debug_testDynamic_C:onNodeReset() end

--- Advances the timer and switches to 'finished' at 5 s.
---Source: lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:38
---@param args any unused
function flowgraph_nodes_debug_testDynamic_C:work(args) end

--- Timer at 0, state 'started'.
---Source: lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:33
function flowgraph_nodes_debug_testDynamic_C:workOnce() end

