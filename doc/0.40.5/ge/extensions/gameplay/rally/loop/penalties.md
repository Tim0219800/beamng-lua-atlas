# `gameplay_rally_loop_penalties`

*File: `lua/ge/extensions/gameplay/rally/loop/penalties.lua` · VM: Game Engine (GE) · 114 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_penalties`: `extensions.load("gameplay_rally_loop_penalties")`, then the global `gameplay_rally_loop_penalties`

Computation of time control penalties for a rally loop: early arrival, late arrival, false start. Time is compared to the minute (arrival within the same minute as the scheduled time = on time). Each minute of difference costs 10 s.

## Example

```lua
local r = gameplay_rally_loop_penalties.getTimingStatus(actualEpoch, scheduledEpoch)
if r.hasPenalty then print(r.status, r.totalPenalty) end
```

## Notes

- The times passed to getTimingStatus are epoch times in seconds; the comparison is done on math.floor(t/60).
- If scheduledTime or actualTime is nil, the result is 'on-time' with no penalty.
- The comments talk about 'minute or fraction of a minute', but the code counts calendar minutes of difference (difference of whole minutes), not the actual duration.
- calculateFalseStartPenalty ignores its argument and always returns falseStartPenaltySeconds.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly)` | Penalty for an early arrival: minutesEarly multiplied by timeControlPenaltySecondsPerMinute. | 14 |
| `gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount)` | False start penalty; constant, independent of the number of false starts. | 26 |
| `gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate)` | Penalty for a late arrival: minutesLate multiplied by timeControlPenaltySecondsPerMinute. | 22 |
| `gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime)` | Determines whether arrival at a checkpoint is early, on time or late, and computes the associated penalty. | 38 |

### Parameter details

#### `gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly)`

Penalty for an early arrival: minutesEarly multiplied by timeControlPenaltySecondsPerMinute.

- `minutesEarly` (*number*) : Number of minutes early.
- **returns**: number Penalty in seconds.

#### `gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount)`

False start penalty; constant, independent of the number of false starts.

- `falseStartCount` (*integer*) : Number of false starts (ignored).
- **returns**: number falseStartPenaltySeconds.

#### `gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate)`

Penalty for a late arrival: minutesLate multiplied by timeControlPenaltySecondsPerMinute.

- `minutesLate` (*number*) : Number of minutes late.
- **returns**: number Penalty in seconds.

#### `gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime)`

Determines whether arrival at a checkpoint is early, on time or late, and computes the associated penalty.

- `actualTime` (*number|nil*) : Actual arrival time, epoch in seconds.
- `scheduledTime` (*number|nil*) : Scheduled time, epoch in seconds (may be nil).
- **returns**: table {status = 'early'|'on-time'|'late', totalPenalty, hasPenalty, penalties}. Each element of penalties: {type = 'time_control_early'|'time_control_late', amount, data = {minutesEarly|minutesLate, actualMinute, scheduledMinute}} for i18n.

## Fields

| Field | Type | Description |
|---|---|---|
| `falseStartPenaltySeconds` | number | False start penalty in seconds (10). |
| `timeControlPenaltySecondsPerMinute` | number | Penalty in seconds per minute early or late (10). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/penalties.lua`.*
