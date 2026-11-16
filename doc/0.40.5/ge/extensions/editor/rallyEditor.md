# `editor_rallyEditor`

*File: `lua/ge/extensions/editor/rallyEditor.lua` · VM: Game Engine (GE) · 1523 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor`: `extensions.load("editor_rallyEditor")`, then the global `editor_rallyEditor`

Main "Rally Editor" window of the world editor (menu Gameplay > Rally Editor, edit mode "Rally Editor" / notebookEditMode, action map "rallyEditor"). It edits a rally notebook (notebook: *.notebook.json in a mission folder, under rallyUtil.notebooksPath) through tabs: notebookInfo, missionTab, voicepacksTab, pacenotes, drivelineTab, systemPacenotesTab, measurementsTab, aiCompetitorsTab, and testTab only if a dev.txt file exists at the root. It manages the current mission (currentMissionDir/Name/Id), voicepack selection (pick), a comparison "ghost notebook", auxiliary windows (DevTools, RallyToolbox, calibration, stage loader) and the rallyEditor.* preferences (editing, view, waypoints, ui). The other modules (tabs) call its getters (getPref*, getCurrentPath...).

## Example

```lua
local nb = editor_rallyEditor.getCurrentPath()  -- current notebook or nil
editor_rallyEditor.loadOrCreateForMissionEditor('/gameplay/missions/italy/rallyStage/001-...')
editor_rallyEditor.saveNotebook()
```

## Notes

- Registered preferences: rallyEditor.editing (lockWaypoints [hidden], showPreviousPacenote, showNextPacenote, waypointSnapMethod), rallyEditor.view (pacenoteLabelMode "all"|"distance", pacenoteLabelDistance 100-1500 [650 default], pacenoteLabelNearCameraCount 0-10 [3], showAdjacentPacenoteText, showSelectedPacenoteUtility, drivelineSplinePrismWidth 0.5-5 [1.945], showAllPacenoteLabels [legacy, hidden]), rallyEditor.waypoints.defaultRadius (8, from 1 to 50), rallyEditor.ui.pacenoteNoteFieldWidth (300).
- Bug: M.getVolatilePreferences returns the variable "volatilePreferences" which is never defined in this file; it therefore always returns nil.
- The legacy preference showAllPacenoteLabels = true forces the "all" label mode.
- moveSelectedWaypointForward/Backward, zoomIn and zoomOut are called directly by input actions with a value (0 = released, 1 = pressed); repetition is limited by a debounce (0.25 s for waypoints, 0.05 s for zoom). zoomIn/zoomOut/mouseWheelZoom only act if the active camera is "pacenoteOrbit".
- The navigation shortcuts (selectPrevPacenote, selectNextPacenote, insertMode, deselect, selectNextWaypoint, cameraPathPlay, toggleCornerCalls) do nothing if the active tab is not Pacenotes.
- Declared dependency: gameplay_missions_missions. The gameplay_rallyLoop extension is loaded/unloaded by the "RallyLoop Extension" checkbox in the Tools menu.
- When the edit mode is activated then deactivated, resetEphemeralViewOptions resets the forest hiding option (theForest) and the foreground snaproad display.

**Dependencies (loaded first):** `gameplay_missions_missions`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor.allowGizmo()` | Returns whether the gizmo is allowed: true when the current edit mode is "Rally Editor". | 1439 |
| `editor_rallyEditor.buildVoicepackPickerEntries(missionDir)` | Builds the list of voicepacks offered for a mission (voicepack.buildPickerEntries with suffix "(mission)" for mission voicepacks). | 1450 |
| `editor_rallyEditor.cameraPathPlay()` | Starts/stops playback of the Pacenotes tab's camera path; no effect if another tab is active. | 302 |
| `editor_rallyEditor.changeDebugDrawOpacity(val)` | Changes the debug draw opacity in steps of 0.2, clamped between 0.1 and 1.0: val = 0 decreases, val = 1.0 increases. | 1377 |
| `editor_rallyEditor.clearGhostNotebook()` | Clears the comparison "ghost" notebook if it exists. | 1295 |
| `editor_rallyEditor.deselect()` | Deselects in the Pacenotes tab (ignored outside this tab). | 247 |
| `editor_rallyEditor.detectNotebookToLoad(missionDir)` | Chooses the notebook to load for a mission: resolution by voicepack, otherwise first existing notebook, otherwise "structured.notebook.json" to create. | 1323 |
| `editor_rallyEditor.drawStageLoaderModal()` | Draws the stage loading modal window (StageLoaderModal). *(internal)* | 612 |
| `editor_rallyEditor.drawToolbarMissionContext(pathObj)` | Draws the text "mission \| notebook \| voicepack" (in cyan) in the toolbar with a tooltip; does nothing if there is no current mission. *(internal)* | 616 |
| `editor_rallyEditor.getCurrentFilename()` | Returns the file path of the current notebook. | 1369 |
| `editor_rallyEditor.getCurrentMissionDir()` | Returns the current mission's folder. | 1443 |
| `editor_rallyEditor.getCurrentMissionId()` | Returns the current mission's identifier (e.g. "italy/rallyStage/001-ss-fastello-norte", extracted after "/missions/"). | 1445 |
| `editor_rallyEditor.getCurrentMissionName()` | Returns the mission's readable name (translated info.json name, otherwise last path segment). | 1444 |
| `editor_rallyEditor.getCurrentPath()` | Returns the notebook being edited. | 1442 |
| `editor_rallyEditor.getCurrentVoicepackPick()` | Returns the current voicepack choice: {type='voicepack', scope='global'\|'mission', dirname=...}. | 1446 |
| `editor_rallyEditor.getGhostNotebookError()` | Returns the error from the last ghost notebook load. | 1313 |
| `editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote)` | Returns the label of the ghost notebook corresponding to a pacenote. | 1317 |
| `editor_rallyEditor.getGhostNotebookPath()` | Returns the loaded ghost notebook. | 1301 |
| `editor_rallyEditor.getGhostNotebookSelectedFname()` | Returns the file name of the selected ghost notebook. | 1305 |
| `editor_rallyEditor.getGhostNotebookSelectedLabel()` | Returns the label of the selected ghost notebook. | 1309 |
| `editor_rallyEditor.getMissionDir()` | Returns the current notebook's mission folder (currentPath:getMissionDir()). | 1517 |
| `editor_rallyEditor.getMissionId()` | Returns the current notebook's mission identifier (currentPath:getMissionId()). | 1518 |
| `editor_rallyEditor.getPacenotesWindow()` | Returns the Pacenotes tab. | 1516 |
| `editor_rallyEditor.getPrefDefaultRadius()` | Preference rallyEditor.waypoints.defaultRadius: display radius of waypoints. | 1246 |
| `editor_rallyEditor.getPrefDrivelineSplinePrismWidth()` | Prism width (vehicle width) used to draw the driveline spline. | 1242 |
| `editor_rallyEditor.getPrefLockWaypoints()` | Preference rallyEditor.editing.lockWaypoints: locks the waypoint position. | 1254 |
| `editor_rallyEditor.getPrefPacenoteLabelDistance()` | Camera distance beyond which the preview with no selection switches to the rainbow overview. | 1226 |
| `editor_rallyEditor.getPrefPacenoteLabelMode()` | Display mode for pacenote preview labels. | 1222 |
| `editor_rallyEditor.getPrefPacenoteLabelNearCameraCount()` | Number of pacenotes before and after the camera pivot that display their label. | 1230 |
| `editor_rallyEditor.getPrefShowAdjacentPacenoteText()` | Returns whether the preview texts of the previous and next pacenotes are displayed. | 1234 |
| `editor_rallyEditor.getPrefShowAllPacenoteLabels()` | True if the label mode is "all". | 1218 |
| `editor_rallyEditor.getPrefShowNextPacenote()` | Also displays the next pacenote when a pacenote is selected. | 1214 |
| `editor_rallyEditor.getPrefShowPreviousPacenote()` | Also displays the previous pacenote when a pacenote is selected. | 1210 |
| `editor_rallyEditor.getPrefShowSelectedPacenoteUtility()` | Returns whether the floating utility window of the selected pacenote is displayed. | 1238 |
| `editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth()` | Width of a pacenote's notes.note.freeform field. | 1250 |
| `editor_rallyEditor.getPrefWaypointSnapMethod()` | Z snapping method when dragging a waypoint, before looking for the nearest snaproad point. | 1258 |
| `editor_rallyEditor.getViewSnaproadPathOnTop()` | Returns whether the snaproad path is drawn in the foreground (ephemeral view option, reset to false when the mode is deactivated). | 1459 |
| `editor_rallyEditor.getVolatilePreferences()` | Supposed to return the volatile preferences; returns the undefined variable volatilePreferences, so nil (see notes). | 1514 |
| `editor_rallyEditor.insertMode()` | Activates the Pacenotes tab's insert mode (ignored outside this tab). | 233 |
| `editor_rallyEditor.isCalibrationWindowOpen()` | Returns whether the calibration window is open. | 1510 |
| `editor_rallyEditor.isPacenotesToolsSectionExpanded()` | True if DevTools is open and its pacenote tools section is expanded. | 1520 |
| `editor_rallyEditor.isToolboxOpen()` | True if the RallyToolbox or DevTools window is open. | 1425 |
| `editor_rallyEditor.isVisible()` | Returns whether the "rallyEditor" window is displayed. | 1452 |
| `editor_rallyEditor.listGhostNotebookChoices()` | Lists the notebooks offered as ghost notebook. | 1285 |
| `editor_rallyEditor.listNotebooks(folder)` | Lists, sorted, the *.notebook.json files (recursive search) under a mission's notebooks folder. | 1267 |
| `editor_rallyEditor.loadForMissionEditor(missionDir)` | Sets the current mission, builds the voicepack list and applies the first one (which loads its first notebook); otherwise clears the notebook. | 1345 |
| `editor_rallyEditor.loadNotebook(fullFilename)` | Loads an existing notebook (rallyUtil.loadNotebook), sets it as current, updates all tabs and recomputes the structured notes. Logs an error if loading fails. | 416 |
| `editor_rallyEditor.loadOrCreateForMissionEditor(missionDir)` | Sets the current mission, removes the voicepack pick, detects the notebook (detectNotebookToLoad) and loads or creates it. | 1357 |
| `editor_rallyEditor.loadOrCreateNotebook(fullFilename)` | Loads the notebook or, if not found, creates a new one (rallyUtil.createNotebook), then updates the tabs and recomputes the structured notes. | 400 |
| `editor_rallyEditor.mouseWheelZoom(val)` | Zoom of the "pacenoteOrbit" camera with the mouse wheel: val = 0 zooms in by 0.4, val = 1.0 zooms out by 0.4. No effect with another camera. | 1389 |
| `editor_rallyEditor.moveSelectedWaypointBackward(v)` | Called directly by the input action: requests moving the selected waypoint backward (repeated with a 0.25 s debounce). Pacenotes tab only. *(internal)* | 292 |
| `editor_rallyEditor.moveSelectedWaypointForward(v)` | Called directly by the input action: requests moving the selected waypoint forward (0.25 s debounce). Pacenotes tab only. *(internal)* | 282 |
| `editor_rallyEditor.onDeserialized(data)` | Called after a Lua reload with the saved state: restores the mission, the voicepack pick (legacy "custom" picks are ignored), the notebook (or the pick's first notebook if the file no longer exists) and the state of the Toolbox/DevTools windows. *(internal)* *(hook)* | 1133 |
| `editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw)` | Called every frame by the editor: draws the window (File, View, Tools menus, tabs, keyboard and mouse inputs, auxiliary windows). *(internal)* *(hook)* | 979 |
| `editor_rallyEditor.onEditorInitialized()` | Called at editor initialization, including after a Lua reload (Ctrl+L): resets references, creates the ghost notebook, declares the notebookEditMode edit mode, registers the window and the Gameplay > Rally Editor menu, instantiates the tabs and selects Pacenotes (or the first useful tab if there is no notebook). *(internal)* *(hook)* | 1037 |
| `editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry)` | Declares the rallyEditor preferences category (editing, view, waypoints, ui). *(internal)* *(hook)* | 1167 |
| `editor_rallyEditor.onEditorToolWindowHide(windowName)` | If the hidden window is rallyEditor, switches back to objectSelect mode. *(internal)* *(hook)* | 1110 |
| `editor_rallyEditor.onSerialize()` | Called before a Lua reload; saves the mission, voicepack pick, current notebook file and the open state of RallyToolbox and DevTools. *(internal)* *(hook)* | 1122 |
| `editor_rallyEditor.onVehicleResetted()` | Hook called on vehicle reset: forwarded to DevTools if it is open. *(internal)* *(hook)* | 1429 |
| `editor_rallyEditor.onWindowGotFocus(windowName)` | If the window gaining focus is rallyEditor, activates the notebookEditMode edit mode. *(internal)* *(hook)* | 1116 |
| `editor_rallyEditor.openStageLoaderModal()` | Opens the "Open Rally Stage..." modal window. | 608 |
| `editor_rallyEditor.saveNotebook()` | Saves the current notebook (currentPath:save()). Logs a warning if no notebook is loaded. | 212 |
| `editor_rallyEditor.selectGhostNotebook(fname)` | Selects a comparison ghost notebook by file name. | 1290 |
| `editor_rallyEditor.selectNextPacenote()` | Selects the next pacenote in the Pacenotes tab (ignored elsewhere). | 228 |
| `editor_rallyEditor.selectNextWaypoint()` | Selects the next waypoint in the Pacenotes tab (ignored elsewhere). | 252 |
| `editor_rallyEditor.selectPrevPacenote()` | Selects the previous pacenote in the Pacenotes tab (ignored elsewhere). | 223 |
| `editor_rallyEditor.setFreeCam()` | Switches to the editor's free camera, keeping the current camera's position and rotation. | 238 |
| `editor_rallyEditor.setPrefLockWaypoints(val)` | Writes the rallyEditor.editing.lockWaypoints preference. | 1263 |
| `editor_rallyEditor.setVoicepackPick(pick)` | Sets the active voicepack pick and automatically loads the first candidate notebook; if the pick has no resolvable notebook, clears the loaded notebook. | 445 |
| `editor_rallyEditor.show()` | Clears the selection, shows the Rally Editor window and activates the notebookEditMode edit mode. | 1000 |
| `editor_rallyEditor.showPacenotesTab()` | Selects the Pacenotes tab (programmatic selection). | 983 |
| `editor_rallyEditor.showRallyTool()` | Shows the window (or gives it focus), opens the Pacenotes tab and activates the notebookEditMode edit mode. | 988 |
| `editor_rallyEditor.toggleCalibrationWindow()` | Opens or closes the calibration window. | 1511 |
| `editor_rallyEditor.toggleCornerCalls()` | Enables/disables corner calls in the Pacenotes tab (ignored elsewhere). | 307 |
| `editor_rallyEditor.zoomIn(val)` | Called directly by the input action: continuous zoom in (0.05 s debounce) of the "pacenoteOrbit" camera. No effect with another camera. *(internal)* | 1400 |
| `editor_rallyEditor.zoomOut(val)` | Called directly by the input action: continuous zoom out (0.05 s debounce) of the "pacenoteOrbit" camera. No effect with another camera. *(internal)* | 1413 |

### Parameter details

#### `editor_rallyEditor.allowGizmo()`

Returns whether the gizmo is allowed: true when the current edit mode is "Rally Editor".

- **returns**: boolean true in Rally Editor mode.

#### `editor_rallyEditor.buildVoicepackPickerEntries(missionDir)`

Builds the list of voicepacks offered for a mission (voicepack.buildPickerEntries with suffix "(mission)" for mission voicepacks).

- `missionDir` (*string*) : Mission folder.
- **returns**: table<integer, table> Entries containing in particular a pick field.

#### `editor_rallyEditor.changeDebugDrawOpacity(val)`

Changes the debug draw opacity in steps of 0.2, clamped between 0.1 and 1.0: val = 0 decreases, val = 1.0 increases.

- `val` (*number*) : 0 to decrease, 1.0 to increase.

#### `editor_rallyEditor.detectNotebookToLoad(missionDir)`

Chooses the notebook to load for a mission: resolution by voicepack, otherwise first existing notebook, otherwise "structured.notebook.json" to create.

- `missionDir` (*string*) : Mission folder.
- **returns**: string Full path of the notebook file.

#### `editor_rallyEditor.drawToolbarMissionContext(pathObj)`

Draws the text "mission | notebook | voicepack" (in cyan) in the toolbar with a tooltip; does nothing if there is no current mission.

- `pathObj` (*table|nil*) : Current notebook (basenameNoExt() for the name).

#### `editor_rallyEditor.getCurrentFilename()`

Returns the file path of the current notebook.

- **returns**: string|nil currentPath.fname or nil if no notebook.

#### `editor_rallyEditor.getCurrentMissionDir()`

Returns the current mission's folder.

- **returns**: string|nil Absolute path.

#### `editor_rallyEditor.getCurrentMissionId()`

Returns the current mission's identifier (e.g. "italy/rallyStage/001-ss-fastello-norte", extracted after "/missions/").

- **returns**: string|nil Identifier or nil.

#### `editor_rallyEditor.getCurrentMissionName()`

Returns the mission's readable name (translated info.json name, otherwise last path segment).

- **returns**: string|nil Name.

#### `editor_rallyEditor.getCurrentPath()`

Returns the notebook being edited.

- **returns**: table|nil Notebook object or nil.

#### `editor_rallyEditor.getCurrentVoicepackPick()`

Returns the current voicepack choice: {type='voicepack', scope='global'|'mission', dirname=...}.

- **returns**: table|nil Current pick.

#### `editor_rallyEditor.getGhostNotebookError()`

Returns the error from the last ghost notebook load.

- **returns**: string|nil Error message.

#### `editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote)`

Returns the label of the ghost notebook corresponding to a pacenote.

- `pacenote` (*table*) : Pacenote of the current notebook.
- **returns**: string|nil Label.

#### `editor_rallyEditor.getGhostNotebookPath()`

Returns the loaded ghost notebook.

- **returns**: table|nil Ghost notebook.

#### `editor_rallyEditor.getGhostNotebookSelectedFname()`

Returns the file name of the selected ghost notebook.

- **returns**: string|nil File path.

#### `editor_rallyEditor.getGhostNotebookSelectedLabel()`

Returns the label of the selected ghost notebook.

- **returns**: string Label, or "(none)".

#### `editor_rallyEditor.getMissionDir()`

Returns the current notebook's mission folder (currentPath:getMissionDir()).

- **returns**: string|nil Folder or nil.

#### `editor_rallyEditor.getMissionId()`

Returns the current notebook's mission identifier (currentPath:getMissionId()).

- **returns**: string|nil Identifier or nil.

#### `editor_rallyEditor.getPacenotesWindow()`

Returns the Pacenotes tab.

- **returns**: table|nil Tab instance.

#### `editor_rallyEditor.getPrefDefaultRadius()`

Preference rallyEditor.waypoints.defaultRadius: display radius of waypoints.

- **returns**: integer Radius (8 by default).

#### `editor_rallyEditor.getPrefDrivelineSplinePrismWidth()`

Prism width (vehicle width) used to draw the driveline spline.

- **returns**: number Width in meters, clamped to 0.5-5 (1.945 by default).

#### `editor_rallyEditor.getPrefLockWaypoints()`

Preference rallyEditor.editing.lockWaypoints: locks the waypoint position.

- **returns**: boolean false by default.

#### `editor_rallyEditor.getPrefPacenoteLabelDistance()`

Camera distance beyond which the preview with no selection switches to the rainbow overview.

- **returns**: number Distance in meters, clamped to 100-1500 (650 by default).

#### `editor_rallyEditor.getPrefPacenoteLabelMode()`

Display mode for pacenote preview labels.

- **returns**: string "all" or "distance" (default).

#### `editor_rallyEditor.getPrefPacenoteLabelNearCameraCount()`

Number of pacenotes before and after the camera pivot that display their label.

- **returns**: integer 0 to 10 (3 by default).

#### `editor_rallyEditor.getPrefShowAdjacentPacenoteText()`

Returns whether the preview texts of the previous and next pacenotes are displayed.

- **returns**: boolean true by default.

#### `editor_rallyEditor.getPrefShowAllPacenoteLabels()`

True if the label mode is "all".

- **returns**: boolean true if all labels are displayed.

#### `editor_rallyEditor.getPrefShowNextPacenote()`

Also displays the next pacenote when a pacenote is selected.

- **returns**: boolean true by default.

#### `editor_rallyEditor.getPrefShowPreviousPacenote()`

Also displays the previous pacenote when a pacenote is selected.

- **returns**: boolean true by default.

#### `editor_rallyEditor.getPrefShowSelectedPacenoteUtility()`

Returns whether the floating utility window of the selected pacenote is displayed.

- **returns**: boolean false by default.

#### `editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth()`

Width of a pacenote's notes.note.freeform field.

- **returns**: integer Width (300 by default, from 1 to 1000).

#### `editor_rallyEditor.getPrefWaypointSnapMethod()`

Z snapping method when dragging a waypoint, before looking for the nearest snaproad point.

- **returns**: string Valid zSnap value (zSnap.defaultMethod otherwise).

#### `editor_rallyEditor.getViewSnaproadPathOnTop()`

Returns whether the snaproad path is drawn in the foreground (ephemeral view option, reset to false when the mode is deactivated).

- **returns**: boolean Current value.

#### `editor_rallyEditor.getVolatilePreferences()`

Supposed to return the volatile preferences; returns the undefined variable volatilePreferences, so nil (see notes).

- **returns**: nil Always nil.

#### `editor_rallyEditor.isCalibrationWindowOpen()`

Returns whether the calibration window is open.

- **returns**: boolean Window state.

#### `editor_rallyEditor.isPacenotesToolsSectionExpanded()`

True if DevTools is open and its pacenote tools section is expanded.

- **returns**: boolean Section state.

#### `editor_rallyEditor.isToolboxOpen()`

True if the RallyToolbox or DevTools window is open.

- **returns**: boolean true if either is open.

#### `editor_rallyEditor.isVisible()`

Returns whether the "rallyEditor" window is displayed.

- **returns**: boolean Visibility.

#### `editor_rallyEditor.listGhostNotebookChoices()`

Lists the notebooks offered as ghost notebook.

- **returns**: table Choices (empty list if the ghost module is not ready).

#### `editor_rallyEditor.listNotebooks(folder)`

Lists, sorted, the *.notebook.json files (recursive search) under a mission's notebooks folder.

- `folder` (*string|nil*) : Mission folder; by default the current notebook's (error if no notebook loaded).
- **returns**: table<integer, string> Sorted full paths.

#### `editor_rallyEditor.loadForMissionEditor(missionDir)`

Sets the current mission, builds the voicepack list and applies the first one (which loads its first notebook); otherwise clears the notebook.

- `missionDir` (*string*) : Mission folder.

#### `editor_rallyEditor.loadNotebook(fullFilename)`

Loads an existing notebook (rallyUtil.loadNotebook), sets it as current, updates all tabs and recomputes the structured notes. Logs an error if loading fails.

- `fullFilename` (*string*) : Full path of the .notebook.json file.

#### `editor_rallyEditor.loadOrCreateForMissionEditor(missionDir)`

Sets the current mission, removes the voicepack pick, detects the notebook (detectNotebookToLoad) and loads or creates it.

- `missionDir` (*string*) : Mission folder.

#### `editor_rallyEditor.loadOrCreateNotebook(fullFilename)`

Loads the notebook or, if not found, creates a new one (rallyUtil.createNotebook), then updates the tabs and recomputes the structured notes.

- `fullFilename` (*string*) : Full path of the .notebook.json file.

#### `editor_rallyEditor.mouseWheelZoom(val)`

Zoom of the "pacenoteOrbit" camera with the mouse wheel: val = 0 zooms in by 0.4, val = 1.0 zooms out by 0.4. No effect with another camera.

- `val` (*number*) : 0 or 1.0.

#### `editor_rallyEditor.moveSelectedWaypointBackward(v)`

Called directly by the input action: requests moving the selected waypoint backward (repeated with a 0.25 s debounce). Pacenotes tab only.

- `v` (*number*) : 0 released, 1 pressed.

#### `editor_rallyEditor.moveSelectedWaypointForward(v)`

Called directly by the input action: requests moving the selected waypoint forward (0.25 s debounce). Pacenotes tab only.

- `v` (*number*) : 0 released, 1 pressed.

#### `editor_rallyEditor.onDeserialized(data)`

Called after a Lua reload with the saved state: restores the mission, the voicepack pick (legacy "custom" picks are ignored), the notebook (or the pick's first notebook if the file no longer exists) and the state of the Toolbox/DevTools windows.

- `data` (*table|nil*) : onSerialize table.

#### `editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw)`

Called every frame by the editor: draws the window (File, View, Tools menus, tabs, keyboard and mouse inputs, auxiliary windows).

- `dtReal` (*number*) : Real-time delta.
- `dtSim` (*number*) : Simulation time delta.
- `dtRaw` (*number*) : Raw time delta.

#### `editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry)`

Declares the rallyEditor preferences category (editing, view, waypoints, ui).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_rallyEditor.onEditorToolWindowHide(windowName)`

If the hidden window is rallyEditor, switches back to objectSelect mode.

- `windowName` (*string*) : Window name.

#### `editor_rallyEditor.onSerialize()`

Called before a Lua reload; saves the mission, voicepack pick, current notebook file and the open state of RallyToolbox and DevTools.

- **returns**: table {currentMissionDir, currentVoicepackPick, currentNotebookFname, rallyToolboxWindowOpen, devToolsWindowOpen}.

#### `editor_rallyEditor.onWindowGotFocus(windowName)`

If the window gaining focus is rallyEditor, activates the notebookEditMode edit mode.

- `windowName` (*string*) : Window name.

#### `editor_rallyEditor.selectGhostNotebook(fname)`

Selects a comparison ghost notebook by file name.

- `fname` (*string*) : Notebook path.
- **returns**: boolean Selection result; false if the ghost module is not ready.

#### `editor_rallyEditor.setPrefLockWaypoints(val)`

Writes the rallyEditor.editing.lockWaypoints preference.

- `val` (*boolean*) : true to lock.

#### `editor_rallyEditor.setVoicepackPick(pick)`

Sets the active voicepack pick and automatically loads the first candidate notebook; if the pick has no resolvable notebook, clears the loaded notebook.

- `pick` (*table*) : {type='voicepack', scope='global'|'mission', dirname=<voicepack folder>}.

#### `editor_rallyEditor.zoomIn(val)`

Called directly by the input action: continuous zoom in (0.05 s debounce) of the "pacenoteOrbit" camera. No effect with another camera.

- `val` (*number*) : 0 released, 1 pressed.

#### `editor_rallyEditor.zoomOut(val)`

Called directly by the input action: continuous zoom out (0.05 s debounce) of the "pacenoteOrbit" camera. No effect with another camera.

- `val` (*number*) : 0 released, 1 pressed.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Required extensions: {'gameplay_missions_missions'}. |
| `devToolsWindowOpen` | ImBoolPtr | Flag for whether the DevTools window is open (replaced on deserialization). |
| `notebookBasenamesForPick` | function | Alias of voicepack.notebookBasenamesForPick (list of candidate notebook names for a voicepack pick). |
| `picksMatch` | function | Alias of voicepack.picksMatch (compatibility with external callers). |
| `rallyToolboxWindowOpen` | ImBoolPtr | Flag for whether the RallyToolbox window is open (replaced on deserialization). |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `scenetree.` `findObject`

**Loads extensions:** `gameplay_rallyLoop`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor.lua`.*
