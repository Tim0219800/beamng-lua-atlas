---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the World Editor's editor object: initialize(editor) installs the constants (FloatMin/Max, IntMin/Max, AuxControl_*), the state (history, levelPath, dirty, editModes, selection) and the basic functions: creating/opening/saving levels, the "modified" (dirty) state of the level and tools, undo/redo, visualization types, visibility/selectability of object classes, edit modes and copy/paste/delete actions routed to the current mode. An editor tool modder uses it through editor.xxx.
--- Access: extension `editor_api_core`: `extensions.load("editor_api_core")`, then the global `editor_api_core`
---@class editor_api_core
editor_api_core = {}

--- Installs constants, state variables and functions on the editor object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/core.lua:715
---@param editorInstance table editor object
function editor_api_core.initialize(editorInstance) end

--- Functions added to the editor object by initialize.
---@class editor_api_core_editor
local editor_api_core_editor = {}

--- If any tools are modified, opens the saveDirtyTools modal window and returns true.
---Source: lua/ge/extensions/editor/api/core.lua:544
---@return boolean  true if at least one tool is modified
function editor_api_core_editor.anyToolDirty() end

--- Saves a copy of the level to /temp/level_autosaves/<level>/<counter>/, cycling on files.autoSave.maxAutoSaveCountPerSession, then restores levelPath and the dirty state.
---Source: lua/ge/extensions/editor/api/core.lua:150
function editor_api_core_editor.autoSaveLevel() end

--- If the level/tools are modified, shows a dialog: Yes saves, Cancel calls Engine.cancelShutdown(), No resets everything to clean.
---Source: lua/ge/extensions/editor/api/core.lua:553
---@param noCancelButton boolean|nil If true, no Cancel button
function editor_api_core_editor.checkDirtyAndSave(noCancelButton) end

--- Clears the undo and redo history; past actions become irreversible.
---Source: lua/ge/extensions/editor/api/core.lua:309
function editor_api_core_editor.clearUndoHistory() end

--- Removes all registered visualization types.
---Source: lua/ge/extensions/editor/api/core.lua:371
function editor_api_core_editor.clearVisualizationTypes() end

--- Copy: calls onCopy of the current mode then the onEditorCopy hook.
---Source: lua/ge/extensions/editor/api/core.lua:474
function editor_api_core_editor.copy() end

--- Recursively copies the files from srcPath to dstPath (FS:findFiles + FS:copyFile) and logs it.
---Source: lua/ge/extensions/editor/api/core.lua:20
---@param srcPath string Source folder
---@param dstPath string Destination folder
function editor_api_core_editor.copyDirectory(srcPath, dstPath) end

--- Copies a level folder (default levels/template/) to a new one, replaces the old level name with the new one in the .json/.cs files and renames the files containing the old name. Can be slow.
---Source: lua/ge/extensions/editor/api/core.lua:32
---@param srcPath string|nil Source level, levels/template/ if empty
---@param dstPath string Destination level
function editor_api_core_editor.copyLevelFolder(srcPath, dstPath) end

--- Cut: calls onCut of the current edit mode then the onEditorCut hook.
---Source: lua/ge/extensions/editor/api/core.lua:465
function editor_api_core_editor.cut() end

--- Deletes an object by id if it exists and is not locked, then marks the editor as modified.
---Source: lua/ge/extensions/editor/api/core.lua:275
---@param objectId integer Object ID
---@return boolean  true if deleted
function editor_api_core_editor.deleteObject(objectId) end

--- Delete selection: calls onDeleteSelection of the current mode, emits onEditorDeleteSelection and clears editor.selection.
---Source: lua/ge/extensions/editor/api/core.lua:521
function editor_api_core_editor.deleteSelection() end

--- Deselect: calls onDeselect of the current mode then the onEditorDeselect hook.
---Source: lua/ge/extensions/editor/api/core.lua:512
function editor_api_core_editor.deselect() end

--- For the UI: offers to save, opens a folder picker under /levels, copies the template level to the new folder, then newLevel() and openLevel().
---Source: lua/ge/extensions/editor/api/core.lua:569
function editor_api_core_editor.doNewLevel() end

--- For the UI: offers to save, opens a folder picker under /levels and opens the chosen level.
---Source: lua/ge/extensions/editor/api/core.lua:584
function editor_api_core_editor.doOpenLevel() end

--- For the UI: saves the level, or calls doSaveLevelAs if levelPath is empty.
---Source: lua/ge/extensions/editor/api/core.lua:596
function editor_api_core_editor.doSaveLevel() end

