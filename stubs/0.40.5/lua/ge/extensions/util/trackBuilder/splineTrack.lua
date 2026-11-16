---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/splineTrack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the Track Builder (procedural track editor). The module keeps two levels of data per sub-track: subPieces (abstract description: list of pieces with their bank, height, width, checkpoint, walls, ceiling, materials, obstacles markers) and subTracks (concrete segments with points, mesh, markerInfo). It converts pieces into segments (toSegments), computes Bézier, arc or custom points, measures the track, interpolates the markers, generates the ProceduralMesh objects via segmentToProceduralMesh, places markers and obstacles, handles multi-track intersections, scenario checkpoints, saving and loading in JSON (trackEditor/ folder) and vehicle positioning. It is driven by the Track Builder UI app and by quickraceSetup.
--- Access: extension `util_trackBuilder_splineTrack`: `extensions.load("util_trackBuilder_splineTrack")`, then the global `util_trackBuilder_splineTrack`
---@class util_trackBuilder_splineTrack
---@field applyStack nil Always nil (stack code commented out).
---@field camDistance number Distance from the camera to the selected segment during focusMarkerOn (80 by default).
---@field clearStack nil Always nil (stack code commented out).
---@field curve nil Always nil (exists in pieces).
---@field deepcopy nil Always nil: the function is in a commented-out block.
---@field emptyOffset nil Always nil (exists in pieces).
---@field forward nil Always nil (exists in pieces).
---@field fresnelSC nil Always nil (exists in pieces).
---@field getHdgVector nil Always nil: function not defined here (exists in pieces).
---@field getStackCount nil Always nil (stack code commented out).
---@field initialTrackPiece nil Always nil: function not defined here (exists in pieces).
---@field interpolateField nil Always nil: function not defined.
---@field interpolateSegment nil Always nil: function not defined.
---@field loop nil Always nil (exists in pieces).
---@field materialUtil table Reference to the util_trackBuilder_materialUtil module (management of materials A to H).
---@field offsetCurve nil Always nil (exists in pieces).
---@field saveHistory nil Always nil (history commented out).
---@field setAllPiecesToAsphalt nil Always nil: function not defined.
---@field spiral nil Always nil.
---@field stack nil Always nil (stack code commented out).
---@field stackToCursor nil Always nil (stack code commented out).
util_trackBuilder_splineTrack = {}

--- Creates checkpoints (BeamNGWaypoint 'gym_<n>') evenly distributed along the track (about one every 300 m, at least 3) or at the segments marked hasCheckPoint, and registers them in scenario.lapConfig and scenario.nodes. Resets lapConfig and nodes of the current scenario.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:262
---@param reverse boolean|nil Travel in the reverse direction.
function util_trackBuilder_splineTrack.addCheckPointPositions(reverse) end

--- Closes the track: adds an absolute freeBezier piece toward the start point and copies bank, width and height from the first piece. Does nothing if the track is already closed.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1092
function util_trackBuilder_splineTrack.addClosingPiece() end

--- Adds a hexagonal curve ('hexCurve').
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1604
---@param len number Curve size.
---@param hardness number Hardness.
---@param dir number Direction: 1 or -1.
---@param index integer|nil Insertion position.
---@param replace boolean|nil Replace.
function util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace) end

--- Adds a move without geometry ('hexEmptyOffset').
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1608
---@param xOff number Lateral offset.
---@param yOff number Forward offset.
---@param zOff number Vertical offset.
---@param dirOff number Rotation in steps.
---@param absolute boolean|nil Relative to the track origin.
---@param index integer|nil Insertion position.
---@param replace boolean|nil Replace.
function util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace) end

--- Adds a straight line ('freeForward').
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1603
---@param len number Length.
---@param index integer|nil Insertion position (end by default).
---@param replace boolean|nil Replace the piece at this index.
function util_trackBuilder_splineTrack.addForward(len, index, replace) end

--- Adds a hexagonal loop ('hexLoop').
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1607
---@param rad number Radius.
---@param off number Lateral offset.
---@param index integer|nil Insertion position.
---@param replace boolean|nil Replace.
function util_trackBuilder_splineTrack.addLoop(rad, off, index, replace) end

