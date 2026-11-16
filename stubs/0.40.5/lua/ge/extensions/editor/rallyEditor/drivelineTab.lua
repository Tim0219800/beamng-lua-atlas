---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/drivelineTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tab object returned by the constructor (new(rallyEditor)). Main fields: path (notebook), drivelineV3, drivelineLoaded, loadMode, loadError, isSplineView, showRawPoints, showFinalDrivelineVisualization, calculatedRaceDistance, drivelineStats {pointCount, length}, bufferEnabled/bufferPoints/bufferRadius/bufferBounds. windowDescription = 'Driveline Editor'.
---@class editor_rallyEditor_drivelineTab
local editor_rallyEditor_drivelineTab = {}

--- Computes the race distance via a temporary RallyManager (getRaceDistanceMeters) and stores it in calculatedRaceDistance (false on failure).
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:574
---@return number|nil  Distance in meters, or nil.
function editor_rallyEditor_drivelineTab:calculateRaceDistance() end

--- Resets all state (notebook, loaded driveline, statistics, buffer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:94
function editor_rallyEditor_drivelineTab:clearState() end

--- Probes the terrain groundmodel (one sample every 5 m) along the driveline between start and finish and returns the percentage per surface category (tarmac, gravel, ice, snow; only the non-zero ones).
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:618
---@param startPos vec3 Start position.
---@param finishPos vec3 End position.
---@return table<string, number>|nil  Percentages with 1 decimal, or nil if impossible (no points, no terrain, no sample).
function editor_rallyEditor_drivelineTab:computeSurfacePercentages(startPos, finishPos) end

--- Generates the final line (finalDrivelinePoints) from the edited spline then recomputes the distance.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:502
---@return boolean  Creation success.
function editor_rallyEditor_drivelineTab:createDrivelineFromSpline() end

--- Creates a temporary RallyManager for the mission, injecting the drivelineV3 being edited (even if unsaved), to compute distance and start/finish against the editor's geometry.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:548
---@return table|nil  RallyManager, or nil if there is no notebook, no mission, or if the resources cannot be rebuilt.
function editor_rallyEditor_drivelineTab:createTempRallyManager() end

--- Deep copy of the spline, used for undo/redo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:485
---@return table  Copy of the spline.
function editor_rallyEditor_drivelineTab:deepCopySpline() end

--- Draws the imgui interface: source choice, display options, spline simplification and saving, final line display, statistics ("Refresh Stats"), properties (speed limit, raycast...) and the experimental buffer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:837
---@param mouseInfo table Mouse information.
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw time delta.
function editor_rallyEditor_drivelineTab:draw(mouseInfo, dtReal, dtSim, dtRaw) end

--- Called every frame for 3D rendering: raw path (recording mode), spline interaction, geometry update if needed, final line display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:1186
---@param mouseInfo table Mouse information.
function editor_rallyEditor_drivelineTab:drawDebugEntrypoint(mouseInfo) end

--- Formats a distance in meters: "0m" if zero, otherwise 3 decimals, in km above 950 m.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:182
---@param dist number|nil Distance in meters.
---@return string  Text like "1.234km".
function editor_rallyEditor_drivelineTab:formatDistance(dist) end

--- Formats a duration in seconds as "MM:SS.d" (rounded tenths). "N/A" if nil or <= 0.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:208
---@param timeSecs number|nil Duration in seconds.
---@return string  Formatted duration.
function editor_rallyEditor_drivelineTab:formatDurationSecs(timeSecs) end

--- Experimental: builds the buffer zone around the final line (list of positions and bounding box enlarged by bufferRadius) and enables bufferEnabled.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:772
---@return boolean  false if there are no final line points.
function editor_rallyEditor_drivelineTab:generateBuffer() end

--- Length of the raw path in 'recording' mode.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:444
---@return number  Meters, 0 in other modes.
function editor_rallyEditor_drivelineTab:getDrivelineLength() end

--- Number of raw points in 'recording' mode.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:463
---@return integer  Number of points, 0 in other modes.
function editor_rallyEditor_drivelineTab:getDrivelinePointCount() end

--- Sum of the distances between consecutive points of the final line (finalDrivelinePoints).
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:196
---@return number  Length in meters (0 if absent).
function editor_rallyEditor_drivelineTab:getFinalDrivelineLength() end

--- Reads missionTypeData.silverTime in the mission's info.json.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:221
---@return number|nil  Silver time in seconds, or nil if absent or non-positive.
function editor_rallyEditor_drivelineTab:getMissionSilverTimeSecs() end

--- Handles mouse and keyboard to edit the spline (delegates to DrivelineEditSurface.handleSplineInteraction with splineEditCallbacks).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:1314
function editor_rallyEditor_drivelineTab:handleSplineInteraction() end

--- Tests whether the driveline spline file exists or, failing that, the final driveline file.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:245
---@return boolean  true if either exists.
function editor_rallyEditor_drivelineTab:hasFinalDriveline() end

--- Tests whether the mission's raw driveline recording file exists.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:236
---@return boolean  true if the file exists.
function editor_rallyEditor_drivelineTab:hasRecording() end

--- Internal constructor: initializes the UI, editing and buffer state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:60
---@param rallyEditor table Rally editor instance.
function editor_rallyEditor_drivelineTab:init(rallyEditor) end

--- Tests whether a point is within bufferRadius of a buffer point (fast rejection by bounding box).
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:814
---@param point vec3 Point to test.
---@return boolean  false if the buffer is not active.
function editor_rallyEditor_drivelineTab:isPointInBuffer(point) end

--- Loads the saved driveline; if there is none, creates an empty spline with default properties. Switches to 'final' mode.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:286
---@return boolean  true if loading succeeded.
function editor_rallyEditor_drivelineTab:loadFromFinal() end

--- Builds a spline from the mission's race path (detailed AI path points), updates the geometry and switches to 'race' mode. Fails if the race has no AI path.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:337
---@return boolean  true if the spline was created.
function editor_rallyEditor_drivelineTab:loadFromRace() end

--- Loads and processes the driveline from the raw recording via DrivelineV3, switches to 'recording' mode and recomputes the distance. On failure, fills loadError.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:256
---@return boolean  true if loading succeeded.
function editor_rallyEditor_drivelineTab:loadFromRecording() end

--- Updates drivelineStats with the point count and length of the final line.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:517
---@return table  {pointCount, length}.
function editor_rallyEditor_drivelineTab:recalculateDrivelineStats() end

--- If a driveline is loaded, regenerates the final line from the spline, updates the stats then computes the race distance. Otherwise resets the values to zero.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:531
---@return number|nil  Race distance in meters, or nil.
function editor_rallyEditor_drivelineTab:recalculateRaceDistance() end

--- Redo callback for a spline edit; then recomputes the race distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:496
---@param data table History data.
function editor_rallyEditor_drivelineTab:redoSplineEdit(data) end

--- Recomputes distance (raceDistanceKms, 3 decimals) and surface percentages, puts them in drivelineV3.stats then saves the spline file.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:731
---@return boolean  true if the stats were computed and saved.
function editor_rallyEditor_drivelineTab:refreshStats() end

--- Resets drivelineStats to {pointCount = 0, length = 0}.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:510
function editor_rallyEditor_drivelineTab:resetDrivelineStats() end

--- Saves the final driveline/spline (delegates to DrivelineEditSurface.saveFinalDriveline).
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:767
---@return boolean  Save success.
function editor_rallyEditor_drivelineTab:saveFinalDriveline() end

--- Called by the editor when the tab is selected: emits onEditorEditModeChanged(nil, nil) to redraw the shortcut legend.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:169
function editor_rallyEditor_drivelineTab:selected() end

--- Sets properties.speedLimitKph to distance / silver time (in km/h, minimum 0). Requires the mission's silver time and a computed distance.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:594
---@return boolean  true if the speed was changed.
function editor_rallyEditor_drivelineTab:setAverageSpeedFromSilverTimeAndRaceDistance() end

--- Sets the current notebook. If the mission folder changes, the loading state is reset. Creates the mission's DrivelineV3 object if needed and automatically loads the final line if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:117
---@param path table Notebook (uses getMissionDir).
function editor_rallyEditor_drivelineTab:setPath(path) end

--- Returns the callbacks passed to DrivelineEditSurface: onCommit and onHistoryRestore recompute the race distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:157
---@return table  Table {onCommit, onHistoryRestore}.
function editor_rallyEditor_drivelineTab:splineEditCallbacks() end

--- Undo callback for a spline edit; restores the state then recomputes the race distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:490
---@param data table History data.
function editor_rallyEditor_drivelineTab:undoSplineEdit(data) end

--- Called when the tab is left: emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:176
function editor_rallyEditor_drivelineTab:unselect() end

--- Recomputes the spline geometry (DrivelineV3) then the race distance.
---Source: lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:476
---@return boolean  Update success.
function editor_rallyEditor_drivelineTab:updateSplineGeometry() end

