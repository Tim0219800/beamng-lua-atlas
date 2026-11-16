# `editor_rallyEditor_drivelineTab`

*File: `lua/ge/extensions/editor/rallyEditor/drivelineTab.lua` · VM: Game Engine (GE) · 1326 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/drivelineTab")` (file under extensions/ but not a regular extension)

"Driveline Editor" tab of the rally editor. It loads a mission's driving line (driveline) from a raw recording, from the saved final line (spline file) or from the race path (detailed AI path), then lets you edit it as a spline (nodes, widths) via DrivelineEditSurface, simplify it, save it and recompute its race distance. It also computes the stage statistics (distance in km and tarmac/gravel/ice/snow surface percentages by sampling the terrain) and writes them into the spline file under the key "stats". The module returns a constructor (class C). It relies on DrivelineV3 for the data.

## Notes

- Loading modes (self.loadMode): 'recording', 'final', 'race'. Without a final file, loadFromFinal() creates an empty spline with speedLimitKph = 100 and liaisonAllocatedTimeMins = 5.
- loadFromRace() always uses the detailed AI path (hard-coded option); the pathnodes branch is dead code. The RDP simplification tolerance is 4.0 m.
- Surface: one sample every 5 m along the start -> finish section, classified by groundmodel name (tables hard-coded in the file). rock, grass and other are merged into the dominant surface if it exceeds 90% of the samples, otherwise into gravel. Result rounded to 0.1%.
- computeSurfacePercentages writes many debug lines to the log ([surfaceProbe]).
- calculatedRaceDistance is nil (not computed), false (failure) or a number in meters.
- getDrivelineLength and getDrivelinePointCount only return a non-zero value in 'recording' mode.
- The 10 m radius buffer is marked experimental; the button displays "30m" but bufferRadius is 10.0 in the code (label inconsistency).

## Class `C`

Tab object returned by the constructor (new(rallyEditor)). Main fields: path (notebook), drivelineV3, drivelineLoaded, loadMode, loadError, isSplineView, showRawPoints, showFinalDrivelineVisualization, calculatedRaceDistance, drivelineStats {pointCount, length}, bufferEnabled/bufferPoints/bufferRadius/bufferBounds. windowDescription = 'Driveline Editor'.

The module returns a constructor: `local obj = require("editor_rallyEditor_drivelineTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calculateRaceDistance()` | Computes the race distance via a temporary RallyManager (getRaceDistanceMeters) and stores it in calculatedRaceDistance (false on failure). | 574 |
| `C:clearState()` | Resets all state (notebook, loaded driveline, statistics, buffer). | 94 |
| `C:computeSurfacePercentages(startPos, finishPos)` | Probes the terrain groundmodel (one sample every 5 m) along the driveline between start and finish and returns the percentage per surface category (tarmac, gravel, ice, snow; only the non-zero ones). | 618 |
| `C:createDrivelineFromSpline()` | Generates the final line (finalDrivelinePoints) from the edited spline then recomputes the distance. | 502 |
| `C:createTempRallyManager()` | Creates a temporary RallyManager for the mission, injecting the drivelineV3 being edited (even if unsaved), to compute distance and start/finish against the editor's geometry. | 548 |
| `C:deepCopySpline()` | Deep copy of the spline, used for undo/redo. | 485 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` | Draws the imgui interface: source choice, display options, spline simplification and saving, final line display, statistics ("Refresh Stats"), properties (speed limit, raycast...) and the experimental buffer. | 837 |
| `C:drawDebugEntrypoint(mouseInfo)` | Called every frame for 3D rendering: raw path (recording mode), spline interaction, geometry update if needed, final line display. | 1186 |
| `C:formatDistance(dist)` | Formats a distance in meters: "0m" if zero, otherwise 3 decimals, in km above 950 m. | 182 |
| `C:formatDurationSecs(timeSecs)` | Formats a duration in seconds as "MM:SS.d" (rounded tenths). "N/A" if nil or <= 0. | 208 |
| `C:generateBuffer()` | Experimental: builds the buffer zone around the final line (list of positions and bounding box enlarged by bufferRadius) and enables bufferEnabled. | 772 |
| `C:getDrivelineLength()` | Length of the raw path in 'recording' mode. | 444 |
| `C:getDrivelinePointCount()` | Number of raw points in 'recording' mode. | 463 |
| `C:getFinalDrivelineLength()` | Sum of the distances between consecutive points of the final line (finalDrivelinePoints). | 196 |
| `C:getMissionSilverTimeSecs()` | Reads missionTypeData.silverTime in the mission's info.json. | 221 |
| `C:handleSplineInteraction()` | Handles mouse and keyboard to edit the spline (delegates to DrivelineEditSurface.handleSplineInteraction with splineEditCallbacks). | 1314 |
| `C:hasFinalDriveline()` | Tests whether the driveline spline file exists or, failing that, the final driveline file. | 245 |
| `C:hasRecording()` | Tests whether the mission's raw driveline recording file exists. | 236 |
| `C:init(rallyEditor)` | Internal constructor: initializes the UI, editing and buffer state. | 60 |
| `C:isPointInBuffer(point)` | Tests whether a point is within bufferRadius of a buffer point (fast rejection by bounding box). | 814 |
| `C:loadFromFinal()` | Loads the saved driveline; if there is none, creates an empty spline with default properties. Switches to 'final' mode. | 286 |
| `C:loadFromRace()` | Builds a spline from the mission's race path (detailed AI path points), updates the geometry and switches to 'race' mode. Fails if the race has no AI path. | 337 |
| `C:loadFromRecording()` | Loads and processes the driveline from the raw recording via DrivelineV3, switches to 'recording' mode and recomputes the distance. On failure, fills loadError. | 256 |
| `C:recalculateDrivelineStats()` | Updates drivelineStats with the point count and length of the final line. | 517 |
| `C:recalculateRaceDistance()` | If a driveline is loaded, regenerates the final line from the spline, updates the stats then computes the race distance. Otherwise resets the values to zero. | 531 |
| `C:redoSplineEdit(data)` | Redo callback for a spline edit; then recomputes the race distance. | 496 |
| `C:refreshStats()` | Recomputes distance (raceDistanceKms, 3 decimals) and surface percentages, puts them in drivelineV3.stats then saves the spline file. | 731 |
| `C:resetDrivelineStats()` | Resets drivelineStats to {pointCount = 0, length = 0}. | 510 |
| `C:saveFinalDriveline()` | Saves the final driveline/spline (delegates to DrivelineEditSurface.saveFinalDriveline). | 767 |
| `C:selected()` | Called by the editor when the tab is selected: emits onEditorEditModeChanged(nil, nil) to redraw the shortcut legend. | 169 |
| `C:setAverageSpeedFromSilverTimeAndRaceDistance()` | Sets properties.speedLimitKph to distance / silver time (in km/h, minimum 0). Requires the mission's silver time and a computed distance. | 594 |
| `C:setPath(path)` | Sets the current notebook. If the mission folder changes, the loading state is reset. Creates the mission's DrivelineV3 object if needed and automatically loads the final line if it exists. | 117 |
| `C:splineEditCallbacks()` | Returns the callbacks passed to DrivelineEditSurface: onCommit and onHistoryRestore recompute the race distance. | 157 |
| `C:undoSplineEdit(data)` | Undo callback for a spline edit; restores the state then recomputes the race distance. | 490 |
| `C:unselect()` | Called when the tab is left: emits onEditorEditModeChanged(nil, nil). | 176 |
| `C:updateSplineGeometry()` | Recomputes the spline geometry (DrivelineV3) then the race distance. | 476 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/drivelineTab.lua`.*
