# `gameplay_rally_driveline_drivelineRoute`

*File: `lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua` · VM: Game Engine (GE) · 2122 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/driveline/drivelineRoute")` (file under extensions/ but not a regular extension)

Second version of the rally driveline, based on gameplay/route/raceRoute. From a RacePath (race.json), a notebook (NotebookPath) and a list of recorded points (PointList), it builds two routes: a dynamic route (recomputed from the vehicle's position) and an immutable static route (with RallyRouteTracker to follow the vehicle and handle going off the road). The start points, stop zone points, race pathnodes and the corner start/end waypoints (Cs/Ce) of the notes are inserted into the polyline. Then, every frame, onUpdate evaluates the note window: when the time remaining before the corner start drops below (co-driver delay + spoken duration of the note), the note's audio is triggered via the onPacenote*Hit callbacks. Also provides distances (course, fraction covered, splits), vehicle repositioning (notes, recovery) and debug drawings. The module returns a constructor: require(...)().

## Example

```lua
local dl = require('/lua/ge/extensions/gameplay/rally/driveline/drivelineRoute')()
dl.onPacenoteCsDynamicHit = function(pacenote, shouldTriggerAudio) end
dl:setVehicleTracker(vehicleTracker)
if dl:loadRouteFromRecordedDriveline(racePath, notebookPath, pointList) then
  -- every frame: dl:onUpdate(dtReal, dtSim, dtRaw)
end
```

## Notes

- Distances are 'distToTarget' values (remaining distance to the end of the route): they decrease along the route; distance from the start = distToTarget of the first point - distToTarget of the point.
- To load, racePath must have a default start position and a 'STOP_ZONE', 'SS_stop_control' or 'TC_out' position; otherwise loadRouteFromRecordedDriveline fails (false) and resets the object.
- Only the dynamic (1) and csImmediate (15) trigger types exist in RallyEnums.triggerType; comparisons with csStatic, csHalf, csMinus5, ceMinus5, ceStatic are therefore nil and never trigger audio (the events are still recorded and their callbacks called without audio).
- Dynamic threshold: timeToCs < codriverDelayForSpeed(speed in mph) + effective note duration; timeToCs = (vehicle remaining distance - original distance of the Cs waypoint) / speed in m/s.
- Parameters: staticDistanceThresholdMeters 0.1; minEvalSpeedMph 1.0; minWaitTimeSinceRecalc 2.0 s; trigger speed smoothing 0.25 s; pacenoteLookbehindWindow 5 notes.
- The onPacenoteXxxHit callbacks (Dynamic, CsImmediate, CsStatic, CeStatic, CsOffset, CeOffset, CornerPercent) must be set by the caller; they are not called while recalcNeeded is true.
- onUpdate only evaluates notes at least minWaitTimeSinceRecalc after a recalculation. dtSimSumSinceRecalc stays nil until the first recalculation: the comparison dtSimSumSinceRecalc > minWaitTimeSinceRecalc would raise an error if the speed exceeds minEvalSpeedMph before any recalculation (inferred from code).
- evaluatePacenoteEvents returns several times before profilerPopEvent without calling it (profiler imbalance, inferred from code).
- Split labels: one decimal digit (km) except for duplicates or '0.0', in which case two digits.

## Class `C`

Driveline V2 returned by the constructor. Main attributes: racePath, notebookPath, route, routeStatic, staticTracker, vehicleTracker, events, eventLog, loaded, nextPacenoteIdxForEval, splitDataList, pathnodeObservationList, raceCompletionData, onPacenote*Hit callbacks.

The module returns a constructor: `local obj = require("gameplay_rally_driveline_drivelineRoute")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_abortLoadRoute()` | Aborts a load in progress (calls _reset). | 403 |
| `C:_reset()` | Resets the loading and tracking state: routes, trackers, events, trigger thresholds (0.1 m, 1 mph, 2 s, smoothing 0.25 s) and mouse tracking. | 72 |
| `C:buildElevationProfile()` | Builds the elevation profile: one element {x, y, z, distFromStart, splitLabel, isRacePathnode} per static route point up to and including the finish line. | 2085 |
| `C:callPacenoteEventCallback(callbackFn, ...)` | Calls a note event callback, unless it is nil or a recalculation is pending. | 1331 |
| `C:codriverDelayForSpeed(speedMph)` | Co-driver delay for a given speed, with the settings of the active voice pack (speed scaling, offset) via gameplay_rally_codriverTiming.delayForSpeed. | 123 |
| `C:drawDebugDrivelineRoute(drawRoute, drawPacenotes, drawLimit, monochrome, static, drawHiddenPathnodes, drawRoutePathnodes, drawPointI, drawPointMetadata, drawPacenoteText)` | Draws the route (dynamic or static): rainbow spheres and prisms, point indices, metadata, race pathnodes and note labels (at most drawLimit labels). | 1814 |
| `C:drawDebugDrivelineRouteShort(dist)` | Draws the static route ahead of the vehicle in green over a given distance. | 2044 |
| `C:drawDebugTriggerPoint()` | Draws an orange sphere where the next note will trigger at the current speed. | 1787 |
| `C:effectiveAudioLen(pacenote)` | Effective spoken duration of a note, with the structured overlap gaps (AudioManager:pacenoteEffectiveAudioLen); otherwise the raw total duration pacenote:audioLenTotal(). | 114 |
| `C:enableTrackMouseLikeVehicleMovement(val)` | Allows moving the mouse position (Shift + click) in debug mode. | 1501 |
| `C:enableTriggerLogging()` | Indicates whether the detailed trigger log is active (gameplay_rally.getDebugLogging()). | 60 |
| `C:evaluatePacenoteEvents(pacenote, speedMs)` | Evaluates a note's triggers: dynamic (time before Cs < co-driver delay + spoken duration), immediate, static Cs, -40 m offset and 50% between Cs and Ce, -5 m offset and static Ce. Calls the matching callbacks with shouldTriggerAudio (true only once, for the note's trigger type). Returns true if the note's audio was just triggered. | 1095 |
| `C:evaluatePacenotesWindow(speedMs)` | Evaluates the notes in the window [next - 5, next]; advances nextPacenoteIdxForEval each time audio is triggered. | 1389 |
| `C:getAheadRoutePointPos()` | Position of the second point of the dynamic route (point ahead of the vehicle). | 147 |
| `C:getDistanceKmString()` | Race length formatted as '%.2f km', or 'N/A'. | 1586 |
| `C:getDistanceMeters()` | Length of the race (from start to finish line) in meters; -1 if the finish line is unknown; nil without a route or racePath. | 1573 |
| `C:getFinishLineDistOffset()` | distToTarget of the static route point of the last pathnode (finish line); nil if unavailable. | 1546 |
| `C:getNearestRoutePoint(pos)` | Position projected on the static route of the closest segment (via kd-tree), if the projection is ahead of the segment start (xnorm > 0). | 831 |
| `C:getNextPacenote()` | Next note to evaluate. | 143 |
| `C:getPacenoteEvent(pacenote)` | Returns a note's stored event or creates one: disabledByRecalc, csDynamicHit, csImmediateHit, csStaticHit, csMeterOffsetHit[-40], cornerPercentHit[0.5], ceStaticHit, ceMeterOffsetHit[-5], audioTriggerComplete. | 1033 |
| `C:getPacenotes()` | Sorted list of the loaded notebook's notes ({} if no notebook). | 135 |
| `C:getPointDistanceFromStartKm(point)` | Distance from the start to a route point, in kilometers. | 1671 |
| `C:getPointDistanceFromStartMeters(point)` | Distance from the start to a route point, in meters (0 without a route). | 1660 |
| `C:getPosition()` | Vehicle position (or the mouse's in debug mode). | 1366 |
| `C:getRaceCompletionData()` | Race progress: returns a shared table {distM, distPct, distKm, totalDistM} (distance covered, fraction, text '%.2fkm', total length). Values are 0 if the finish line is unknown. | 1595 |
| `C:getRecoveryDistToTarget(backoffDistance)` | Remaining distance at which to reposition the vehicle after going off the road (static tracker; otherwise tracked distance). | 892 |
| `C:getRouteCorridorWidth()` | Current half-width of the corridor. | 875 |
| `C:getSpeed()` | Vehicle speed in m/s (or the mouse's in debug mode). 0 without a vehicle tracker, nil without a vehicle. | 1337 |
| `C:getStaticTrackerState()` | State of the static tracker (see RallyRouteTracker:getState). | 859 |
| `C:getTrackedDistToTarget()` | Remaining distance to the end of the route: that of the static tracker; otherwise that of the first point of the dynamic route. | 882 |
| `C:init()` | Initializes the callbacks (nil), the mouse debug options, the split lists and the internal state (_reset). | 28 |
| `C:isLoaded()` | Indicates whether a route was loaded successfully. | 68 |
| `C:loadRouteFromRecordedDriveline(racePath, notebookPath, pointsList)` | Loads the route from a recorded driveline: builds the list of points (driveline, start position, stop zone, pathnodes, Cs/Ce waypoints of the notes), removes those before the start and after the stop, creates the dynamic route and the static route, the static tracker, the note lengths and the splits/pathnodes data. Returns false (and resets itself) if prerequisites are missing. | 412 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: updates the mouse in debug mode, the speed, the static tracker and the smoothed trigger speed; runs a recalculation if requested, otherwise evaluates the notes if the speed exceeds 1 mph and 2 s have elapsed since the last recalculation. Ignores speeds > 1000 mph. | 1427 |
| `C:positionAtDistToTarget(targetDist)` | Position on the static route for a given remaining distance (linear interpolation between points). | 1699 |
| `C:projectStaticRoute(pos, options)` | Projects a position onto the static route without changing state. | 848 |
| `C:recalculate(options)` | Recomputes the route from the current position: finds the next corner start waypoint (Cs) and the next pathnode, disables the events of notes already passed (disabledByRecalc), sets nextPacenoteIdxForEval, calls route:recalculateRouteWithOriginalPositions and resets the static tracker (unless preserveStaticTracker). | 900 |
| `C:resetStaticTracker(pos)` | Resets the static tracker, optionally at a position. | 853 |
| `C:setRecalcNeeded(options)` | Requests a route recalculation at the next onUpdate. | 1482 |
| `C:setRouteCorridorWidth(width)` | Sets the half-width of the static tracker's route corridor. | 869 |
| `C:setStaticTrackerDebugCapture(enabled)` | Enables diagnostic capture on the static tracker. | 863 |
| `C:setTrackMouseLikeVehicle(val)` | Enables/disables mouse tracking as if it were the vehicle (debug). Disabling clears the mouse data. | 1490 |
| `C:setVehicleTracker(vehicleTracker)` | Sets the object that provides the vehicle's position and speed (methods getVehicle, speedMs, pos). | 131 |
| `C:updateDynamicTriggerSpeed(speedMs, dtSim)` | Smooths the speed used for triggers (exponential filter with 0.25 s constant); initializes it to the current speed if it is nil or if dtSim is invalid. | 1014 |
| `C:updateMouseLikeVehicle(dtSim)` | Updates the mouse's simulated position and speed (camera raycast, smoothing 0.02) in debug mode. | 1505 |
| `C:updateStaticTracker(pos, options)` | Updates the static route tracker with the position (RallyRouteTracker:update). | 843 |
| `C:vehiclePlacementPosAndRotForPacenote(pacenote, distBefore, tangentLookAhead)` | Position and orientation to reposition the vehicle distBefore meters before a note's corner start (Cs), heading taken toward a point tangentLookAhead meters further along the route. | 1713 |
| `C:vehiclePlacementPosAndRotForRecovery(backoffDistance, tangentLookAhead)` | Position and orientation to recover the vehicle after going off the road (the tracker's recovery distance, clamped to the start of the route). | 1754 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua`.*
