---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/api/history.lua (instanciée par la fonction renvoyée par le module)
---@class editor_api_history
local editor_api_history = {}

--- This will start a history transaction of adding multiple actions as a group.
---  @param name the name of the undo transaction (as a group of actions)
---Source : lua/ge/extensions/editor/api/history.lua:76
---@param name any
function editor_api_history:beginTransaction(name) end

--- Cancels a started transaction. Used when adding actions in a transaction, and some add action failed or data is not valid.
---Source : lua/ge/extensions/editor/api/history.lua:88
function editor_api_history:cancelTransaction() end

--- Clear the history undo and redo stacks, used on new document.
---Source : lua/ge/extensions/editor/api/history.lua:173
function editor_api_history:clear() end

--- This adds the action on the undo stack **AND EXECUTES THE REDO** function with the given data table as argument.
---  When this function is called inside a beginTransaction/endTransaction, it will not execute the redo function until endTransaction, when all the redo functions of all the added actions inside that transaction are called at once.
---  @param name the name of the action, in the example format "MyCreateWhatever" do not add Action at the end of the string
---  @param data the data used by both undo and redo functions, where you keep new and old information about the action done
---  @param undoFunc the undo function, which has the format: local function myCreateWhateverUndo(actionData)
---  @param redoFunc the redo function, which has the format: local function myCreateWhateverRedo(actionData)
---  @param dontCallRedoNow wont call the redo function as part of the normal operation, you will need to do the operation separated from the redo code
---  @return the action table that was pushed to the stack
---Source : lua/ge/extensions/editor/api/history.lua:122
---@param name any
---@param data any
---@param undoFunc any
---@param redoFunc any
---@param dontCallRedoNow any
function editor_api_history:commitAction(name, data, undoFunc, redoFunc, dontCallRedoNow) end

--- Deserialize the history stacks
---Source : lua/ge/extensions/editor/api/history.lua:212
---@param data any
function editor_api_history:deserialize(data) end

--- Ends a transaction successfuly and **EXECUTES ALL REDO** functions from all the added actions in this transaction.
---Source : lua/ge/extensions/editor/api/history.lua:94
---@param dontCallRedoNow any
function editor_api_history:endTransaction(dontCallRedoNow) end

---Source : lua/ge/extensions/editor/api/history.lua:31
function editor_api_history:init() end

--- Redo a number of steps from the history stack.
---  @param steps how many steps to redo, default is 1 if not specified
---Source : lua/ge/extensions/editor/api/history.lua:58
---@param steps any
function editor_api_history:redo(steps) end

--- Serialize the history stacks
---Source : lua/ge/extensions/editor/api/history.lua:205
---@param data any
function editor_api_history:serialize(data) end

--- Undo a number of steps from the history stack.
---  @param steps how many steps to undo, default is 1 if not specified
---Source : lua/ge/extensions/editor/api/history.lua:40
---@param steps any
function editor_api_history:undo(steps) end

--- Update an object id with a new one, that can be found in the redo actions.
---  @param oldObjectId the old id
---  @param newObjectId the new id
---Source : lua/ge/extensions/editor/api/history.lua:181
---@param oldObjectId any
---@param newObjectId any
function editor_api_history:updateRedoStackObjectId(oldObjectId, newObjectId) end

