---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_core` : `extensions.load("editor_api_core")`, puis la globale `editor_api_core`
---@class editor_api_core
editor_api_core = {}

---Source : lua/ge/extensions/editor/api/core.lua:715
---@param editorInstance any
function editor_api_core.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/core.lua
---@class editor_api_core_editor
local editor_api_core_editor = {}

---Source : lua/ge/extensions/editor/api/core.lua:544
function editor_api_core_editor.anyToolDirty() end

--- Save a copy of the level's scene tree to an autosave folder
---Source : lua/ge/extensions/editor/api/core.lua:150
function editor_api_core_editor.autoSaveLevel() end

---Source : lua/ge/extensions/editor/api/core.lua:553
---@param noCancelButton any
function editor_api_core_editor.checkDirtyAndSave(noCancelButton) end

--- Clears the current undo history (along with redo information), basically acting like a collapse of operations. From this moment all the past operations are irreversible.
---Source : lua/ge/extensions/editor/api/core.lua:309
function editor_api_core_editor.clearUndoHistory() end

---Source : lua/ge/extensions/editor/api/core.lua:371
function editor_api_core_editor.clearVisualizationTypes() end

--- Copy the current selection. The copy action is routed to the current edit mode, calling its ``onCopy()`` callback, see `Edit Modes`.
---  The global extension hook ``onEditorCopy`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered.
---Source : lua/ge/extensions/editor/api/core.lua:474
function editor_api_core_editor.copy() end

---Source : lua/ge/extensions/editor/api/core.lua:20
---@param srcPath any
---@param dstPath any
function editor_api_core_editor.copyDirectory(srcPath, dstPath) end

---Source : lua/ge/extensions/editor/api/core.lua:32
---@param srcPath any
---@param dstPath any
function editor_api_core_editor.copyLevelFolder(srcPath, dstPath) end

--- Cut the current selection. The cut action is routed to the current edit mode, calling its ``onCut()`` callback, see `Edit Modes`.
---  The global extension hook ``onEditorCut`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered.
---Source : lua/ge/extensions/editor/api/core.lua:465
function editor_api_core_editor.cut() end

--- Delete an object by its id.
---Source : lua/ge/extensions/editor/api/core.lua:275
---@param objectId any
function editor_api_core_editor.deleteObject(objectId) end

--- Delete the items in the current selection. The delete selection action is routed to the current edit mode, calling its ``onDeleteSelection()`` callback, see `Edit Modes`.
---  The global extension hook ``onEditorDeleteSelection`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered.
---Source : lua/ge/extensions/editor/api/core.lua:521
function editor_api_core_editor.deleteSelection() end

--- Deselect the current selection. The deselect action is routed to the current edit mode, calling its ``onDeselect()`` callback, see `Edit Modes`.
---  The global extension hook ``onEditorDeselect`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered.
---Source : lua/ge/extensions/editor/api/core.lua:512
function editor_api_core_editor.deselect() end

--- Used by editor UI to do new level, complete with all the open dialog
---Source : lua/ge/extensions/editor/api/core.lua:569
function editor_api_core_editor.doNewLevel() end

--- Used by editor UI to open a level, complete with open file dialog
---Source : lua/ge/extensions/editor/api/core.lua:584
function editor_api_core_editor.doOpenLevel() end

--- Used by editor UI to save level, will ask for folder is no level path was set
---Source : lua/ge/extensions/editor/api/core.lua:596
function editor_api_core_editor.doSaveLevel() end

--- Used by editor UI to save a level into another folder, as a new level, complete with open folder dialog
---Source : lua/ge/extensions/editor/api/core.lua:606
function editor_api_core_editor.doSaveLevelAs() end

--- Duplicate the current selection. The duplicate action is routed to the current edit mode, calling its ``onDuplicate()`` callback, see `Edit Modes`.
---  The global extension hook ``onEditorDuplicate`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered.
---Source : lua/ge/extensions/editor/api/core.lua:494
function editor_api_core_editor.duplicate() end

---Source : lua/ge/extensions/editor/api/core.lua:625
---@param enabled any
---@param toolName any
function editor_api_core_editor.enableHeadless(enabled, toolName) end

