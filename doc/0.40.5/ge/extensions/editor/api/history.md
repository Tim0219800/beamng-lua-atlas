# `editor_api_history`

*Fichier : `lua/ge/extensions/editor/api/history.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/history")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_api_history")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginTransaction(name)` | This will start a history transaction of adding multiple actions as a group.<br> @param name the name of the undo transaction (as a group of actions) | 76 |
| `C:cancelTransaction()` | Cancels a started transaction. Used when adding actions in a transaction, and some add action failed or data is not valid. | 88 |
| `C:clear()` | Clear the history undo and redo stacks, used on new document. | 173 |
| `C:commitAction(name, data, undoFunc, redoFunc, dontCallRedoNow)` | This adds the action on the undo stack **AND EXECUTES THE REDO** function with the given data table as argument.<br> When this function is called inside a beginTransaction/endTransaction, it will not execute the redo function until endTransaction, when all the redo functions of all the added actions inside that transaction are called at once.<br> @param name the name of the action, in the example format "MyCreateWhatever" do not add Action at the end of the string<br> @param data the data used by both undo and redo functions, where you keep new and old information about the action done<br> @param undoFunc the undo function, which has the format: local function myCreateWhateverUndo(actionData)<br> @param redoFunc the redo function, which has the format: local function myCreateWhateverRedo(actionData)<br> @param dontCallRedoNow wont call the redo function as part of the normal operation, you will need to do the operation separated from the redo code<br> @return the action table that was pushed to the stack | 122 |
| `C:deserialize(data)` | Deserialize the history stacks | 212 |
| `C:endTransaction(dontCallRedoNow)` | Ends a transaction successfuly and **EXECUTES ALL REDO** functions from all the added actions in this transaction. | 94 |
| `C:init()` |  | 31 |
| `C:redo(steps)` | Redo a number of steps from the history stack.<br> @param steps how many steps to redo, default is 1 if not specified | 58 |
| `C:serialize(data)` | Serialize the history stacks | 205 |
| `C:undo(steps)` | Undo a number of steps from the history stack.<br> @param steps how many steps to undo, default is 1 if not specified | 40 |
| `C:updateRedoStackObjectId(oldObjectId, newObjectId)` | Update an object id with a new one, that can be found in the redo actions.<br> @param oldObjectId the old id<br> @param newObjectId the new id | 181 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/history.lua`.*
