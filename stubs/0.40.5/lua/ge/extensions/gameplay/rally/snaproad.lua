---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Snaproad object returned by the constructor.
---@class gameplay_rally_snaproad
local gameplay_rally_snaproad = {}

--- All the driveline's points (empty table if there is no driveline).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:562
---@return table
function gameplay_rally_snaproad:_allPoints() end

--- Applies the position and normal of a snap result to a waypoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:748
---@param wp table Waypoint
---@param loc table Snap result
function gameplay_rally_snaproad:_applySnapLocationToWaypoint(wp, loc) end

--- Sets point.partition to nil on all points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1323
function gameplay_rally_snaproad:_clearPointCachedPartitions() end

--- Snaproad color (cc.snaproads_clr_recce).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:302
function gameplay_rally_snaproad:_clrSnaproad() end

--- Draws the partition's corner calls.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:524
function gameplay_rally_snaproad:_drawDebugCornerCalls() end

--- Draws all the snaproad's points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:370
---@param adjustH boolean|nil
---@param clrOverride table|nil Forced color
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugDefault(adjustH, clrOverride, prismWidth, drawOnTop) end

--- Draws the current partition: before, focus, after.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:334
---@param adjustH boolean|nil
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugPartition(adjustH, prismWidth, drawOnTop) end

--- Draws the prisms of a partition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:161
---@param partition table Partition
---@param clr table Color
---@param prismWidth number|nil Width
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugPartitionAllPrisms(partition, clr, prismWidth, drawOnTop) end

--- Draws all the partitions (used for Ctrl+click to create a new pacenote, according to the code comment).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:258
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:_drawDebugPartitionsAll(prismWidth, drawOnTop) end

--- Draws prisms (debugDrawer:drawSquarePrism) between consecutive points, with color, height and opacity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:122
---@param points table[] Points
---@param clr table|nil Color
---@param alpha number|nil Alpha
---@param adjustH boolean|nil Height adjustment
---@param globalOpacity number|nil Global opacity
---@param prismWidth number|nil Prism width (1.945 by default)
---@param fromLocation table|nil Start limited by a snap result
---@param toLocation table|nil End limited by a snap result
---@param drawOnTop boolean|nil Draw on top of the scene
function gameplay_rally_snaproad:_drawDebugPointPrisms(points, clr, alpha, adjustH, globalOpacity, prismWidth, fromLocation, toLocation, drawOnTop) end

--- Draws spheres at the given points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:205
---@param points table[] Points
---@param clr table|nil Color
---@param alpha number|nil
---@param radius number|nil Radius
---@param adjustH boolean|nil
---@param globalOpacity number|nil
function gameplay_rally_snaproad:_drawDebugPoints(points, clr, alpha, radius, adjustH, globalOpacity) end

--- Draws cylinders at the given points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:233
---@param points table[] Points
---@param clr table|nil
---@param alpha number|nil
---@param radius number|nil
---@param adjustH boolean|nil
---@param globalOpacity number|nil
---@param h number|nil Height
function gameplay_rally_snaproad:_drawDebugPointsCyl(points, clr, alpha, radius, adjustH, globalOpacity, h) end

--- Returns the points index (all or filtered), rebuilt if the points table changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:587
---@param useAllPoints boolean true to ignore the filter
---@return table  {points, kdTree, stableIdIndex, prefixDistances, totalLength}
function gameplay_rally_snaproad:_indexForPoints(useAllPoints) end

--- Forgets the filtered points index.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:583
function gameplay_rally_snaproad:_invalidateFilterPointIndex() end

--- The filter's points if active, otherwise all points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:570
---@return table
function gameplay_rally_snaproad:_operativePoints() end

--- Splits the road into before points, focus points (from fromPoint to toPoint) and after points, and marks the focus points with partition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1206
---@param fromPoint table First focus point
---@param toPoint table Last focus point
---@param fromLoc table|nil Start snap result
---@param toLoc table|nil End snap result
function gameplay_rally_snaproad:_partitionPoints(fromPoint, toPoint, fromLoc, toLoc) end

--- Rebuilds the index (kd-tree, cumulative distances) of all points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:578
function gameplay_rally_snaproad:_rebuildAllPointIndex() end

