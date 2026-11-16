# `util_trackBuilder_splineTrack`

*File: `lua/ge/extensions/util/trackBuilder/splineTrack.lua` · VM: Game Engine (GE) · 2295 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_splineTrack`: `extensions.load("util_trackBuilder_splineTrack")`, then the global `util_trackBuilder_splineTrack`

Core of the Track Builder (procedural track editor). The module keeps two levels of data per sub-track: subPieces (abstract description: list of pieces with their bank, height, width, checkpoint, walls, ceiling, materials, obstacles markers) and subTracks (concrete segments with points, mesh, markerInfo). It converts pieces into segments (toSegments), computes Bézier, arc or custom points, measures the track, interpolates the markers, generates the ProceduralMesh objects via segmentToProceduralMesh, places markers and obstacles, handles multi-track intersections, scenario checkpoints, saving and loading in JSON (trackEditor/ folder) and vehicle positioning. It is driven by the Track Builder UI app and by quickraceSetup.

## Example

```lua
extensions.load('util_trackBuilder_splineTrack')
local st = util_trackBuilder_splineTrack
st.addCurve(4, 0, 1)
st.addForward(6)
st.makeTrack(true)
st.save('monTrack')
```

## Notes

- Scale: gridScale = 4 m per grid unit in x and y, heightScale = 1 for z. Piece positions are in grid units; segment points are in meters. The angles of setTrackPosition are in degrees, those of pieces in radians.
- Module load: the last line runs M.initTrack(), which creates an initial track ('init' piece + addForward(3)) and positions it in front of the free camera, above the vehicle, or at (0, 0, 15). In the glow_city level it is placed at (50, -50, 250).
- Quality: quality 1 = high, 4 = low (1 point out of 4). After makeTrack(false), the segments are first in low quality then improved one by one by onUpdate (0.25 s timer + 0.1 s per segment); makeTrack(true) generates everything in high quality and reloads the collision.
- Track files are read and written in 'trackEditor/<name>.json' (Documents/BeamNG); the format has the field version = '1.1'.
- Probable bug: load() reads mesher.settings.LUTDetail, but segmentToProceduralMesh exports settings = nil; indexing nil causes an error as soon as a track is actually loaded.
- Bug: in load(), the final 'Could not find file…' branch concatenates the variable filename, which does not exist at that point (nil), and raises an error when the file is not found (a table name is not affected).
- Bug: getLastPieceWithMarker uses #track but 'track' is not defined; without the lastIndex argument the function fails.
- Bug: positionVehicle tests an undefined variable 'closed' (nil, the real variable is trackClosed): in reverse mode, the vehicle is always placed at the last segment.
- Bug: focusMarkerOn moves the camera only if M.camActivated is true; this field is never defined here (the local variable camActivated is not exported), so it is nil unless the app writes it.
- Several exported fields are nil because their functions do not exist in this file: applyStack, clearStack, getStackCount, stack, stackToCursor (stack code commented out), saveHistory, setAllPiecesToAsphalt, interpolateSegment, interpolateField, getHdgVector, initialTrackPiece, forward, curve, offsetCurve, spiral, fresnelSC, loop, emptyOffset. M.deepcopy is also nil (function commented out).
- convertToSpline assigns markerInfo.basePosition twice: the value from the last point is overwritten by segment.position * vectorScale.
- UI message: guihooks.trigger('Message', {ttl, msg, category, icon}) on save, load and rename.
- scenario: addCheckPointPositions and positionVehicle rely on scenario_scenarios.getScenario() (lapConfig, nodes, startingTransforms['scenario_player0']).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_splineTrack.addCheckPointPositions(reverse)` | Creates checkpoints (BeamNGWaypoint 'gym_<n>') evenly distributed along the track (about one every 300 m, at least 3) or at the segments marked hasCheckPoint, and registers them in scenario.lapConfig and scenario.nodes. Resets lapConfig and nodes of the current scenario. | 262 |
| `util_trackBuilder_splineTrack.addClosingPiece()` | Closes the track: adds an absolute freeBezier piece toward the start point and copies bank, width and height from the first piece. Does nothing if the track is already closed. | 1092 |
| `util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace)` | Adds a hexagonal curve ('hexCurve'). | 1604 |
| `util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace)` | Adds a move without geometry ('hexEmptyOffset'). | 1608 |
| `util_trackBuilder_splineTrack.addForward(len, index, replace)` | Adds a straight line ('freeForward'). | 1603 |
| `util_trackBuilder_splineTrack.addLoop(rad, off, index, replace)` | Adds a hexagonal loop ('hexLoop'). | 1607 |
| `util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace)` | Adds a hexagonal S-curve ('hexOffsetCurve'). | 1605 |
| `util_trackBuilder_splineTrack.addPiece(params, index, replace)` | Adds (or replaces) a piece in subPieces at the given index, invalidates it and invalidates the affected pieces. With replace, keeps the markers, profiles, materials and obstacles of the replaced piece; otherwise the profiles are copied from the previous piece (default 'regular'). | 1611 |
| `util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace)` | Adds a hexagonal spiral ('hexSpiral'). | 1606 |
| `util_trackBuilder_splineTrack.calculateCustomPoints(piece)` | Scales and rotates the custom points of a piece (loops). Returns nil without customPoints. | 1263 |
| `util_trackBuilder_splineTrack.convertToSpline()` | For each invalid segment, computes rotation and points (Bézier, arc or custom), marks the first and last points as always present, sets markerInfo.basePosition; then determines whether the track is closed (start and end less than 0.1 unit apart). | 1111 |
| `util_trackBuilder_splineTrack.createMarkers()` | Creates the track marker ('track_marker') if it does not exist and places all edit markers (markers.transformMarkers for each type). | 703 |
| `util_trackBuilder_splineTrack.createNewSubTrack(position, hdg)` | Adds a new sub-track at the given position and heading (position divided by gridScale), makes it current and returns its index. | 90 |
| `util_trackBuilder_splineTrack.exportTrackToTable()` | Exports the track as a simple Lua table (sub-tracks, positions, pieces, materials, materialUtil field materials, intersections, laps, reversible, closed). | 1736 |
| `util_trackBuilder_splineTrack.focusCameraOn(index, distance, force)` | Smoothly moves (0.3 s, via cameraTransition) the free camera to look at segment index at the given distance. | 616 |
| `util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force)` | Places the track marker on segment index, selects it (material 'track_editor_grid') and, if M.camActivated is true, recenters the camera. Shows the markers if they are hidden. | 645 |
| `util_trackBuilder_splineTrack.getAllCheckpoints()` | Lists the segments carrying a fixed checkpoint. | 347 |
| `util_trackBuilder_splineTrack.getArcPoints(segment)` | Computes the points of a circular arc (polyMult * pointsMultiplier points, 300 at most). | 1175 |
| `util_trackBuilder_splineTrack.getBezierPoints(segment)` | Computes the points of a cubic Bézier curve between origin and position (grid scale applied) with the segment's control points. | 1209 |
| `util_trackBuilder_splineTrack.getCustomTracks()` | Lists the JSON tracks in trackEditor/ using the current format (version field present). | 2137 |
| `util_trackBuilder_splineTrack.getEndOfTrack()` | Returns the last segment of the current sub-track. | 1534 |
| `util_trackBuilder_splineTrack.getIntersection(name)` | Returns an intersection's table by its name. | 222 |
| `util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex)` | Returns the last segment (starting from lastIndex going backward) that has the given marker. See notes: crashes without lastIndex. | 493 |
| `util_trackBuilder_splineTrack.getPieceInfo(index, sub)` | With index: returns the abstract piece. Without index: returns the editor's global state (pieces, quality, markers shown, position, selection, closed track, laps, reversible, sub-track index). | 502 |
| `util_trackBuilder_splineTrack.getPreviewNames()` | Lists the names of the .png and .jpg images in trackEditor/ (previews). The two loops write to the same indices: the jpgs overwrite the pngs (bug). | 2158 |
| `util_trackBuilder_splineTrack.getSegmentInfo(index, sub)` | Returns the concrete segment (points, mesh, markerInfo) at the given index. | 521 |
| `util_trackBuilder_splineTrack.getSelectedTrackInfo()` | Returns the currently selected segment. | 608 |
| `util_trackBuilder_splineTrack.getTrackPosition()` | Returns the position and heading of the current sub-track. | 477 |
| `util_trackBuilder_splineTrack.importTrackFromTable(import)` | Replaces the current track with the one from the table (format 1.0 or 1.1): rebuilds the sub-tracks, converts obstacles to vec3/quat, applies the materials, invalidates all pieces, and restores the time of day and fog if the level matches. | 1902 |
| `util_trackBuilder_splineTrack.initTrack(noUnload)` | (Re)initializes the current sub-track: unloads everything (except noUnload), creates the 'init' piece with the 'track_editor_A_*' materials (G on glow_city), positions the track then adds an addForward(3). | 1429 |
| `util_trackBuilder_splineTrack.invalidatePiece(index, types, force)` | Records that a piece must be recomputed for a given marker type, or for all if types is nil (markers.addMarkerChange). | 1317 |
| `util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol)` | Loads a track from the file trackEditor/<name>.json or from a table, builds it in high quality (makeTrack(true)) for each sub-track, recreates the intersections and displays a UI message unless silent. increasePointMult multiplies the number of points by 1.5 during the build. | 1984 |
| `util_trackBuilder_splineTrack.loadJSON(originalFilename)` | Only reads a track's JSON (to get length, author, etc.) without building it. | 2045 |
| `util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision)` | Generates the track meshes: toSegments, convertToSpline, measureTrack, caps, marker interpolation, final rotation of the points, regeneration of the meshes to refresh, markers, obstacles. Reloads the collision if instantHighQuality is true and ignoreCollision false. | 848 |
| `util_trackBuilder_splineTrack.markerChange(type, index, value)` | Modifies a marker (bank, height, width, checkpoint, walls, ceiling, obstacles…) of a piece and invalidates it; value nil deletes it. Forbids the checkpoint on the first piece. On a closed track, also applies the change to the first piece. | 737 |
| `util_trackBuilder_splineTrack.measureTrack()` | Computes startLength, endLength and the cumulative length of each point, from the last valid segment, for the invalid segments. | 1291 |
| `util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)` | Creates an intersection (junction of several segment ends) with multiTrackMerger and stores it; the default materials come from the first segment. The intersection name is 'procMerger-…'. | 173 |
| `util_trackBuilder_splineTrack.onClientEndMission()` | Hook called at the end of the level: calls unloadAll to forget the track. *(internal)* *(hook)* | 2172 |
| `util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata)` | Hook called when screenshot metadata is collected; body entirely commented out, so no effect. *(internal)* *(hook)* | 2179 |
| `util_trackBuilder_splineTrack.onPreRender(dt)` | Hook called before rendering; relays to cameraTransition.onPreRender(dt). *(internal)* *(hook)* | 2281 |
| `util_trackBuilder_splineTrack.onUpdate()` | Hook called every frame. If high quality and markers are active, counts down (fixed step of 0.01) the timer of the low-quality segments and regenerates them one by one in quality 1. *(internal)* *(hook)* | 787 |
| `util_trackBuilder_splineTrack.positionTrackAboveVehicle()` | Places the track origin 15 m above the player vehicle. Returns false if there is no vehicle. | 422 |
| `util_trackBuilder_splineTrack.positionTrackBeforeCamera()` | Places the track origin 15 m in front of the camera. Returns false if the camera is not free. | 395 |
| `util_trackBuilder_splineTrack.positionVehicle(reverse, index)` | Places the player's vehicle ('thePlayer' outside a scenario) 3 m behind the start of a segment (0.25 m above) and reloads the collision if ignoreCollision is false. Updates scenario.startingTransforms['scenario_player0']. | 362 |
| `util_trackBuilder_splineTrack.refreshAllMaterials()` | Applies the pending material changes (materialChanged) to all segments. | 836 |
| `util_trackBuilder_splineTrack.removeAt(index)` | Deletes the piece at the given index and shifts the following ones. Ignored if the track has only two pieces or if index <= 2. | 1544 |
| `util_trackBuilder_splineTrack.removeIntersection(name)` | Deletes an intersection (scene object included) by its name. Crashes if the name does not exist. | 197 |
| `util_trackBuilder_splineTrack.removeSubTrack(index)` | Deletes a sub-track (meshes included), shifts the following ones and renames their meshes. Does nothing if there is only one sub-track. | 104 |
| `util_trackBuilder_splineTrack.removeTrack()` | Deletes the entire track: hides the markers, deletes meshes, procedural obstacles, markers and intersections, resets the state to an empty sub-track. | 1503 |
| `util_trackBuilder_splineTrack.rename(oldName, newName)` | Renames a track file in trackEditor/ and displays a UI message. | 2124 |
| `util_trackBuilder_splineTrack.revert()` | Deletes the last piece (at least two remain). | 1539 |
| `util_trackBuilder_splineTrack.rotateTrackToCamera()` | Orients the track in the direction of the free camera. Returns false if the camera is not free. | 410 |
| `util_trackBuilder_splineTrack.rotateTrackToTrackVehicle()` | Orients the track according to the player vehicle's direction. Returns false without a vehicle. | 434 |
| `util_trackBuilder_splineTrack.rotateVectorByQuat(v, q)` | Helper function: returns q * v. | 1727 |
| `util_trackBuilder_splineTrack.save(filename, saveOptions)` | Exports the track, adds version, author (player vehicle's plate), date, length, level (saveForThisMap), environment (saveEnvironment), difficulty (37 by default) and description, then writes it to trackEditor/<name>.json. An empty name produces a dated name YYYY-MM-DD_HH-MM-SS. A nil name does not serialize. | 2062 |
| `util_trackBuilder_splineTrack.setAllPiecesHighQuality()` | Immediately regenerates in quality 1 all the segments of the current sub-track that were not. | 772 |
| `util_trackBuilder_splineTrack.setDefaultLaps(laps)` | Sets the default number of laps saved with the track. | 468 |
| `util_trackBuilder_splineTrack.setHighQuality(hq)` | Enables or disables high quality; marks all segments whose quality differs for regeneration (quality 1 or 4). | 527 |
| `util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border)` | Changes the materials of an intersection. | 205 |
| `util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh)` | Changes the border profile of an intersection by recreating it. | 213 |
| `util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill)` | Changes the material of a field (centerMesh, leftMesh, rightMesh, leftWall, rightWall, ceilingMesh) of a segment; with fill, extends the change to the neighboring segments that had the same material. | 988 |
| `util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill)` | Changes the profile (centerMesh, leftMesh, rightMesh) of a segment; with fill, extends it to identical neighboring segments. | 1026 |
| `util_trackBuilder_splineTrack.setReversible(rev)` | Indicates whether the track can be driven in the reverse direction (saved with the track). | 472 |
| `util_trackBuilder_splineTrack.setSegmentMaterial(segment)` | Applies to each sub-mesh of the segment its material (or 'track_editor_grid' if selected). | 1070 |
| `util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub)` | Sets the position of the sub-track origin (x and y in grid units, z in meters) and, if hdg is given, its heading in degrees; recomputes the unit vectors and invalidates all pieces. | 446 |
| `util_trackBuilder_splineTrack.showMarkers(show)` | Shows (creation + placement) or hides all edit markers and the track marker. | 684 |
| `util_trackBuilder_splineTrack.snapToGrid(point)` | Snaps a point to the track's triangular grid (steps of sqrt(3)/2 and 0.5), keeping z. | 1078 |
| `util_trackBuilder_splineTrack.switchSubTrack(index)` | Changes the current sub-track; initializes it if it does not exist. | 96 |
| `util_trackBuilder_splineTrack.toSegments()` | Transforms the invalid pieces of subPieces into segments of subTracks (deletes the old meshes and obstacles) using pieces.toSegment, and initializes meshInfo, markerInfo and the inherited marker fields. | 1329 |
| `util_trackBuilder_splineTrack.unloadAll()` | Resets all the module's fields (tracks, pieces, intersections, markers, obstacles) without deleting the scene objects, forces highQuality to true, markersShown to false and reloads the collision. | 1487 |
| `util_trackBuilder_splineTrack.unselectAll()` | Deselects all segments of all sub-tracks and marks their materials for refresh. | 634 |

### Parameter details

#### `util_trackBuilder_splineTrack.addCheckPointPositions(reverse)`

Creates checkpoints (BeamNGWaypoint 'gym_<n>') evenly distributed along the track (about one every 300 m, at least 3) or at the segments marked hasCheckPoint, and registers them in scenario.lapConfig and scenario.nodes. Resets lapConfig and nodes of the current scenario.

- `reverse` (*boolean|nil*) : Travel in the reverse direction.

#### `util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace)`

Adds a hexagonal curve ('hexCurve').

- `len` (*number*) : Curve size.
- `hardness` (*number*) : Hardness.
- `dir` (*number*) : Direction: 1 or -1.
- `index` (*integer|nil*) : Insertion position.
- `replace` (*boolean|nil*) : Replace.

#### `util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace)`

Adds a move without geometry ('hexEmptyOffset').

- `xOff` (*number*) : Lateral offset.
- `yOff` (*number*) : Forward offset.
- `zOff` (*number*) : Vertical offset.
- `dirOff` (*number*) : Rotation in steps.
- `absolute` (*boolean|nil*) : Relative to the track origin.
- `index` (*integer|nil*) : Insertion position.
- `replace` (*boolean|nil*) : Replace.

#### `util_trackBuilder_splineTrack.addForward(len, index, replace)`

Adds a straight line ('freeForward').

- `len` (*number*) : Length.
- `index` (*integer|nil*) : Insertion position (end by default).
- `replace` (*boolean|nil*) : Replace the piece at this index.

#### `util_trackBuilder_splineTrack.addLoop(rad, off, index, replace)`

Adds a hexagonal loop ('hexLoop').

- `rad` (*number*) : Radius.
- `off` (*number*) : Lateral offset.
- `index` (*integer|nil*) : Insertion position.
- `replace` (*boolean|nil*) : Replace.

#### `util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace)`

Adds a hexagonal S-curve ('hexOffsetCurve').

- `len` (*number*) : Length.
- `off` (*number*) : Lateral offset.
- `hardness` (*number*) : Hardness.
- `index` (*integer|nil*) : Insertion position.
- `replace` (*boolean|nil*) : Replace.

#### `util_trackBuilder_splineTrack.addPiece(params, index, replace)`

Adds (or replaces) a piece in subPieces at the given index, invalidates it and invalidates the affected pieces. With replace, keeps the markers, profiles, materials and obstacles of the replaced piece; otherwise the profiles are copied from the previous piece (default 'regular').

- `params` (*table*) : Piece description (field piece = type name, plus its parameters; see pieces.toSegment).
- `index` (*integer|nil*) : Insertion position (end by default).
- `replace` (*boolean|nil*) : Replace the existing piece.

#### `util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace)`

Adds a hexagonal spiral ('hexSpiral').

- `size` (*number*) : Size.
- `inside` (*boolean*) : Inward.
- `dir` (*number*) : Direction: 1 or -1.
- `index` (*integer|nil*) : Insertion position.
- `replace` (*boolean|nil*) : Replace.

#### `util_trackBuilder_splineTrack.calculateCustomPoints(piece)`

Scales and rotates the custom points of a piece (loops). Returns nil without customPoints.

- `piece` (*table*) : Piece with customPoints, position and hdg.
- **returns**: table[]|nil Points {position, rot, quality}.

#### `util_trackBuilder_splineTrack.createNewSubTrack(position, hdg)`

Adds a new sub-track at the given position and heading (position divided by gridScale), makes it current and returns its index.

- `position` (*vec3*) : World position in meters.
- `hdg` (*number*) : Heading in degrees.
- **returns**: integer Index of the new sub-track.

#### `util_trackBuilder_splineTrack.exportTrackToTable()`

Exports the track as a simple Lua table (sub-tracks, positions, pieces, materials, materialUtil field materials, intersections, laps, reversible, closed).

- **returns**: table Table exportable to JSON.

#### `util_trackBuilder_splineTrack.focusCameraOn(index, distance, force)`

Smoothly moves (0.3 s, via cameraTransition) the free camera to look at segment index at the given distance.

- `index` (*integer*) : Segment index.
- `distance` (*number|nil*) : Distance (camDistance by default).
- `force` (*boolean|nil*) : Redoes the transition even if the segment is the same as last time.

#### `util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force)`

Places the track marker on segment index, selects it (material 'track_editor_grid') and, if M.camActivated is true, recenters the camera. Shows the markers if they are hidden.

- `index` (*integer*) : Segment index.
- `dontRefresMaterial` (*boolean|nil*) : Does not change the selection materials.
- `force` (*boolean|nil*) : Force the camera to recenter.

#### `util_trackBuilder_splineTrack.getAllCheckpoints()`

Lists the segments carrying a fixed checkpoint.

- **returns**: table[] Items {segmentIndex, checkpointSize, checkpointPosition}.

#### `util_trackBuilder_splineTrack.getArcPoints(segment)`

Computes the points of a circular arc (polyMult * pointsMultiplier points, 300 at most).

- `segment` (*table*) : Segment of type 'arc' (position, hdg, direction, angle, radius).
- **returns**: table[] Points {position, rot, quality}.

#### `util_trackBuilder_splineTrack.getBezierPoints(segment)`

Computes the points of a cubic Bézier curve between origin and position (grid scale applied) with the segment's control points.

- `segment` (*table*) : Segment of type 'bezier'.
- **returns**: table[] Points {position, rot, quality, …}.

#### `util_trackBuilder_splineTrack.getCustomTracks()`

Lists the JSON tracks in trackEditor/ using the current format (version field present).

- **returns**: string[] Track names.

#### `util_trackBuilder_splineTrack.getEndOfTrack()`

Returns the last segment of the current sub-track.

- **returns**: table|nil Segment.

#### `util_trackBuilder_splineTrack.getIntersection(name)`

Returns an intersection's table by its name.

- `name` (*string*) : Intersection name.
- **returns**: table|nil {segments, centerMat, borderMat, borderMesh, name, obj}.

#### `util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex)`

Returns the last segment (starting from lastIndex going backward) that has the given marker. See notes: crashes without lastIndex.

- `markerName` (*string*) : Marker name.
- `lastIndex` (*integer*) : Starting index.
- **returns**: table|nil Segment found.

#### `util_trackBuilder_splineTrack.getPieceInfo(index, sub)`

With index: returns the abstract piece. Without index: returns the editor's global state (pieces, quality, markers shown, position, selection, closed track, laps, reversible, sub-track index).

- `index` (*integer|nil*) : Piece index.
- `sub` (*integer|nil*) : Sub-track (current by default).
- **returns**: table Piece or global state.

#### `util_trackBuilder_splineTrack.getPreviewNames()`

Lists the names of the .png and .jpg images in trackEditor/ (previews). The two loops write to the same indices: the jpgs overwrite the pngs (bug).

- **returns**: string[] Preview names.

#### `util_trackBuilder_splineTrack.getSegmentInfo(index, sub)`

Returns the concrete segment (points, mesh, markerInfo) at the given index.

- `index` (*integer*) : Segment index.
- `sub` (*integer|nil*) : Sub-track.
- **returns**: table|nil Segment.

#### `util_trackBuilder_splineTrack.getSelectedTrackInfo()`

Returns the currently selected segment.

- **returns**: table|nil Selected segment.

#### `util_trackBuilder_splineTrack.getTrackPosition()`

Returns the position and heading of the current sub-track.

- **returns**: table {x, y, z, hdg, unitX, unitY}.

#### `util_trackBuilder_splineTrack.importTrackFromTable(import)`

Replaces the current track with the one from the table (format 1.0 or 1.1): rebuilds the sub-tracks, converts obstacles to vec3/quat, applies the materials, invalidates all pieces, and restores the time of day and fog if the level matches.

- `import` (*table*) : Table in the format exported by exportTrackToTable/save.

#### `util_trackBuilder_splineTrack.initTrack(noUnload)`

(Re)initializes the current sub-track: unloads everything (except noUnload), creates the 'init' piece with the 'track_editor_A_*' materials (G on glow_city), positions the track then adds an addForward(3).

- `noUnload` (*boolean|nil*) : Do not call unloadAll.

#### `util_trackBuilder_splineTrack.invalidatePiece(index, types, force)`

Records that a piece must be recomputed for a given marker type, or for all if types is nil (markers.addMarkerChange).

- `index` (*integer*) : Piece index.
- `types` (*string|nil*) : Marker type.
- `force` (*boolean|nil*) : Not used in the code.

#### `util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol)`

Loads a track from the file trackEditor/<name>.json or from a table, builds it in high quality (makeTrack(true)) for each sub-track, recreates the intersections and displays a UI message unless silent. increasePointMult multiplies the number of points by 1.5 during the build.

- `originalFilename` (*string|table*) : Track name (without extension) or already-read table.
- `instantHighQuality` (*boolean|nil*) : Not used in the code (inferred from code).
- `increasePointMult` (*boolean|nil*) : Increases the point density (unless read.keepPointMultiplier).
- `clearShapes` (*boolean|nil*) : Calls mesher.clearShapes at the end.
- `silent` (*boolean|nil*) : No UI message.
- `ignoreCol` (*boolean|nil*) : Stores ignoreCollision: no collision reload.

#### `util_trackBuilder_splineTrack.loadJSON(originalFilename)`

Only reads a track's JSON (to get length, author, etc.) without building it.

- `originalFilename` (*string*) : Track name without extension.
- **returns**: table|nil JSON content or nil.

#### `util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision)`

Generates the track meshes: toSegments, convertToSpline, measureTrack, caps, marker interpolation, final rotation of the points, regeneration of the meshes to refresh, markers, obstacles. Reloads the collision if instantHighQuality is true and ignoreCollision false.

- `instantHighQuality` (*boolean|nil*) : Generate immediately in quality 1.
- `ignoreCollision` (*boolean|nil*) : Do not reload the collision (parameter, shadows the module variable).

#### `util_trackBuilder_splineTrack.markerChange(type, index, value)`

Modifies a marker (bank, height, width, checkpoint, walls, ceiling, obstacles…) of a piece and invalidates it; value nil deletes it. Forbids the checkpoint on the first piece. On a closed track, also applies the change to the first piece.

- `type` (*string*) : Marker type.
- `index` (*integer|nil*) : Piece index (last by default).
- `value` (*any*) : Marker value (table {value, interpolation} for bank/height/width).

#### `util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)`

Creates an intersection (junction of several segment ends) with multiTrackMerger and stores it; the default materials come from the first segment. The intersection name is 'procMerger-…'.

- `segments` (*table[]*) : List of {segment, reverse, index, sub}.
- `centerMat` (*string|nil*) : Center material.
- `borderMat` (*string|nil*) : Border material.
- `borderMesh` (*string|nil*) : Border profile.

#### `util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata)`

Hook called when screenshot metadata is collected; body entirely commented out, so no effect.

- `metadata` (*table*) : Screenshot metadata.

#### `util_trackBuilder_splineTrack.onPreRender(dt)`

Hook called before rendering; relays to cameraTransition.onPreRender(dt).

- `dt` (*number*) : Elapsed time (s).

#### `util_trackBuilder_splineTrack.positionTrackAboveVehicle()`

Places the track origin 15 m above the player vehicle. Returns false if there is no vehicle.

- **returns**: boolean Success.

#### `util_trackBuilder_splineTrack.positionTrackBeforeCamera()`

Places the track origin 15 m in front of the camera. Returns false if the camera is not free.

- **returns**: boolean Success.

#### `util_trackBuilder_splineTrack.positionVehicle(reverse, index)`

Places the player's vehicle ('thePlayer' outside a scenario) 3 m behind the start of a segment (0.25 m above) and reloads the collision if ignoreCollision is false. Updates scenario.startingTransforms['scenario_player0'].

- `reverse` (*boolean|nil*) : Start at the other end, in the reverse direction.
- `index` (*integer|nil*) : Index of the start segment (1 by default).

#### `util_trackBuilder_splineTrack.removeAt(index)`

Deletes the piece at the given index and shifts the following ones. Ignored if the track has only two pieces or if index <= 2.

- `index` (*integer*) : Piece index.

#### `util_trackBuilder_splineTrack.removeIntersection(name)`

Deletes an intersection (scene object included) by its name. Crashes if the name does not exist.

- `name` (*string*) : Intersection name.

#### `util_trackBuilder_splineTrack.removeSubTrack(index)`

Deletes a sub-track (meshes included), shifts the following ones and renames their meshes. Does nothing if there is only one sub-track.

- `index` (*integer*) : Sub-track index.

#### `util_trackBuilder_splineTrack.rename(oldName, newName)`

Renames a track file in trackEditor/ and displays a UI message.

- `oldName` (*string*) : Old name (without extension).
- `newName` (*string*) : New name.

#### `util_trackBuilder_splineTrack.rotateTrackToCamera()`

Orients the track in the direction of the free camera. Returns false if the camera is not free.

- **returns**: boolean Success.

#### `util_trackBuilder_splineTrack.rotateTrackToTrackVehicle()`

Orients the track according to the player vehicle's direction. Returns false without a vehicle.

- **returns**: boolean Success.

#### `util_trackBuilder_splineTrack.rotateVectorByQuat(v, q)`

Helper function: returns q * v.

- `v` (*vec3*) : Vector.
- `q` (*quat*) : Rotation.
- **returns**: vec3 Rotated vector.

#### `util_trackBuilder_splineTrack.save(filename, saveOptions)`

Exports the track, adds version, author (player vehicle's plate), date, length, level (saveForThisMap), environment (saveEnvironment), difficulty (37 by default) and description, then writes it to trackEditor/<name>.json. An empty name produces a dated name YYYY-MM-DD_HH-MM-SS. A nil name does not serialize.

- `filename` (*string|nil*) : File name without extension, '' for a dated name, nil to not write.
- `saveOptions` (*table|nil*) : {saveForThisMap, saveEnvironment, difficulty, description}.
- **returns**: table Exported table.
- **returns**: string|nil Name used if a file was written.

#### `util_trackBuilder_splineTrack.setDefaultLaps(laps)`

Sets the default number of laps saved with the track.

- `laps` (*integer*) : Number of laps.

#### `util_trackBuilder_splineTrack.setHighQuality(hq)`

Enables or disables high quality; marks all segments whose quality differs for regeneration (quality 1 or 4).

- `hq` (*boolean*) : High quality.

#### `util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border)`

Changes the materials of an intersection.

- `name` (*string*) : Intersection name.
- `center` (*string|nil*) : Center material.
- `border` (*string|nil*) : Border material.

#### `util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh)`

Changes the border profile of an intersection by recreating it.

- `name` (*string*) : Intersection name.
- `mesh` (*string*) : Profile name (see basicBorders).

#### `util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill)`

Changes the material of a field (centerMesh, leftMesh, rightMesh, leftWall, rightWall, ceilingMesh) of a segment; with fill, extends the change to the neighboring segments that had the same material.

- `index` (*integer*) : Segment index.
- `sub` (*integer|nil*) : Sub-track.
- `field` (*string*) : Material field name.
- `material` (*string*) : Material name.
- `fill` (*boolean|nil*) : Extend to the neighbors.
- **returns**: boolean true if something changed.

#### `util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill)`

Changes the profile (centerMesh, leftMesh, rightMesh) of a segment; with fill, extends it to identical neighboring segments.

- `index` (*integer*) : Segment index.
- `field` (*string*) : Profile field.
- `mesh` (*string*) : Profile name.
- `fill` (*boolean|nil*) : Extend to the neighbors.
- **returns**: boolean true if something changed.

#### `util_trackBuilder_splineTrack.setReversible(rev)`

Indicates whether the track can be driven in the reverse direction (saved with the track).

- `rev` (*boolean*) : Reversible track.

#### `util_trackBuilder_splineTrack.setSegmentMaterial(segment)`

Applies to each sub-mesh of the segment its material (or 'track_editor_grid' if selected).

- `segment` (*table*) : Segment with points, mesh and submeshIndexes.

#### `util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub)`

Sets the position of the sub-track origin (x and y in grid units, z in meters) and, if hdg is given, its heading in degrees; recomputes the unit vectors and invalidates all pieces.

- `x` (*number*) : x in grid units.
- `y` (*number*) : y in grid units.
- `z` (*number*) : Altitude in meters.
- `hdg` (*number|nil*) : Heading in degrees.
- `sub` (*integer|nil*) : Sub-track (current by default).

#### `util_trackBuilder_splineTrack.showMarkers(show)`

Shows (creation + placement) or hides all edit markers and the track marker.

- `show` (*boolean*) : Show the markers.

#### `util_trackBuilder_splineTrack.snapToGrid(point)`

Snaps a point to the track's triangular grid (steps of sqrt(3)/2 and 0.5), keeping z.

- `point` (*vec3*) : Point to snap.
- **returns**: vec3 Snapped point.

#### `util_trackBuilder_splineTrack.switchSubTrack(index)`

Changes the current sub-track; initializes it if it does not exist.

- `index` (*integer*) : Sub-track index.

## Fields

| Field | Type | Description |
|---|---|---|
| `applyStack` | nil | Always nil (stack code commented out). ⚠ reference `applyStack` not defined in the file (probably nil) |
| `camDistance` | number | Distance from the camera to the selected segment during focusMarkerOn (80 by default). |
| `clearStack` | nil | Always nil (stack code commented out). ⚠ reference `clearStack` not defined in the file (probably nil) |
| `curve` | nil | Always nil (exists in pieces). ⚠ reference `curve` not defined in the file (probably nil) |
| `deepcopy` | nil | Always nil: the function is in a commented-out block. |
| `emptyOffset` | nil | Always nil (exists in pieces). ⚠ reference `emptyOffset` not defined in the file (probably nil) |
| `forward` | nil | Always nil (exists in pieces). ⚠ reference `forward` not defined in the file (probably nil) |
| `fresnelSC` | nil | Always nil (exists in pieces). ⚠ reference `fresnelSC` not defined in the file (probably nil) |
| `getHdgVector` | nil | Always nil: function not defined here (exists in pieces). ⚠ reference `getHdgVector` not defined in the file (probably nil) |
| `getStackCount` | nil | Always nil (stack code commented out). ⚠ reference `getStackCount` not defined in the file (probably nil) |
| `initialTrackPiece` | nil | Always nil: function not defined here (exists in pieces). ⚠ reference `initialTrackPiece` not defined in the file (probably nil) |
| `interpolateField` | nil | Always nil: function not defined. ⚠ reference `interpolateField` not defined in the file (probably nil) |
| `interpolateSegment` | nil | Always nil: function not defined. ⚠ reference `interpolateSegment` not defined in the file (probably nil) |
| `loop` | nil | Always nil (exists in pieces). ⚠ reference `loop` not defined in the file (probably nil) |
| `materialUtil` | table | Reference to the util_trackBuilder_materialUtil module (management of materials A to H). |
| `offsetCurve` | nil | Always nil (exists in pieces). ⚠ reference `offsetCurve` not defined in the file (probably nil) |
| `saveHistory` | nil | Always nil (history commented out). ⚠ reference `saveHistory` not defined in the file (probably nil) |
| `setAllPiecesToAsphalt` | nil | Always nil: function not defined. ⚠ reference `setAllPiecesToAsphalt` not defined in the file (probably nil) |
| `spiral` | nil | Always nil. ⚠ reference `spiral` not defined in the file (probably nil) |
| `stack` | nil | Always nil (stack code commented out). ⚠ reference `stack` not defined in the file (probably nil) |
| `stackToCursor` | nil | Always nil (stack code commented out). ⚠ reference `stackToCursor` not defined in the file (probably nil) |

**UI events (guihooks.trigger):** `Message`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`
- `be:` `reloadCollision`
- `core_environment.` `getFogDensity`, `getTimeOfDay`, `setFogDensity`, `setTimeOfDay`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/splineTrack.lua`.*