--- For the UI: folder picker, copies the level folder to the new one then saveLevelAs. Refuses /levels directly (a subfolder is required).
---Source: lua/ge/extensions/editor/api/core.lua:606
function editor_api_core_editor.doSaveLevelAs() end

--- Duplicate: calls onDuplicate of the current mode then the onEditorDuplicate hook.
---Source: lua/ge/extensions/editor/api/core.lua:494
function editor_api_core_editor.duplicate() end

--- Enables/disables a tool's headless mode: saves and loads window layouts, sets editor.headless/headlessToolName and emits onEditorHeadlessChange(enabled, toolName).
---Source: lua/ge/extensions/editor/api/core.lua:625
---@param enabled boolean Enable or not
---@param toolName string Tool name
function editor_api_core_editor.enableHeadless(enabled, toolName) end

--- Key of the current mode in editor.editModes, "" if none.
---Source: lua/ge/extensions/editor/api/core.lua:456
---@return string  Name
function editor_api_core_editor.getCurrentEditModeName() end

--- Name of the current level (last folder of the mission path).
---Source: lua/ge/extensions/editor/api/core.lua:530
---@return string|nil  Level name
function editor_api_core_editor.getLevelName() end

--- Path of the current level folder, "" if unknown.
---Source: lua/ge/extensions/editor/api/core.lua:539
---@return string  Path
function editor_api_core_editor.getLevelPath() end

--- Returns whether an object class is selectable.
---Source: lua/ge/extensions/editor/api/core.lua:398
---@param typeName string Class name
---@return boolean  true if selectable
function editor_api_core_editor.getObjectTypeSelectable(typeName) end

--- Returns whether an object class is rendered.
---Source: lua/ge/extensions/editor/api/core.lua:385
---@param typeName string Class name
---@return boolean  true if visible
function editor_api_core_editor.getObjectTypeVisible(typeName) end

--- Current value of a visualization type; nil if the name is unknown.
---Source: lua/ge/extensions/editor/api/core.lua:338
---@param name string Type name
---@return boolean|nil  true if active
function editor_api_core_editor.getVisualizationType(name) end

--- List of visualization types, sorted by displayName if needed.
---Source: lua/ge/extensions/editor/api/core.lua:356
---@return table[]  Registered types
function editor_api_core_editor.getVisualizationTypes() end

--- Returns whether this tool is currently in headless mode.
---Source: lua/ge/extensions/editor/api/core.lua:647
---@param toolName string Tool name
---@return boolean  true if active
function editor_api_core_editor.isHeadlessToolActive(toolName) end

--- Creates a .link file (JSON {path = targetPath}) in the level folder pointing to targetPath, and returns the link path (without .link). Returns targetPath as is if no level is open, "" if targetPath is empty.
---Source: lua/ge/extensions/editor/api/core.lua:665
---@param targetPath string Target resource path
---@return string  Path in the level
function editor_api_core_editor.linkifyPath(targetPath) end

--- Mutes the master audio channel (remembers the volume) or restores it.
---Source: lua/ge/extensions/editor/api/core.lua:651
---@param muteIt boolean|nil true or nil to mute, false to restore
function editor_api_core_editor.muteAudio(muteIt) end

--- Resets the editor for a new level: onEditorExitLevel then onEditorBeforeNewLevel hooks, clears the history, levelPath = "", autosave counter to 1, then onEditorAfterNewLevel and resetDirty. Does not destroy the scenetree.
---Source: lua/ge/extensions/editor/api/core.lua:74
function editor_api_core_editor.newLevel() end

--- Opens an existing level: disables Sim signals, onEditorBeforeOpenLevel hook, newLevel(), editor shutdown, then core_levels.startLevel(path), then onEditorAfterOpenLevel hook. Unsaved changes are lost.
---Source: lua/ge/extensions/editor/api/core.lua:88
---@param path string Level folder, relative to the game root
function editor_api_core_editor.openLevel(path) end

--- Paste: calls onPaste of the current mode then the onEditorPaste hook.
---Source: lua/ge/extensions/editor/api/core.lua:484
function editor_api_core_editor.paste() end

--- Hides and disables the editor.
---Source: lua/ge/extensions/editor/api/core.lua:265
function editor_api_core_editor.quitEditor() end

--- Quits the game (quit()).
---Source: lua/ge/extensions/editor/api/core.lua:270
function editor_api_core_editor.quitGame() end

--- Redoes the last undone operation(s).
---Source: lua/ge/extensions/editor/api/core.lua:293
---@param steps integer|nil Number of steps, 1 by default
function editor_api_core_editor.redo(steps) end

