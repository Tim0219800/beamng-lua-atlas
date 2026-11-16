# `gameplay_rally_stage_stageObserver`

*File: `lua/ge/extensions/gameplay/rally/stage/stageObserver.lua` · VM: Game Engine (GE) · 350 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/stage/stageObserver")` (file under extensions/ but not a regular extension)

Rally special stage observer: at each update, it compares the vehicle's footprint (8 corners of the oriented bounding box, OOBB) between two frames and detects its crossing of the timing "pathnodes" (splits, finish). It computes the crossing time interpolated within the frame, fills in the tracker* fields of the observation data, marks missed nodes (outside the window or off the road) and feeds stageTimingState. Used by rallyManager. The module returns a constructor.

## Notes

- Two authority modes: 'shadow' (default, observation only) and 'tracker' (any other value falls back to 'shadow').
- Default windows in meters along the road: check 80 behind / 120 ahead, node considered missed beyond 120 behind.
- A pathnode is crossed if a vehicle corner passes through the sphere of radius pathnodeRadius (without normal) or the plane defined by the normal (with pathnodeHasNormal) during the frame.
- If tracker.state is 'offRoute' at the crossing, the split is marked missing with the reason 'offRoute' (except the finish); if the node is passed without being observed, the reason is 'missedWindow'.
- Crossing a node of type 'finish' ends the stage (stageComplete, completeAt on stageTimingState).
- setFootprintCorners uses veh:getSpawnWorldOOBB() if available, otherwise be:getObjectOOBB*XYZ; it returns false as long as the OOBB is not initialized.

## Class `C`

Observer object returned by the constructor; optional options: authorityMode, checkWindowBehindMeters, checkWindowAheadMeters, missWindowBehindMeters.

The module returns a constructor: `local obj = require("gameplay_rally_stage_stageObserver")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:getAuthorityMode()` | Returns the current authority mode. | 151 |
| `C:getStageTime()` | Stage end time if known, otherwise last sampled stage time. | 325 |
| `C:getState()` | Snapshot: authorityMode, stageComplete, stageFinishTime, currentStageTime, currentStageTimeRounded (to the tenth), trackerState, raceActive, raceComplete. | 330 |
| `C:init(options)` | Initializes the authority mode, the window sizes and the corner storage, then calls reset. | 137 |
| `C:recordRaceSplit(splitData, time)` | Fills in splitData.time and splitData.source ('race') if they are absent. | 220 |
| `C:reset()` | Resets the previous distance, the observation start index, the previous footprint, the stage end state, the last values and the updateSerial counter. | 155 |
| `C:resetAfterTeleport()` | Forgets the previous distance and footprint to avoid a false crossing after a teleport. | 173 |
| `C:resetFootprint()` | Forgets the previous footprint: the next update only stores it, without detecting any crossing. | 169 |
| `C:setAuthorityMode(mode)` | Sets the authority mode: 'tracker' or, for any other value, 'shadow'. | 147 |
| `C:update(context)` | Updates the observation for the frame: reads the stage time, gets the vehicle corners, advances the observation window, tests the crossing of nearby pathnodes and updates trackerObserved/trackerMissed, trackerTime, time and source, as well as stageTimingState. | 226 |

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/stage/stageObserver.lua`.*
