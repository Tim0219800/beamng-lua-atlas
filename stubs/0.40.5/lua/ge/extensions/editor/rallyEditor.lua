---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main "Rally Editor" window of the world editor (menu Gameplay > Rally Editor, edit mode "Rally Editor" / notebookEditMode, action map "rallyEditor"). It edits a rally notebook (notebook: *.notebook.json in a mission folder, under rallyUtil.notebooksPath) through tabs: notebookInfo, missionTab, voicepacksTab, pacenotes, drivelineTab, systemPacenotesTab, measurementsTab, aiCompetitorsTab, and testTab only if a dev.txt file exists at the root. It manages the current mission (currentMissionDir/Name/Id), voicepack selection (pick), a comparison "ghost notebook", auxiliary windows (DevTools, RallyToolbox, calibration, stage loader) and the rallyEditor.* preferences (editing, view, waypoints, ui). The other modules (tabs) call its getters (getPref*, getCurrentPath...).
--- Access: extension `editor_rallyEditor`: `extensions.load("editor_rallyEditor")`, then the global `editor_rallyEditor`
---@class editor_rallyEditor
---@field dependencies table<integer, string> Required extensions: {'gameplay_missions_missions'}.
---@field devToolsWindowOpen ImBoolPtr Flag for whether the DevTools window is open (replaced on deserialization).
---@field notebookBasenamesForPick function Alias of voicepack.notebookBasenamesForPick (list of candidate notebook names for a voicepack pick).
---@field picksMatch function Alias of voicepack.picksMatch (compatibility with external callers).
---@field rallyToolboxWindowOpen ImBoolPtr Flag for whether the RallyToolbox window is open (replaced on deserialization).
editor_rallyEditor = {}

--- Returns whether the gizmo is allowed: true when the current edit mode is "Rally Editor".
---Source: lua/ge/extensions/editor/rallyEditor.lua:1439
---@return boolean  true in Rally Editor mode.
function editor_rallyEditor.allowGizmo() end

--- Builds the list of voicepacks offered for a mission (voicepack.buildPickerEntries with suffix "(mission)" for mission voicepacks).
---Source: lua/ge/extensions/editor/rallyEditor.lua:1450
---@param missionDir string Mission folder.
---@return table<integer, table>  Entries containing in particular a pick field.
function editor_rallyEditor.buildVoicepackPickerEntries(missionDir) end

--- Starts/stops playback of the Pacenotes tab's camera path; no effect if another tab is active.
---Source: lua/ge/extensions/editor/rallyEditor.lua:302
function editor_rallyEditor.cameraPathPlay() end

--- Changes the debug draw opacity in steps of 0.2, clamped between 0.1 and 1.0: val = 0 decreases, val = 1.0 increases.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1377
---@param val number 0 to decrease, 1.0 to increase.
function editor_rallyEditor.changeDebugDrawOpacity(val) end

--- Clears the comparison "ghost" notebook if it exists.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1295
function editor_rallyEditor.clearGhostNotebook() end

--- Deselects in the Pacenotes tab (ignored outside this tab).
---Source: lua/ge/extensions/editor/rallyEditor.lua:247
function editor_rallyEditor.deselect() end

--- Chooses the notebook to load for a mission: resolution by voicepack, otherwise first existing notebook, otherwise "structured.notebook.json" to create.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1323
---@param missionDir string Mission folder.
---@return string  Full path of the notebook file.
function editor_rallyEditor.detectNotebookToLoad(missionDir) end

--- Draws the stage loading modal window (StageLoaderModal).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:612
function editor_rallyEditor.drawStageLoaderModal() end

--- Draws the text "mission | notebook | voicepack" (in cyan) in the toolbar with a tooltip; does nothing if there is no current mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:616
---@param pathObj table|nil Current notebook (basenameNoExt() for the name).
function editor_rallyEditor.drawToolbarMissionContext(pathObj) end

--- Returns the file path of the current notebook.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1369
---@return string|nil  currentPath.fname or nil if no notebook.
function editor_rallyEditor.getCurrentFilename() end

--- Returns the current mission's folder.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1443
---@return string|nil  Absolute path.
function editor_rallyEditor.getCurrentMissionDir() end

--- Returns the current mission's identifier (e.g. "italy/rallyStage/001-ss-fastello-norte", extracted after "/missions/").
---Source: lua/ge/extensions/editor/rallyEditor.lua:1445
---@return string|nil  Identifier or nil.
function editor_rallyEditor.getCurrentMissionId() end