--- Adds a hexagonal S-curve ('hexOffsetCurve').
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1605
---@param len number Length.
---@param off number Lateral offset.
---@param hardness number Hardness.
---@param index integer|nil Insertion position.
---@param replace boolean|nil Replace.
function util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace) end

--- Adds (or replaces) a piece in subPieces at the given index, invalidates it and invalidates the affected pieces. With replace, keeps the markers, profiles, materials and obstacles of the replaced piece; otherwise the profiles are copied from the previous piece (default 'regular').
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1611
---@param params table Piece description (field piece = type name, plus its parameters; see pieces.toSegment).
---@param index integer|nil Insertion position (end by default).
---@param replace boolean|nil Replace the existing piece.
function util_trackBuilder_splineTrack.addPiece(params, index, replace) end

--- Adds a hexagonal spiral ('hexSpiral').
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1606
---@param size number Size.
---@param inside boolean Inward.
---@param dir number Direction: 1 or -1.
---@param index integer|nil Insertion position.
---@param replace boolean|nil Replace.
function util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace) end

--- Scales and rotates the custom points of a piece (loops). Returns nil without customPoints.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1263
---@param piece table Piece with customPoints, position and hdg.
---@return table[]|nil  Points {position, rot, quality}.
function util_trackBuilder_splineTrack.calculateCustomPoints(piece) end

--- For each invalid segment, computes rotation and points (Bézier, arc or custom), marks the first and last points as always present, sets markerInfo.basePosition; then determines whether the track is closed (start and end less than 0.1 unit apart).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1111
function util_trackBuilder_splineTrack.convertToSpline() end

--- Creates the track marker ('track_marker') if it does not exist and places all edit markers (markers.transformMarkers for each type).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:703
function util_trackBuilder_splineTrack.createMarkers() end

--- Adds a new sub-track at the given position and heading (position divided by gridScale), makes it current and returns its index.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:90
---@param position vec3 World position in meters.
---@param hdg number Heading in degrees.
---@return integer  Index of the new sub-track.
function util_trackBuilder_splineTrack.createNewSubTrack(position, hdg) end

--- Exports the track as a simple Lua table (sub-tracks, positions, pieces, materials, materialUtil field materials, intersections, laps, reversible, closed).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1736
---@return table  Table exportable to JSON.
function util_trackBuilder_splineTrack.exportTrackToTable() end

--- Smoothly moves (0.3 s, via cameraTransition) the free camera to look at segment index at the given distance.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:616
---@param index integer Segment index.
---@param distance number|nil Distance (camDistance by default).
---@param force boolean|nil Redoes the transition even if the segment is the same as last time.
function util_trackBuilder_splineTrack.focusCameraOn(index, distance, force) end

--- Places the track marker on segment index, selects it (material 'track_editor_grid') and, if M.camActivated is true, recenters the camera. Shows the markers if they are hidden.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:645
---@param index integer Segment index.
---@param dontRefresMaterial boolean|nil Does not change the selection materials.
---@param force boolean|nil Force the camera to recenter.
function util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force) end

--- Lists the segments carrying a fixed checkpoint.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:347
---@return table[]  Items {segmentIndex, checkpointSize, checkpointPosition}.
function util_trackBuilder_splineTrack.getAllCheckpoints() end

--- Computes the points of a circular arc (polyMult * pointsMultiplier points, 300 at most).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1175
---@param segment table Segment of type 'arc' (position, hdg, direction, angle, radius).
---@return table[]  Points {position, rot, quality}.
function util_trackBuilder_splineTrack.getArcPoints(segment) end

--- Computes the points of a cubic Bézier curve between origin and position (grid scale applied) with the segment's control points.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1209
---@param segment table Segment of type 'bezier'.
---@return table[]  Points {position, rot, quality, …}.
function util_trackBuilder_splineTrack.getBezierPoints(segment) end

--- Lists the JSON tracks in trackEditor/ using the current format (version field present).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2137
---@return string[]  Track names.
function util_trackBuilder_splineTrack.getCustomTracks() end

--- Returns the last segment of the current sub-track.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1534
---@return table|nil  Segment.
function util_trackBuilder_splineTrack.getEndOfTrack() end

--- Returns an intersection's table by its name.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:222
---@param name string Intersection name.
---@return table|nil  {segments, centerMat, borderMat, borderMesh, name, obj}.
function util_trackBuilder_splineTrack.getIntersection(name) end

