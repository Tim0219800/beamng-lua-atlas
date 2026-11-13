# `editor_api_core`

*Fichier : `lua/ge/extensions/editor/api/core.lua` · VM : Game Engine (GE) · 814 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_core` : `extensions.load("editor_api_core")`, puis la globale `editor_api_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_core.initialize(editorInstance)` |  | 715 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.anyToolDirty()` |  | 544 |
| `editor.autoSaveLevel()` | Save a copy of the level's scene tree to an autosave folder | 150 |
| `editor.checkDirtyAndSave(noCancelButton)` |  | 553 |
| `editor.clearUndoHistory()` | Clears the current undo history (along with redo information), basically acting like a collapse of operations. From this moment all the past operations are irreversible. | 309 |
| `editor.clearVisualizationTypes()` |  | 371 |
| `editor.copy()` | Copy the current selection. The copy action is routed to the current edit mode, calling its ``onCopy()`` callback, see `Edit Modes`.<br> The global extension hook ``onEditorCopy`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered. | 474 |
| `editor.copyDirectory(srcPath, dstPath)` |  | 20 |
| `editor.copyLevelFolder(srcPath, dstPath)` |  | 32 |
| `editor.cut()` | Cut the current selection. The cut action is routed to the current edit mode, calling its ``onCut()`` callback, see `Edit Modes`.<br> The global extension hook ``onEditorCut`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered. | 465 |
| `editor.deleteObject(objectId)` | Delete an object by its id. | 275 |
| `editor.deleteSelection()` | Delete the items in the current selection. The delete selection action is routed to the current edit mode, calling its ``onDeleteSelection()`` callback, see `Edit Modes`.<br> The global extension hook ``onEditorDeleteSelection`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered. | 521 |
| `editor.deselect()` | Deselect the current selection. The deselect action is routed to the current edit mode, calling its ``onDeselect()`` callback, see `Edit Modes`.<br> The global extension hook ``onEditorDeselect`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered. | 512 |
| `editor.doNewLevel()` | Used by editor UI to do new level, complete with all the open dialog | 569 |
| `editor.doOpenLevel()` | Used by editor UI to open a level, complete with open file dialog | 584 |
| `editor.doSaveLevel()` | Used by editor UI to save level, will ask for folder is no level path was set | 596 |
| `editor.doSaveLevelAs()` | Used by editor UI to save a level into another folder, as a new level, complete with open folder dialog | 606 |
| `editor.duplicate()` | Duplicate the current selection. The duplicate action is routed to the current edit mode, calling its ``onDuplicate()`` callback, see `Edit Modes`.<br> The global extension hook ``onEditorDuplicate`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered. | 494 |
| `editor.enableHeadless(enabled, toolName)` |  | 625 |
| `editor.getCurrentEditModeName()` | Returns the current edit mode name, from the key name of the editMode table | 456 |
| `editor.getLevelName()` | Return the current level name. | 530 |
| `editor.getLevelPath()` | Return the current level path. | 539 |
| `editor.getObjectTypeSelectable(typeName)` | Return true if object type is editable/selectable.<br> @param typeName the name of the C++ object class/type | 398 |
| `editor.getObjectTypeVisible(typeName)` | Returns true/false for class visibility<br> Get the object type visibility.<br> @param typeName the name of the C++ object class/type | 385 |
| `editor.getVisualizationType(name)` | Return a visualization type current value.<br> @param name the vizualization's name<br> @return true if the vizualization is active | 338 |
| `editor.getVisualizationTypes()` | Returns the available visualization types. You can add custom ones adding an item to ``editor.registerVisualizationType(...)`` | 356 |
| `editor.isHeadlessToolActive(toolName)` |  | 647 |
| `editor.linkifyPath(targetPath)` |  | 665 |
| `editor.muteAudio(muteIt)` |  | 651 |
| `editor.newLevel()` | Reset everything and create a new level from a default template | 74 |
| `editor.openLevel(path)` | Open an existing level from disk. Will remove any unsaved changes made to the current level.<br> @param path the level folder, relative to game root | 88 |
| `editor.paste()` | Paste the current selection. The paste action is routed to the current edit mode, calling its ``onPaste()`` callback, see `Edit Modes`.<br> The global extension hook ``onEditorPaste`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered. | 484 |
| `editor.quitEditor()` | Hides and deactivates the editor. | 265 |
| `editor.quitGame()` | Quit the actual game. | 270 |
| `editor.redo(steps)` | Redo (revert the last undo steps) the last operation(s).<br> @param steps the number of redo steps to be performed, if omitted, then this is 1 | 293 |
| `editor.registerVisualizationType(typeData)` | Add a new user visualization type.<br> @param typeData the visualization type info | 366 |
| `editor.resetAllDirtyTools()` |  | 252 |
| `editor.resetDirty()` | Set the editor state to clean, no need to save it. | 258 |
| `editor.resetDirtyTool(name)` |  | 248 |
| `editor.saveDirtyToolsUi()` |  | 177 |
| `editor.saveLevel()` | Save the current level data. There must be a level opened. This function will call the Save As if the level is unnamed. | 115 |
| `editor.saveLevelAs(levelPath)` | Save the level's scene tree to the specified path. | 143 |
| `editor.selectAll()` | Select all items. The select all action is routed to the current edit mode, calling its ``onSelectAll()`` callback, see `Edit Modes`.<br> The global extension hook ``onEditorSelectAll`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered. | 503 |
| `editor.selectEditMode(newEditMode)` | Select the current edit mode<br> @param mode the edit mode table, with the fields:<br>  **displayName** - the display name shown in the title bar for the current edit mode, example: "Edit Terrain"<br>  **onActivate** - a function called when the edit mode gets selected, optional<br>  **onDeactivate** - a function called when the edit mode gets deselected, optional<br>  **onUpdate** - a function called when the edit mode needs to update/check internal state<br>  **onCut** - a function called when the edit mode is required to cut the selection, optional<br>  **onCopy** - a function called when the edit mode is required to copy the selection, optional<br>  **onPaste** - a function called when the edit mode is required to paste the selection, optional<br>  **onDuplicate** - a function called when the edit mode is required to duplicate(clone) the selection, optional<br>  **onSelectAll** - a function called when the edit mode is required to select all items, optional<br>  **onDeselect** - a function called when the edit mode is required to deselect the selection, optional<br>  **onDeleteSelection** - a function called when the edit mode is required to delete the selected items, optional<br>  **onToolbar** - a function called when the edit mode is selected and it needs to render icon buttons in the vertical edit mode toolbar, optional<br>  **actionMap** - an action map for the input, which will be pushed to the action map stack when the edit mode is selected, optional<br>  **icon** - an icon for the edit mode, you can find the icons in the editor.icons table, if nil, no toolbar button will be shown in the edit modes toolbar<br>  **iconTooltip** - a tooltip for the button in the edit modes toolbar, optional | 419 |
| `editor.setDirty()` | Set the editor state to dirty, level needs to be saved. | 238 |
| `editor.setDirtyTool(name, saveFn)` |  | 243 |
| `editor.setObjectTypeSelectable(typeName, selectable)` | Set a certain object type from being editable/selectable.<br> @param typeName the name of the C++ object class/type<br> @param selectable true/false for class selectability | 392 |
| `editor.setObjectTypeVisible(typeName, visible)` | Set the object type visibility.<br> @param typeName the name of the C++ object class/type to be visible<br> @param visible true/false for class visibility | 378 |
| `editor.setUndoHistory(history)` | Allows the user to change the current history table instance.<br> This is useful for context aware undo, for example if the editor uses multiple windows/panes and when switching editing actions back and forth, each window/pane should keep its own undo context to allow proper undo/redo operation.<br> @param history the history table instance to be used from now on. If this is nil then the default history will be used. | 300 |
| `editor.setVisualizationType(name, on)` | Set a visualization type's status on or off.<br> @param name the name of the type, allowed values can be found using [editor.getVisualizationTypes()][{{editor.getVisualizationTypes()}}]<br> @param on true to activate the vizualization | 316 |
| `editor.undo(steps)` | Undo the last operation(s).<br> @param steps the number of undo steps to be performed, if omitted, then this is 1 | 287 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorAfterNewLevel`
- `onEditorAfterOpenLevel` — écouté par 3 module(s)
- `onEditorAfterSaveLevel` — écouté par 5 module(s)
- `onEditorAfterSaveLevelBackup`
- `onEditorBeforeNewLevel`
- `onEditorBeforeOpenLevel`
- `onEditorBeforeSaveLevel` — écouté par 7 module(s)
- `onEditorBeforeSaveLevelBackup`
- `onEditorCopy`
- `onEditorCut`
- `onEditorDeleteSelection` — écouté par 2 module(s)
- `onEditorDeselect`
- `onEditorDuplicate`
- `onEditorEditModeActivated` — écouté par 1 module(s)
- `onEditorEditModeChanged` — écouté par 1 module(s)
- `onEditorEditModeDeactivated` — écouté par 1 module(s)
- `onEditorExitLevel` — écouté par 2 module(s)
- `onEditorHeadlessChange` — écouté par 3 module(s)
- `onEditorPaste`
- `onEditorSelectAll`

## Appels vers le moteur (C++)

- `Engine.` `cancelShutdown`
- `FS:` `copyFile`, `directoryCreate`, `directoryRemove`, `findFiles`, `renameFile`
- `Sim.` `findObjectById`, `serializeObjectToDirectories`
- `obj:` `deleteObject`, `isLocked`
- `worldEditorCppApi.` `clearSceneDirtyFlag`, `disableSimSetAndSimObjectSignals`, `getClassIsRenderable`, `getClassIsSelectable`, `setClassIsRenderable`, `setClassIsSelectable`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/core.lua`.*
