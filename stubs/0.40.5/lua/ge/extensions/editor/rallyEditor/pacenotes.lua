---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tab object returned by the constructor (new(rallyEditor)). Main fields: rallyEditor, path (notebook), mouseInfo, pacenoteToolsState, pacenoteForm, ghostNotebookRenderer, notes_valid, invalid_notes_count, todo_count, validation_issues, validationDirty, pacenotesDrivelineHost, drivelineEditSnapshot, customAudioAnchorPick, previewAudioManager. windowDescription = 'Pacenotes'.
---@class editor_rallyEditor_pacenotes
local editor_rallyEditor_pacenotes = {}

--- Moves the selected waypoint along the snaproad; clears the pacenote's TODO.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2487
---@param fwd boolean Forward.
---@param steps integer Number of steps.
function editor_rallyEditor_pacenotes:_moveSelectedWaypointHelper(fwd, steps) end

--- Creates the "host" table (editing state) passed to DrivelineEditSurface.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:412
---@return table  Empty host.
function editor_rallyEditor_pacenotes:_newPacenotesDrivelineHost() end

--- Applies the reprojection if requested and the delay has elapsed (or if force). Regenerates the driveline from the spline, replaces the snaproad and refreshes.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:547
---@param force boolean|nil Ignore the dirty state and the delay.
function editor_rallyEditor_pacenotes:applyLiveDrivelineReproject(force) end

--- Resets the gizmo to the origin (workaround for a map edge issue).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:789
function editor_rallyEditor_pacenotes:attemptToFixMapEdgeIssue() end

--- Asks the notebook to automatically fill the distance calls, then marks the validation as needing redoing.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2385
function editor_rallyEditor_pacenotes:autofillDistanceCalls() end

--- Starts the "pick an anchor pacenote" mode for a custom audio clip (the next click in the 3D view picks the pacenote).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:333
---@param basename string Base name of the audio file.
function editor_rallyEditor_pacenotes:beginCustomAudioAnchorPick(basename) end

--- Start of gizmo manipulation: stores the waypoint's state (data, rotation, radius).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:823
function editor_rallyEditor_pacenotes:beginDrag() end

--- Returns whether the active camera is the "path" camera.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2553
---@return boolean  Result.
function editor_rallyEditor_pacenotes:cameraPathIsPlaying() end

--- Starts or stops camera playback along the road for the selected pacenote; on start stores the camera and starts the preview audio, on stop restores the camera.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2516
function editor_rallyEditor_pacenotes:cameraPathPlay() end

--- Cancels the ongoing anchor pick.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:347
function editor_rallyEditor_pacenotes:cancelCustomAudioAnchorPick() end

--- Records, for each pacenote, the positions, normals and locations along the road of its corner start/end waypoints before a driveline edit.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:459
---@return table|nil  {pacenotes, snaproad}.
function editor_rallyEditor_pacenotes:captureDrivelineEditSnapshot() end

--- Cleanly renumbers the pacenote names; by default with an undoable history entry.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2361
---@param recordHistory boolean|nil false to not record history.
function editor_rallyEditor_pacenotes:cleanupPacenoteNames(recordHistory) end

--- Resets all state (stops audio, clears the selection, validation, driveline editing, form).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:135
function editor_rallyEditor_pacenotes:clearState() end

--- Ctrl mode: displays "Click to Create New Pacenote" on the road and, on click, creates a pacenote (corner start at the click, corner end 10 m further) in its place in the order, respecting the spacing between neighboring pacenotes.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1450
function editor_rallyEditor_pacenotes:createMouseDragPacenote() end

