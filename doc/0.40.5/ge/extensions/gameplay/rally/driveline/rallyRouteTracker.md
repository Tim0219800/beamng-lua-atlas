# `gameplay_rally_driveline_rallyRouteTracker`

*File: `lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua` · VM: Game Engine (GE) · 378 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/driveline/rallyRouteTracker")` (file under extensions/ but not a regular extension)

Tracking of a vehicle's position along a static rally route. On each update, the position is projected onto the route's segments (local window around the previous segment, then full search if progress is inconsistent), which gives the segment, the remaining distance to the finish (distToTarget) and the lateral offset. A lateral corridor determines the 'onRoute' / 'offRoute' state (with hysteresis in ticks); when off the route, the departure point is stored to compute a recovery position close to the exit point. The module returns a constructor: require(...)(path, options).

## Example

```lua
local tracker = require('/lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker')(route.path)
tracker:update(vehPos)
local st = tracker:getState()  -- st.state, st.distToTarget, st.lateralDist
```

## Notes

- path is a list of points {pos, distToTarget} ordered from start to finish; distToTarget decreases along the route.
- Default options: searchBehind 4, searchAhead 8 (segments), offRouteDistance 8 m (corridor half-width), onRouteDistance 7.9 m, transitionTicks 2, recoveryBackoffDistanceMeters 3 m, maxForwardJump 80 m, maxBackwardJump 20 m. The option recoveryBackoffDistance is accepted as an alias of recoveryBackoffDistanceMeters.
- A local projection is rejected if progress exceeds maxForwardJump/maxBackwardJump; the full projection is then tried, and if it is rejected too the previous projection is kept ('held').
- States: 'unknown' (initial), 'onRoute', 'offRoute'. Switching from one state to the other takes transitionTicks consecutive updates; the offset must be >= offRouteDistance to leave, <= onRouteDistance to return.
- setCorridorWidth clamps the width to [0.1; 15] m.
- The debug* fields (debugLocalCandidate, debugFullCandidate, debugWindow) do not affect behavior.

## Class `C`

Tracker returned by the module constructor.

The module returns a constructor: `local obj = require("gameplay_rally_driveline_rallyRouteTracker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_acceptProjection(projection, allowJump)` | Accepts or rejects a projection according to the maximum forward/backward jumps relative to the current distance (always accepted if allowJump or first computation). | 202 |
| `C:_computeDebugWindow(segmentIdx, forceFullSearch)` | Diagnostic: returns the segment window examined by the local projection ({firstIdx, lastIdx}) or {fullSearch=true}. | 238 |
| `C:_snapshotDeparture(pos, projection)` | Records the route exit point (distToTarget, routePos, vehiclePos, lateralDist, segmentIdx) on switching to 'offRoute' and sets the recovery distance. | 220 |
| `C:_updateRecoveryCandidate(pos, projection)` | Stores the last recoverable point (distToTarget and position on the route) and computes recoveryDistToTarget = distToTarget + backoff, capped at the start of the route. | 212 |
| `C:getCorridorWidth()` | Current half-width of the corridor. | 186 |
| `C:getOptions()` | Current options table (shared, not a copy). | 190 |
| `C:getRecoveryDistToTarget(backoffDistance)` | Remaining distance to the finish at which to reposition the vehicle: starting point of the route exit (if off the route) or last recoverable point, plus a backoff, capped at the start of the route. | 334 |
| `C:getState()` | Snapshot of the tracker state: state, segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, offRouteDistance, onRouteDistance, lastRecoverable*, recoveryDistToTarget, departure, projectionSource ('local', 'full', 'held'), localCandidate, fullCandidate, window, searchBehind, searchAhead. | 347 |
| `C:init(path, options)` | Stores the route, merges the options with the default values and resets the state. | 134 |
| `C:project(pos, options)` | Projects a position onto the route without changing state: full search if options.forceFullSearch, otherwise local around the current segment. | 194 |
| `C:reset(pos)` | Resets the tracking state. If a position is given, immediately performs an update with full search and jump allowed. | 142 |
| `C:setCorridorWidth(width)` | Sets the corridor half-width (offRouteDistance, clamped to [0.1; 15] m) and the return threshold (onRouteDistance = offRouteDistance - 0.1). | 178 |
| `C:setDebugCapture(enabled)` | Enables diagnostic capture (computes an additional full projection on each update). | 169 |
| `C:setPath(path)` | Replaces the tracked route and resets the state. | 173 |
| `C:update(pos, updateOptions)` | Updates tracking with the vehicle position: projection (local then full if needed), update of segmentIdx, xnorm, distToTarget, distFromStart, routePos, lateralDist, then of the onRoute/offRoute state with hysteresis. Returns the retained projection (or the last one if the new one is rejected). | 249 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua`.*