--- Fixes the ordered list of pacenote projections so that each end is at least 2 m after its start and the pacenotes do not overlap, by shifting the distances and staying within the road length.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:757
---@param entries table[] Entries {csLoc, ceLoc, ...} modified in place
function gameplay_rally_snaproad:_repairPacenoteProjectionEntries(entries) end

--- Reads from a snapshot the position, normal and location of a waypoint (cs or ce), falling back to the current waypoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:739
---@param snapshotPn table|nil Pacenote snapshot entry
---@param key string 'cs' or 'ce'
---@param fallbackWp table Fallback waypoint
---@return table  {pos, normal, location}
function gameplay_rally_snaproad:_snapshotWaypoint(snapshotPn, key, fallbackWp) end

--- Projects pos onto the road then moves forward (fwd = true) or backward by meters along the road, without exceeding the limit points.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:712
---@param pos vec3 Start position
---@param meters number Distance in meters
---@param fwd boolean true forward, false backward
---@param limitPoints table[]|nil Points the result must not exceed
---@param useAllPoints boolean|nil true to ignore the filter
---@return table|nil  Snap result
function gameplay_rally_snaproad:advanceAlongRoute(pos, meters, fwd, limitPoints, useAllPoints) end

--- Disables the partition of all pacenotes, clears the filter and the partitions cached on the points.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1314
function gameplay_rally_snaproad:clearAll() end

--- Disables the point filter.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1409
function gameplay_rally_snaproad:clearFilter() end

--- Disables and empties the current partition.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1196
function gameplay_rally_snaproad:clearPartition() end

--- Road point closest to a position.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:954
---@param source_pos vec3 Position
---@param useAllPoints boolean|nil true to ignore the filter
---@return table|nil  Point
function gameplay_rally_snaproad:closestSnapPoint(source_pos, useAllPoints) end

--- Position projected onto the road; returns source_pos as is if the projection fails.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:959
---@param source_pos vec3 Position
---@return vec3  Position
function gameplay_rally_snaproad:closestSnapPos(source_pos) end

--- Projects a position onto the road: finds the closest point (kd-tree) then the best segment in a window of 6 segments around it. If a filter with bounds is active, clamps the result between those bounds.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:875
---@param source_pos vec3 Position to project
---@param useAllPoints boolean|nil true to ignore the filter
---@return table|nil  Snap result; nil if no points
function gameplay_rally_snaproad:closestSnapResult(source_pos, useAllPoints) end

--- Compares two positions on the road according to their distanceAlongRoute.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:628
---@param a table Snap result
---@param b table Snap result
---@return integer|nil  -1 if a is before b, 0 if equal (gap < 0.0001 m), 1 if a is after b; nil if data is missing
function gameplay_rally_snaproad:compareRouteLocations(a, b) end

--- Moves back point by point until a distance in meters is exceeded, or before a limit point.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1043
---@param fromPoint table Starting point
---@param meters number Distance
---@param limitPoints table[]|nil Limit points
---@return table  Point reached
function gameplay_rally_snaproad:distanceBackwards(fromPoint, meters, limitPoints) end

--- Like advanceAlongRoute backward, from a position.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1070
---@param fromPos vec3 Position
---@param meters number Distance
---@param limitPoints table[]|nil Limit points
---@return table|nil  Snap result
function gameplay_rally_snaproad:distanceBackwardsResult(fromPos, meters, limitPoints) end

--- Distance along the road between the projections of two positions.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:733
---@param posA vec3 First position
---@param posB vec3 Second position
---@param useAllPoints boolean|nil true to ignore the filter
---@return number|nil  meters
function gameplay_rally_snaproad:distanceBetweenPositions(posA, posB, useAllPoints) end

--- Absolute distance between two snap results, along the road.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:637
---@param a table Snap result
---@param b table Snap result
---@return number|nil  meters
function gameplay_rally_snaproad:distanceBetweenRouteLocations(a, b) end

--- Moves forward point by point until a distance in meters is exceeded, or before a limit point.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1074
---@param fromPoint table Starting point
---@param meters number Distance
---@param limitPoints table[]|nil Limit points
---@return table  Point reached
function gameplay_rally_snaproad:distanceForwards(fromPoint, meters, limitPoints) end

