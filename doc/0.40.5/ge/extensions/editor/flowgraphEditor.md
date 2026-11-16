# `editor_flowgraphEditor`

*File: `lua/ge/extensions/editor/flowgraphEditor.lua` · VM: Game Engine (GE) · 1101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_flowgraphEditor`: `extensions.load("editor_flowgraphEditor")`, then the global `editor_flowgraphEditor`

Game editor extension that hosts the Flowgraph editor (visual node graph editor for gameplay, scenarios and missions). It creates the main window (flowgraph/main) and all the auxiliary windows (overview, stateView, events, examples, properties, variables, projectSettings, history, welcome, nodelibrary, execution, search, references, garbageDebug), manages the current manager (core_flowgraphManager), opening/saving of .flow.json files, autosave, recent files, editing shortcuts and registration of the flowgraph.general.* and flowgraph.debug.* preferences.

## Example

```lua
extensions.load('editor_flowgraphEditor')
editor_flowgraphEditor.open()
local mgr = editor_flowgraphEditor.getManager()
```

## Notes

- The drawing functions and the onEditor* hooks only work when the editor is active and initialized (onEditorInitialized creates the windows and the ui_flowgraph_editor context).
- Project files: *.flow.json; macros: *.macro.flow.json; autosaves in flowgraphEditor/autoSaves/ (name <timestamp>_<project name>.flow.json), default interval 120 s (preference flowgraph.general.autosaveInterval, 30-600).
- setManager only changes the manager at the next onEditorGui (unless instant = true).
- Inconsistencies in the code: save() tests the preference flowgraph.general.editorDebug while the registered one is flowgraph.debug.editorDebug (so the test is always "false"), saveFile() logs an error for a transient project but does not stop; onClientStartMission writes M.requesteEditor (typo) so requestedEditor is never reset to false; showNodeReferences calls winReferences:searchFor which does not exist; the restore loop in onEditorGui uses a global variable `done` that is always nil; onWindowMenuItem calls open() before its local declaration (not exported, not used).
- M.onUpdate is the small "FG Monitor" window shown when the editor is disabled but showSmallFgWindow is true.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_flowgraphEditor.addHistory(title, graph)` | Schedules a project history (undo) snapshot with a title; the snapshot is taken later (delayedHistorySnapshot). Also prints the title in the console. | 392 |
| `editor_flowgraphEditor.arrowControllableWindowCall(fun, ...)` | Calls a method on the current keyboard-controllable window (search, node library), if there is one. | 848 |
| `editor_flowgraphEditor.autoSave()` | Autosave: if the timer has elapsed and the project is editable and not transient, writes a copy to flowgraphEditor/autoSaves/ and re-arms the timer. | 149 |
| `editor_flowgraphEditor.closeCurrent()` | Closes the current project (removeManager) and switches to the first remaining manager or nil. | 100 |
| `editor_flowgraphEditor.drawContextMenus()` | Draws the "CreateNodeContentMenu" popup (node library at position mgr.newNodePos). *(internal)* | 378 |
| `editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw)` | Draws the full editor for the frame: manager, main window, all auxiliary windows, node double-click handling, autosave. Called from onEditorGui. *(internal)* | 473 |
| `editor_flowgraphEditor.drawExecution()` | Draws the execution view alone (executionView:drawAlone). *(internal)* | 386 |
| `editor_flowgraphEditor.drawRestoreMenu()` | Draws the "Restore..." submenu listing the autosave files grouped by original project (UTC date). *(internal)* | 406 |
| `editor_flowgraphEditor.getManager()` | Returns the flowgraph manager displayed in the editor. | 797 |
| `editor_flowgraphEditor.getPropertiesWindow()` | Returns the Properties window. | 1059 |
| `editor_flowgraphEditor.isActionMapEnabled(map)` | Indicates whether the "<map>ActionMap" action map is active and enabled. | 1048 |
| `editor_flowgraphEditor.onClientStartMission()` | Hook called when a mission/level starts on the client side: if requestedEditor is true, activates the editor and opens the Flowgraph window. *(internal)* *(hook)* | 822 |
| `editor_flowgraphEditor.onDeserialized(data)` | Restore hook after Lua reload: stores the open windows (data.windows) and the current manager name (data.currentMgrName). *(internal)* *(hook)* | 792 |
| `editor_flowgraphEditor.onEditorActivated()` | Hook called when the editor is activated: hides the small FG Monitor window. *(internal)* *(hook)* | 629 |
| `editor_flowgraphEditor.onEditorDeactivated()` | Hook called when the editor is deactivated: pops the FlowgraphMain and Flowgraph action maps. *(internal)* *(hook)* | 623 |
| `editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw)` | Hook called every frame by the editor: handles action maps, tooltips, manager change, then draws the editor (drawEditor) if the main window is visible. *(internal)* *(hook)* | 260 |
| `editor_flowgraphEditor.onEditorInitialized()` | Hook called when the editor is ready: creates the windows, the "Flowgraph Editor" menu entry (Gameplay group), the node editor context, restores the open windows and declares the flowgraphTransform edit mode. *(internal)* *(hook)* | 641 |
| `editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry)` | Preferences registration hook: 'flowgraph' category with 'general' (pins, recent files, autosave...) and 'debug' (editorDebug, displayIds...) subcategories. *(internal)* *(hook)* | 745 |
| `editor_flowgraphEditor.onSerialize()` | Save hook before Lua reload: returns the windows' state and the current manager name (empty table if the windows do not exist). *(internal)* *(hook)* | 693 |
| `editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: draws the small "FG Monitor" window (button to enlarge the editor) when showSmallFgWindow is true. *(internal)* *(hook)* | 552 |
| `editor_flowgraphEditor.open()` | Opens (shows) the main window of the Flowgraph editor. | 618 |
| `editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs)` | Opens a .flow.json file: either as a new manager (and makes it current), or by reloading the data into the current manager. Updates the folder and recent files. | 80 |
| `editor_flowgraphEditor.save()` | Saves the current project: saveFile if it already has a name/folder, otherwise opens the "Save as" dialog. Re-arms the autosave. | 139 |
| `editor_flowgraphEditor.saveAsFile(fCbData)` | Sets the project's folder and file name from the chosen path, then saves. | 195 |
| `editor_flowgraphEditor.saveCurrent()` | Saves the current graph: the macro (saveMacro) if it is a macro with a path, otherwise the project (save). | 131 |
| `editor_flowgraphEditor.saveFile()` | Writes the project to savedDir/savedFilename (indented JSON). Refuses if the project has no name or is not stopped (runningState ~= 'stopped'), marks the graphs clean, renames "New Project" after the file and updates the recent files. | 160 |
| `editor_flowgraphEditor.saveMacro(graph)` | Saves a macro: opens the "Unsaved macros" popup if child macros are modified, otherwise writes to the existing path (macroPath) or opens the dialog (.macro.flow.json). | 114 |
| `editor_flowgraphEditor.setManager(newMgr, instant)` | Request to change the displayed manager (applied at the next onEditorGui, or immediately with instant). | 685 |
| `editor_flowgraphEditor.showNodeReferences(node)` | Opens the References window and asks it to search for a node. BUG: calls winReferences:searchFor which does not exist in references.lua. | 835 |
| `editor_flowgraphEditor.uiAutoConnectShortcut()` | Shortcut: automatically links the output pins of the left node to the free input pins of the right node, based on pin similarity (nodelib:ratePinSimilarity) and if the link is possible. Works with a selected link, a node with a single neighbor, or two selected nodes. | 913 |
| `editor_flowgraphEditor.uiDisconnectShortcut()` | Shortcut: deletes the selected links, or the links connecting the selected nodes to the rest of the graph (failing that, those between selected nodes). | 1000 |
| `editor_flowgraphEditor.uiFindShortcut()` | Shortcut: opens the Search window and puts the focus in the search field. | 1033 |
| `editor_flowgraphEditor.uiFocusNodesShortcut()` | Shortcut: recenters the graph view on the selection, or on all content if there is no selection. | 854 |
| `editor_flowgraphEditor.uiHideShortcut(hide)` | Shortcut: toggles the visibility of the selected links; with no link selected, hides or shows the links of the selected nodes. Adds a history snapshot. | 864 |
| `editor_flowgraphEditor.uiShowSourceShortcut()` | Shortcut: opens the file explorer on the source file of the selected node (node.sourcePath), if there is exactly one. | 903 |
| `editor_flowgraphEditor.uiToggleCategoryShortcut()` | Shortcut: toggles the dynamic mode (toggleDynamicMode) of the selected node, if there is exactly one. | 1038 |
| `editor_flowgraphEditor.windowsMenu()` | Draws the content of the "Windows" menu: one entry per window (checked if visible) and "Open All" / "Close All". *(internal)* | 801 |

### Parameter details

#### `editor_flowgraphEditor.addHistory(title, graph)`

Schedules a project history (undo) snapshot with a title; the snapshot is taken later (delayedHistorySnapshot). Also prints the title in the console.

- `title` (*string*) : Text of the history entry.
- `graph` (*table|boolean|nil*) : Graph concerned; nil = current graph; any other type (e.g. false) = no graph.

#### `editor_flowgraphEditor.arrowControllableWindowCall(fun, ...)`

Calls a method on the current keyboard-controllable window (search, node library), if there is one.

- `fun` (*string*) : Method name (e.g. 'navigateList', 'createNode').
- `...` (*any*) : Arguments passed to the method.

#### `editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw)`

Draws the full editor for the frame: manager, main window, all auxiliary windows, node double-click handling, autosave. Called from onEditorGui.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_flowgraphEditor.getManager()`