--- Returns the current edit mode name, from the key name of the editMode table
---Source : lua/ge/extensions/editor/api/core.lua:456
function editor_api_core_editor.getCurrentEditModeName() end

--- Return the current level name.
---Source : lua/ge/extensions/editor/api/core.lua:530
function editor_api_core_editor.getLevelName() end

--- Return the current level path.
---Source : lua/ge/extensions/editor/api/core.lua:539
function editor_api_core_editor.getLevelPath() end

--- Return true if object type is editable/selectable.
---  @param typeName the name of the C++ object class/type
---Source : lua/ge/extensions/editor/api/core.lua:398
---@param typeName any
function editor_api_core_editor.getObjectTypeSelectable(typeName) end

--- Returns true/false for class visibility
---  Get the object type visibility.
---  @param typeName the name of the C++ object class/type
---Source : lua/ge/extensions/editor/api/core.lua:385
---@param typeName any
function editor_api_core_editor.getObjectTypeVisible(typeName) end

--- Return a visualization type current value.
---  @param name the vizualization's name
---  @return true if the vizualization is active
---Source : lua/ge/extensions/editor/api/core.lua:338
---@param name any
function editor_api_core_editor.getVisualizationType(name) end

--- Returns the available visualization types. You can add custom ones adding an item to ``editor.registerVisualizationType(...)``
---Source : lua/ge/extensions/editor/api/core.lua:356
function editor_api_core_editor.getVisualizationTypes() end

---Source : lua/ge/extensions/editor/api/core.lua:647
---@param toolName any
function editor_api_core_editor.isHeadlessToolActive(toolName) end

---Source : lua/ge/extensions/editor/api/core.lua:665
---@param targetPath any
function editor_api_core_editor.linkifyPath(targetPath) end

---Source : lua/ge/extensions/editor/api/core.lua:651
---@param muteIt any
function editor_api_core_editor.muteAudio(muteIt) end

--- Reset everything and create a new level from a default template
---Source : lua/ge/extensions/editor/api/core.lua:74
function editor_api_core_editor.newLevel() end

--- Open an existing level from disk. Will remove any unsaved changes made to the current level.
---  @param path the level folder, relative to game root
---Source : lua/ge/extensions/editor/api/core.lua:88
---@param path any
function editor_api_core_editor.openLevel(path) end

