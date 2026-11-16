---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- History object. Fields: maxUndoLevels, undoStack, redoStack, currentTransaction.
---@class editor_api_history
local editor_api_history = {}

--- Starts a group of actions that can be undone at once. The redos are only run at endTransaction.
---Source: lua/ge/extensions/editor/api/history.lua:76
---@param name string|nil transaction name (optional)
---@return table|boolean  the created transaction, or false if a transaction is already in progress
function editor_api_history:beginTransaction(name) end

--- Abandons the current transaction without running or pushing anything (useful if an action failed).
---Source: lua/ge/extensions/editor/api/history.lua:88
function editor_api_history:cancelTransaction() end

--- Clears the undo and redo stacks (new document).
---Source: lua/ge/extensions/editor/api/history.lua:173
function editor_api_history:clear() end

--- Records an undo/redo action and runs its redo. Inside a transaction, the action is only added to the group.
---Source: lua/ge/extensions/editor/api/history.lua:122
---@param name string action name, without the "Action" suffix (e.g. "MyCreateWhatever")
---@param data table data shared by undoFunc and redoFunc
---@param undoFunc function function(actionData) that undoes the action
---@param redoFunc function function(actionData) that does/redoes the action
---@param dontCallRedoNow boolean|nil true = do not call redoFunc now
---@return any  see notes: result of redoFunc, action, nil (duplicate) or false
function editor_api_history:commitAction(name, data, undoFunc, redoFunc, dontCallRedoNow) end

--- Restores the stacks from `data.history` if it exists and cancels the current transaction.
---Source: lua/ge/extensions/editor/api/history.lua:212
---@param data table table containing history
function editor_api_history:deserialize(data) end

--- Ends the transaction: pushes it and runs the redos of all its actions (unless dontCallRedoNow), then clears the redo stack.
---Source: lua/ge/extensions/editor/api/history.lua:94
---@param dontCallRedoNow boolean|nil true = do not run the redos now
---@return boolean  always true
function editor_api_history:endTransaction(dontCallRedoNow) end

--- Initializes empty stacks, maxUndoLevels = 1000, no transaction in progress. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/history.lua:31
function editor_api_history:init() end

--- Redoes `steps` transactions: calls the redo of each action in order, then puts them back on the undo stack.
---Source: lua/ge/extensions/editor/api/history.lua:58
---@param steps integer|nil number of transactions to redo, 1 by default
function editor_api_history:redo(steps) end

--- Writes `data.history = { undoStack, redoStack }` (references, not a copy).
---Source: lua/ge/extensions/editor/api/history.lua:205
---@param data table table to fill
function editor_api_history:serialize(data) end

--- Undoes `steps` transactions: calls the undo of each action in reverse order, then moves the transaction to the redo stack. Stops if the stack is empty.
---Source: lua/ge/extensions/editor/api/history.lua:40
---@param steps integer|nil number of transactions to undo, 1 by default
function editor_api_history:undo(steps) end

--- In the actions of the redo stack, replaces `data.objectId` and the elements of `data.objectIds` equal to oldObjectId with newObjectId (useful when an object is recreated with a different id).
---Source: lua/ge/extensions/editor/api/history.lua:181
---@param oldObjectId integer old id
---@param newObjectId integer new id
function editor_api_history:updateRedoStackObjectId(oldObjectId, newObjectId) end

