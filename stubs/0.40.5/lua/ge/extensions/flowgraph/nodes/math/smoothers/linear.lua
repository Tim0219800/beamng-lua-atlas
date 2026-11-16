---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_math_smoothers_linear_C
local flowgraph_nodes_math_smoothers_linear_C = {}

--- Creates the smoother (newTemporalSmoothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:31
function flowgraph_nodes_math_smoothers_linear_C:_executionStarted() end

--- If 'set' changed, forces the smoother state to that value.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:36
function flowgraph_nodes_math_smoothers_linear_C:checkSetValue() end

--- Displays the smoother state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:63
---@param builder any
---@param style any
function flowgraph_nodes_math_smoothers_linear_C:drawMiddle(builder, style) end

--- Sets C.oldSet=0 (at class level).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:26
function flowgraph_nodes_math_smoothers_linear_C:init() end

--- With no input, outputs the current state; otherwise chooses the rate (upRate/downRate, default 1) and outputs smoother:getWithRateUncapped(sample, dt, rate).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:44
function flowgraph_nodes_math_smoothers_linear_C:work() end

