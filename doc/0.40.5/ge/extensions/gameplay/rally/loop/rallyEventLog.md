# `gameplay_rally_loop_rallyEventLog`

*File: `lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua` · VM: Game Engine (GE) · 199 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/loop/rallyEventLog")` (file under extensions/ but not a regular extension)

Event log of a rally loop. Each entry (item) carries a timestamp, an eventId, an eventGroup, a type ('penalty', etc.) and a data table. On each addition, the aggregates are recomputed: total penalty, total stage time, total time (stages + penalties) and penalty summary by group and by type. Used by rallyLoopManager and rallyAttempts.

## Example

```lua
local log = require('gameplay_rally_loop_rallyEventLog')()
log:addItem({eventId='ss1', eventGroup='SS1'}, 12.3, 'penalty', {penaltyType='speeding', amount=10})
print(log:getTotalPenalty())
```

## Notes

- The module returns a constructor function; the options passed are forwarded to C:init (which uses none).
- Only items whose data.stageTimeSecs exists count as stage time; only items of type 'penalty' with data.amount count in the penalty.
- An item without data would cause an error in getStageTimes/_calcTotalStageTime (access to item.data.stageTimeSecs without a guard).
- C:clear() empties items and itemsByEventGroup but does not reset aggregatedItems: the totals stay as before until the next addItem.

## Class `C`

Event log. Instance fields: items (ordered list), itemsByEventGroup (table eventGroup -> list), aggregatedItems (totalPenalty, totalStageTime, totalTime, penaltySummary).

The module returns a constructor: `local obj = require("gameplay_rally_loop_rallyEventLog")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_calcPenaltySummary()` | Builds the penalty summary by group then by penaltyType. | 115 |
| `C:_calcTotalPenalty()` | Sum of data.amount of the items of type 'penalty'. | 95 |
| `C:_calcTotalStageTime()` | Sum of data.stageTimeSecs of all items. | 105 |
| `C:addItem(event, timestamp, type, data)` | Adds an entry to the log and to the event's group, then recomputes the aggregates. eventId and eventGroup are 'unknown' if absent. | 19 |
| `C:clear()` | Empties the log (items and groups) and logs a debug message. The aggregates are not recomputed. | 185 |
| `C:getAllItems()` | Returns all the items in the order they were added. | 55 |
| `C:getItemsByEventGroup(eventGroup)` | Returns the items of an event group (empty table if none). | 51 |
| `C:getItemsByType(type)` | Returns the items whose type matches. | 59 |
| `C:getPenaltySummary()` | Penalty summary: {totalPenalty, groups = {{eventGroup, totalPenalty, penalties = {{type, count, amount}}}}}. Groups follow the order of first appearance, penalties are sorted by type. | 91 |
| `C:getStageTimes()` | Returns the items that carry data.stageTimeSecs (one per completed stage). | 69 |
| `C:getTotalPenalty()` | Total penalty in seconds (0 if none). | 79 |
| `C:getTotalStageTime()` | Sum of the stage times in seconds. | 83 |
| `C:getTotalTime()` | Stage times plus penalties, in seconds. | 87 |
| `C:init()` | Initializes the empty lists. Called by the constructor. | 9 |
| `C:recalculateAggregatedItems()` | Recomputes totalPenalty, totalStageTime, totalTime and penaltySummary. Called by addItem. | 43 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua`.*
