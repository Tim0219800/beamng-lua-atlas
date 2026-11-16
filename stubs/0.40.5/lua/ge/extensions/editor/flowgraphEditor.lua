---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraphEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Game editor extension that hosts the Flowgraph editor (visual node graph editor for gameplay, scenarios and missions). It creates the main window (flowgraph/main) and all the auxiliary windows (overview, stateView, events, examples, properties, variables, projectSettings, history, welcome, nodelibrary, execution, search, references, garbageDebug), manages the current manager (core_flowgraphManager), opening/saving of .flow.json files, autosave, recent files, editing shortcuts and registration of the flowgraph.general.* and flowgraph.debug.* preferences.
--- Access: extension `editor_flowgraphEditor`: `extensions.load("editor_flowgraphEditor")`, then the global `editor_flowgraphEditor`
---@class editor_flowgraphEditor
---@field allowTooltip boolean True when the mouse has been still for more than 0.5 s and no button is pressed: allows tooltips to be displayed.
---@field forceOpen table<string, boolean> Initial values {states = true, log = true} indicating views to force open.
---@field lastOpenedFolder string Last folder used for opening/saving (default 'flowgraphEditor/').
---@field pushedNodeLibActionMap boolean True if the 'NodeLibrary' action map was pushed by a search window.
---@field requestedEditor boolean If true, onClientStartMission activates the editor and opens Flowgraph.
---@field settings table Interface settings: viewModes = {'default', 'simple', 'flowLevel', 'debug'}.
---@field showSmallFgWindow ImBoolPtr Display of the small "FG Monitor" window (BoolPtr).
---@field switchToSmallWindow boolean If true, the next drawEditor disables the editor and shows the small window.
editor_flowgraphEditor = {}

--- Schedules a project history (undo) snapshot with a title; the snapshot is taken later (delayedHistorySnapshot). Also prints the title in the console.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:392
---@param title string Text of the history entry.
---@param graph table|boolean|nil Graph concerned; nil = current graph; any other type (e.g. false) = no graph.
function editor_flowgraphEditor.addHistory(title, graph) end

--- Calls a method on the current keyboard-controllable window (search, node library), if there is one.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:848
---@param fun string Method name (e.g. 'navigateList', 'createNode').
---@param ... any Arguments passed to the method.
function editor_flowgraphEditor.arrowControllableWindowCall(fun, ...) end

--- Autosave: if the timer has elapsed and the project is editable and not transient, writes a copy to flowgraphEditor/autoSaves/ and re-arms the timer.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:149
function editor_flowgraphEditor.autoSave() end

--- Closes the current project (removeManager) and switches to the first remaining manager or nil.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:100
function editor_flowgraphEditor.closeCurrent() end

--- Draws the "CreateNodeContentMenu" popup (node library at position mgr.newNodePos).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:378
function editor_flowgraphEditor.drawContextMenus() end

--- Draws the full editor for the frame: manager, main window, all auxiliary windows, node double-click handling, autosave. Called from onEditorGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:473
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw) end

--- Draws the execution view alone (executionView:drawAlone).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:386
function editor_flowgraphEditor.drawExecution() end

--- Draws the "Restore..." submenu listing the autosave files grouped by original project (UTC date).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:406
function editor_flowgraphEditor.drawRestoreMenu() end

--- Returns the flowgraph manager displayed in the editor.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:797
---@return table|nil  Current manager.
function editor_flowgraphEditor.getManager() end

--- Returns the Properties window.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:1059
---@return table  Instance of the properties window.
function editor_flowgraphEditor.getPropertiesWindow() end

--- Indicates whether the "<map>ActionMap" action map is active and enabled.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:1048
---@param map string Name without the 'ActionMap' suffix.
---@return boolean  true if enabled.
function editor_flowgraphEditor.isActionMapEnabled(map) end

--- Hook called when a mission/level starts on the client side: if requestedEditor is true, activates the editor and opens the Flowgraph window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:822
function editor_flowgraphEditor.onClientStartMission() end

--- Restore hook after Lua reload: stores the open windows (data.windows) and the current manager name (data.currentMgrName).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:792
---@param data table Data produced by onSerialize.
function editor_flowgraphEditor.onDeserialized(data) end

--- Hook called when the editor is activated: hides the small FG Monitor window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:629
function editor_flowgraphEditor.onEditorActivated() end

--- Hook called when the editor is deactivated: pops the FlowgraphMain and Flowgraph action maps.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:623
function editor_flowgraphEditor.onEditorDeactivated() end