--- Like advanceAlongRoute forward, from a position.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1106
---@param fromPos vec3 Position
---@param meters number Distance
---@param limitPoints table[]|nil Limit points
---@return table|nil  Snap result
function gameplay_rally_snaproad:distanceForwardsResult(fromPos, meters, limitPoints) end

--- Drawing during camera path playback (pacenote of the current partition).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:399
function gameplay_rally_snaproad:drawDebugCameraPlaying() end

--- Draws only the partitions that overlap a distance window.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:282
---@param window table Window (inferred from code)
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:drawDebugPartitionsAllWindow(window, prismWidth, drawOnTop) end

--- Drawing for the recce app: the partition if active, otherwise all points (with height adjustment).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:391
function gameplay_rally_snaproad:drawDebugRecceApp() end

--- Main drawing: the partition if active, otherwise the partition of all pacenotes, otherwise all points.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:379
---@param clrOverride table|nil Forced color
---@param prismWidth number|nil
---@param drawOnTop boolean|nil
function gameplay_rally_snaproad:drawDebugSnaproad(clrOverride, prismWidth, drawOnTop) end

--- Returns the driveline passed to the constructor.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:558
---@return table|nil
function gameplay_rally_snaproad:driveline() end

--- First point of the driveline.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1113
---@return table|nil  Point
function gameplay_rally_snaproad:firstSnapPoint() end

--- Forward normal of a point (delegated to snaproad/normals).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:997
---@param point table Point
---@return vec3|nil  Normal
function gameplay_rally_snaproad:forwardNormalVec(point) end

--- Groups points by corner call according to styleData (see notes: returns {} if styleData is not defined).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:464
---@param points table[] Points
function gameplay_rally_snaproad:groupPointsByCornerCall(points) end

--- Stores the driveline, creates the camera path reader, initializes filter, partition, partition_all, global opacity and the points index.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:68
---@param driveline table PointList (points field)
function gameplay_rally_snaproad:init(driveline) end

--- Measures the geometry of the current partition's corner (geoPacenotes.measurePartition) on its focus points.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:362
function gameplay_rally_snaproad:measurePartition() end

--- Minimum gap between adjacent waypoints: 2.0 m.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:601
---@return number  meters
function gameplay_rally_snaproad:minAdjacentWaypointDistance() end

--- Point following the point closest to srcPos (the point itself at the end).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1143
---@param srcPos vec3 Position
---@return table|nil  Point
function gameplay_rally_snaproad:nextSnapPoint(srcPos) end

--- Position of the point returned by nextSnapPoint (error if nil).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1139
---@param srcPos vec3 Position
---@return vec3  Position
function gameplay_rally_snaproad:nextSnapPos(srcPos) end

--- Returns (previous, current, next) of a point (delegated to snaproad/normals).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:987
---@param point table Point
---@return table|nil  prev
---@return table|nil  current
---@return table|nil  next
function gameplay_rally_snaproad:normalAlignPoints(point) end

--- Forward normal of a snap result (computed on the fromPoint/toPoint segment, or via the closest point if the segment is degenerate).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:643
---@param result table|nil Snap result
---@return vec3|nil  Normal
function gameplay_rally_snaproad:normalForSnapResult(result) end

--- Indicates whether the partition of all pacenotes is active.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1629
---@return boolean
function gameplay_rally_snaproad:partitionAllEnabled() end

--- Splits the whole road between the pacenotes: one partition per interval before each pacenote and one per pacenote. Also fills in _driveline_location and _driveline_point on the waypoints.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1329
---@param notebook table Notebook
function gameplay_rally_snaproad:partitionAllPacenotes(notebook) end

--- Starts camera path playback (cameraPathPlayer).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1621
function gameplay_rally_snaproad:playCameraPath() end

--- Moves back a given number of points, stopping before a limit point.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1001
---@param fromPoint table Starting point
---@param steps integer Number of points
---@param limitPoints table[]|nil Points not to be reached
---@return table  Point reached
function gameplay_rally_snaproad:pointsBackwards(fromPoint, steps, limitPoints) end

