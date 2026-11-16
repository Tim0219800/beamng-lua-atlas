# `editor_api_core`

*File: `lua/ge/extensions/editor/api/core.lua` · VM: Game Engine (GE) · 814 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_core`: `extensions.load("editor_api_core")`, then the global `editor_api_core`

Core of the World Editor's editor object: initialize(editor) installs the constants (FloatMin/Max, IntMin/Max, AuxControl_*), the state (history, levelPath, dirty, editModes, selection) and the basic functions: creating/opening/saving levels, the "modified" (dirty) state of the level and tools, undo/redo, visualization types, visibility/selectability of object classes, edit modes and copy/paste/delete actions routed to the current mode. An editor tool modder uses it through editor.xxx.

## Example

```lua
editor.registerVisualizationType({name = "$Lua.myFlag", displayName = "My overlay", type = editor.varTypes.LuaVar})
editor.selectEditMode({displayName = "My mode", onActivate = function() end, onDeactivate = function() end})
editor.setDirty()
```

## Notes

- The module only exports initialize; everything is set on the editor object.
- The cut/copy/paste/duplicate/selectAll/deselect/deleteSelection actions first call the current edit mode's callback (onCut, onCopy...), then emit the corresponding global hook (onEditorCut...).
- Visualization types (editor.varTypes): ConVar=1 (VariableRegistry), LuaVar=2 (Lua global variable evaluated by loadstring), Custom=3 (getter/setter), Setting=4 (settings). An optional typeData callback is called after setVisualizationType.
- saveLevel first writes to <level>/__main, then replaces <level>/main; if serialization fails, a FATAL log is emitted but the onEditorAfterSaveLevel hooks and resetDirty still run.
- copyDirectory/copyLevelFolder use gsub with the paths as Lua patterns (special characters such as '-' or '.' are not escaped).
- checkDirtyAndSave: the expression "editor.dirty or anyToolDirty() and editor.initialized" is evaluated with Lua precedence (and before or): editor.initialized only conditions anyToolDirty.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_core.initialize(editorInstance)` | Installs constants, state variables and functions on the editor object. *(internal)* | 715 |

### Parameter details

#### `editor_api_core.initialize(editorInstance)`

Installs constants, state variables and functions on the editor object.

- `editorInstance` (*table*) : editor object

## Class `editor`

