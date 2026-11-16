# `gameplay_route_route`

*File: `lua/ge/extensions/gameplay/route/route.lua` · VM: Game Engine (GE) · 459 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/route/route")` (file under extensions/ but not a regular extension)

Route class on the navgraph (`map` module): computes a path through a list of positions, stores the remaining distances (distToTarget), tracks a vehicle, the camera or a position, shortens the path as progress is made and recalculates it when the target strays more than 18 m from it. Computations can run asynchronously in core_jobsystem (setupPathMultiJob, recalculateRoute). The module returns a constructor: `require('/lua/ge/extensions/gameplay/route/route')()`. Each path point is a table {pos, wp, linkCount, distToTarget, fixed}.

## Example

```lua
local route = require('/lua/ge/extensions/gameplay/route/route')()
route:setRouteParams(nil, nil, nil, nil, nil, nil)
route:setupPathMulti({vec3(0,0,0), vec3(500,200,0)})
local idx, dist = route:trackVehicle(be:getPlayerVehicle(0))
```

## Notes

- A `fixed` point is a mandatory stage (arrival of each segment); recalculateRoute only recalculates up to the first fixed point, then reattaches the rest of the path (the "tail").
- "On the path" distance: onPathDist = 18 m; points closer than 1 m (closeDistSquared = 1) are merged.
- The lockFixedNodes field (uninitialized, to be set from outside) prevents going past a fixed point while tracking.
- updatePathForPos does a print("recalculateRoute(pos)") when an ongoing recalculation is replaced because the vehicle strayed too far from the anchor.
- The onRecalculatedRoute hook (no argument) is emitted at the end of an asynchronous recalculation. The equivalent raceRoute module emits the same hook with the argument 'raceRoute'.
- The debugLog function is disabled (debugLog = nop): no debug log is emitted. Jobs use global_pathJobMaxDt or a near-zero dt (1e-11) to yield at each search step.

## Class `C`

Route. Fields: path, dirMult (1e3), distance, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ, done, lastDist, lastIndexAtDist, lockFixedNodes.

The module returns a constructor: `local obj = require("gameplay_route_route")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calcDistance()` | Recalculates distToTarget of each point (remaining distance to the end) and self.distance. | 85 |
| `C:clear()` | Cancels ongoing jobs and clears the path. | 249 |
| `C:getNextFixedWP()` | Position of the first fixed point of the path. | 256 |
| `C:getPositionOffset(currentPos)` | Finds the path segment closest to a position. | 373 |
| `C:init()` | Constructor: empty path, dirMult = 1e3, no job running. | 27 |
| `C:recalculateRoute(startPos)` | Recalculates the route from startPos in an asynchronous task. If a fixed point exists, only redoes the section up to it then reattaches the rest; otherwise redoes the route up to the last point. Emits the onRecalculatedRoute hook at the end. Cancels previous jobs. | 288 |
| `C:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Sets the search parameters passed to map.getPointToPointPath / map.getPath. | 36 |
| `C:setupPath(fromPos, toPos)` | Simple route between two positions (calls setupPathMulti). | 102 |
| `C:setupPathMulti(positions)` | Builds (synchronously) a path through all the positions. The arrival of each segment is a `fixed` point. Close points are merged and the endpoints are adjusted to the closest segment. | 181 |
| `C:setupPathMultiJob(positions, onComplete)` | Like setupPathMulti but the search runs in core_jobsystem (yields between steps). self.path is replaced once the computation finishes. Cancels any ongoing recalculation or previous job. | 216 |
| `C:setupPathMultiWaypoints(wpList)` | Appends to the path the navgraph nodes between given waypoints (map.getPath), without consecutive duplicates, then computes the distances. | 106 |
| `C:shortenPath(idx)` | Removes the points before index idx (the first idx-1 points). | 399 |
| `C:stepAhead(stepDist, reset)` | Returns the point located stepDist meters further along the route, storing the last position to speed up successive calls. | 59 |
| `C:trackCamera()` | Tracks the camera (core_camera.getPosition). | 408 |
| `C:trackPosition(pos)` | Tracks an arbitrary position. | 409 |
| `C:trackVehicle(veh)` | Tracks a vehicle (updatePathForPos on its position). | 407 |
| `C:unflagFirstFixedNode()` | Removes the fixed flag from the first fixed point (stage reached). | 262 |
| `C:updatePathForPos(pos)` | Updates the route for a position: starts a recalculation if 18 m or more from every segment, cancels a recalculation that has become unnecessary, shortens the path and adjusts the first point to the position. Sets done = true if the path has fewer than 2 points. | 412 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRecalculatedRoute` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/route/route.lua`.*
