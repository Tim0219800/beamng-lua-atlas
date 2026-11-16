# `gameplay_race_race`

*File: `lua/ge/extensions/gameplay/race/race.lua` · VM: Game Engine (GE) · 1351 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/race/race")` (file under extensions/ but not a regular extension)

Race engine class: runs one or more vehicles on a race path (gameplay/race/path). Every frame it tracks each vehicle's wheel corners, detects entry into segments, pathnode crossings, laps, the finish, rolling starts, co-driver calls (pacenotes) and recoveries, computes times, the ranking and the "on road" state. It also drives AI vehicles along the path and feeds the Hotlapping and LapTimes apps. The module returns a factory: require('/lua/ge/extensions/gameplay/race/race')(). It is used by race missions, rally mode and the flowgraph.

## Example

```lua
local race = require('/lua/ge/extensions/gameplay/race/race')()
race:setPathFile('/levels/west_coast_usa/race/test.race.json')
race.lapCount = 3
race:setVehicleIds({be:getPlayerVehicleID(0)})
race:startRace()
-- then call race:onUpdate(dtSim) every frame
```

## Notes

- Options of the race table (to set before startRace): lapCount (1), useHotlappingApp (false), useLapTimesApp (true), useDebugDraw (false), useWaypointAudio (true), alwaysAdvanceTime (false), autoAiMode (starts the AI of the non-player vehicles), recoverAffectsTotalTime, logRaceInfo (writes raceRecord/<date>/ at the finish), saveFileSuffix, suspended.
- States per vehicle (self.states[id]): active, complete, currentLap (0 for the first lap), currentSegments, currentTimes, historicTimes, bestLapTime, nextPathnodes, overNextPathnodes, placement, startTime, endTime, events, eventLog, isOnRoad, aiPathIdx, recoveriesUsed, timeDifferenceToFirst (in milliseconds).
- Events (state.events, cleared every frame if the time is > 0): raceStarted, rollingStarted, pathnodeReached (+ pathnodeReachedId), lapComplete, lapSkipped, raceComplete, raceAborted, recovered, recoveredTo, recoveryReached, pacenoteReached (+ pacenoteIdReached).
- Hooks emitted by digestEvents / updateVehicle: onRaceStarted({race, time}), onRacePathnodeReached({race, time, pathnode}), onRaceComplete({race, time}), onRaceAborted({race, time}). For a non-visible pathnode, onRacePathnodeReached is emitted without the time field.
- Probable bug: onUpdate and findNextPathnodes test self.path.branching (always nil) instead of self.path.config.branching; getTrackedData therefore also runs for branched paths, where linearCPIndex is nil.
- Probable bug: handleRecover uses #self.recoveryStates (number of entries indexed by vehicle ids, often 0) instead of #self.recoveryStates[id] for events.recovered.
- updateVehicle contains a debug print(string.format('T: ...')) on each visible pathnode reached.
- timeDifferenceToFirst is stored in milliseconds while formatTimeDifference treats it as seconds (mm:ss.ms): the displayed difference is off by a factor of 1000.
- isDebug = true in the file: detectOffTrack dumps and draws its data, but its call is commented out ("temporarily disabled until errors get resolved").
- state.reverse = self.path.config.reverse: field never defined in autoConfig (nil).
- The distances of getDistOnNav are in meters; the times in simulation seconds.
- The in* functions (inDrawEventlog, inDrawTimes...) are ImGui debug utilities; their call is commented out in onUpdate.

## Class `C`

Ongoing race. Fields: path, vehIds, states (by vehicle id), recoveryStates (recovery snapshots by id), time (race time in s), lapCount, finishCount, started, suspended, checkpointTimes ('<lap>_<segment>' -> time), aiPath, aiDetailedPath, sortPlacements (ranking comparator: descending lap, then descending checkpoint index, then ascending distance to the next point).