--- Paste the current selection. The paste action is routed to the current edit mode, calling its ``onPaste()`` callback, see `Edit Modes`.
---  The global extension hook ``onEditorPaste`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered.
---Source : lua/ge/extensions/editor/api/core.lua:484
function editor_api_core_editor.paste() end

--- Hides and deactivates the editor.
---Source : lua/ge/extensions/editor/api/core.lua:265
function editor_api_core_editor.quitEditor() end

--- Quit the actual game.
---Source : lua/ge/extensions/editor/api/core.lua:270
function editor_api_core_editor.quitGame() end

--- Redo (revert the last undo steps) the last operation(s).
---  @param steps the number of redo steps to be performed, if omitted, then this is 1
---Source : lua/ge/extensions/editor/api/core.lua:293
---@param steps any
function editor_api_core_editor.redo(steps) end

--- Add a new user visualization type.
---  @param typeData the visualization type info
---Source : lua/ge/extensions/editor/api/core.lua:366
---@param typeData any
function editor_api_core_editor.registerVisualizationType(typeData) end

---Source : lua/ge/extensions/editor/api/core.lua:252
function editor_api_core_editor.resetAllDirtyTools() end

--- Set the editor state to clean, no need to save it.
---Source : lua/ge/extensions/editor/api/core.lua:258
function editor_api_core_editor.resetDirty() end

---Source : lua/ge/extensions/editor/api/core.lua:248
---@param name any
function editor_api_core_editor.resetDirtyTool(name) end

---Source : lua/ge/extensions/editor/api/core.lua:177
function editor_api_core_editor.saveDirtyToolsUi() end

--- Save the current level data. There must be a level opened. This function will call the Save As if the level is unnamed.
---Source : lua/ge/extensions/editor/api/core.lua:115
function editor_api_core_editor.saveLevel() end

--- Save the level's scene tree to the specified path.
---Source : lua/ge/extensions/editor/api/core.lua:143
---@param levelPath any
function editor_api_core_editor.saveLevelAs(levelPath) end

--- Select all items. The select all action is routed to the current edit mode, calling its ``onSelectAll()`` callback, see `Edit Modes`.
---  The global extension hook ``onEditorSelectAll`` will also be invoked, which can be used by other tools if they're in focus and don't have edit modes registered.
---Source : lua/ge/extensions/editor/api/core.lua:503
function editor_api_core_editor.selectAll() end

--- Select the current edit mode
---  @param mode the edit mode table, with the fields:
---   **displayName** - the display name shown in the title bar for the current edit mode, example: "Edit Terrain"
---   **onActivate** - a function called when the edit mode gets selected, optional
---   **onDeactivate** - a function called when the edit mode gets deselected, optional
---   **onUpdate** - a function called when the edit mode needs to update/check internal state
---   **onCut** - a function called when the edit mode is required to cut the selection, optional
---   **onCopy** - a function called when the edit mode is required to copy the selection, optional
---   **onPaste** - a function called when the edit mode is required to paste the selection, optional
---   **onDuplicate** - a function called when the edit mode is required to duplicate(clone) the selection, optional
---   **onSelectAll** - a function called when the edit mode is required to select all items, optional
---   **onDeselect** - a function called when the edit mode is required to deselect the selection, optional
---   **onDeleteSelection** - a function called when the edit mode is required to delete the selected items, optional
---   **onToolbar** - a function called when the edit mode is selected and it needs to render icon buttons in the vertical edit mode toolbar, optional
---   **actionMap** - an action map for the input, which will be pushed to the action map stack when the edit mode is selected, optional
---   **icon** - an icon for the edit mode, you can find the icons in the editor.icons table, if nil, no toolbar button will be shown in the edit modes toolbar
---   **iconTooltip** - a tooltip for the button in the edit modes toolbar, optional
---Source : lua/ge/extensions/editor/api/core.lua:419
---@param newEditMode any
function editor_api_core_editor.selectEditMode(newEditMode) end

--- Set the editor state to dirty, level needs to be saved.
---Source : lua/ge/extensions/editor/api/core.lua:238
function editor_api_core_editor.setDirty() end

---Source : lua/ge/extensions/editor/api/core.lua:243
---@param name any
---@param saveFn any
function editor_api_core_editor.setDirtyTool(name, saveFn) end

--- Set a certain object type from being editable/selectable.
---  @param typeName the name of the C++ object class/type
---  @param selectable true/false for class selectability
---Source : lua/ge/extensions/editor/api/core.lua:392
---@param typeName any
---@param selectable any
function editor_api_core_editor.setObjectTypeSelectable(typeName, selectable) end

--- Set the object type visibility.
---  @param typeName the name of the C++ object class/type to be visible
---  @param visible true/false for class visibility
---Source : lua/ge/extensions/editor/api/core.lua:378
---@param typeName any
---@param visible any
function editor_api_core_editor.setObjectTypeVisible(typeName, visible) end

--- Allows the user to change the current history table instance.
---  This is useful for context aware undo, for example if the editor uses multiple windows/panes and when switching editing actions back and forth, each window/pane should keep its own undo context to allow proper undo/redo operation.
---  @param history the history table instance to be used from now on. If this is nil then the default history will be used.
---Source : lua/ge/extensions/editor/api/core.lua:300
---@param history any
function editor_api_core_editor.setUndoHistory(history) end

--- Set a visualization type's status on or off.
---  @param name the name of the type, allowed values can be found using [editor.getVisualizationTypes()][{{editor.getVisualizationTypes()}}]
---  @param on true to activate the vizualization
---Source : lua/ge/extensions/editor/api/core.lua:316
---@param name any
---@param on any
function editor_api_core_editor.setVisualizationType(name, on) end

--- Undo the last operation(s).
---  @param steps the number of undo steps to be performed, if omitted, then this is 1
---Source : lua/ge/extensions/editor/api/core.lua:287
---@param steps any
function editor_api_core_editor.undo(steps) end