Functions added to the editor object by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.anyToolDirty()` | If any tools are modified, opens the saveDirtyTools modal window and returns true. | 544 |
| `editor.autoSaveLevel()` | Saves a copy of the level to /temp/level_autosaves/<level>/<counter>/, cycling on files.autoSave.maxAutoSaveCountPerSession, then restores levelPath and the dirty state. | 150 |
| `editor.checkDirtyAndSave(noCancelButton)` | If the level/tools are modified, shows a dialog: Yes saves, Cancel calls Engine.cancelShutdown(), No resets everything to clean. | 553 |
| `editor.clearUndoHistory()` | Clears the undo and redo history; past actions become irreversible. | 309 |
| `editor.clearVisualizationTypes()` | Removes all registered visualization types. | 371 |
| `editor.copy()` | Copy: calls onCopy of the current mode then the onEditorCopy hook. | 474 |
| `editor.copyDirectory(srcPath, dstPath)` | Recursively copies the files from srcPath to dstPath (FS:findFiles + FS:copyFile) and logs it. | 20 |
| `editor.copyLevelFolder(srcPath, dstPath)` | Copies a level folder (default levels/template/) to a new one, replaces the old level name with the new one in the .json/.cs files and renames the files containing the old name. Can be slow. | 32 |
| `editor.cut()` | Cut: calls onCut of the current edit mode then the onEditorCut hook. | 465 |
| `editor.deleteObject(objectId)` | Deletes an object by id if it exists and is not locked, then marks the editor as modified. | 275 |
| `editor.deleteSelection()` | Delete selection: calls onDeleteSelection of the current mode, emits onEditorDeleteSelection and clears editor.selection. | 521 |
| `editor.deselect()` | Deselect: calls onDeselect of the current mode then the onEditorDeselect hook. | 512 |
| `editor.doNewLevel()` | For the UI: offers to save, opens a folder picker under /levels, copies the template level to the new folder, then newLevel() and openLevel(). | 569 |
| `editor.doOpenLevel()` | For the UI: offers to save, opens a folder picker under /levels and opens the chosen level. | 584 |
| `editor.doSaveLevel()` | For the UI: saves the level, or calls doSaveLevelAs if levelPath is empty. | 596 |
| `editor.doSaveLevelAs()` | For the UI: folder picker, copies the level folder to the new one then saveLevelAs. Refuses /levels directly (a subfolder is required). | 606 |
| `editor.duplicate()` | Duplicate: calls onDuplicate of the current mode then the onEditorDuplicate hook. | 494 |
| `editor.enableHeadless(enabled, toolName)` | Enables/disables a tool's headless mode: saves and loads window layouts, sets editor.headless/headlessToolName and emits onEditorHeadlessChange(enabled, toolName). | 625 |
| `editor.getCurrentEditModeName()` | Key of the current mode in editor.editModes, "" if none. | 456 |
| `editor.getLevelName()` | Name of the current level (last folder of the mission path). | 530 |
| `editor.getLevelPath()` | Path of the current level folder, "" if unknown. | 539 |
| `editor.getObjectTypeSelectable(typeName)` | Returns whether an object class is selectable. | 398 |
| `editor.getObjectTypeVisible(typeName)` | Returns whether an object class is rendered. | 385 |
| `editor.getVisualizationType(name)` | Current value of a visualization type; nil if the name is unknown. | 338 |
| `editor.getVisualizationTypes()` | List of visualization types, sorted by displayName if needed. | 356 |
| `editor.isHeadlessToolActive(toolName)` | Returns whether this tool is currently in headless mode. | 647 |
| `editor.linkifyPath(targetPath)` | Creates a .link file (JSON {path = targetPath}) in the level folder pointing to targetPath, and returns the link path (without .link). Returns targetPath as is if no level is open, "" if targetPath is empty. | 665 |
| `editor.muteAudio(muteIt)` | Mutes the master audio channel (remembers the volume) or restores it. | 651 |
| `editor.newLevel()` | Resets the editor for a new level: onEditorExitLevel then onEditorBeforeNewLevel hooks, clears the history, levelPath = "", autosave counter to 1, then onEditorAfterNewLevel and resetDirty. Does not destroy the scenetree. | 74 |
| `editor.openLevel(path)` | Opens an existing level: disables Sim signals, onEditorBeforeOpenLevel hook, newLevel(), editor shutdown, then core_levels.startLevel(path), then onEditorAfterOpenLevel hook. Unsaved changes are lost. | 88 |
| `editor.paste()` | Paste: calls onPaste of the current mode then the onEditorPaste hook. | 484 |
| `editor.quitEditor()` | Hides and disables the editor. | 265 |
| `editor.quitGame()` | Quits the game (quit()). | 270 |
| `editor.redo(steps)` | Redoes the last undone operation(s). | 293 |
| `editor.registerVisualizationType(typeData)` | Registers a custom visualization type. | 366 |
| `editor.resetAllDirtyTools()` | Clears the list of modified tools and resets cleanExit to true. | 252 |
| `editor.resetDirty()` | Marks the level as clean, clears the engine scene flag and resets cleanExit to true. | 258 |
| `editor.resetDirtyTool(name)` | Removes a tool from the list of modified tools. | 248 |
| `editor.saveDirtyToolsUi()` | Draws the "Save Tool Windows Data" modal window listing the modified tools (Save All, Save Selected, Don't Save Any, Cancel). | 177 |
| `editor.saveLevel()` | Saves the MissionGroup to <levelPath>main (via __main), with onEditorBeforeSaveLevel/onEditorAfterSaveLevel hooks, resetDirty, a notification, and a backup copy if the files.autoSave.saveBackupCopy preference is enabled (onEditorBefore/AfterSaveLevelBackup hooks). | 115 |
| `editor.saveLevelAs(levelPath)` | Changes editor.levelPath and the mission name (info.json), then saves the level at that location. | 143 |
| `editor.selectAll()` | Select all: calls onSelectAll of the current mode then the onEditorSelectAll hook. | 503 |
| `editor.selectEditMode(newEditMode)` | Activates an edit mode: deactivates the old one (onDeactivate, onEditorEditModeDeactivated hook, pop of its actionMap), activates the new one (onActivate, onEditorEditModeActivated hook, push of its actionMap at maximum priority) then emits onEditorEditModeChanged(old, new). Mode fields: displayName, onActivate, onDeactivate, onUpdate, onCut, onCopy, onPaste, onDuplicate, onSelectAll, onDeselect, onDeleteSelection, onToolbar, actionMap, icon, iconTooltip, hideObjectIcons. | 419 |
| `editor.setDirty()` | Marks the level as modified and records the unclean shutdown info (general.internal.cleanExit/lastLevel preferences). | 238 |
| `editor.setDirtyTool(name, saveFn)` | Declares a tool as having unsaved data, with its save function. | 243 |
| `editor.setObjectTypeSelectable(typeName, selectable)` | Allows or forbids selection of an object class. | 392 |
| `editor.setObjectTypeVisible(typeName, visible)` | Makes a C++ object class visible/invisible in the editor. | 378 |
| `editor.setUndoHistory(history)` | Changes the history instance used (useful for a per-window/panel undo). nil restores the default history. | 300 |
| `editor.setVisualizationType(name, on)` | Enables/disables a registered visualization type (depending on its ConVar/LuaVar/Custom/Setting type) then calls its optional callback. Ignores an unknown name. | 316 |
| `editor.undo(steps)` | Undoes the last operation(s) of the current history. | 287 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorAfterNewLevel`
- `onEditorAfterOpenLevel` — listened to by 3 module(s)
- `onEditorAfterSaveLevel` — listened to by 5 module(s)
- `onEditorAfterSaveLevelBackup`
- `onEditorBeforeNewLevel`
- `onEditorBeforeOpenLevel`
- `onEditorBeforeSaveLevel` — listened to by 7 module(s)
- `onEditorBeforeSaveLevelBackup`
- `onEditorCopy`
- `onEditorCut`
- `onEditorDeleteSelection` — listened to by 2 module(s)
- `onEditorDeselect`
- `onEditorDuplicate`
- `onEditorEditModeActivated` — listened to by 1 module(s)
- `onEditorEditModeChanged` — listened to by 1 module(s)
- `onEditorEditModeDeactivated` — listened to by 1 module(s)
- `onEditorExitLevel` — listened to by 2 module(s)
- `onEditorHeadlessChange` — listened to by 3 module(s)
- `onEditorPaste`
- `onEditorSelectAll`

## Calls into the engine (C++)

- `Engine.` `cancelShutdown`
- `FS:` `copyFile`, `directoryCreate`, `directoryRemove`, `findFiles`, `renameFile`
- `Sim.` `findObjectById`, `serializeObjectToDirectories`
- `obj:` `deleteObject`, `isLocked`
- `worldEditorCppApi.` `clearSceneDirtyFlag`, `disableSimSetAndSimObjectSignals`, `getClassIsRenderable`, `getClassIsSelectable`, `setClassIsRenderable`, `setClassIsSelectable`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/core.lua`.*
