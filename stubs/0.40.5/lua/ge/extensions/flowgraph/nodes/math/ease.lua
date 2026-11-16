---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/ease.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_math_ease_C
local flowgraph_nodes_math_ease_C = {}

--- Reads back easeFuncName and the associated function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/ease.lua:88
---@param nodeData any
function flowgraph_nodes_math_ease_C:_onDeserialized(nodeData) end

--- Saves easeFuncName.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/ease.lua:84
---@param res any
function flowgraph_nodes_math_ease_C:_onSerialize(res) end

--- Dropdown of easing functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/ease.lua:69
function flowgraph_nodes_math_ease_C:drawCustomProperties() end

--- Displays the function name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/ease.lua:102
---@param builder any
---@param style any
function flowgraph_nodes_math_ease_C:drawMiddle(builder, style) end

--- Default function: linear.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/ease.lua:63
function flowgraph_nodes_math_ease_C:init() end

--- If the input is not nil/false, writes easeFunc(value) to the output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/ease.lua:96
function flowgraph_nodes_math_ease_C:work() end

