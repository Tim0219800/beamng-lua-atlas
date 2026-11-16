# `gameplay_rally_driveline_pointList`

*File: `lua/ge/extensions/gameplay/rally/driveline/pointList.lua` · VM: Game Engine (GE) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/driveline/pointList")` (file under extensions/ but not a regular extension)

List of points along a path (rally driveline). Each point is a table {pos (vec3), quat, ts, normal, prev, next, id, partition, pacenoteDistances, cachedPacenotes{cs, ce, at, auto_at, half}}. The class can chain points (prev/next/id), compute their normals (snaproad/normals), measure the length, find the closest point and draw a debug preview. The module returns a constructor: require(...)(points).

## Notes

- BUG: in createPoint, the parameter is named 'quat' and shadows the global function quat(); the default value 'quat or quat(0,0,0,1)' therefore calls nil if the argument is omitted (Lua error). Always pass a quaternion.
- setAll replaces the points then recomputes relations (prev/next/id) and normals; the constructor does not.
- The length is the sum of the 3D distances between consecutive points, in meters.

## Class `C`

List of points returned by the constructor; attribute self.points.

The module returns a constructor: `local obj = require("gameplay_rally_driveline_pointList")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calculateLength()` | Total length of the path (0 if fewer than 2 points). | 76 |
| `C:count()` | Number of points. | 91 |
| `C:createPoint(pos, quat, ts)` | Creates a point in standard format (normal (0,0,1), empty pacenoteDistances, empty cachedPacenotes). Does not add the point to the list. | 17 |
| `C:downsample()` | Compatibility stub with DrivelineRoute: returns the list itself (drivelineV3 already simplifies). | 134 |
| `C:drawDebug(drawLabels)` | Draws a sphere per point (color recce_driveline_clr, alpha 0.3) and, if requested, the ts timestamp as a label. Call every frame. | 139 |
| `C:findNearestPoint(srcPos)` | Closest point to a position (3D distance, linear scan). | 113 |
| `C:get(index)` | Point at the given index. | 96 |
| `C:getAll()` | Internal table of all the points (not a copy). | 101 |
| `C:init(points)` | Stores the provided list of points (empty by default) without computing relations or normals. | 12 |
| `C:setAll(points)` | Replaces all the points then recomputes relations and normals. | 106 |
| `C:setupPointNormals()` | Computes each point's normal with snaproadNormals.forwardNormalVec and creates pacenoteDistances/cachedPacenotes if missing. | 56 |
| `C:setupPointRelationships()` | Fills in id (index), prev and next of each point. | 39 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/driveline/pointList.lua`.*
