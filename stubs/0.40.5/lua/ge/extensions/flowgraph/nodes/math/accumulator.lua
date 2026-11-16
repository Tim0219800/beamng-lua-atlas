---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/accumulator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_math_accumulator_C
local flowgraph_nodes_math_accumulator_C = {}

--- Resets the sum to resetValue and updates result.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:29
function flowgraph_nodes_math_accumulator_C:_executionStarted() end

--- Resets the sum to resetValue and updates result.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:34
function flowgraph_nodes_math_accumulator_C:_executionStopped() end

--- Resets the sum to resetValue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:56
function flowgraph_nodes_math_accumulator_C:_onDeserialized() end

--- Displays the current sum.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:60
---@param builder any
---@param style any
function flowgraph_nodes_math_accumulator_C:drawMiddle(builder, style) end

--- currentSum=0, resetValue=0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:24
function flowgraph_nodes_math_accumulator_C:init() end

--- Applies reset, then adds value if add is active (changed=true), writes result.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:39
function flowgraph_nodes_math_accumulator_C:work() end

