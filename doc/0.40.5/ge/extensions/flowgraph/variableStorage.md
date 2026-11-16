# `flowgraph_variableStorage`

*File: `lua/ge/extensions/flowgraph/variableStorage.lua` · VM: Game Engine (GE) · 407 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/variableStorage")` (file under extensions/ but not a regular extension)

Variable storage of a flowgraph project (project global variables read/written by the getVariable/setVariable nodes). The module returns a constructor: `require('flowgraph_variableStorage')(mgr)`. Each variable has a name, a type (string, number, bool, vec3, quat, color), a base value, a current value, a merge strategy (see `flowgraph_utils`) and options (fixed type, undeletable, monitored, kept after stop). The frame's writes go through `change` then are merged by `finalizeChanges`.

## Example

```lua
local vs = mgr.variables
vs:addVariable('score', 0, 'number', 'sum')
vs:change('score', 10)
vs:finalizeChanges()
local v, ok = vs:get('score')
```

## Notes

- Three ways to write: `changeBase` (start value + current, with type check), `changeInstant` (current value only, no merge) and `change` (goes through the merge strategy, effective after `finalizeChanges`).
- On stop (`_executionStopped`), each variable goes back to its `baseValue`, except those marked `keepAfterStop`, whose current value becomes the new base.
- Default strategies if the requested one is invalid: `last`, `max` for a number, `or_` for a bool.
- `updateType` resets the value to a default of the type (false, 0, '', {0,0,0}...) and does not work if `fixedType`.
- Probable bug: `renameVariable` does not update the `name` field of the renamed variable and calls `table.insert(customVariableOrder, nil, newName)` if the old name was not in the custom order.
- Probable bug: `_onDeserialized` does `self.customVariableOrder = self.customVariableOrder or data.customVariableOrder`; since `customVariableOrder` always exists (a table), the saved order is ignored (the order is rebuilt by `addVariable`).
- `changeCustomVariableOrder` crashes if the name is not in `customVariableOrder` (`oldIdx` nil).

## Class `C`

Variable storage instance. Fields: mgr, id, variables (name -> {name, baseValue, value, index, type, fixedType, undeletable, mergeStrat, mergeFuns, monitored, keepAfterStop}), variableChanges, sortedVariableNames, customVariableOrder, types.

The module returns a constructor: `local obj = require("flowgraph_variableStorage")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Called on stop: empties the pending changes and resets each variable to its base value (or keeps its value if `keepAfterStop`). | 340 |
| `C:_onClear()` | Called when the project is cleared; equivalent to `_executionStopped`. | 336 |
| `C:_onDeserialized(data)` | Reloads the variables from the save data (accepts the old format without `list`), sorted by index then name. | 372 |
| `C:_onSerialize()` | Serializes the variables: {list = [{name, value=baseValue, index, type, mergeStrat, fixedType, undeletable, monitored, keep}], customVariableOrder}. | 351 |
| `C:addVariable(name, value, type, mergeStrat, fixedType, undeletable)` | Adds a variable. Returns false (and logs an error) if it already exists. | 119 |
| `C:change(name, value)` | Submits a value to the variable's merge strategy; effective after `finalizeChanges`. Rejects nil. | 314 |
| `C:changeBase(name, value)` | Changes the base value and the current value, after a type compatibility check. | 291 |
| `C:changeCustomVariableOrder(name, newIdx)` | Moves a variable in `customVariableOrder` so that it is placed before/after index `newIdx` (relative to the original order). | 101 |
| `C:changeInstant(name, value)` | Immediately changes the current value, with no merge and no type check. | 305 |
| `C:clear()` | Deletes all variables and pending changes. | 82 |
| `C:finalizeChanges()` | Finalizes the merges of all modified variables (`finalize`, then `init`) and empties the change list. Called by the manager at the end of the frame (inferred from code). | 328 |
| `C:get(name)` | Reads a variable's current value. Logs an error if it does not exist. | 57 |
| `C:getFull(name)` | Returns the variable's full table (value, type, strategy...). | 70 |
| `C:getMaxSortIndex()` | Largest sort `index` among the variables (0 if none). | 111 |
| `C:getMergeStrats(type)` | Returns the sorted merge strategies offered for a type (see `sortedMergeFuns`). | 48 |
| `C:getName()` | Returns "(manager name / manager id)" for logs. | 40 |
| `C:getTypes()` | List of supported variable types (string, number, bool, vec3, quat, color) with color and icon. | 44 |
| `C:init(mgr)` | Constructor: takes a unique id from the manager, creates the tables and completes the type list with the editor's color and icon. | 25 |
| `C:refreshSortedVariableNames()` | Rebuilds `sortedVariableNames`, names sorted by `index`. | 88 |
| `C:removeVariable(name)` | Deletes a variable (unless `undeletable`) and removes it from the custom order. | 236 |
| `C:renameVariable(name, newName)` | Renames a variable and notifies the getVariable/setVariable nodes of all graphs and macros. | 255 |
| `C:setFixedType(name, fixedType)` | Enables/disables fixed typing. | 208 |
| `C:setKeepAfterStop(name, keep)` | If true, the current value becomes the base value when the project stops (kept). | 226 |
| `C:setMergeStrat(name, strat)` | Sets the merge strategy and initializes it. An invalid strategy is replaced by a default value depending on the type. | 140 |
| `C:setMonitor(name, monitor)` | Marks the variable as monitored (displayed in the editor). | 217 |
| `C:updateType(name, type)` | Changes a variable's type (values reset to a default of the type), switches back to the `last` strategy and notifies the getVariable/setVariable nodes. | 163 |
| `C:variableExists(name)` | Tells whether a variable exists. | 52 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/variableStorage.lua`.*
