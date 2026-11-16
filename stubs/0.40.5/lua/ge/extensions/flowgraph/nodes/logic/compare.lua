---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/compare.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_compare_C
local flowgraph_nodes_logic_compare_C = {}

--- Finds the comparison via opSymbol (or the old field data.comparisonFunc) then calls refreshFunction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:79
---@param res any
function flowgraph_nodes_logic_compare_C:_onDeserialized(res) end

--- Called when a property changes; reruns refreshFunction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:70
---@param key string property name
---@param val any new value
function flowgraph_nodes_logic_compare_C:_onPropertyChanged(key, val) end

--- Saves opSymbol of the current comparison.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:75
---@param res any
function flowgraph_nodes_logic_compare_C:_onSerialize(res) end

--- Properties panel: dropdown of comparison functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:38
function flowgraph_nodes_logic_compare_C:drawCustomProperties() end

--- Displays the operator symbol.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:114
---@param builder any
---@param style any
function flowgraph_nodes_logic_compare_C:drawMiddle(builder, style) end

--- Sorts the comparison operators by name and selects the first one by default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:29
function flowgraph_nodes_logic_compare_C:init() end

--- Updates compFunc from the chosen comparison; if absent, installs an empty function and reports the error 'Invalid comparison'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:59
function flowgraph_nodes_logic_compare_C:refreshFunction() end

--- Computes value = compFunc(A, B); flow follows the flow input, true = value, false = not value. nil case described above.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/compare.lua:97
function flowgraph_nodes_logic_compare_C:work() end

