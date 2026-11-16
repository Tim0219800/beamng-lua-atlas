---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_math_smoothers_nonLinear_C
local flowgraph_nodes_math_smoothers_nonLinear_C = {}

--- If 'set' changed, forces the smoother state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua:32
function flowgraph_nodes_math_smoothers_nonLinear_C:checkSetValue() end

--- Displays the smoother state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua:59
---@param builder any
---@param style any
function flowgraph_nodes_math_smoothers_nonLinear_C:drawMiddle(builder, style) end

--- Sets C.oldSet=0 (class) and creates the nonlinear smoother.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua:26
function flowgraph_nodes_math_smoothers_nonLinear_C:init() end

--- With no input, outputs the state; otherwise outputs smoother:getWithRate(sample, dt, rate) with rate = upRate/downRate (default 1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua:40
function flowgraph_nodes_math_smoothers_nonLinear_C:work() end

