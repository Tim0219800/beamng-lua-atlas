# `editor_rallyEditor_pacenotes`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes.lua` · VM: Game Engine (GE) · 2677 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/pacenotes")` (file under extensions/ but not a regular extension)

"Pacenotes" tab of the rally editor, the most important of the editor: it handles selection of pacenotes and waypoints (corner start / corner end) in the 3D view, their creation (Ctrl + click on the snaproad), moving them with the mouse with snapping to the road, geometric measurement of corners, notebook validation, playback of a camera along the road with audio preview, additive editing of the driveline (spline) with live waypoint reprojection, and the choice of anchors for custom audio clips. It also contains the pacenote list/form (PacenoteForm) and the "Audio" tab (customAudioList) for notebooks in custom audio mode. The module returns a constructor (class C). Shared state is in self.pacenoteToolsState (selected_pn_id, selected_wp_id, hover_wp_id, snaproad, mode, drivelineEditActive, etc.).

## Example

```lua
local tab = editor_rallyEditor.getPacenotesWindow()
tab:selectPacenote(id)
tab:measureSelectedPacenote(true)
if not tab:isValid() then dump(tab.validation_issues) end
```

## Notes

- The snaproad is built from the saved final driveline (DrivelineV3:loadDrivelineFromFile). Without a saved driveline, loadSnaproad() logs an error and sets snaproad to nil: the driveline must first be created in the Driveline tab.
- Edit modes: 'edit_all' and 'edit_corners'; setModeEditAll/Corners also disable waypoint locking.
- Live reprojection during driveline editing is debounced by 0.15 s (drivelineReprojectDebounceSecs).
- Pacenote creation: the corner end is placed 10 m along the road (reduced if there is not enough room, minGap respected); the pacenote receives a structured element of type 'corner' at slot "4".
- Probable bug: deleteSelectedPacenote(shouldSelect) computes `shouldSelect = (shouldSelect == nil) and true`. Called with no argument, it is true; called with true or false, it is false, so the neighboring pacenote is then not selected. Merges pass false deliberately.
- toggleCornerCalls() is a stub (logs "will be implemented in the future").
- In _moveSelectedWaypointHelper, when no waypoint is selected, the function selects the next one then returns without moving.
- The axis gizmo is hidden below the map (z = -1000) because the gizmo is not used for editing; the beginDrag/dragging/endDragging functions are nevertheless wired to editor.updateAxisGizmo.
- The handleMouseInput code contains a comment about a known editor bug: getAxisGizmoSelectedElement returns 6 after a cold start, hence the absence of the isAxisGizmoHovered test.

## Class `C`

Tab object returned by the constructor (new(rallyEditor)). Main fields: rallyEditor, path (notebook), mouseInfo, pacenoteToolsState, pacenoteForm, ghostNotebookRenderer, notes_valid, invalid_notes_count, todo_count, validation_issues, validationDirty, pacenotesDrivelineHost, drivelineEditSnapshot, customAudioAnchorPick, previewAudioManager. windowDescription = 'Pacenotes'.