--- Returns the last segment (starting from lastIndex going backward) that has the given marker. See notes: crashes without lastIndex.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:493
---@param markerName string Marker name.
---@param lastIndex integer Starting index.
---@return table|nil  Segment found.
function util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex) end

--- With index: returns the abstract piece. Without index: returns the editor's global state (pieces, quality, markers shown, position, selection, closed track, laps, reversible, sub-track index).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:502
---@param index integer|nil Piece index.
---@param sub integer|nil Sub-track (current by default).
---@return table  Piece or global state.
function util_trackBuilder_splineTrack.getPieceInfo(index, sub) end

--- Lists the names of the .png and .jpg images in trackEditor/ (previews). The two loops write to the same indices: the jpgs overwrite the pngs (bug).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2158
---@return string[]  Preview names.
function util_trackBuilder_splineTrack.getPreviewNames() end

--- Returns the concrete segment (points, mesh, markerInfo) at the given index.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:521
---@param index integer Segment index.
---@param sub integer|nil Sub-track.
---@return table|nil  Segment.
function util_trackBuilder_splineTrack.getSegmentInfo(index, sub) end

--- Returns the currently selected segment.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:608
---@return table|nil  Selected segment.
function util_trackBuilder_splineTrack.getSelectedTrackInfo() end

--- Returns the position and heading of the current sub-track.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:477
---@return table  {x, y, z, hdg, unitX, unitY}.
function util_trackBuilder_splineTrack.getTrackPosition() end

--- Replaces the current track with the one from the table (format 1.0 or 1.1): rebuilds the sub-tracks, converts obstacles to vec3/quat, applies the materials, invalidates all pieces, and restores the time of day and fog if the level matches.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1902
---@param import table Table in the format exported by exportTrackToTable/save.
function util_trackBuilder_splineTrack.importTrackFromTable(import) end

--- (Re)initializes the current sub-track: unloads everything (except noUnload), creates the 'init' piece with the 'track_editor_A_*' materials (G on glow_city), positions the track then adds an addForward(3).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1429
---@param noUnload boolean|nil Do not call unloadAll.
function util_trackBuilder_splineTrack.initTrack(noUnload) end

--- Records that a piece must be recomputed for a given marker type, or for all if types is nil (markers.addMarkerChange).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1317
---@param index integer Piece index.
---@param types string|nil Marker type.
---@param force boolean|nil Not used in the code.
function util_trackBuilder_splineTrack.invalidatePiece(index, types, force) end

--- Loads a track from the file trackEditor/<name>.json or from a table, builds it in high quality (makeTrack(true)) for each sub-track, recreates the intersections and displays a UI message unless silent. increasePointMult multiplies the number of points by 1.5 during the build.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1984
---@param originalFilename string|table Track name (without extension) or already-read table.
---@param instantHighQuality boolean|nil Not used in the code (inferred from code).
---@param increasePointMult boolean|nil Increases the point density (unless read.keepPointMultiplier).
---@param clearShapes boolean|nil Calls mesher.clearShapes at the end.
---@param silent boolean|nil No UI message.
---@param ignoreCol boolean|nil Stores ignoreCollision: no collision reload.
function util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol) end

--- Only reads a track's JSON (to get length, author, etc.) without building it.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2045
---@param originalFilename string Track name without extension.
---@return table|nil  JSON content or nil.
function util_trackBuilder_splineTrack.loadJSON(originalFilename) end

--- Generates the track meshes: toSegments, convertToSpline, measureTrack, caps, marker interpolation, final rotation of the points, regeneration of the meshes to refresh, markers, obstacles. Reloads the collision if instantHighQuality is true and ignoreCollision false.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:848
---@param instantHighQuality boolean|nil Generate immediately in quality 1.
---@param ignoreCollision boolean|nil Do not reload the collision (parameter, shadows the module variable).
function util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision) end

--- Modifies a marker (bank, height, width, checkpoint, walls, ceiling, obstacles…) of a piece and invalidates it; value nil deletes it. Forbids the checkpoint on the first piece. On a closed track, also applies the change to the first piece.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:737
---@param type string Marker type.
---@param index integer|nil Piece index (last by default).
---@param value any Marker value (table {value, interpolation} for bank/height/width).
function util_trackBuilder_splineTrack.markerChange(type, index, value) end

