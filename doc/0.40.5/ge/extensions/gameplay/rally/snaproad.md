# `gameplay_rally_snaproad`

*File: `lua/ge/extensions/gameplay/rally/snaproad.lua` · VM: Game Engine (GE) · 1648 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/snaproad")` (file under extensions/ but not a regular extension)

Rally snaproad: a "magnetic road" built on the points of a driveline (PointList). It lets you project a position onto the road (closestSnapResult, with cumulative distance along the road), move forward or backward by a given distance, compute normals, partition the road around the pacenotes (partition, partition_all, filter) and reproject the pacenote waypoints when the road changes. It also contains the debugDrawer drawing functions used by the rally editor and the recce app. The module returns a constructor: Snaproad(driveline).

## Example

```lua
local Snaproad = require('/lua/ge/extensions/gameplay/rally/snaproad')
local sr = Snaproad(pointList)
local loc = sr:closestSnapResult(veh:getPosition())
print(loc.distanceAlongRoute, sr:totalRouteLength())
```

## Notes

- A "snap result" (route location) is a table {pos, point, nearestPoint, fromPoint, toPoint, segmentIndex, xnorm, distanceAlongRoute (m), distSq (m²)}.
- The points are tables with pos (vec3), id (sequential index) and prev / next links; the spatial index is a kd-tree rebuilt if the points table changes.
- The useAllPoints argument ignores the active filter (filter) and works on all the driveline's points; otherwise, if a filter is active, only its bounds are used to bound the result.
- minAdjacentWaypointDistance is 2.0 m: the start and end waypoints of a pacenote are pushed apart to respect this gap (_repairPacenoteProjectionEntries).
- Possible inconsistency: rallyManager passes a PointList to the constructor, whereas recce:createPacenotesData calls Snaproad(self) with the Recce object; Snaproad reads driveline().points, so with a Recce the points field does not exist (the driveline is in recce.driveline there).
- groupPointsByCornerCall depends on self.styleData, which is never defined in this file: the function returns an empty table unless external code assigns styleData.
- Several functions set point.partition on the points: this state is stored directly in the driveline's points.

## Class `C`

Snaproad object returned by the constructor.

