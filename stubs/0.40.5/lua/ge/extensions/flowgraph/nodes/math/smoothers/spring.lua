---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_math_smoothers_spring_C
local flowgraph_nodes_math_smoothers_spring_C = {}

--- If 'set' changed, forces the smoother state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:34
function flowgraph_nodes_math_smoothers_spring_C:checkSetValue() end

--- Displays the smoother state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:64
---@param builder any
---@param style any
function flowgraph_nodes_math_smoothers_spring_C:drawMiddle(builder, style) end

--- Sets C.oldSet=0 and C.smoother (class) via newTemporalSigmoidSmoothing().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:28
function flowgraph_nodes_math_smoothers_spring_C:init() end

--- With no input, outputs the state; otherwise calls smoother:getWithSpringDamp(sample, dt, spring, damp).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:42
function flowgraph_nodes_math_smoothers_spring_C:work() end