--- Computes startLength, endLength and the cumulative length of each point, from the last valid segment, for the invalid segments.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1291
function util_trackBuilder_splineTrack.measureTrack() end

--- Creates an intersection (junction of several segment ends) with multiTrackMerger and stores it; the default materials come from the first segment. The intersection name is 'procMerger-…'.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:173
---@param segments table[] List of {segment, reverse, index, sub}.
---@param centerMat string|nil Center material.
---@param borderMat string|nil Border material.
---@param borderMesh string|nil Border profile.
function util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh) end

--- Hook called at the end of the level: calls unloadAll to forget the track.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2172
function util_trackBuilder_splineTrack.onClientEndMission() end

--- Hook called when screenshot metadata is collected; body entirely commented out, so no effect.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2179
---@param metadata table Screenshot metadata.
function util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata) end

--- Hook called before rendering; relays to cameraTransition.onPreRender(dt).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2281
---@param dt number Elapsed time (s).
function util_trackBuilder_splineTrack.onPreRender(dt) end

--- Hook called every frame. If high quality and markers are active, counts down (fixed step of 0.01) the timer of the low-quality segments and regenerates them one by one in quality 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:787
function util_trackBuilder_splineTrack.onUpdate() end

--- Places the track origin 15 m above the player vehicle. Returns false if there is no vehicle.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:422
---@return boolean  Success.
function util_trackBuilder_splineTrack.positionTrackAboveVehicle() end

--- Places the track origin 15 m in front of the camera. Returns false if the camera is not free.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:395
---@return boolean  Success.
function util_trackBuilder_splineTrack.positionTrackBeforeCamera() end

--- Places the player's vehicle ('thePlayer' outside a scenario) 3 m behind the start of a segment (0.25 m above) and reloads the collision if ignoreCollision is false. Updates scenario.startingTransforms['scenario_player0'].
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:362
---@param reverse boolean|nil Start at the other end, in the reverse direction.
---@param index integer|nil Index of the start segment (1 by default).
function util_trackBuilder_splineTrack.positionVehicle(reverse, index) end

--- Applies the pending material changes (materialChanged) to all segments.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:836
function util_trackBuilder_splineTrack.refreshAllMaterials() end

--- Deletes the piece at the given index and shifts the following ones. Ignored if the track has only two pieces or if index <= 2.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1544
---@param index integer Piece index.
function util_trackBuilder_splineTrack.removeAt(index) end

--- Deletes an intersection (scene object included) by its name. Crashes if the name does not exist.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:197
---@param name string Intersection name.
function util_trackBuilder_splineTrack.removeIntersection(name) end

--- Deletes a sub-track (meshes included), shifts the following ones and renames their meshes. Does nothing if there is only one sub-track.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:104
---@param index integer Sub-track index.
function util_trackBuilder_splineTrack.removeSubTrack(index) end

--- Deletes the entire track: hides the markers, deletes meshes, procedural obstacles, markers and intersections, resets the state to an empty sub-track.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1503
function util_trackBuilder_splineTrack.removeTrack() end

--- Renames a track file in trackEditor/ and displays a UI message.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2124
---@param oldName string Old name (without extension).
---@param newName string New name.
function util_trackBuilder_splineTrack.rename(oldName, newName) end

--- Deletes the last piece (at least two remain).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1539
function util_trackBuilder_splineTrack.revert() end

--- Orients the track in the direction of the free camera. Returns false if the camera is not free.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:410
---@return boolean  Success.
function util_trackBuilder_splineTrack.rotateTrackToCamera() end

--- Orients the track according to the player vehicle's direction. Returns false without a vehicle.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:434
---@return boolean  Success.
function util_trackBuilder_splineTrack.rotateTrackToTrackVehicle() end

--- Helper function: returns q * v.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1727
---@param v vec3 Vector.
---@param q quat Rotation.
---@return vec3  Rotated vector.
function util_trackBuilder_splineTrack.rotateVectorByQuat(v, q) end