--- Returns the mission's readable name (translated info.json name, otherwise last path segment).
---Source: lua/ge/extensions/editor/rallyEditor.lua:1444
---@return string|nil  Name.
function editor_rallyEditor.getCurrentMissionName() end

--- Returns the notebook being edited.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1442
---@return table|nil  Notebook object or nil.
function editor_rallyEditor.getCurrentPath() end

--- Returns the current voicepack choice: {type='voicepack', scope='global'|'mission', dirname=...}.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1446
---@return table|nil  Current pick.
function editor_rallyEditor.getCurrentVoicepackPick() end

--- Returns the error from the last ghost notebook load.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1313
---@return string|nil  Error message.
function editor_rallyEditor.getGhostNotebookError() end

--- Returns the label of the ghost notebook corresponding to a pacenote.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1317
---@param pacenote table Pacenote of the current notebook.
---@return string|nil  Label.
function editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote) end

--- Returns the loaded ghost notebook.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1301
---@return table|nil  Ghost notebook.
function editor_rallyEditor.getGhostNotebookPath() end

--- Returns the file name of the selected ghost notebook.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1305
---@return string|nil  File path.
function editor_rallyEditor.getGhostNotebookSelectedFname() end

--- Returns the label of the selected ghost notebook.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1309
---@return string  Label, or "(none)".
function editor_rallyEditor.getGhostNotebookSelectedLabel() end

--- Returns the current notebook's mission folder (currentPath:getMissionDir()).
---Source: lua/ge/extensions/editor/rallyEditor.lua:1517
---@return string|nil  Folder or nil.
function editor_rallyEditor.getMissionDir() end

--- Returns the current notebook's mission identifier (currentPath:getMissionId()).
---Source: lua/ge/extensions/editor/rallyEditor.lua:1518
---@return string|nil  Identifier or nil.
function editor_rallyEditor.getMissionId() end

--- Returns the Pacenotes tab.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1516
---@return table|nil  Tab instance.
function editor_rallyEditor.getPacenotesWindow() end

--- Preference rallyEditor.waypoints.defaultRadius: display radius of waypoints.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1246
---@return integer  Radius (8 by default).
function editor_rallyEditor.getPrefDefaultRadius() end

--- Prism width (vehicle width) used to draw the driveline spline.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1242
---@return number  Width in meters, clamped to 0.5-5 (1.945 by default).
function editor_rallyEditor.getPrefDrivelineSplinePrismWidth() end

--- Preference rallyEditor.editing.lockWaypoints: locks the waypoint position.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1254
---@return boolean  false by default.
function editor_rallyEditor.getPrefLockWaypoints() end

--- Camera distance beyond which the preview with no selection switches to the rainbow overview.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1226
---@return number  Distance in meters, clamped to 100-1500 (650 by default).
function editor_rallyEditor.getPrefPacenoteLabelDistance() end

--- Display mode for pacenote preview labels.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1222
---@return string  "all" or "distance" (default).
function editor_rallyEditor.getPrefPacenoteLabelMode() end

--- Number of pacenotes before and after the camera pivot that display their label.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1230
---@return integer  0 to 10 (3 by default).
function editor_rallyEditor.getPrefPacenoteLabelNearCameraCount() end

--- Returns whether the preview texts of the previous and next pacenotes are displayed.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1234
---@return boolean  true by default.
function editor_rallyEditor.getPrefShowAdjacentPacenoteText() end

--- True if the label mode is "all".
---Source: lua/ge/extensions/editor/rallyEditor.lua:1218
---@return boolean  true if all labels are displayed.
function editor_rallyEditor.getPrefShowAllPacenoteLabels() end

--- Also displays the next pacenote when a pacenote is selected.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1214
---@return boolean  true by default.
function editor_rallyEditor.getPrefShowNextPacenote() end

--- Also displays the previous pacenote when a pacenote is selected.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1210
---@return boolean  true by default.
function editor_rallyEditor.getPrefShowPreviousPacenote() end

--- Returns whether the floating utility window of the selected pacenote is displayed.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1238
---@return boolean  false by default.
function editor_rallyEditor.getPrefShowSelectedPacenoteUtility() end

--- Width of a pacenote's notes.note.freeform field.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1250
---@return integer  Width (300 by default, from 1 to 1000).
function editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth() end

--- Z snapping method when dragging a waypoint, before looking for the nearest snaproad point.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1258
---@return string  Valid zSnap value (zSnap.defaultMethod otherwise).
function editor_rallyEditor.getPrefWaypointSnapMethod() end

