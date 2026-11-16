---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/increaser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_math_increaser_C
local flowgraph_nodes_math_increaser_C = {}

--- Resets currentValue to resetValue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/increaser.lua:36
function flowgraph_nodes_math_increaser_C:_executionStopped() end

--- Displays the current value.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/increaser.lua:60
---@param builder any
---@param style any
function flowgraph_nodes_math_increaser_C:drawMiddle(builder, style) end

--- currentValue=0, resetValue=0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/increaser.lua:31
function flowgraph_nodes_math_increaser_C:init() end

--- Applies clear, updates the maximum, writes result; flow follows the flow input.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/increaser.lua:40
function flowgraph_nodes_math_increaser_C:work() end