--- Exports the track, adds version, author (player vehicle's plate), date, length, level (saveForThisMap), environment (saveEnvironment), difficulty (37 by default) and description, then writes it to trackEditor/<name>.json. An empty name produces a dated name YYYY-MM-DD_HH-MM-SS. A nil name does not serialize.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:2062
---@param filename string|nil File name without extension, '' for a dated name, nil to not write.
---@param saveOptions table|nil {saveForThisMap, saveEnvironment, difficulty, description}.
---@return table  Exported table.
---@return string|nil  Name used if a file was written.
function util_trackBuilder_splineTrack.save(filename, saveOptions) end

--- Immediately regenerates in quality 1 all the segments of the current sub-track that were not.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:772
function util_trackBuilder_splineTrack.setAllPiecesHighQuality() end

--- Sets the default number of laps saved with the track.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:468
---@param laps integer Number of laps.
function util_trackBuilder_splineTrack.setDefaultLaps(laps) end

--- Enables or disables high quality; marks all segments whose quality differs for regeneration (quality 1 or 4).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:527
---@param hq boolean High quality.
function util_trackBuilder_splineTrack.setHighQuality(hq) end

--- Changes the materials of an intersection.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:205
---@param name string Intersection name.
---@param center string|nil Center material.
---@param border string|nil Border material.
function util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border) end

--- Changes the border profile of an intersection by recreating it.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:213
---@param name string Intersection name.
---@param mesh string Profile name (see basicBorders).
function util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh) end

--- Changes the material of a field (centerMesh, leftMesh, rightMesh, leftWall, rightWall, ceilingMesh) of a segment; with fill, extends the change to the neighboring segments that had the same material.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:988
---@param index integer Segment index.
---@param sub integer|nil Sub-track.
---@param field string Material field name.
---@param material string Material name.
---@param fill boolean|nil Extend to the neighbors.
---@return boolean  true if something changed.
function util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill) end

--- Changes the profile (centerMesh, leftMesh, rightMesh) of a segment; with fill, extends it to identical neighboring segments.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1026
---@param index integer Segment index.
---@param field string Profile field.
---@param mesh string Profile name.
---@param fill boolean|nil Extend to the neighbors.
---@return boolean  true if something changed.
function util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill) end

--- Indicates whether the track can be driven in the reverse direction (saved with the track).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:472
---@param rev boolean Reversible track.
function util_trackBuilder_splineTrack.setReversible(rev) end

--- Applies to each sub-mesh of the segment its material (or 'track_editor_grid' if selected).
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1070
---@param segment table Segment with points, mesh and submeshIndexes.
function util_trackBuilder_splineTrack.setSegmentMaterial(segment) end

--- Sets the position of the sub-track origin (x and y in grid units, z in meters) and, if hdg is given, its heading in degrees; recomputes the unit vectors and invalidates all pieces.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:446
---@param x number x in grid units.
---@param y number y in grid units.
---@param z number Altitude in meters.
---@param hdg number|nil Heading in degrees.
---@param sub integer|nil Sub-track (current by default).
function util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub) end

--- Shows (creation + placement) or hides all edit markers and the track marker.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:684
---@param show boolean Show the markers.
function util_trackBuilder_splineTrack.showMarkers(show) end

--- Snaps a point to the track's triangular grid (steps of sqrt(3)/2 and 0.5), keeping z.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1078
---@param point vec3 Point to snap.
---@return vec3  Snapped point.
function util_trackBuilder_splineTrack.snapToGrid(point) end

--- Changes the current sub-track; initializes it if it does not exist.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:96
---@param index integer Sub-track index.
function util_trackBuilder_splineTrack.switchSubTrack(index) end

--- Transforms the invalid pieces of subPieces into segments of subTracks (deletes the old meshes and obstacles) using pieces.toSegment, and initializes meshInfo, markerInfo and the inherited marker fields.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1329
function util_trackBuilder_splineTrack.toSegments() end

--- Resets all the module's fields (tracks, pieces, intersections, markers, obstacles) without deleting the scene objects, forces highQuality to true, markersShown to false and reloads the collision.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:1487
function util_trackBuilder_splineTrack.unloadAll() end

--- Deselects all segments of all sub-tracks and marks their materials for refresh.
---Source: lua/ge/extensions/util/trackBuilder/splineTrack.lua:634
function util_trackBuilder_splineTrack.unselectAll() end

