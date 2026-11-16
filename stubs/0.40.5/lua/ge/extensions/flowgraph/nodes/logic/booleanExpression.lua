---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_booleanExpression_C
local flowgraph_nodes_logic_booleanExpression_C = {}

--- At start, builds the activePinList list of actually connected input pins (used by safeMode).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:181
function flowgraph_nodes_logic_booleanExpression_C:_executionStarted() end

--- Calls parseExpression after loading (the result is ignored).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:192
---@param nodeData any
function flowgraph_nodes_logic_booleanExpression_C:_onDeserialized(nodeData) end

--- Builds the expression environment: a table whose __index reads the value of the input pin with the same name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:96
---@return table  environment passed to load()
function flowgraph_nodes_logic_booleanExpression_C:buildBaseEnv() end

--- Properties panel: dropdown of expression templates (AND, OR, XOR, NAND, or 'Custom Expression') and description of the chosen template's pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:62
function flowgraph_nodes_logic_booleanExpression_C:drawCustomProperties() end

--- Displays the expression in the middle of the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:169
---@param builder any
---@param style any
function flowgraph_nodes_logic_booleanExpression_C:drawMiddle(builder, style) end

--- Initializes data.safeMode=true, empty expression, the environment and a whitelist of keywords (not, true, false, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:200
function flowgraph_nodes_logic_booleanExpression_C:init() end

--- When a link is added and a pin is missing, creates a new bool input pin named after the next letter (a, b, c...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:174
---@param link any
function flowgraph_nodes_logic_booleanExpression_C:onLink(link) end

--- Empty (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:196
---@param link any
function flowgraph_nodes_logic_booleanExpression_C:onUnlink(link) end

--- Checks the expression (rejects assignment '=' and characters other than lowercase letters/spaces/parentheses) then compiles it with load() in the restricted environment.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:114
---@return function|nil  compiled function
---@return string|nil  error message
function flowgraph_nodes_logic_booleanExpression_C:parseExpression() end

--- In safeMode, does nothing if a connected input is nil. Recompiles the expression if it changed, runs it with pcall and writes the result to 'value'; errors are displayed via __setNodeError('expression').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:134
function flowgraph_nodes_logic_booleanExpression_C:work() end

