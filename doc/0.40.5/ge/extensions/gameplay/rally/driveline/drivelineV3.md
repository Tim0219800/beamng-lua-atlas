# `gameplay_rally_driveline_drivelineV3`

*File: `lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua` · VM: Game Engine (GE) · 770 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/driveline/drivelineV3")` (file under extensions/ but not a regular extension)

Third version of the rally driveline: turns the recce recording into an editable spline, then into a list of final points. Pipeline: loads the raw points (DrivelineRecording.load), simplifies them with the RDP algorithm into spline nodes, computes the smoothed terrain-snapped geometry (zSnap.conformSplineGeometry, with or without raycast), then generates the final points (position, quaternion, normal, simulated ts at 5 Hz). Can also save/load the spline (JSON), load the old final driveline, draw the debug/editor traces, project two positions onto the driveline to get the points or the distance between them, and read the properties (speed limit, allocated liaison time). The module returns a constructor: require(...)(missionDir).

## Example

```lua
local dl = require('/lua/ge/extensions/gameplay/rally/driveline/drivelineV3')(missionDir)
if dl:loadDrivelineFromFile() or dl:loadFromRecording() then
  local pointList = dl:getFinalPointList()
end
```

## Notes

- Properties (self.properties): speedLimitKph (100 by default), liaisonAllocatedTimeMins (5), useRaycast (false), vertRayRaise (2.0, clamped to [0.1; 20]). They are saved in the spline file along with 'stats'.
- The ts time of the final points is simulated: index / 5.0 (5 Hz), it is not the actually recorded time.
- loadDrivelineFromFile: if the spline file exists it is used, otherwise falls back to the old final driveline file (converted to a spline).
- The simplification forces a constant width (DrivelineUtil.defaultSplineWidth) for all nodes.
- calculateDistanceBetweenPoints returns 0 if the final driveline is not available. The distance is measured along the driveline with projection (xnorm) for the partial start and end segments; the order of p1 and p2 does not matter.
- Files are chosen via rallyUtil.drivelineSplineFile(missionDir) and rallyUtil.finalDrivelineFile(missionDir).

## Class `C`

Driveline V3 returned by the constructor. Attributes: missionDir, rawDrivelinePoints, spline, finalDrivelinePoints, simplificationTolerance, properties, stats.

The module returns a constructor: `local obj = require("gameplay_rally_driveline_drivelineV3")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_findSegmentRange(p1, p2)` | Projects p1 and p2 onto the final driveline's segments (closest projection) and returns the ordered segment range: startIdx, startXnorm, endIdx, endXnorm (the start always comes first). nil if unresolved. | 662 |
| `C:calculateDistanceBetweenPoints(p1, p2)` | Distance along the final driveline between the projections of p1 and p2 (partial start and end segments computed with xnorm). | 724 |
| `C:convertDrivelineToSpline(drivelinePoints)` | Converts driveline points to a spline: positions, constant width, normals; RDP simplification (simplificationTolerance tolerance). Logs the reduction ratio. | 335 |
| `C:createDrivelineFromSpline()` | Generates finalDrivelinePoints from the spline's subdivided points (divPoints). Sets finalDrivelinePoints to nil if the spline is not ready. | 481 |
| `C:createDrivelinePointsFromPositions(positions)` | Converts a list of positions into full points: orientation (quatFromDir from the direction toward the next point), ts = index/5, prev/next/id chaining, normal (SnaproadNormals.forwardNormalVec), empty pacenoteDistances and cachedPacenotes. | 418 |
| `C:createEmptySpline(name, isLoop, id)` | Creates an empty spline table ({name, id, isDirty, isEnabled, isLoop, nodes, widths, nmls, divPoints, divWidths, tangents, binormals, normals, discMap}). The id is a UUID if absent. | 65 |
| `C:deepCopySpline()` | Deep copy of the spline (nodes, widths, nmls and simple metadata) for undo/redo in the editor. Does not copy the secondary geometry. | 503 |
| `C:getFinalPointList()` | Returns a PointList built from the final points (nil and a warning if there are fewer than 2). | 493 |
| `C:getLiaisonAllocatedTimeSecs()` | Time allocated for the liaison, in seconds (liaisonAllocatedTimeMins x 60). | 654 |
| `C:getPointsBetween(p1, p2)` | Ordered list of the final points covering the interval between p1 and p2 (segment endpoints included). | 713 |
| `C:getSpeedLimitKph()` | Driveline speed limit (speedLimitKph property). | 650 |
| `C:init(missionDir)` | Stores the mission folder and initializes the state (default simplification tolerance, default properties, no data loaded). | 41 |
| `C:loadDrivelineFromFile()` | Loads the driveline from a file: spline if present, otherwise the old final driveline converted to a spline then regenerated. | 266 |
| `C:loadDrivelineSplineFromFile()` | Loads the spline from its file, computes its geometry and generates the final points. | 176 |
| `C:loadFinalDrivelineFromFile()` | Loads the old final driveline (list of [x,y,z] points, at least 2) and turns it into full points; also reads the properties. | 228 |
| `C:loadFromRecording()` | Full pipeline: loads the recce recording, converts to a spline, computes the geometry, generates the final points. | 306 |
| `C:loadPropertiesFromData(data)` | Reads data.properties (speedLimitKph, liaisonAllocatedTimeMins, useRaycast, vertRayRaise) with default values. | 86 |
| `C:loadRecceRecording()` | Loads the raw points recorded during the recce (DrivelineRecording.load) into rawDrivelinePoints. | 209 |
| `C:loadSplineFromData(data)` | Builds the spline from JSON data (nodes, widths, nmls, properties, stats). Fails if fewer than 2 nodes or an invalid node. | 120 |
| `C:renderFinalDriveline()` | Draws the final points as semi-transparent red cylinders with stakes. | 587 |
| `C:renderRawDriveline()` | Draws (debugDrawer) the raw points: pink-purple cylinders between points and small vertical stakes. Call every frame. | 537 |
| `C:renderSmoothCurve(lineWidth)` | Draws the smoothed curve (divPoints) as a blue prism the width of a vehicle. | 563 |
| `C:renderSpline(selectedNodeIdx)` | Draws the editable spline (rSpline editor tools) with start and end markers; for a single node, draws the node's sphere. | 613 |
| `C:saveSplineToFile()` | Writes the spline to the mission's spline file (folder created if needed). | 145 |
| `C:serializeSpline()` | Serializes the current spline into a JSON table {version=1, name, isLoop, nodes, widths, nmls, properties, stats}. Returns nil if fewer than 2 nodes. | 97 |
| `C:updateSplineGeometry()` | Recomputes the spline's secondary geometry (subdivided points divPoints, tangents, normals...) conforming to the terrain via zSnap.conformSplineGeometry, and its roadLength length. | 383 |

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `fileExists`
- `debugDrawer:` `drawCylinder`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua`.*