The module returns a constructor: `local obj = require("editor_rallyEditor_pacenotes")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_moveSelectedWaypointHelper(fwd, steps)` | Moves the selected waypoint along the snaproad; clears the pacenote's TODO. | 2487 |
| `C:_newPacenotesDrivelineHost()` | Creates the "host" table (editing state) passed to DrivelineEditSurface. | 412 |
| `C:applyLiveDrivelineReproject(force)` | Applies the reprojection if requested and the delay has elapsed (or if force). Regenerates the driveline from the spline, replaces the snaproad and refreshes. | 547 |
| `C:attemptToFixMapEdgeIssue()` | Resets the gizmo to the origin (workaround for a map edge issue). | 789 |
| `C:autofillDistanceCalls()` | Asks the notebook to automatically fill the distance calls, then marks the validation as needing redoing. | 2385 |
| `C:beginCustomAudioAnchorPick(basename)` | Starts the "pick an anchor pacenote" mode for a custom audio clip (the next click in the 3D view picks the pacenote). | 333 |
| `C:beginDrag()` | Start of gizmo manipulation: stores the waypoint's state (data, rotation, radius). | 823 |
| `C:cameraPathIsPlaying()` | Returns whether the active camera is the "path" camera. | 2553 |
| `C:cameraPathPlay()` | Starts or stops camera playback along the road for the selected pacenote; on start stores the camera and starts the preview audio, on stop restores the camera. | 2516 |
| `C:cancelCustomAudioAnchorPick()` | Cancels the ongoing anchor pick. | 347 |
| `C:captureDrivelineEditSnapshot()` | Records, for each pacenote, the positions, normals and locations along the road of its corner start/end waypoints before a driveline edit. | 459 |
| `C:cleanupPacenoteNames(recordHistory)` | Cleanly renumbers the pacenote names; by default with an undoable history entry. | 2361 |
| `C:clearState()` | Resets all state (stops audio, clears the selection, validation, driveline editing, form). | 135 |
| `C:createMouseDragPacenote()` | Ctrl mode: displays "Click to Create New Pacenote" on the road and, on click, creates a pacenote (corner start at the click, corner end 10 m further) in its place in the order, respecting the spacing between neighboring pacenotes. | 1450 |
| `C:debugDrawNewPacenote(pos_cs, pos_ce)` | Debug preview of a new pacenote between two positions (variant 1). | 1406 |
| `C:debugDrawNewPacenote2(pos_cs, pos_ce)` | Debug preview of a new pacenote between two positions (variant 2). | 1428 |
| `C:deleteAllPacenotes()` | Deletes all pacenotes of the notebook and deselects. | 2021 |
| `C:deleteSelected()` | Deletes the selected pacenote if there is one. | 1767 |
| `C:deleteSelectedPacenote(shouldSelect)` | Deletes the selected pacenote then selects the previous (or next) one; see the note on the computation of shouldSelect. | 1773 |
| `C:deselect()` | Deselects the waypoint, or failing that the pacenote (no effect during camera playback). | 777 |
| `C:detectCustomAudioAnchorPickHover()` | Looks for the hovered corner start waypoint (mouse ray against the waypoint's sphere) during the audio anchor pick. | 1553 |
| `C:detectMouseHoverWaypoint()` | Determines which waypoint is hovered by the mouse ray, according to the selection and the previous/next pacenote display preferences. Keeps the one closest to the camera. | 1613 |
| `C:dragging()` | During gizmo manipulation: applies translation, rotation or scale (radius) to the waypoint. | 837 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` | Draws the imgui tab: stores mouseInfo, updates the preview audio, handles the mouse then draws the pacenote list. | 1392 |
| `C:drawCustomAudioAnchorPickOverlay(globalOpacity)` | Draws the corner start spheres colored according to whether the clip can be anchored, with text on hover. | 937 |
| `C:drawDebugCameraPlaying()` | Draws the snaproad state during camera playback. | 1117 |
| `C:drawDebugEntrypoint(globalOpacity, dt)` | Main 3D rendering called every frame: no-selection preview, notebook, snaproad, ghost notebook, partitions, audio anchors, camera position and driveline editing surface. | 985 |
| `C:drawDrivelineEditToggle()` | Draws the "Edit Driveline" button (orange when active). | 2031 |
| `C:drawPacenotesDrivelineEditSurface()` | In driveline editing mode: handles spline interaction, geometry update, rendering and debounced reprojection. | 1082 |
| `C:drawPacenotesList()` | Draws the "Pacenote" (form) and "Audio" (clip list if the notebook is in custom audio mode) tabs. | 2105 |
| `C:endDragging()` | End of gizmo manipulation: records an undoable action in the history. | 874 |
| `C:ensureDrivelineEditSnapshot()` | Takes the snapshot if it does not exist yet. | 505 |
| `C:ensurePacenotesDrivelineHost()` | Creates the driveline editing host and loads the driveline from the file if needed. | 429 |
| `C:ensurePreviewAudioManager()` | Creates (or recreates if the notebook changed) the preview audio manager. | 256 |
| `C:ensureValidationFresh()` | Reruns validate() if the validation is marked as needing redoing. | 1979 |
| `C:generateElevationProfile()` | Builds a RallyManager for the mission and calls drivelineRoute:buildElevationProfile(). | 2627 |
| `C:getCustomAudioAnchorPickBasename()` | Returns the clip for which an anchor is being picked. | 358 |
| `C:getRacePath()` | Returns the race editor's current race path (editor_raceEditor.getCurrentPath()). | 212 |
| `C:getSnaproad()` | Returns the current snaproad. | 366 |
| `C:handleCustomAudioAnchorPickMouseInput()` | Handles the mouse during the anchor pick: click on a valid pacenote sets the anchor, otherwise displays the reason for the refusal; click on empty space cancels. | 1576 |
| `C:handleMouseDown(hoveredWp)` | Handles the click: selection of the hovered pacenote/waypoint, start of drag; Shift recenters the camera; click on empty space deselects. | 1123 |
| `C:handleMouseHold()` | While held: moves the selected (unlocked) waypoint to the mouse position snapped to the road and orients its normal. | 1218 |
| `C:handleMouseInput()` | Mouse entry point: gizmo, audio anchor pick, driveline editing, Ctrl-click creation or normal interaction. | 1328 |
| `C:handleMouseUp()` | On release: records the move in the history (undo/redo) and resets the drag state. | 1247 |
| `C:handleUnmodifiedMouseInteraction(hoveredWp)` | Routes the mouse input (down, hold, up, hover) without modifier. | 1316 |
| `C:init(rallyEditor)` | Internal constructor: creates the tools state, the pacenote form and the ghost notebook renderer. | 107 |
| `C:insertMode()` | Enables insert mode (no effect during camera playback). | 1970 |
| `C:insertNewPacenoteAfter(note)` | Creates a pacenote after the given pacenote, with an intermediate number (or +1 at the end), then re-sorts by name. | 2413 |
| `C:invalidateNoSelectionPreview()` | Invalidates the preview displayed when no pacenote is selected. | 180 |
| `C:isCustomAudioAnchorPickActive()` | Returns whether an anchor pick is in progress. | 354 |
| `C:isPacenotesDrivelineEditActive()` | Returns whether driveline editing in the Pacenotes tab is active. | 408 |
| `C:isPickingCustomAudioAnchorFor(basename)` | Returns whether the ongoing anchor pick concerns this clip. | 362 |
| `C:isValid()` | Refreshes the validation if needed then returns whether the notebook is valid. | 175 |
| `C:loadSnaproad(snapshot)` | Loads the saved driveline, builds the Snaproad, gives it to the notebook (setSnaproad) and reprojects the waypoints if a previous snaproad or a snapshot exists. | 370 |
| `C:markLiveDrivelineReprojectDirty()` | Requests a live reprojection after the debounce delay. | 542 |
| `C:markPacenoteGeometryDirty()` | Marks the pacenote geometry as needing recomputation (invalidates the no-selection preview). | 186 |
| `C:markValidationDirty()` | Marks the validation as needing redoing. | 1975 |
| `C:measureSelectedPacenote(applyMeasurements)` | Measures the selected pacenote's corner geometry via the snaproad (measurePartition) and optionally applies the measurements to the pacenote. | 1796 |
| `C:mergeSelectedWithNextPacenote()` | Prepends the selected pacenote's freeform text to the start of the next one's, deletes the selected one and selects the next. | 2608 |
| `C:mergeSelectedWithPrevPacenote()` | Appends the selected pacenote's freeform text to the end of the previous one's, deletes the selected one and selects the previous. | 2589 |
| `C:moveSelectedWaypointBackward(steps)` | Moves the selected waypoint backward along the road. | 2510 |
| `C:moveSelectedWaypointForward(steps)` | Moves the selected waypoint forward along the road. | 2504 |
| `C:onEditModeActivate()` | Called when the notebook edit mode is activated: reselects the current pacenote. | 203 |
| `C:onEditModeDeactivate()` | Called when the edit mode is deactivated: stops audio and restores the free camera. | 207 |
| `C:onPacenoteDrag(pn_sel)` | After a waypoint move: updates neighbors, midpoint, distances, measurement and structured texts of the previous/current/next notes. | 1191 |
| `C:onPacenotesDrivelineEditCommitted(host)` | Spline edit end callback: regenerates the driveline, saves it, then forces the reprojection. | 569 |
| `C:pacenoteSearchMatches(pacenote)` | Tests the pacenote against the current search text (true if the search is empty). | 2322 |
| `C:placeVehicleAtPacenote()` | Teleports the player vehicle to the start position associated with the selected pacenote. | 2402 |
| `C:refreshAfterDrivelineReproject()` | After reprojection: remeasures all pacenotes, fills the distance calls, refreshes the notebook and the selection. | 530 |
| `C:refreshPacenotes(opts)` | Cleans the names then refreshes the notebook's pacenotes without remeasuring. | 2392 |
| `C:refreshPacenotesTab(snapshot, opts)` | Reloads the snaproad, invalidates the custom audio matching, remeasures all pacenotes and refreshes the notes. | 1959 |
| `C:remeasureAllPacenotes()` | Remeasures all pacenotes (snaproad partition per pacenote) then restores the selected pacenote's partition. | 1812 |
| `C:replaceSnaproadFromDrivelineV3(drivelineV3, snapshot)` | Replaces the snaproad with a new one built from the edited driveline and reprojects the waypoints according to the snapshot. | 512 |
| `C:resetGizmoTransformToOrigin()` | Places the axis gizmo very low (z = -1000) to hide it. | 793 |
| `C:searchPacenoteMatchFn(pacenote)` | Search predicate: non-missing pacenote matching the search text. | 2318 |
| `C:selectNextPacenote()` | Selects the next pacenote matching the search (or the first if nothing is selected). No effect during camera playback. | 1909 |
| `C:selectNextWaypoint()` | Toggles the selection between the current pacenote's corner start and corner end (corner start if no waypoint is selected). | 2450 |
| `C:selectPacenote(id)` | Selects a pacenote by id (nil to deselect): updates the form, the snaproad partition, the measurement and the camera. Ignored during driveline editing if id is given. | 685 |
| `C:selectPrevPacenote()` | Selects the previous pacenote matching the search (or the last if nothing is selected). No effect during camera playback. | 1859 |
| `C:selectRecentPacenote()` | If nothing is selected, reselects the last selected pacenote. | 1842 |
| `C:selectWaypoint(id)` | Selects a waypoint by id (also selects its pacenote) and sets the snaproad filter. nil deselects the waypoint. | 736 |
| `C:selected()` | Called by the editor when the tab is selected: prepares the edit mode, reloads snaproad and pacenotes, adds the shortcuts (Ctrl: create, Delete: delete) and emits onEditorEditModeChanged(nil, nil). | 640 |
| `C:selectedPacenote()` | Returns the selected pacenote. | 234 |
| `C:selectedWaypoint()` | Returns the selected pacenote's selected waypoint. | 243 |
| `C:setHover(wp)` | Stores the hovered waypoint (hover_wp_id) and the Shift key state. | 1290 |
| `C:setModeEditAll()` | Switches to 'edit_all' mode and unlocks the waypoints. | 2570 |
| `C:setModeEditCorners()` | Switches to 'edit_corners' mode and unlocks the waypoints. | 2575 |
| `C:setOrbitCameraToSelectedPacenote()` | Aims the camera (pacenoteOrbit orbit or V2 camera) at the selected pacenote. | 671 |
| `C:setPacenotesDrivelineEditActive(active)` | Enables or disables driveline editing mode (deselects everything and takes a snapshot on activation). | 583 |
| `C:setPath(path)` | Sets the current notebook; if it changes, stops audio and abandons any ongoing driveline editing. Marks validation as needing redoing. | 190 |
| `C:setupEditMode()` | Deselects the waypoint, switches to edit_corners mode and sets the snaproad partition to the selected pacenote. | 2580 |
| `C:startPreviewAudio(pacenote)` | Queues the pacenote's audio clips to play during camera playback. | 270 |
| `C:stopPreviewAudio()` | Empties the preview audio queue and disables it. | 304 |
| `C:toggleCornerCalls()` | Stub: only logs that the function will be implemented. | 2557 |
| `C:unselect()` | Called when the tab is left: stops audio, restores the free camera, removes the shortcuts and emits onEditorEditModeChanged(nil, nil). | 659 |
| `C:updateGizmoTransform(index)` | Places the gizmo on a waypoint if the gizmo is allowed. | 803 |
| `C:updatePreviewAudio(dtReal, dtSim, dtRaw)` | Called every frame: advances the audio manager while the path camera is playing, and stops otherwise or when the queue is empty. | 311 |
| `C:validate()` | Validates each pacenote, counts the TODOs and invalid notes, fills validation_issues and notes_valid. | 1985 |
| `C:wpPosForSimpleDrag(wp, mousePos, mouseOffset)` | Computes the new position of a dragged waypoint (z snapping then snaproad snapping) and a position used to orient its normal perpendicularly. | 1696 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`, `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes.lua`.*