The module returns a constructor: `local obj = require("gameplay_rally_snaproad")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_allPoints()` | All the driveline's points (empty table if there is no driveline). | 562 |
| `C:_applySnapLocationToWaypoint(wp, loc)` | Applies the position and normal of a snap result to a waypoint. | 748 |
| `C:_clearPointCachedPartitions()` | Sets point.partition to nil on all points. | 1323 |
| `C:_clrSnaproad()` | Snaproad color (cc.snaproads_clr_recce). | 302 |
| `C:_drawDebugCornerCalls()` | Draws the partition's corner calls. | 524 |
| `C:_drawDebugDefault(adjustH, clrOverride, prismWidth, drawOnTop)` | Draws all the snaproad's points. | 370 |
| `C:_drawDebugPartition(adjustH, prismWidth, drawOnTop)` | Draws the current partition: before, focus, after. | 334 |
| `C:_drawDebugPartitionAllPrisms(partition, clr, prismWidth, drawOnTop)` | Draws the prisms of a partition. | 161 |
| `C:_drawDebugPartitionsAll(prismWidth, drawOnTop)` | Draws all the partitions (used for Ctrl+click to create a new pacenote, according to the code comment). | 258 |
| `C:_drawDebugPointPrisms(points, clr, alpha, adjustH, globalOpacity, prismWidth, fromLocation, toLocation, drawOnTop)` | Draws prisms (debugDrawer:drawSquarePrism) between consecutive points, with color, height and opacity. | 122 |
| `C:_drawDebugPoints(points, clr, alpha, radius, adjustH, globalOpacity)` | Draws spheres at the given points. | 205 |
| `C:_drawDebugPointsCyl(points, clr, alpha, radius, adjustH, globalOpacity, h)` | Draws cylinders at the given points. | 233 |
| `C:_indexForPoints(useAllPoints)` | Returns the points index (all or filtered), rebuilt if the points table changed. | 587 |
| `C:_invalidateFilterPointIndex()` | Forgets the filtered points index. | 583 |
| `C:_operativePoints()` | The filter's points if active, otherwise all points. | 570 |
| `C:_partitionPoints(fromPoint, toPoint, fromLoc, toLoc)` | Splits the road into before points, focus points (from fromPoint to toPoint) and after points, and marks the focus points with partition. | 1206 |
| `C:_rebuildAllPointIndex()` | Rebuilds the index (kd-tree, cumulative distances) of all points. | 578 |
| `C:_repairPacenoteProjectionEntries(entries)` | Fixes the ordered list of pacenote projections so that each end is at least 2 m after its start and the pacenotes do not overlap, by shifting the distances and staying within the road length. | 757 |
| `C:_snapshotWaypoint(snapshotPn, key, fallbackWp)` | Reads from a snapshot the position, normal and location of a waypoint (cs or ce), falling back to the current waypoint. | 739 |
| `C:advanceAlongRoute(pos, meters, fwd, limitPoints, useAllPoints)` | Projects pos onto the road then moves forward (fwd = true) or backward by meters along the road, without exceeding the limit points. | 712 |
| `C:clearAll()` | Disables the partition of all pacenotes, clears the filter and the partitions cached on the points. | 1314 |
| `C:clearFilter()` | Disables the point filter. | 1409 |
| `C:clearPartition()` | Disables and empties the current partition. | 1196 |
| `C:closestSnapPoint(source_pos, useAllPoints)` | Road point closest to a position. | 954 |
| `C:closestSnapPos(source_pos)` | Position projected onto the road; returns source_pos as is if the projection fails. | 959 |
| `C:closestSnapResult(source_pos, useAllPoints)` | Projects a position onto the road: finds the closest point (kd-tree) then the best segment in a window of 6 segments around it. If a filter with bounds is active, clamps the result between those bounds. | 875 |
| `C:compareRouteLocations(a, b)` | Compares two positions on the road according to their distanceAlongRoute. | 628 |
| `C:distanceBackwards(fromPoint, meters, limitPoints)` | Moves back point by point until a distance in meters is exceeded, or before a limit point. | 1043 |
| `C:distanceBackwardsResult(fromPos, meters, limitPoints)` | Like advanceAlongRoute backward, from a position. | 1070 |
| `C:distanceBetweenPositions(posA, posB, useAllPoints)` | Distance along the road between the projections of two positions. | 733 |
| `C:distanceBetweenRouteLocations(a, b)` | Absolute distance between two snap results, along the road. | 637 |
| `C:distanceForwards(fromPoint, meters, limitPoints)` | Moves forward point by point until a distance in meters is exceeded, or before a limit point. | 1074 |
| `C:distanceForwardsResult(fromPos, meters, limitPoints)` | Like advanceAlongRoute forward, from a position. | 1106 |
| `C:drawDebugCameraPlaying()` | Drawing during camera path playback (pacenote of the current partition). | 399 |
| `C:drawDebugPartitionsAllWindow(window, prismWidth, drawOnTop)` | Draws only the partitions that overlap a distance window. | 282 |
| `C:drawDebugRecceApp()` | Drawing for the recce app: the partition if active, otherwise all points (with height adjustment). | 391 |
| `C:drawDebugSnaproad(clrOverride, prismWidth, drawOnTop)` | Main drawing: the partition if active, otherwise the partition of all pacenotes, otherwise all points. | 379 |
| `C:driveline()` | Returns the driveline passed to the constructor. | 558 |
| `C:firstSnapPoint()` | First point of the driveline. | 1113 |
| `C:forwardNormalVec(point)` | Forward normal of a point (delegated to snaproad/normals). | 997 |
| `C:groupPointsByCornerCall(points)` | Groups points by corner call according to styleData (see notes: returns {} if styleData is not defined). | 464 |
| `C:init(driveline)` | Stores the driveline, creates the camera path reader, initializes filter, partition, partition_all, global opacity and the points index. | 68 |
| `C:measurePartition()` | Measures the geometry of the current partition's corner (geoPacenotes.measurePartition) on its focus points. | 362 |
| `C:minAdjacentWaypointDistance()` | Minimum gap between adjacent waypoints: 2.0 m. | 601 |
| `C:nextSnapPoint(srcPos)` | Point following the point closest to srcPos (the point itself at the end). | 1143 |
| `C:nextSnapPos(srcPos)` | Position of the point returned by nextSnapPoint (error if nil). | 1139 |
| `C:normalAlignPoints(point)` | Returns (previous, current, next) of a point (delegated to snaproad/normals). | 987 |
| `C:normalForSnapResult(result)` | Forward normal of a snap result (computed on the fromPoint/toPoint segment, or via the closest point if the segment is degenerate). | 643 |
| `C:partitionAllEnabled()` | Indicates whether the partition of all pacenotes is active. | 1629 |
| `C:partitionAllPacenotes(notebook)` | Splits the whole road between the pacenotes: one partition per interval before each pacenote and one per pacenote. Also fills in _driveline_location and _driveline_point on the waypoints. | 1329 |
| `C:playCameraPath()` | Starts camera path playback (cameraPathPlayer). | 1621 |
| `C:pointsBackwards(fromPoint, steps, limitPoints)` | Moves back a given number of points, stopping before a limit point. | 1001 |
| `C:pointsForCameraPath(bufferBeforeMeters, bufferAfterMeters)` | List of road points around the current partition for a camera path (40 m before and 20 m after by default). | 1576 |
| `C:pointsForwards(fromPoint, steps, limitPoints)` | Moves forward a given number of points, stopping before a limit point. | 1022 |
| `C:positionAtDistanceAlongRoute(distanceAlongRoute, useAllPoints)` | Position on the road at a given cumulative distance (clamped between 0 and the total length), interpolated on the relevant segment. | 659 |
| `C:prevSnapPoint(srcPos)` | Point preceding the point closest to srcPos (the point itself at the start). | 1121 |
| `C:prevSnapPos(srcPos)` | Position of the point returned by prevSnapPoint (error if nil). | 1117 |
| `C:reprojectPacenoteWaypoints(notebook, previousSnaproad, snapshot)` | Reprojects the pacenote waypoints. Without a snapshot, builds one from the current positions (and from the old snaproad if provided). | 843 |
| `C:reprojectPacenoteWaypointsFromSnapshot(notebook, snapshot)` | Reprojects onto the current road the cs/ce waypoints of all non-missing pacenotes, from a snapshot, repairs overlaps, updates the halfpoints and recomputes the distance calls (autofillDistanceCalls). | 799 |
| `C:routeLocationForPoint(point)` | Builds the snap result corresponding exactly to a driveline point. | 610 |
| `C:setFilter(wp)` | Enables a filter that limits the movable points of a pacenote waypoint between the neighboring pacenotes (with a 2 m margin). | 1455 |
| `C:setFilterPartitionPoint(point)` | Enables a filter limited to the partition containing the given point. | 1435 |
| `C:setFilterToAllPartitions()` | Enables a filter containing all the points of the partitions (requires partitionAllPacenotes first). | 1417 |
| `C:setGlobalOpacity(globalOpacity)` | Sets the global opacity of the debug drawings. | 112 |
| `C:setPartitionToFilter()` | Sets the "focus" partition on the portion of road covered by the active filter. | 1565 |
| `C:setPartitionToPacenote(pn)` | Sets the "focus" partition on the portion of road going from the start to the end of the pacenote. | 1183 |
| `C:stopCameraPath()` | Stops camera path playback. | 1625 |
| `C:toggleCornerCalls()` | Toggles the display of corner calls and recomputes the current pacenote's partition. | 1633 |
| `C:totalRouteLength()` | Total length of the road (all points). | 605 |
| `C:updateHalfpoint(pn)` | Computes the midpoint (in distance along the road) between the start and the end of the pacenote and stores it in pn.halfpoint, halfpointLocation, halfpointPos. | 1161 |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/snaproad.lua`.*