Returns the flowgraph manager displayed in the editor.

- **returns**: table|nil Current manager.

#### `editor_flowgraphEditor.getPropertiesWindow()`

Returns the Properties window.

- **returns**: table Instance of the properties window.

#### `editor_flowgraphEditor.isActionMapEnabled(map)`

Indicates whether the "<map>ActionMap" action map is active and enabled.

- `map` (*string*) : Name without the 'ActionMap' suffix.
- **returns**: boolean true if enabled.

#### `editor_flowgraphEditor.onDeserialized(data)`

Restore hook after Lua reload: stores the open windows (data.windows) and the current manager name (data.currentMgrName).

- `data` (*table*) : Data produced by onSerialize.

#### `editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw)`

Hook called every frame by the editor: handles action maps, tooltips, manager change, then draws the editor (drawEditor) if the main window is visible.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry)`

Preferences registration hook: 'flowgraph' category with 'general' (pins, recent files, autosave...) and 'debug' (editorDebug, displayIds...) subcategories.

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_flowgraphEditor.onSerialize()`

Save hook before Lua reload: returns the windows' state and the current manager name (empty table if the windows do not exist).

- **returns**: table Serialized data.

#### `editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: draws the small "FG Monitor" window (button to enlarge the editor) when showSmallFgWindow is true.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs)`

