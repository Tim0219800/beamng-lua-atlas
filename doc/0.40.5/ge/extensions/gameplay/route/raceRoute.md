# `gameplay_route_raceRoute`

*File: `lua/ge/extensions/gameplay/route/raceRoute.lua` · VM: Game Engine (GE) · 519 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/route/raceRoute")` (file under extensions/ but not a regular extension)

Synchronous variant of route.lua for races and rally: path on the navgraph with per-point metadata (metadata), merge and recalculation callbacks, and storage of the original fixed points so the full route can be recalculated. The path shortens as tracking proceeds, with an "on the path" threshold of 15 m. The module returns a constructor: `require(...)(removeFirst, useMapPathfinding, closeDistSquared, logTag)`.

## Example

```lua
local RaceRoute = require('/lua/ge/extensions/gameplay/route/raceRoute')
local r = RaceRoute(true, true, 1)
r:setupPathMultiWithMetadata({{pos = p1}, {pos = p2, metadata = {name = 'cp'}}})
local idx, d = r:trackPosition(vehPos)
```

## Notes

- Callbacks available in self.callbacks: onPointProcessed(point) after construction, shouldPointBeFixedForRecalc(point) for recalculateRouteWithOriginalPositions, onRouteShortened (declared but not called here), onMetadataMerge(i, last, cur) -> newPoint, newMetadata when merging close points.
- Differences with route.lua: everything is synchronous (no core_jobsystem), onPathDist = 15 m, setupPathMultiWithMetadata sets each arrival as a fixed point and may not use map pathfinding (useMapPathfinding = false).
- The logTag argument of init is local and has no effect (it shadows the module variable).
- calcDistance crashes if the path is empty (self.path[1] is nil), unlike route.lua which handles this case.
- recalculateRoute and recalculateRouteWithOriginalPositions emit the hook onRecalculatedRoute with the argument 'raceRoute'.
- originalFixedPositions is filled only once, on the first setupPathMultiWithMetadata, and is not cleared by clear().
- updatePathForPos resets the metadata of the first point to nil if it is repositioned (resetMetadata).

## Class `C`

Race route. Fields: path, removeFirst, useMapPathfinding, closeDistSquared, originalFixedPositions, dirMult, callbacks, trackingMutationEnabled, done, plus the search parameters (cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ).

The module returns a constructor: `local obj = require("gameplay_route_raceRoute")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calcDistance()` | Recalculates distToTarget of each point. | 132 |
| `C:clear()` | Clears the path (without touching originalFixedPositions). | 347 |
| `C:getNextFixedWP()` | Position of the first fixed point of the path. | 352 |
| `C:getPositionOffset(currentPos)` | Finds the closest segment to a position (threshold 15 m). | 434 |
| `C:init(removeFirst, useMapPathfinding, closeDistSquared, logTag)` | Constructor with options. | 13 |
| `C:recalculateRoute(startPos)` | Rebuilds the path from startPos, passing through all remaining fixed points, then emits onRecalculatedRoute('raceRoute'). | 358 |
| `C:recalculateRouteWithOriginalPositions(startPos)` | Like recalculateRoute but starts from the original (unshortened) fixed points. An original point is kept if the shouldPointBeFixedForRecalc callback returns true, and the last point is always kept. Emits onRecalculatedRoute('raceRoute'). | 389 |
| `C:setRouteParams(cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Sets the navgraph search parameters. | 64 |
| `C:setTrackingMutationEnabled(enabled)` | If false, updatePathForPos no longer modifies the path (no recalculation or shortening) and only returns the offset. | 45 |
| `C:setupPath(fromPos, toPos)` | Route between two positions. | 143 |
| `C:setupPathMulti(positions)` | Builds the path for a list of plain positions (wraps them in {pos=...} then calls setupPathMultiWithMetadata). | 163 |
| `C:setupPathMultiWaypoints(wpList)` | Appends to the path the navgraph nodes between given waypoints (map.getPath). | 147 |
| `C:setupPathMultiWithMetadata(positions)` | Builds the path for positions with optional metadata. Each arrival becomes a fixed point that keeps its metadata; points that are too close are merged (onMetadataMerge callback possible); the endpoints are adjusted; onPointProcessed is called for each point; the original fixed points are stored on the first call. | 183 |
| `C:shortenPath(idx)` | Removes the points before index idx. | 459 |
| `C:stepAhead(stepDist, reset)` | Point located stepDist meters further along the route (same logic as route.lua). | 106 |
| `C:trackCamera()` | Tracks the camera (core_camera.getPosition). | 473 |
| `C:trackPosition(pos)` | Tracks an arbitrary position. | 474 |
| `C:trackVehicle(veh)` | Tracks a vehicle. | 472 |
| `C:updatePathForPos(pos)` | Updates the route for a position: recalculates if off the path (>= 15 m), shortens the path and adjusts the first point (resetting its metadata to nil). Without allowed mutation, only computes the offset. | 477 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRecalculatedRoute` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/route/raceRoute.lua`.*
