# `editor_api_history`

*File: `lua/ge/extensions/editor/api/history.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/api/history")` (file under extensions/ but not a regular extension)

Editor undo/redo stack. Each action has a name, a data table and two undo/redo functions that receive this table. Actions are grouped into transactions (a single action forms a one-action transaction); undo/redo operate per transaction. The module returns a constructor with no arguments (calls `init`). Default limit: 1000 levels.

## Example

```lua
local h = require("editor/api/history")()
h:commitAction("MyMove", {id = 5, old = a, new = b},
  function(d) --[[ undo ]] end,
  function(d) --[[ redo ]] end)
h:undo()
```

## Notes

- `commitAction` outside a transaction immediately runs redoFunc (unless dontCallRedoNow) and returns the RESULT of redoFunc, not the action as the comment says; inside a transaction it returns the action. It returns nil if the action is identical to the last transaction on the stack (ignoring timestamp), and false if undo or redo is missing.
- `table.remove(self.undoStack, 0)` is used to remove the oldest transaction when the stack is full: index 0 is not a valid index of a Lua sequence, so the 1000-level limit does not seem to be actually enforced (inferred from code).
- `endTransaction` crashes if no transaction has been started (currentTransaction nil). An empty transaction is not added to the stack.
- Any new commit or non-empty endTransaction clears the redo stack.
- Optional hooks set by the caller: `self.onUndo(action)`, `self.onRedo(action)`, `self.onCommitAction(action)`. Actions store `userId` (editor.userId) and `timestamp` (os.time()).

## Class `C`

History object. Fields: maxUndoLevels, undoStack, redoStack, currentTransaction.

The module returns a constructor: `local obj = require("editor_api_history")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginTransaction(name)` | Starts a group of actions that can be undone at once. The redos are only run at endTransaction. | 76 |
| `C:cancelTransaction()` | Abandons the current transaction without running or pushing anything (useful if an action failed). | 88 |
| `C:clear()` | Clears the undo and redo stacks (new document). | 173 |
| `C:commitAction(name, data, undoFunc, redoFunc, dontCallRedoNow)` | Records an undo/redo action and runs its redo. Inside a transaction, the action is only added to the group. | 122 |
| `C:deserialize(data)` | Restores the stacks from `data.history` if it exists and cancels the current transaction. | 212 |
| `C:endTransaction(dontCallRedoNow)` | Ends the transaction: pushes it and runs the redos of all its actions (unless dontCallRedoNow), then clears the redo stack. | 94 |
| `C:init()` | Initializes empty stacks, maxUndoLevels = 1000, no transaction in progress. Called by the constructor. | 31 |
| `C:redo(steps)` | Redoes `steps` transactions: calls the redo of each action in order, then puts them back on the undo stack. | 58 |
| `C:serialize(data)` | Writes `data.history = { undoStack, redoStack }` (references, not a copy). | 205 |
| `C:undo(steps)` | Undoes `steps` transactions: calls the undo of each action in reverse order, then moves the transaction to the redo stack. Stops if the stack is empty. | 40 |
| `C:updateRedoStackObjectId(oldObjectId, newObjectId)` | In the actions of the redo stack, replaces `data.objectId` and the elements of `data.objectIds` equal to oldObjectId with newObjectId (useful when an object is recreated with a different id). | 181 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/history.lua`.*