--- Hook called every frame by the editor: handles action maps, tooltips, manager change, then draws the editor (drawEditor) if the main window is visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:260
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw) end

--- Hook called when the editor is ready: creates the windows, the "Flowgraph Editor" menu entry (Gameplay group), the node editor context, restores the open windows and declares the flowgraphTransform edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:641
function editor_flowgraphEditor.onEditorInitialized() end

--- Preferences registration hook: 'flowgraph' category with 'general' (pins, recent files, autosave...) and 'debug' (editorDebug, displayIds...) subcategories.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:745
---@param prefsRegistry table Editor preferences registry.
function editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Save hook before Lua reload: returns the windows' state and the current manager name (empty table if the windows do not exist).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:693
---@return table  Serialized data.
function editor_flowgraphEditor.onSerialize() end

--- Hook called every frame: draws the small "FG Monitor" window (button to enlarge the editor) when showSmallFgWindow is true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:552
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw) end

--- Opens (shows) the main window of the Flowgraph editor.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:618
function editor_flowgraphEditor.open() end

--- Opens a .flow.json file: either as a new manager (and makes it current), or by reloading the data into the current manager. Updates the folder and recent files.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:80
---@param fCbData table File dialog data, with the filepath field.
---@param openAsNewManager boolean|nil true to create a new manager.
---@param keepSavedDirs boolean|nil Passed to loadManager (keep the saved folders).
function editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs) end

--- Saves the current project: saveFile if it already has a name/folder, otherwise opens the "Save as" dialog. Re-arms the autosave.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:139
function editor_flowgraphEditor.save() end

--- Sets the project's folder and file name from the chosen path, then saves.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:195
---@param fCbData table Dialog data, filepath field.
function editor_flowgraphEditor.saveAsFile(fCbData) end

--- Saves the current graph: the macro (saveMacro) if it is a macro with a path, otherwise the project (save).
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:131
function editor_flowgraphEditor.saveCurrent() end

--- Writes the project to savedDir/savedFilename (indented JSON). Refuses if the project has no name or is not stopped (runningState ~= 'stopped'), marks the graphs clean, renames "New Project" after the file and updates the recent files.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:160
function editor_flowgraphEditor.saveFile() end

--- Saves a macro: opens the "Unsaved macros" popup if child macros are modified, otherwise writes to the existing path (macroPath) or opens the dialog (.macro.flow.json).
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:114
---@param graph table Macro-type graph.
function editor_flowgraphEditor.saveMacro(graph) end

--- Request to change the displayed manager (applied at the next onEditorGui, or immediately with instant).
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:685
---@param newMgr table|nil Flowgraph manager.
---@param instant boolean|nil Apply immediately to the local variable mgr.
function editor_flowgraphEditor.setManager(newMgr, instant) end

--- Opens the References window and asks it to search for a node. BUG: calls winReferences:searchFor which does not exist in references.lua.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:835
---@param node table Node to search for.
function editor_flowgraphEditor.showNodeReferences(node) end

--- Shortcut: automatically links the output pins of the left node to the free input pins of the right node, based on pin similarity (nodelib:ratePinSimilarity) and if the link is possible. Works with a selected link, a node with a single neighbor, or two selected nodes.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:913
function editor_flowgraphEditor.uiAutoConnectShortcut() end

--- Shortcut: deletes the selected links, or the links connecting the selected nodes to the rest of the graph (failing that, those between selected nodes).
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:1000
function editor_flowgraphEditor.uiDisconnectShortcut() end

--- Shortcut: opens the Search window and puts the focus in the search field.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:1033
function editor_flowgraphEditor.uiFindShortcut() end

--- Shortcut: recenters the graph view on the selection, or on all content if there is no selection.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:854
function editor_flowgraphEditor.uiFocusNodesShortcut() end

--- Shortcut: toggles the visibility of the selected links; with no link selected, hides or shows the links of the selected nodes. Adds a history snapshot.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:864
---@param hide boolean Value applied to the links of the selected nodes when no link is selected.
function editor_flowgraphEditor.uiHideShortcut(hide) end

--- Shortcut: opens the file explorer on the source file of the selected node (node.sourcePath), if there is exactly one.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:903
function editor_flowgraphEditor.uiShowSourceShortcut() end

--- Shortcut: toggles the dynamic mode (toggleDynamicMode) of the selected node, if there is exactly one.
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:1038
function editor_flowgraphEditor.uiToggleCategoryShortcut() end

--- Draws the content of the "Windows" menu: one entry per window (checked if visible) and "Open All" / "Close All".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraphEditor.lua:801
function editor_flowgraphEditor.windowsMenu() end