--- Returns whether the snaproad path is drawn in the foreground (ephemeral view option, reset to false when the mode is deactivated).
---Source: lua/ge/extensions/editor/rallyEditor.lua:1459
---@return boolean  Current value.
function editor_rallyEditor.getViewSnaproadPathOnTop() end

--- Supposed to return the volatile preferences; returns the undefined variable volatilePreferences, so nil (see notes).
---Source: lua/ge/extensions/editor/rallyEditor.lua:1514
---@return nil  Always nil.
function editor_rallyEditor.getVolatilePreferences() end

--- Activates the Pacenotes tab's insert mode (ignored outside this tab).
---Source: lua/ge/extensions/editor/rallyEditor.lua:233
function editor_rallyEditor.insertMode() end

--- Returns whether the calibration window is open.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1510
---@return boolean  Window state.
function editor_rallyEditor.isCalibrationWindowOpen() end

--- True if DevTools is open and its pacenote tools section is expanded.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1520
---@return boolean  Section state.
function editor_rallyEditor.isPacenotesToolsSectionExpanded() end

--- True if the RallyToolbox or DevTools window is open.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1425
---@return boolean  true if either is open.
function editor_rallyEditor.isToolboxOpen() end

--- Returns whether the "rallyEditor" window is displayed.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1452
---@return boolean  Visibility.
function editor_rallyEditor.isVisible() end

--- Lists the notebooks offered as ghost notebook.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1285
---@return table  Choices (empty list if the ghost module is not ready).
function editor_rallyEditor.listGhostNotebookChoices() end

--- Lists, sorted, the *.notebook.json files (recursive search) under a mission's notebooks folder.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1267
---@param folder string|nil Mission folder; by default the current notebook's (error if no notebook loaded).
---@return table<integer, string>  Sorted full paths.
function editor_rallyEditor.listNotebooks(folder) end

--- Sets the current mission, builds the voicepack list and applies the first one (which loads its first notebook); otherwise clears the notebook.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1345
---@param missionDir string Mission folder.
function editor_rallyEditor.loadForMissionEditor(missionDir) end

--- Loads an existing notebook (rallyUtil.loadNotebook), sets it as current, updates all tabs and recomputes the structured notes. Logs an error if loading fails.
---Source: lua/ge/extensions/editor/rallyEditor.lua:416
---@param fullFilename string Full path of the .notebook.json file.
function editor_rallyEditor.loadNotebook(fullFilename) end

--- Sets the current mission, removes the voicepack pick, detects the notebook (detectNotebookToLoad) and loads or creates it.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1357
---@param missionDir string Mission folder.
function editor_rallyEditor.loadOrCreateForMissionEditor(missionDir) end

--- Loads the notebook or, if not found, creates a new one (rallyUtil.createNotebook), then updates the tabs and recomputes the structured notes.
---Source: lua/ge/extensions/editor/rallyEditor.lua:400
---@param fullFilename string Full path of the .notebook.json file.
function editor_rallyEditor.loadOrCreateNotebook(fullFilename) end

--- Zoom of the "pacenoteOrbit" camera with the mouse wheel: val = 0 zooms in by 0.4, val = 1.0 zooms out by 0.4. No effect with another camera.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1389
---@param val number 0 or 1.0.
function editor_rallyEditor.mouseWheelZoom(val) end

--- Called directly by the input action: requests moving the selected waypoint backward (repeated with a 0.25 s debounce). Pacenotes tab only.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:292
---@param v number 0 released, 1 pressed.
function editor_rallyEditor.moveSelectedWaypointBackward(v) end

--- Called directly by the input action: requests moving the selected waypoint forward (0.25 s debounce). Pacenotes tab only.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:282
---@param v number 0 released, 1 pressed.
function editor_rallyEditor.moveSelectedWaypointForward(v) end

--- Called after a Lua reload with the saved state: restores the mission, the voicepack pick (legacy "custom" picks are ignored), the notebook (or the pick's first notebook if the file no longer exists) and the state of the Toolbox/DevTools windows.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1133
---@param data table|nil onSerialize table.
function editor_rallyEditor.onDeserialized(data) end

--- Called every frame by the editor: draws the window (File, View, Tools menus, tabs, keyboard and mouse inputs, auxiliary windows).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:979
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw time delta.
function editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw) end

--- Called at editor initialization, including after a Lua reload (Ctrl+L): resets references, creates the ghost notebook, declares the notebookEditMode edit mode, registers the window and the Gameplay > Rally Editor menu, instantiates the tabs and selects Pacenotes (or the first useful tab if there is no notebook).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1037
function editor_rallyEditor.onEditorInitialized() end