--- Debug preview of a new pacenote between two positions (variant 1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1406
---@param pos_cs vec3 Corner start.
---@param pos_ce vec3 Corner end.
function editor_rallyEditor_pacenotes:debugDrawNewPacenote(pos_cs, pos_ce) end

--- Debug preview of a new pacenote between two positions (variant 2).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1428
---@param pos_cs vec3 Corner start.
---@param pos_ce vec3 Corner end.
function editor_rallyEditor_pacenotes:debugDrawNewPacenote2(pos_cs, pos_ce) end

--- Deletes all pacenotes of the notebook and deselects.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2021
function editor_rallyEditor_pacenotes:deleteAllPacenotes() end

--- Deletes the selected pacenote if there is one.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1767
function editor_rallyEditor_pacenotes:deleteSelected() end

--- Deletes the selected pacenote then selects the previous (or next) one; see the note on the computation of shouldSelect.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1773
---@param shouldSelect boolean|nil Select a neighbor after deletion (inverted behavior, see notes).
function editor_rallyEditor_pacenotes:deleteSelectedPacenote(shouldSelect) end

--- Deselects the waypoint, or failing that the pacenote (no effect during camera playback).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:777
function editor_rallyEditor_pacenotes:deselect() end

--- Looks for the hovered corner start waypoint (mouse ray against the waypoint's sphere) during the audio anchor pick.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1553
---@return table|nil  Waypoint closest to the camera.
function editor_rallyEditor_pacenotes:detectCustomAudioAnchorPickHover() end

--- Determines which waypoint is hovered by the mouse ray, according to the selection and the previous/next pacenote display preferences. Keeps the one closest to the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1613
---@return table|nil  Hovered waypoint.
function editor_rallyEditor_pacenotes:detectMouseHoverWaypoint() end

--- During gizmo manipulation: applies translation, rotation or scale (radius) to the waypoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:837
function editor_rallyEditor_pacenotes:dragging() end

--- Draws the imgui tab: stores mouseInfo, updates the preview audio, handles the mouse then draws the pacenote list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1392
---@param mouseInfo table Mouse information.
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw time delta.
function editor_rallyEditor_pacenotes:draw(mouseInfo, dtReal, dtSim, dtRaw) end

--- Draws the corner start spheres colored according to whether the clip can be anchored, with text on hover.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:937
---@param globalOpacity number|nil Global opacity.
function editor_rallyEditor_pacenotes:drawCustomAudioAnchorPickOverlay(globalOpacity) end

--- Draws the snaproad state during camera playback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1117
function editor_rallyEditor_pacenotes:drawDebugCameraPlaying() end

--- Main 3D rendering called every frame: no-selection preview, notebook, snaproad, ghost notebook, partitions, audio anchors, camera position and driveline editing surface.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:985
---@param globalOpacity number|nil Global opacity.
---@param dt number|nil Time delta for the pulse animation.
function editor_rallyEditor_pacenotes:drawDebugEntrypoint(globalOpacity, dt) end

--- Draws the "Edit Driveline" button (orange when active).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2031
function editor_rallyEditor_pacenotes:drawDrivelineEditToggle() end

--- In driveline editing mode: handles spline interaction, geometry update, rendering and debounced reprojection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1082
function editor_rallyEditor_pacenotes:drawPacenotesDrivelineEditSurface() end

--- Draws the "Pacenote" (form) and "Audio" (clip list if the notebook is in custom audio mode) tabs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2105
function editor_rallyEditor_pacenotes:drawPacenotesList() end

--- End of gizmo manipulation: records an undoable action in the history.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:874
function editor_rallyEditor_pacenotes:endDragging() end

--- Takes the snapshot if it does not exist yet.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:505
---@return table|nil  Snapshot.
function editor_rallyEditor_pacenotes:ensureDrivelineEditSnapshot() end

--- Creates the driveline editing host and loads the driveline from the file if needed.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:429
---@return table|nil  Host, or nil on failure (loadError filled).
function editor_rallyEditor_pacenotes:ensurePacenotesDrivelineHost() end

--- Creates (or recreates if the notebook changed) the preview audio manager.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:256
---@return table|nil  AudioManager.
function editor_rallyEditor_pacenotes:ensurePreviewAudioManager() end

--- Reruns validate() if the validation is marked as needing redoing.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1979
function editor_rallyEditor_pacenotes:ensureValidationFresh() end

--- Builds a RallyManager for the mission and calls drivelineRoute:buildElevationProfile().
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2627
---@return table|nil  Elevation profile (list of points), or nil on failure.
function editor_rallyEditor_pacenotes:generateElevationProfile() end

--- Returns the clip for which an anchor is being picked.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:358
---@return string|nil  Base name, or nil.
function editor_rallyEditor_pacenotes:getCustomAudioAnchorPickBasename() end

--- Returns the race editor's current race path (editor_raceEditor.getCurrentPath()).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:212
---@return table|nil  Race path.
function editor_rallyEditor_pacenotes:getRacePath() end

--- Returns the current snaproad.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:366
---@return table|nil  Snaproad.
function editor_rallyEditor_pacenotes:getSnaproad() end

--- Handles the mouse during the anchor pick: click on a valid pacenote sets the anchor, otherwise displays the reason for the refusal; click on empty space cancels.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1576
---@return boolean  Always true when a pick is active.
function editor_rallyEditor_pacenotes:handleCustomAudioAnchorPickMouseInput() end

--- Handles the click: selection of the hovered pacenote/waypoint, start of drag; Shift recenters the camera; click on empty space deselects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1123
---@param hoveredWp table|nil Hovered waypoint.
function editor_rallyEditor_pacenotes:handleMouseDown(hoveredWp) end

--- While held: moves the selected (unlocked) waypoint to the mouse position snapped to the road and orients its normal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1218
function editor_rallyEditor_pacenotes:handleMouseHold() end

--- Mouse entry point: gizmo, audio anchor pick, driveline editing, Ctrl-click creation or normal interaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1328
function editor_rallyEditor_pacenotes:handleMouseInput() end

--- On release: records the move in the history (undo/redo) and resets the drag state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1247
function editor_rallyEditor_pacenotes:handleMouseUp() end

--- Routes the mouse input (down, hold, up, hover) without modifier.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1316
---@param hoveredWp table|nil Hovered waypoint.
function editor_rallyEditor_pacenotes:handleUnmodifiedMouseInteraction(hoveredWp) end

--- Internal constructor: creates the tools state, the pacenote form and the ghost notebook renderer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:107
---@param rallyEditor table Rally editor instance.
function editor_rallyEditor_pacenotes:init(rallyEditor) end

--- Enables insert mode (no effect during camera playback).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1970
function editor_rallyEditor_pacenotes:insertMode() end

--- Creates a pacenote after the given pacenote, with an intermediate number (or +1 at the end), then re-sorts by name.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2413
---@param note table Reference pacenote.
function editor_rallyEditor_pacenotes:insertNewPacenoteAfter(note) end

--- Invalidates the preview displayed when no pacenote is selected.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:180
function editor_rallyEditor_pacenotes:invalidateNoSelectionPreview() end

--- Returns whether an anchor pick is in progress.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:354
---@return boolean|nil  True if active.
function editor_rallyEditor_pacenotes:isCustomAudioAnchorPickActive() end

--- Returns whether driveline editing in the Pacenotes tab is active.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:408
---@return boolean|nil  True if active.
function editor_rallyEditor_pacenotes:isPacenotesDrivelineEditActive() end

--- Returns whether the ongoing anchor pick concerns this clip.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:362
---@param basename string|nil Base name.
---@return boolean  Result.
function editor_rallyEditor_pacenotes:isPickingCustomAudioAnchorFor(basename) end

--- Refreshes the validation if needed then returns whether the notebook is valid.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:175
---@return boolean  true if notes_valid and no issues.
function editor_rallyEditor_pacenotes:isValid() end

--- Loads the saved driveline, builds the Snaproad, gives it to the notebook (setSnaproad) and reprojects the waypoints if a previous snaproad or a snapshot exists.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:370
---@param snapshot table|nil Driveline edit snapshot (see captureDrivelineEditSnapshot).
function editor_rallyEditor_pacenotes:loadSnaproad(snapshot) end

--- Requests a live reprojection after the debounce delay.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:542
function editor_rallyEditor_pacenotes:markLiveDrivelineReprojectDirty() end

--- Marks the pacenote geometry as needing recomputation (invalidates the no-selection preview).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:186
function editor_rallyEditor_pacenotes:markPacenoteGeometryDirty() end

--- Marks the validation as needing redoing.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1975
function editor_rallyEditor_pacenotes:markValidationDirty() end

--- Measures the selected pacenote's corner geometry via the snaproad (measurePartition) and optionally applies the measurements to the pacenote.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1796
---@param applyMeasurements boolean|nil Call pacenote:applyMeasurements().
function editor_rallyEditor_pacenotes:measureSelectedPacenote(applyMeasurements) end

--- Prepends the selected pacenote's freeform text to the start of the next one's, deletes the selected one and selects the next.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2608
function editor_rallyEditor_pacenotes:mergeSelectedWithNextPacenote() end

--- Appends the selected pacenote's freeform text to the end of the previous one's, deletes the selected one and selects the previous.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2589
function editor_rallyEditor_pacenotes:mergeSelectedWithPrevPacenote() end

--- Moves the selected waypoint backward along the road.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2510
---@param steps integer|nil Step, 1 by default.
function editor_rallyEditor_pacenotes:moveSelectedWaypointBackward(steps) end

--- Moves the selected waypoint forward along the road.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2504
---@param steps integer|nil Step, 1 by default.
function editor_rallyEditor_pacenotes:moveSelectedWaypointForward(steps) end

--- Called when the notebook edit mode is activated: reselects the current pacenote.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:203
function editor_rallyEditor_pacenotes:onEditModeActivate() end

--- Called when the edit mode is deactivated: stops audio and restores the free camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:207
function editor_rallyEditor_pacenotes:onEditModeDeactivate() end

--- After a waypoint move: updates neighbors, midpoint, distances, measurement and structured texts of the previous/current/next notes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1191
---@param pn_sel table Moved pacenote.
function editor_rallyEditor_pacenotes:onPacenoteDrag(pn_sel) end

--- Spline edit end callback: regenerates the driveline, saves it, then forces the reprojection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:569
---@param host table Editing host.
function editor_rallyEditor_pacenotes:onPacenotesDrivelineEditCommitted(host) end

--- Tests the pacenote against the current search text (true if the search is empty).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2322
---@param pacenote table Pacenote.
---@return boolean  Result.
function editor_rallyEditor_pacenotes:pacenoteSearchMatches(pacenote) end

--- Teleports the player vehicle to the start position associated with the selected pacenote.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2402
function editor_rallyEditor_pacenotes:placeVehicleAtPacenote() end

--- After reprojection: remeasures all pacenotes, fills the distance calls, refreshes the notebook and the selection.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:530
function editor_rallyEditor_pacenotes:refreshAfterDrivelineReproject() end

--- Cleans the names then refreshes the notebook's pacenotes without remeasuring.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2392
---@param opts table|nil Options (recordHistory).
function editor_rallyEditor_pacenotes:refreshPacenotes(opts) end

--- Reloads the snaproad, invalidates the custom audio matching, remeasures all pacenotes and refreshes the notes.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1959
---@param snapshot table|nil Reprojection snapshot.
---@param opts table|nil Options (recordHistory).
function editor_rallyEditor_pacenotes:refreshPacenotesTab(snapshot, opts) end

--- Remeasures all pacenotes (snaproad partition per pacenote) then restores the selected pacenote's partition.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1812
function editor_rallyEditor_pacenotes:remeasureAllPacenotes() end

--- Replaces the snaproad with a new one built from the edited driveline and reprojects the waypoints according to the snapshot.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:512
---@param drivelineV3 table Driveline being edited.
---@param snapshot table|nil Snapshot.
---@return boolean  Success.
function editor_rallyEditor_pacenotes:replaceSnaproadFromDrivelineV3(drivelineV3, snapshot) end

--- Places the axis gizmo very low (z = -1000) to hide it.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:793
function editor_rallyEditor_pacenotes:resetGizmoTransformToOrigin() end

--- Search predicate: non-missing pacenote matching the search text.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2318
---@param pacenote table|nil Pacenote.
---@return boolean|nil  True if it matches.
function editor_rallyEditor_pacenotes:searchPacenoteMatchFn(pacenote) end

--- Selects the next pacenote matching the search (or the first if nothing is selected). No effect during camera playback.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1909
function editor_rallyEditor_pacenotes:selectNextPacenote() end

--- Toggles the selection between the current pacenote's corner start and corner end (corner start if no waypoint is selected).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2450
function editor_rallyEditor_pacenotes:selectNextWaypoint() end

--- Selects a pacenote by id (nil to deselect): updates the form, the snaproad partition, the measurement and the camera. Ignored during driveline editing if id is given.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:685
---@param id integer|nil Pacenote id.
function editor_rallyEditor_pacenotes:selectPacenote(id) end

--- Selects the previous pacenote matching the search (or the last if nothing is selected). No effect during camera playback.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1859
function editor_rallyEditor_pacenotes:selectPrevPacenote() end

--- If nothing is selected, reselects the last selected pacenote.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1842
---@return boolean  true if a reselection took place.
function editor_rallyEditor_pacenotes:selectRecentPacenote() end

--- Selects a waypoint by id (also selects its pacenote) and sets the snaproad filter. nil deselects the waypoint.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:736
---@param id integer|nil Waypoint id.
function editor_rallyEditor_pacenotes:selectWaypoint(id) end

--- Called by the editor when the tab is selected: prepares the edit mode, reloads snaproad and pacenotes, adds the shortcuts (Ctrl: create, Delete: delete) and emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:640
function editor_rallyEditor_pacenotes:selected() end

--- Returns the selected pacenote.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:234
---@return table|nil  Pacenote, or nil.
function editor_rallyEditor_pacenotes:selectedPacenote() end

--- Returns the selected pacenote's selected waypoint.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:243
---@return table|nil  Waypoint, or nil.
function editor_rallyEditor_pacenotes:selectedWaypoint() end

--- Stores the hovered waypoint (hover_wp_id) and the Shift key state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1290
---@param wp table|nil Hovered waypoint.
function editor_rallyEditor_pacenotes:setHover(wp) end

--- Switches to 'edit_all' mode and unlocks the waypoints.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2570
function editor_rallyEditor_pacenotes:setModeEditAll() end

--- Switches to 'edit_corners' mode and unlocks the waypoints.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2575
function editor_rallyEditor_pacenotes:setModeEditCorners() end

--- Aims the camera (pacenoteOrbit orbit or V2 camera) at the selected pacenote.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:671
function editor_rallyEditor_pacenotes:setOrbitCameraToSelectedPacenote() end

--- Enables or disables driveline editing mode (deselects everything and takes a snapshot on activation).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:583
---@param active boolean New state.
function editor_rallyEditor_pacenotes:setPacenotesDrivelineEditActive(active) end

--- Sets the current notebook; if it changes, stops audio and abandons any ongoing driveline editing. Marks validation as needing redoing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:190
---@param path table Notebook.
function editor_rallyEditor_pacenotes:setPath(path) end

--- Deselects the waypoint, switches to edit_corners mode and sets the snaproad partition to the selected pacenote.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2580
function editor_rallyEditor_pacenotes:setupEditMode() end

--- Queues the pacenote's audio clips to play during camera playback.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:270
---@param pacenote table Pacenote to preview.
---@return boolean  true if audio is pending or playing.
function editor_rallyEditor_pacenotes:startPreviewAudio(pacenote) end

--- Empties the preview audio queue and disables it.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:304
function editor_rallyEditor_pacenotes:stopPreviewAudio() end

--- Stub: only logs that the function will be implemented.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2557
function editor_rallyEditor_pacenotes:toggleCornerCalls() end

--- Called when the tab is left: stops audio, restores the free camera, removes the shortcuts and emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:659
function editor_rallyEditor_pacenotes:unselect() end

--- Places the gizmo on a waypoint if the gizmo is allowed.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:803
---@param index integer Waypoint id.
function editor_rallyEditor_pacenotes:updateGizmoTransform(index) end

--- Called every frame: advances the audio manager while the path camera is playing, and stops otherwise or when the queue is empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:311
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw time delta.
function editor_rallyEditor_pacenotes:updatePreviewAudio(dtReal, dtSim, dtRaw) end

--- Validates each pacenote, counts the TODOs and invalid notes, fills validation_issues and notes_valid.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1985
function editor_rallyEditor_pacenotes:validate() end

--- Computes the new position of a dragged waypoint (z snapping then snaproad snapping) and a position used to orient its normal perpendicularly.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1696
---@param wp table Waypoint.
---@param mousePos vec3 Mouse position.
---@param mouseOffset vec3 Offset stored at click time.
---@return vec3|nil  New position.
---@return vec3|nil  Normal alignment position.
function editor_rallyEditor_pacenotes:wpPosForSimpleDrag(wp, mousePos, mouseOffset) end