Opens a .flow.json file: either as a new manager (and makes it current), or by reloading the data into the current manager. Updates the folder and recent files.

- `fCbData` (*table*) : File dialog data, with the filepath field.
- `openAsNewManager` (*boolean|nil*) : true to create a new manager.
- `keepSavedDirs` (*boolean|nil*) : Passed to loadManager (keep the saved folders).

#### `editor_flowgraphEditor.saveAsFile(fCbData)`

Sets the project's folder and file name from the chosen path, then saves.

- `fCbData` (*table*) : Dialog data, filepath field.

#### `editor_flowgraphEditor.saveMacro(graph)`

Saves a macro: opens the "Unsaved macros" popup if child macros are modified, otherwise writes to the existing path (macroPath) or opens the dialog (.macro.flow.json).

- `graph` (*table*) : Macro-type graph.

#### `editor_flowgraphEditor.setManager(newMgr, instant)`

Request to change the displayed manager (applied at the next onEditorGui, or immediately with instant).

- `newMgr` (*table|nil*) : Flowgraph manager.
- `instant` (*boolean|nil*) : Apply immediately to the local variable mgr.

#### `editor_flowgraphEditor.showNodeReferences(node)`

Opens the References window and asks it to search for a node. BUG: calls winReferences:searchFor which does not exist in references.lua.

- `node` (*table*) : Node to search for.

#### `editor_flowgraphEditor.uiHideShortcut(hide)`

Shortcut: toggles the visibility of the selected links; with no link selected, hides or shows the links of the selected nodes. Adds a history snapshot.

- `hide` (*boolean*) : Value applied to the links of the selected nodes when no link is selected.

## Fields

| Field | Type | Description |
|---|---|---|
| `allowTooltip` | boolean | True when the mouse has been still for more than 0.5 s and no button is pressed: allows tooltips to be displayed. |
| `forceOpen` | table<string, boolean> | Initial values {states = true, log = true} indicating views to force open. |
| `lastOpenedFolder` | string | Last folder used for opening/saving (default 'flowgraphEditor/'). |
| `pushedNodeLibActionMap` | boolean | True if the 'NodeLibrary' action map was pushed by a search window. |
| `requestedEditor` | boolean | If true, onClientStartMission activates the editor and opens Flowgraph. |
| `settings` | table | Interface settings: viewModes = {'default', 'simple', 'flowLevel', 'debug'}. |
| `showSmallFgWindow` | ImBoolPtr | Display of the small "FG Monitor" window (BoolPtr). |
| `switchToSmallWindow` | boolean | If true, the next drawEditor disables the editor and shows the small window. |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraphEditor.lua`.*
