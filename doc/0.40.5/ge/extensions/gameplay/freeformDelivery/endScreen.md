# `gameplay_freeformDelivery_endScreen`

*File: `lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_endScreen`: `extensions.load("gameplay_freeformDelivery_endScreen")`, then the global `gameplay_freeformDelivery_endScreen`

Small module of the freeform delivery mode (freeformDelivery) that gathers the statistics displayed at the end of a delivery: elapsed time, goal progress (via gameplay_freeformDelivery_goals.getProgress) and damage of each vehicle of the delivery (read from map.objects). Contains no UI: it only builds the results table.

## Notes

- Time is computed with os.clock() - startTime: startTime must therefore come from os.clock().
- Returns nil (with a logged error) if delivery is nil, if startTime is nil or 0, or if getProgress returns nothing.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_endScreen.collectStatistics(delivery, startTime)` | Builds the end-of-delivery statistics table: duration (raw and formatted by gameplay_freeformDelivery_utils.formatTime), number of goals total/completed/required/required completed, damage per vehicle (vehData.damage) and the allRequiredComplete flag. | 8 |

### Parameter details

#### `gameplay_freeformDelivery_endScreen.collectStatistics(delivery, startTime)`

Builds the end-of-delivery statistics table: duration (raw and formatted by gameplay_freeformDelivery_utils.formatTime), number of goals total/completed/required/required completed, damage per vehicle (vehData.damage) and the allRequiredComplete flag.

- `delivery` (*table*) : Data of the loaded delivery (vehicles list with id and name).
- `startTime` (*number*) : Start time in seconds, measured with os.clock().
- **returns**: table|nil {time, timeStr, goalsTotal, goalsCompleted, goalsRequired, goalsRequiredCompleted, vehicleDamages = {[deliveryId] = {name, damage}}, allRequiredComplete}, or nil on error.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua`.*
