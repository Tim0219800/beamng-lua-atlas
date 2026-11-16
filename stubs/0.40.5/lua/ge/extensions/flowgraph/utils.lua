---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph utilities: detection of a value's type, compatibility test with a pin type, default value per type, ImGui label, and merge functions used by `variableStorage` variables when several nodes write the same variable in the same frame. It is loaded as the `flowgraph_utils` extension but also via `require` from pin and variableStorage.
--- Access: extension `flowgraph_utils`: `extensions.load("flowgraph_utils")`, then the global `flowgraph_utils`
---@class flowgraph_utils
---@field mergeFuns table<string, table> Merge functions by category: all, number, bool, vec3, string, any. Each entry: {num, description, init, merge, finalize}.
---@field sortedMergeFuns table<string, table[]> Sorted lists {name, desc, num} by category (any, all, number, string, bool, vec3), for display in the editor.
flowgraph_utils = {}

--- Default value of a type: 0 (number/any), '' (string), true (bool), {0,0,0} (vec3), {0,0,0,0} (quat), {1,1,1,1} (color), {} (table). If `typeName` is a list, uses the first element. Other type: nil.
---Source: lua/ge/extensions/flowgraph/utils.lua:31
---@param typeName string|table Type or list of types.
---@return any  Default value or nil.
function flowgraph_utils.getDefaultValueForType(typeName) end

--- Gives the flowgraph type of a Lua value: bool, string, number, vec3 (table of 3), quat (table of 4), otherwise nil.
---Source: lua/ge/extensions/flowgraph/utils.lua:10
---@param value any Value to test.
---@return string|nil  Type name or nil.
function flowgraph_utils.getVariableType(value) end

--- Tells whether a value can be stored in a pin/variable of type `compType`.
---Source: lua/ge/extensions/flowgraph/utils.lua:21
---@param value any Value.
---@param compType string Target type (bool, string, number, vec3, quat, color, table).
---@return boolean  true if compatible.
function flowgraph_utils.isVariableCompatible(value, compType) end

--- Draws a small ImGui label (translucent red background by default) just above the current line.
---Source: lua/ge/extensions/flowgraph/utils.lua:53
---@param label string Text.
---@param color any Background ImVec4 (default red, 0.4 alpha).
function flowgraph_utils.showLabel(label, color) end

