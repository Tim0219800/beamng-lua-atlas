---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/math.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_math_math_C
local flowgraph_nodes_math_math_C = {}

--- Builds activePinList (connected input pins).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:258
function flowgraph_nodes_math_math_C:_executionStarted() end

--- Calls parseExpression after loading (result ignored).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:269
---@param nodeData any
function flowgraph_nodes_math_math_C:_onDeserialized(nodeData) end

--- Builds the expression environment (math functions and utilities, pin reading with vec3/quat cache).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:101
---@return table  environment passed to load()
function flowgraph_nodes_math_math_C:buildBaseEnv() end

--- List of expression templates and description of their pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:47
function flowgraph_nodes_math_math_C:drawCustomProperties() end

--- Displays the expression.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:246
---@param builder any
---@param style any
function flowgraph_nodes_math_math_C:drawMiddle(builder, style) end

--- safeMode=true, empty expression, creation of the environment and the vec3/quat caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:277
function flowgraph_nodes_math_math_C:init() end

--- Creates an additional input pin (next letter, default value 0) when a link is added and a pin is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:251
---@param link any
function flowgraph_nodes_math_math_C:onLink(link) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:273
---@param link any
function flowgraph_nodes_math_math_C:onUnlink(link) end

--- Rejects assignments (isolated '=') then compiles 'return <expression>' with load() in the environment.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:182
---@return function|nil  compiled function
---@return string|nil  error message
function flowgraph_nodes_math_math_C:parseExpression() end

--- In safeMode, does nothing if a connected input is nil. Recompiles if the expression changed, runs with pcall, converts a vec3/quat result (cdata) to a table {x,y,z[,w]}, writes 'value' and reports errors (node + logEvent).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/math/math.lua:199
function flowgraph_nodes_math_math_C:work() end

