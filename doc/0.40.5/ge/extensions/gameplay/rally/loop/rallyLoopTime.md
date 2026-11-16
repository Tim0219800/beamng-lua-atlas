# `gameplay_rally_loop_rallyLoopTime`

*File: `lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua` · VM: Game Engine (GE) · 188 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_rallyLoopTime`: `extensions.load("gameplay_rally_loop_rallyLoopTime")`, then the global `gameplay_rally_loop_rallyLoopTime`

Manages the time of day of a rally loop. Builds the player setting "Loop Time" (Default, Now, then each HH:MM time listed in loopTimes), translates the choice into environment parameters for missionManager, and drives the sky via core_environment (play, time, date). Only touches the time-related fields; the mission's weather is preserved.

## Notes

- Special values: defaultValue = '__rallyLoopTimeDefault' (static time, noon, clock stopped), nowValue = '__rallyLoopTimeNow' (completely disables the environment module, everything stays as in freeroam).
- The raw tod.time is shifted by half a day relative to the wall clock: noon is 0. parseTime computes (fraction of the day - 0.5) % 1.
- The CSV times use timeScale = 7/36 (day of about 9257 s with a base of 1800 s); the Default option uses timeScale = 0.
- To stop/advance the clock, only send the fields to change to setTimeOfDay: a full table from getTimeOfDay (startTime, date) does not stop the clock (code comment).
- applyToEnvironment fills cloudCover, cloudWindSpeed, fogDensity with the current weather when they are nil, and windSpeed/windDirAngle with 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds)` | Advances the time of day by seconds game seconds: time = (time + seconds / dayLength) % 1. Has no effect if the clock is not in play or if dayLength is invalid. | 158 |
| `gameplay_rally_loop_rallyLoopTime.applyCurrentDate()` | Applies the real current date (year, month, day) to the sky (positions of the sun, moon, stars) without changing the time. | 145 |
| `gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue)` | Applies the choice to the mission's environment table (environment setup module). Now: enabled=false. Default: time=0, timeScale=0, _rallyForceStatic=true. CSV time: parsed time, timeScale=7/36. Fills in missing weather. | 81 |
| `gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData)` | Builds the 'select'-type setting "Loop Time": options Default, Now, then one option per time of missionTypeData.loopTimes (the value is the clock string to avoid float drift). | 55 |
| `gameplay_rally_loop_rallyLoopTime.parseTimes(str)` | Parses a comma-separated list of "HH:MM" times; invalid entries (format, hour > 23, minute > 59) are ignored. | 39 |
| `gameplay_rally_loop_rallyLoopTime.setPlaying(play, time)` | Forces the play state of the time-of-day clock via core_environment.setTimeOfDay, optionally with a time to restore. | 130 |

### Parameter details

#### `gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds)`

Advances the time of day by seconds game seconds: time = (time + seconds / dayLength) % 1. Has no effect if the clock is not in play or if dayLength is invalid.

- `seconds` (*number*) : Seconds to add (must be > 0).
- **returns**: boolean true if the time was changed.

#### `gameplay_rally_loop_rallyLoopTime.applyCurrentDate()`

Applies the real current date (year, month, day) to the sky (positions of the sun, moon, stars) without changing the time.

- **returns**: boolean false if core_environment is unavailable, otherwise true.

#### `gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue)`

Applies the choice to the mission's environment table (environment setup module). Now: enabled=false. Default: time=0, timeScale=0, _rallyForceStatic=true. CSV time: parsed time, timeScale=7/36. Fills in missing weather.

- `environment` (*table*) : Environment table modified in place (ignored if not a table).
- `selectedValue` (*string|nil*) : Chosen value: nowValue, defaultValue, nil (= default) or 'HH:MM' string.

#### `gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData)`

Builds the 'select'-type setting "Loop Time": options Default, Now, then one option per time of missionTypeData.loopTimes (the value is the clock string to avoid float drift).

- `missionTypeData` (*table|nil*) : Mission type data, reads loopTimes.
- **returns**: table Setting table {key, label, type, values, value, defaultValue, currentOption}.

#### `gameplay_rally_loop_rallyLoopTime.parseTimes(str)`

Parses a comma-separated list of "HH:MM" times; invalid entries (format, hour > 23, minute > 59) are ignored.

- `str` (*string*) : List, for example "08:00, 17:30".
- **returns**: table List of {clock = 'HH:MM', time = raw tod.time value in [0,1)}; empty if str is not a string.

#### `gameplay_rally_loop_rallyLoopTime.setPlaying(play, time)`

Forces the play state of the time-of-day clock via core_environment.setTimeOfDay, optionally with a time to restore.

- `play` (*boolean*) : true to make time advance, false to freeze it.
- `time` (*number|nil*) : Raw tod.time value to apply at the same time.
- **returns**: boolean false if core_environment is unavailable, otherwise true.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultValue` | string | Value of the Default option: '__rallyLoopTimeDefault'. |
| `key` | string | Setting key: 'rallyLoopTime'. |
| `nowValue` | string | Value of the Now option: '__rallyLoopTimeNow'. |

## Calls into the engine (C++)

- `core_environment.` `getCloudCover`, `getFogDensity`, `getTimeOfDay`, `getWindSpeed`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua`.*