--- Registers a custom visualization type.
---Source: lua/ge/extensions/editor/api/core.lua:366
---@param typeData table name, displayName, type (editor.varTypes), getter/setter if Custom, optional callback
function editor_api_core_editor.registerVisualizationType(typeData) end

--- Clears the list of modified tools and resets cleanExit to true.
---Source: lua/ge/extensions/editor/api/core.lua:252
function editor_api_core_editor.resetAllDirtyTools() end

--- Marks the level as clean, clears the engine scene flag and resets cleanExit to true.
---Source: lua/ge/extensions/editor/api/core.lua:258
function editor_api_core_editor.resetDirty() end

--- Removes a tool from the list of modified tools.
---Source: lua/ge/extensions/editor/api/core.lua:248
---@param name string Tool name
function editor_api_core_editor.resetDirtyTool(name) end

--- Draws the "Save Tool Windows Data" modal window listing the modified tools (Save All, Save Selected, Don't Save Any, Cancel).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/core.lua:177
function editor_api_core_editor.saveDirtyToolsUi() end

--- Saves the MissionGroup to <levelPath>main (via __main), with onEditorBeforeSaveLevel/onEditorAfterSaveLevel hooks, resetDirty, a notification, and a backup copy if the files.autoSave.saveBackupCopy preference is enabled (onEditorBefore/AfterSaveLevelBackup hooks).
---Source: lua/ge/extensions/editor/api/core.lua:115
function editor_api_core_editor.saveLevel() end

--- Changes editor.levelPath and the mission name (info.json), then saves the level at that location.
---Source: lua/ge/extensions/editor/api/core.lua:143
---@param levelPath string Target folder
function editor_api_core_editor.saveLevelAs(levelPath) end

--- Select all: calls onSelectAll of the current mode then the onEditorSelectAll hook.
---Source: lua/ge/extensions/editor/api/core.lua:503
function editor_api_core_editor.selectAll() end

--- Activates an edit mode: deactivates the old one (onDeactivate, onEditorEditModeDeactivated hook, pop of its actionMap), activates the new one (onActivate, onEditorEditModeActivated hook, push of its actionMap at maximum priority) then emits onEditorEditModeChanged(old, new). Mode fields: displayName, onActivate, onDeactivate, onUpdate, onCut, onCopy, onPaste, onDuplicate, onSelectAll, onDeselect, onDeleteSelection, onToolbar, actionMap, icon, iconTooltip, hideObjectIcons.
---Source: lua/ge/extensions/editor/api/core.lua:419
---@param newEditMode table|nil Edit mode table (nil for none)
function editor_api_core_editor.selectEditMode(newEditMode) end

--- Marks the level as modified and records the unclean shutdown info (general.internal.cleanExit/lastLevel preferences).
---Source: lua/ge/extensions/editor/api/core.lua:238
function editor_api_core_editor.setDirty() end

--- Declares a tool as having unsaved data, with its save function.
---Source: lua/ge/extensions/editor/api/core.lua:243
---@param name string Tool name
---@param saveFn function Function called to save the data
function editor_api_core_editor.setDirtyTool(name, saveFn) end

--- Allows or forbids selection of an object class.
---Source: lua/ge/extensions/editor/api/core.lua:392
---@param typeName string Class name
---@param selectable boolean Selectable
function editor_api_core_editor.setObjectTypeSelectable(typeName, selectable) end

--- Makes a C++ object class visible/invisible in the editor.
---Source: lua/ge/extensions/editor/api/core.lua:378
---@param typeName string Class name
---@param visible boolean Visibility
function editor_api_core_editor.setObjectTypeVisible(typeName, visible) end

--- Changes the history instance used (useful for a per-window/panel undo). nil restores the default history.
---Source: lua/ge/extensions/editor/api/core.lua:300
---@param history table|nil History instance
function editor_api_core_editor.setUndoHistory(history) end

--- Enables/disables a registered visualization type (depending on its ConVar/LuaVar/Custom/Setting type) then calls its optional callback. Ignores an unknown name.
---Source: lua/ge/extensions/editor/api/core.lua:316
---@param name string Type name
---@param on boolean true to enable
function editor_api_core_editor.setVisualizationType(name, on) end

--- Undoes the last operation(s) of the current history.
---Source: lua/ge/extensions/editor/api/core.lua:287
---@param steps integer|nil Number of steps, 1 by default
function editor_api_core_editor.undo(steps) end

