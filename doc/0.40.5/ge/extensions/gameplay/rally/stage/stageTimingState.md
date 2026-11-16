# `gameplay_rally_stage_stageTimingState`

*File: `lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua` · VM: Game Engine (GE) · 168 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/stage/stageTimingState")` (file under extensions/ but not a regular extension)

State machine of a rally special stage's timer: elapsed time, activation, finish, frame time step and split times. Used by rallyManager (getStageTimingState). The module returns a constructor.

## Notes

- Possible statuses: 'idle', 'active', 'complete'.
- Once complete, setActive no longer reactivates the timer; only reset puts it back to zero.
- addTime ignores values <= 0 and returns false if the timer is not active.

## Class `C`

Timing state object.

The module returns a constructor: `local obj = require("gameplay_rally_stage_stageTimingState")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addTime(seconds)` | Adds seconds to the elapsed time (penalty, for example for a recovery). | 50 |
| `C:advance(dt)` | Advances the timer by dt if it is active and not finished, storing the start and duration of the frame; otherwise frameDt is 0. | 39 |
| `C:completeAt(time)` | Ends the timer: status 'complete', freezes finishTime and elapsedTime. | 60 |
| `C:getFrameDt()` | Duration of the last frame processed by advance (0 if inactive). | 143 |
| `C:getFrameStartTime()` | Time at the start of the last frame processed by advance. | 139 |
| `C:getSplitOrder()` | List of pathnodeIds in recording order. | 123 |
| `C:getSplitTimes()` | Table of splits keyed by pathnodeId. | 119 |
| `C:getState()` | Snapshot of the state: status, active, complete, elapsedTime, finishTime, frameStartTime, frameDt, splitTimes, splitOrder (the splits tables are shared, not copied). | 147 |
| `C:getTime()` | Finish time if it exists, otherwise elapsed time (seconds). | 135 |
| `C:init()` | Calls reset. | 7 |
| `C:isActive()` | True if the timer is running (active and not finished). | 127 |
| `C:isComplete()` | True if the timer is finished. | 131 |
| `C:markSplitMissing(splitData, reason)` | Marks a split as missing (without time) with a reason; the entry replaces any existing entry. | 95 |
| `C:recordSplit(splitData, time, source)` | Records a split time for a path node, if splitData.isSplitTiming. Fills in splitData.time and splitData.source if absent. | 68 |
| `C:reset()` | Resets everything: status idle, inactive, not finished, time 0, no splits. | 11 |
| `C:setActive(active)` | Activates or pauses the timer (status 'active' / 'idle'). No effect if the timer is finished (it stays inactive). | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua`.*
