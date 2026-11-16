# `gameplay_drag_timeslip`

*File: `lua/ge/extensions/gameplay/drag/timeslip.lua` · VM: Game Engine (GE) · 347 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_timeslip`: `extensions.load("gameplay_drag_timeslip")`, then the global `gameplay_drag_timeslip`

Generates the timing slip (timeslip) of a drag race: track info, weather (temperature, gravity), and for each racer its name, formatted timers, dial, gap to the dial, disqualification and result (winner, tie, breakOut, gap in seconds). The data is sent to the UI by gameplay_drag_core.sendTimeslipDataToUi. Also provides the "panel" version (grid of labels and rows) and the slip screenshot.

## Notes

- Value format: times in seconds with 3 decimals; speeds exposed in km/h (x 3.6) and mph (x 2.23694) with 3 decimals; '-' for an undefined value (< 0).
- Racers are sorted by descending lane. The winnerResult field is only filled if there are exactly 2 racers: 'ui.drag.timeslip.dq', '.winner', '.tie', '.breakOut', an empty string (bracket: two positive gaps, the larger loses) or '+x.xxx' (heads-up: delay behind the other).
- In MP, entries use the network timers (race.timerValues) first and add the player's nickname to the vehicle name.
- Calls core.setCareerRewards() for each racer: only the first call grants the reward (once per race), the following ones return an empty table.
- createTimeslipPanelData copies the 'tree' key from the slip table, but it does not exist at the first level (it is in stripInfo.tree): this key is never returned.
- The slip requires dragData.prefabs.christmasTree.treeType (otherwise Lua error) and uses gameplay_drag_times (not declared in dependencies).
- The screenshot is saved in screenshots/timeslips/<date-time> as jpg.

**Dependencies (loaded first):** `gameplay_drag_saveSystem`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_timeslip.createTimeslipData()` | Builds the slip table: stripInfo (stripName, levelName, dateTime, timestamp, tree), env (tempK/tempC/tempF, customGrav, gravity), dragType, laneCount, timerConfig, timeslipRows, importantTimerId and racerInfos (per racer: vehId, displayName, stock, licenseText, lane, finalTime, reactionTime, winTime, rewards, dialDiff, dialDiffStr, disqualification, make/country/transmission, timerEntries, timers, displayValues, winnerResult, persona...). | 63 |
| `gameplay_drag_timeslip.createTimeslipPanelData()` | Panel version: takes stripInfo, env, racerInfos, timerConfig, timeslipRows, importantTimerId and adds grid {labels, rows} (one row per racer with its timer values in a monospaced font). | 304 |
| `gameplay_drag_timeslip.screenshotTimeslip()` | Takes a jpg screenshot in screenshots/timeslips/<date-time> and shows a ui.drag.timeslip.saved message. | 336 |

### Parameter details

#### `gameplay_drag_timeslip.createTimeslipData()`

Builds the slip table: stripInfo (stripName, levelName, dateTime, timestamp, tree), env (tempK/tempC/tempF, customGrav, gravity), dragType, laneCount, timerConfig, timeslipRows, importantTimerId and racerInfos (per racer: vehId, displayName, stock, licenseText, lane, finalTime, reactionTime, winTime, rewards, dialDiff, dialDiffStr, disqualification, make/country/transmission, timerEntries, timers, displayValues, winnerResult, persona...).

- **returns**: table|nil Slip data, nil (E log) if there is no drag data.

#### `gameplay_drag_timeslip.createTimeslipPanelData()`

Panel version: takes stripInfo, env, racerInfos, timerConfig, timeslipRows, importantTimerId and adds grid {labels, rows} (one row per racer with its timer values in a monospaced font).

- **returns**: table Panel data, {} if there is no slip.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_saveSystem. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getGravity`, `getTemperatureK`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/timeslip.lua`.*
