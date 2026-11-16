# `gameplay_rally_loop_scheduleUtils`

*File: `lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_scheduleUtils`: `extensions.load("gameplay_rally_loop_scheduleUtils")`, then the global `gameplay_rally_loop_scheduleUtils`

Small utility functions for schedule computation for rally loops: rounding up to the next minute, conversion of slot sizes from minutes to seconds, next slot computation, time comparison with tolerance. All times are in seconds.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute)` | Adds the slot duration to the current time then, by default, rounds up to the next minute. | 27 |
| `gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance)` | Tests whether newTime is strictly greater than currentTime + tolerance. | 45 |
| `gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs)` | Rounds a time up to the next minute: ceil(t / 60) * 60. | 11 |
| `gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes)` | Converts a slot size from minutes to seconds (1 minute by default if nil). | 18 |

### Parameter details

#### `gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute)`

Adds the slot duration to the current time then, by default, rounds up to the next minute.

- `currentTime` (*number*) : Current time in seconds.
- `slotSizeMinutes` (*number|nil*) : Slot size in minutes (default 1).
- `roundToMinute` (*boolean|nil*) : true by default; false to not round.
- **returns**: number Next slot in seconds.

#### `gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance)`

Tests whether newTime is strictly greater than currentTime + tolerance.

- `newTime` (*number*) : Time to test.
- `currentTime` (*number*) : Reference time.
- `tolerance` (*number|nil*) : Tolerance in seconds (default 0).
- **returns**: boolean true if newTime > currentTime + tolerance.

#### `gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs)`

Rounds a time up to the next minute: ceil(t / 60) * 60.

- `timeSecs` (*number*) : Time in seconds.
- **returns**: number Rounded time, in seconds.

#### `gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes)`

Converts a slot size from minutes to seconds (1 minute by default if nil).

- `slotSizeMinutes` (*number|nil*) : Slot size in minutes.
- **returns**: number Seconds.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua`.*