--- Declares the rallyEditor preferences category (editing, view, waypoints, ui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1167
---@param prefsRegistry table Editor preferences registry.
function editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry) end

--- If the hidden window is rallyEditor, switches back to objectSelect mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1110
---@param windowName string Window name.
function editor_rallyEditor.onEditorToolWindowHide(windowName) end

--- Called before a Lua reload; saves the mission, voicepack pick, current notebook file and the open state of RallyToolbox and DevTools.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1122
---@return table  {currentMissionDir, currentVoicepackPick, currentNotebookFname, rallyToolboxWindowOpen, devToolsWindowOpen}.
function editor_rallyEditor.onSerialize() end

--- Hook called on vehicle reset: forwarded to DevTools if it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1429
function editor_rallyEditor.onVehicleResetted() end

--- If the window gaining focus is rallyEditor, activates the notebookEditMode edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1116
---@param windowName string Window name.
function editor_rallyEditor.onWindowGotFocus(windowName) end

--- Opens the "Open Rally Stage..." modal window.
---Source: lua/ge/extensions/editor/rallyEditor.lua:608
function editor_rallyEditor.openStageLoaderModal() end

--- Saves the current notebook (currentPath:save()). Logs a warning if no notebook is loaded.
---Source: lua/ge/extensions/editor/rallyEditor.lua:212
function editor_rallyEditor.saveNotebook() end

--- Selects a comparison ghost notebook by file name.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1290
---@param fname string Notebook path.
---@return boolean  Selection result; false if the ghost module is not ready.
function editor_rallyEditor.selectGhostNotebook(fname) end

--- Selects the next pacenote in the Pacenotes tab (ignored elsewhere).
---Source: lua/ge/extensions/editor/rallyEditor.lua:228
function editor_rallyEditor.selectNextPacenote() end

--- Selects the next waypoint in the Pacenotes tab (ignored elsewhere).
---Source: lua/ge/extensions/editor/rallyEditor.lua:252
function editor_rallyEditor.selectNextWaypoint() end

--- Selects the previous pacenote in the Pacenotes tab (ignored elsewhere).
---Source: lua/ge/extensions/editor/rallyEditor.lua:223
function editor_rallyEditor.selectPrevPacenote() end

--- Switches to the editor's free camera, keeping the current camera's position and rotation.
---Source: lua/ge/extensions/editor/rallyEditor.lua:238
function editor_rallyEditor.setFreeCam() end

--- Writes the rallyEditor.editing.lockWaypoints preference.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1263
---@param val boolean true to lock.
function editor_rallyEditor.setPrefLockWaypoints(val) end

--- Sets the active voicepack pick and automatically loads the first candidate notebook; if the pick has no resolvable notebook, clears the loaded notebook.
---Source: lua/ge/extensions/editor/rallyEditor.lua:445
---@param pick table {type='voicepack', scope='global'|'mission', dirname=<voicepack folder>}.
function editor_rallyEditor.setVoicepackPick(pick) end

--- Clears the selection, shows the Rally Editor window and activates the notebookEditMode edit mode.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1000
function editor_rallyEditor.show() end

--- Selects the Pacenotes tab (programmatic selection).
---Source: lua/ge/extensions/editor/rallyEditor.lua:983
function editor_rallyEditor.showPacenotesTab() end

--- Shows the window (or gives it focus), opens the Pacenotes tab and activates the notebookEditMode edit mode.
---Source: lua/ge/extensions/editor/rallyEditor.lua:988
function editor_rallyEditor.showRallyTool() end

--- Opens or closes the calibration window.
---Source: lua/ge/extensions/editor/rallyEditor.lua:1511
function editor_rallyEditor.toggleCalibrationWindow() end

--- Enables/disables corner calls in the Pacenotes tab (ignored elsewhere).
---Source: lua/ge/extensions/editor/rallyEditor.lua:307
function editor_rallyEditor.toggleCornerCalls() end

--- Called directly by the input action: continuous zoom in (0.05 s debounce) of the "pacenoteOrbit" camera. No effect with another camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1400
---@param val number 0 released, 1 pressed.
function editor_rallyEditor.zoomIn(val) end

--- Called directly by the input action: continuous zoom out (0.05 s debounce) of the "pacenoteOrbit" camera. No effect with another camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor.lua:1413
---@param val number 0 released, 1 pressed.
function editor_rallyEditor.zoomOut(val) end

