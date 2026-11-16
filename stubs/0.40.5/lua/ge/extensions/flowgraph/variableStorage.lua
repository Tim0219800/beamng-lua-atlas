---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/variableStorage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Variable storage instance. Fields: mgr, id, variables (name -> {name, baseValue, value, index, type, fixedType, undeletable, mergeStrat, mergeFuns, monitored, keepAfterStop}), variableChanges, sortedVariableNames, customVariableOrder, types.
---@class flowgraph_variableStorage
local flowgraph_variableStorage = {}

--- Called on stop: empties the pending changes and resets each variable to its base value (or keeps its value if `keepAfterStop`).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:340
function flowgraph_variableStorage:_executionStopped() end

--- Called when the project is cleared; equivalent to `_executionStopped`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:336
function flowgraph_variableStorage:_onClear() end

--- Reloads the variables from the save data (accepts the old format without `list`), sorted by index then name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:372
---@param data table Saved data.
function flowgraph_variableStorage:_onDeserialized(data) end

--- Serializes the variables: {list = [{name, value=baseValue, index, type, mergeStrat, fixedType, undeletable, monitored, keep}], customVariableOrder}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:351
---@return table  Save data.
function flowgraph_variableStorage:_onSerialize() end

--- Adds a variable. Returns false (and logs an error) if it already exists.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:119
---@param name string Name.
---@param value any Start value.
---@param type string Type.
---@param mergeStrat string Merge strategy name.
---@param fixedType boolean|nil Forbids changing the type.
---@param undeletable boolean|nil Forbids deletion.
---@return boolean  true if added.
function flowgraph_variableStorage:addVariable(name, value, type, mergeStrat, fixedType, undeletable) end

--- Submits a value to the variable's merge strategy; effective after `finalizeChanges`. Rejects nil.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:314
---@param name string Variable.
---@param value any Value.
---@return boolean  false if nonexistent or nil value.
function flowgraph_variableStorage:change(name, value) end

--- Changes the base value and the current value, after a type compatibility check.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:291
---@param name string Variable.
---@param value any New value.
---@return boolean  false if nonexistent or incompatible type.
function flowgraph_variableStorage:changeBase(name, value) end

--- Moves a variable in `customVariableOrder` so that it is placed before/after index `newIdx` (relative to the original order).
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:101
---@param name string Variable to move.
---@param newIdx integer New index.
function flowgraph_variableStorage:changeCustomVariableOrder(name, newIdx) end

--- Immediately changes the current value, with no merge and no type check.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:305
---@param name string Variable.
---@param value any New value.
---@return boolean  false if nonexistent.
function flowgraph_variableStorage:changeInstant(name, value) end

--- Deletes all variables and pending changes.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:82
function flowgraph_variableStorage:clear() end

--- Finalizes the merges of all modified variables (`finalize`, then `init`) and empties the change list. Called by the manager at the end of the frame (inferred from code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:328
function flowgraph_variableStorage:finalizeChanges() end

--- Reads a variable's current value. Logs an error if it does not exist.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:57
---@param name string Name.
---@return any  Value or nil.
---@return boolean  true if the variable exists.
function flowgraph_variableStorage:get(name) end

--- Returns the variable's full table (value, type, strategy...).
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:70
---@param name string Name.
---@return table|nil  Variable.
---@return boolean  true if it exists.
function flowgraph_variableStorage:getFull(name) end

--- Largest sort `index` among the variables (0 if none).
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:111
---@return integer  Max index.
function flowgraph_variableStorage:getMaxSortIndex() end

--- Returns the sorted merge strategies offered for a type (see `sortedMergeFuns`).
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:48
---@param type string Variable type (or 'any', 'all').
---@return table[]  List {name, desc, num}, empty if unknown.
function flowgraph_variableStorage:getMergeStrats(type) end

--- Returns "(manager name / manager id)" for logs.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:40
---@return string  Display name.
function flowgraph_variableStorage:getName() end

--- List of supported variable types (string, number, bool, vec3, quat, color) with color and icon.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:44
---@return table[]  Types.
function flowgraph_variableStorage:getTypes() end

--- Constructor: takes a unique id from the manager, creates the tables and completes the type list with the editor's color and icon.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:25
---@param mgr table Flowgraph manager.
function flowgraph_variableStorage:init(mgr) end

--- Rebuilds `sortedVariableNames`, names sorted by `index`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:88
function flowgraph_variableStorage:refreshSortedVariableNames() end

--- Deletes a variable (unless `undeletable`) and removes it from the custom order.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:236
---@param name string Variable.
---@return boolean  false if nonexistent or undeletable.
function flowgraph_variableStorage:removeVariable(name) end

--- Renames a variable and notifies the getVariable/setVariable nodes of all graphs and macros.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:255
---@param name string Old name.
---@param newName string New name.
---@return boolean  false if `newName` already exists.
function flowgraph_variableStorage:renameVariable(name, newName) end

--- Enables/disables fixed typing.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:208
---@param name string Variable.
---@param fixedType boolean|nil true to fix.
---@return boolean  false if nonexistent.
function flowgraph_variableStorage:setFixedType(name, fixedType) end

--- If true, the current value becomes the base value when the project stops (kept).
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:226
---@param name string Variable.
---@param keep boolean|nil true to keep.
---@return boolean  false if nonexistent.
function flowgraph_variableStorage:setKeepAfterStop(name, keep) end

--- Sets the merge strategy and initializes it. An invalid strategy is replaced by a default value depending on the type.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:140
---@param name string Variable.
---@param strat string Strategy.
---@return boolean  false if the variable does not exist.
function flowgraph_variableStorage:setMergeStrat(name, strat) end

--- Marks the variable as monitored (displayed in the editor).
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:217
---@param name string Variable.
---@param monitor boolean|nil true to monitor.
---@return boolean  false if nonexistent.
function flowgraph_variableStorage:setMonitor(name, monitor) end

--- Changes a variable's type (values reset to a default of the type), switches back to the `last` strategy and notifies the getVariable/setVariable nodes.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:163
---@param name string Variable.
---@param type string New type.
---@return boolean  false if nonexistent or fixed type.
function flowgraph_variableStorage:updateType(name, type) end

--- Tells whether a variable exists.
---Source: lua/ge/extensions/flowgraph/variableStorage.lua:52
---@param name string Name.
---@return boolean  true if it exists.
function flowgraph_variableStorage:variableExists(name) end

