# `gameplay_rally_loop_stagedCountdownTest`

*File: `lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua` · VM: Game Engine (GE) · 123 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/loop/stagedCountdownTest")` (file under extensions/ but not a regular extension)

Test simulation for the stage start countdown (staged countdown). Reproduces a wall clock from the environment's time of day and schedules the start event at the next full minute (or the following one if less than 15 s remain). Used in test mode by the countdown node; the epoch is advanced by the caller.

## Notes

- The module returns a constructor: require('gameplay_rally_loop_stagedCountdownTest')().
- The start time in seconds = ((tod.time * 24 + 12) % 24) * 3600 (tod.time = 0 corresponds to noon); if core_environment is absent, midnight (0).
- In calculateScheduledEventTime the variable minutesToAdd is computed but never used (the 60 s offset is applied separately).

## Class `C`

Test instance. Fields: epoch (seconds elapsed since the start), environmentStartTimeSecs (starting wall-clock time in seconds), scheduledEventTime (epoch of the scheduled event).

The module returns a constructor: `local obj = require("gameplay_rally_loop_stagedCountdownTest")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calculateScheduledEventTime()` | Schedules scheduledEventTime at the next full minute of the wall clock; if less than 15 s remain before it, uses the following minute. The result is expressed as an epoch (relative to the start). | 39 |
| `C:getWallClockTime()` | Simulated wall-clock time = (environmentStartTimeSecs + epoch) modulo 86400. | 106 |
| `C:init()` | Reads the environment time, initializes epoch = 0 and schedules the event. | 17 |
| `C:reschedule(slotSizeMinutes, rescheduleCount, maxReschedules, defaultWarningTimes, warningsTriggered)` | Reschedules the event: full minute following the old time plus slotSizeMinutes minutes. Marks as already triggered the warnings whose remaining delay has already passed. | 71 |

## Calls into the engine (C++)

- `core_environment.` `getTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua`.*