The module returns a constructor: `local obj = require("gameplay_race_race")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:abortRace(id)` | Aborts a vehicle's race (ignored if it has finished or is not active): raceAborted event, AI stopped. | 615 |
| `C:calcAIPath()` | Computes the AI path (aiPath, aiDetailedPath) from the race path. | 47 |
| `C:changeRaceVehicle(lastId, newId)` | Replaces a race vehicle with another (transfers states and recoveries, recomputes the wheel corners). | 361 |
| `C:clearEvents(id)` | Clears a vehicle's event table. | 1166 |
| `C:completeLap(id, endTime)` | Ends a vehicle's lap: records the lap times (lap, beginTime, endTime, lapTime, segmentTimes). If laps remain, restarts on the start segments (lapComplete event); otherwise marks the race finished (placement, raceComplete, AI at aggression 0.5) and optionally writes the history to raceRecord/ if logRaceInfo. | 667 |
| `C:createRecoveryPoint(id, recovery)` | Records a snapshot of the vehicle's state with the race time and the associated recovery position. | 628 |
| `C:debugDraw(data)` | Draws spheres for a vehicle's off-track data (off-track path, exit, return and maximum cut points). | 109 |
| `C:detectOffTrack(data, dt)` | Detects a vehicle's track exits and returns, records its off-track trajectory and computes the cut depth and the distance driven off track (debug data). Its call is currently disabled in getTrackedData. | 118 |
| `C:detectRollingStart(id, dt)` | Waiting for a rolling start: tests whether the vehicle entered one of the start segments, then computes the exact (interpolated) start time and raises rollingStarted. | 822 |
| `C:digestEvents(id, dt)` | Processes a vehicle's events: notifies Hotlapping and LapTimes (for the player vehicle), fills the event log, emits the hooks onRaceStarted, onRacePathnodeReached, onRaceComplete, onRaceAborted, records the recovery points and plays the checkpoint sound. | 1028 |
| `C:doSuspend(sus)` | Suspends or resumes the race (time and tracking stop) and notifies the Hotlapping and LapTimes apps. | 330 |
| `C:drawDebug(id)` | Draws a vehicle's next pathnodes (red), the following ones (orange) and the remaining calls. | 1175 |
| `C:findNextPathnodes(id)` | Recomputes for a vehicle the next visible pathnodes (nextPathnodes), the ones after (overNextPathnodes) and the shifted list without branching, with a type per pathnode: 'branch', 'final', 'lap', 'start', 'recovery' or 'default'. | 734 |
| `C:formatTimeDifference(timeDiff)` | Formats a signed time difference as +MM:SS.mmm; returns 'N/A' if nil. Expects seconds (see notes for the inconsistency with timeDifferenceToFirst). | 1315 |
| `C:getDistOnNav(pointA, pointB, inNextAiPathIdx, inPrevAiPathIdx, outNextAiPathIdx, outPrevAiPathIdx)` | Computes, for an off-road portion, the distance that would have had to be driven along the navigation path and the distance cut as the crow flies. | 67 |
| `C:getTimeDifferencesToFirst()` | For each vehicle with a timeDifferenceToFirst, returns the gap to the first one to have crossed the same point, its formatted text and the ranking. | 1327 |
| `C:getTrackedData(dt)` | Updates for each racing vehicle the front position, the index on the AI path, the isOnRoad state, then computes the ranking (placement), counting the vehicles that have already finished. | 182 |
| `C:getVehiclePosition(id)` | Position of a vehicle: scene object, otherwise map.objects; returns vec3() with an error log if not found. | 602 |
| `C:handlePacenotes(id)` | Detects whether the vehicle crosses a not-yet-triggered call in its current segments; raises pacenoteReached and pacenoteIdReached (only one per frame). | 1005 |
| `C:handleRecover(id)` | Restores the state of the last snapshot, the race time if recoverAffectsTotalTime, and puts the vehicle back on the recovery position without repair (moveResetVehicleTo with repair false), then resets the camera. | 650 |
| `C:hasRecoveryPosition(id)` | Indicates whether at least one recovery point exists for this vehicle. | 636 |
| `C:inDrawEventlog(id, im)` | Shows a vehicle's event log in ImGui (Time and Event columns). | 1194 |
| `C:inDrawLapTimes(lTimes, im)` | Shows a lap and its segment times in ImGui. | 1300 |
| `C:inDrawSegmentTimes(sTimes, im, mode, prefix)` | Shows the list of segment times in ImGui (from most recent to oldest). | 1280 |
| `C:inDrawTimes(id, im, detail)` | Shows a vehicle's times in ImGui (current lap, total, previous laps, segments if detail). | 1220 |
| `C:init()` | Constructor: default values and ranking comparator. | 7 |
| `C:onUpdate(dt)` | To be called every frame: for each vehicle, clears the events, handles the requested recoveries, updates the position on the course (updateVehicle), the debug drawing and digests the events; then updates the ranking, the LapTimes app and advances the race time. Does nothing until the race is started. | 278 |
| `C:raceTime(time)` | Formats a time in seconds as MM:SS.mmm. | 1308 |
| `C:requestRecover(id)` | Requests the vehicle's recovery at the last recovery point; effective at the next update. | 644 |
| `C:setPath(path)` | Sets the race path, runs autoConfig and computes the AI path. | 51 |
| `C:setPathFile(file)` | Loads a race path from a JSON file (deserialized into a new path) then applies it with setPath. Logs an error if the file is not found. | 35 |
| `C:setVehicleIds(ids)` | Sets the list of participating vehicles and resets their states. | 57 |
| `C:skipLap(id, keepLapProgress)` | Invalidates a vehicle's current lap (closed circuits only). Without keepLapProgress, also skips the progress: the next pathnode becomes the lap's finish line. | 349 |
| `C:startAiVehicle(id, aggression)` | Starts a vehicle's AI on the race path (ai.driveUsingPath): loops up to one more lap for a closed circuit, or the path extended by 250 m after the finish otherwise. Without a given aggression, estimates it from the vehicle's performance class (S 1, A 0.9, B 0.8, C 0.7, D 0.6, other 0.85). | 395 |
| `C:startRace()` | Starts the race: loads core_hotlapping / core_lapTimes if needed, resets the time to 0, creates each vehicle's state (start segments, wheel corners, AI if autoAiMode) and computes the next pathnodes. The raceStarted event is raised for each vehicle. | 469 |
| `C:stopAiVehicle(id)` | Stops a vehicle's AI ('stop' mode). | 461 |
| `C:stopRace()` | Stops the race: notifies Hotlapping and LapTimes and stops the AI vehicles. | 584 |
| `C:updateVehicle(id, dt)` | Advances the vehicle's wheel corners, handles the rolling start, the calls, a possible invalidated lap, then tests whether a segment is finished or a next one reached. Records the segment time (interpolated with the crossing instant), applies the AI aggression of the custom fields (aiAggression, aiCoef tag), ends the lap if needed, updates the next pathnodes and signals a recovery point reached. | 852 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRaceAborted`
- `onRaceComplete`
- `onRacePathnodeReached` — listened to by 2 module(s)
- `onRaceStarted` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `HotlappingResetApp`, `HotlappingTimerPause`, `HotlappingTimerUnpause`, `setQuickRaceMode`

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getPlayerVehicleID`
- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/race/race.lua`.*