--- List of road points around the current partition for a camera path (40 m before and 20 m after by default).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1576
---@param bufferBeforeMeters number|nil Margin before, 40 by default
---@param bufferAfterMeters number|nil Margin after, 20 by default
---@return table[]|nil  Points; nil without an active partition
function gameplay_rally_snaproad:pointsForCameraPath(bufferBeforeMeters, bufferAfterMeters) end

--- Moves forward a given number of points, stopping before a limit point.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1022
---@param fromPoint table Starting point
---@param steps integer Number of points
---@param limitPoints table[]|nil Points not to be reached
---@return table  Point reached
function gameplay_rally_snaproad:pointsForwards(fromPoint, steps, limitPoints) end

--- Position on the road at a given cumulative distance (clamped between 0 and the total length), interpolated on the relevant segment.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:659
---@param distanceAlongRoute number Distance from the start of the road, in meters
---@param useAllPoints boolean|nil true to ignore the filter
---@return table|nil  Snap result; nil if there are no points
function gameplay_rally_snaproad:positionAtDistanceAlongRoute(distanceAlongRoute, useAllPoints) end

--- Point preceding the point closest to srcPos (the point itself at the start).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1121
---@param srcPos vec3 Position
---@return table|nil  Point
function gameplay_rally_snaproad:prevSnapPoint(srcPos) end

--- Position of the point returned by prevSnapPoint (error if nil).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1117
---@param srcPos vec3 Position
---@return vec3  Position
function gameplay_rally_snaproad:prevSnapPos(srcPos) end

--- Reprojects the pacenote waypoints. Without a snapshot, builds one from the current positions (and from the old snaproad if provided).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:843
---@param notebook table Notebook
---@param previousSnaproad table|nil Old Snaproad
---@param snapshot table|nil Positions snapshot
function gameplay_rally_snaproad:reprojectPacenoteWaypoints(notebook, previousSnaproad, snapshot) end

--- Reprojects onto the current road the cs/ce waypoints of all non-missing pacenotes, from a snapshot, repairs overlaps, updates the halfpoints and recomputes the distance calls (autofillDistanceCalls).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:799
---@param notebook table Notebook
---@param snapshot table {pacenotes = {[pnId] = {cs={pos, normal, location}, ce=...}}}
function gameplay_rally_snaproad:reprojectPacenoteWaypointsFromSnapshot(notebook, snapshot) end

--- Builds the snap result corresponding exactly to a driveline point.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:610
---@param point table|nil Point with id and pos
---@return table|nil  Snap result; nil if the point is unknown
function gameplay_rally_snaproad:routeLocationForPoint(point) end

--- Enables a filter that limits the movable points of a pacenote waypoint between the neighboring pacenotes (with a 2 m margin).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1455
---@param wp table Corner start or end waypoint
function gameplay_rally_snaproad:setFilter(wp) end

--- Enables a filter limited to the partition containing the given point.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1435
---@param point table Point with partition field
function gameplay_rally_snaproad:setFilterPartitionPoint(point) end

--- Enables a filter containing all the points of the partitions (requires partitionAllPacenotes first).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1417
function gameplay_rally_snaproad:setFilterToAllPartitions() end

--- Sets the global opacity of the debug drawings.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:112
---@param globalOpacity number 0 to 1
function gameplay_rally_snaproad:setGlobalOpacity(globalOpacity) end

--- Sets the "focus" partition on the portion of road covered by the active filter.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1565
function gameplay_rally_snaproad:setPartitionToFilter() end

--- Sets the "focus" partition on the portion of road going from the start to the end of the pacenote.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1183
---@param pn table Pacenote
function gameplay_rally_snaproad:setPartitionToPacenote(pn) end

--- Stops camera path playback.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1625
function gameplay_rally_snaproad:stopCameraPath() end

--- Toggles the display of corner calls and recomputes the current pacenote's partition.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1633
function gameplay_rally_snaproad:toggleCornerCalls() end

--- Total length of the road (all points).
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:605
---@return number  meters
function gameplay_rally_snaproad:totalRouteLength() end

--- Computes the midpoint (in distance along the road) between the start and the end of the pacenote and stores it in pn.halfpoint, halfpointLocation, halfpointPos.
---Source: lua/ge/extensions/gameplay/rally/snaproad.lua:1161
---@param pn table Pacenote
function gameplay_rally_snaproad:updateHalfpoint(pn) end

