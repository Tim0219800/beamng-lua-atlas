# `gameplay_drag_times`

*File: `lua/ge/extensions/gameplay/drag/times.lua` · VM: Game Engine (GE) · 288 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_times`: `extensions.load("gameplay_drag_times")`, then the global `gameplay_drag_times`

Drag timing. Every frame, onUpdate advances the main timer of each racer whose timers are started (dtSim in solo, synchronized start clock in MP), detects the crossing of each configured distance (timers of type distanceTimer and velocity, interpolated between two frames), computes the reaction time (distance timer < 0.5 m) and disqualifies a jump start (negative reaction time). It also provides timer value readers (local or received from the network in MP) used by the ranking and the slip. Unlocks the DRAG_QUARTER_MILE achievement for a non-disqualified player's time_1_4 <= 8.20 s.

## Notes

- Units: time in seconds, speeds (velocity timers) in m/s.
- The reaction time is the value of the distance timer < 0.5 m; if reactionTimeInvalid is true (false start or leaving the lane), it is -1. After computation, the main timer is shifted by the reaction value (timer = timer - reaction), so the ET/distance times are measured from the green light.
- In MP, the crossed timers are sent to the host via drag.updateTimerValue, and those of finished or removed racers are completed so that everyone has their times (e.g. time_1_4 after the 1000 ft).
- The code also handles timer types 'timeToVelocity' (velocity field) and 'brakingG' (fields deltaTime, startTime...) in the emergencyStop phase, but core.buildRacerTimers only creates dial, timer, distanceTimer and velocity: these branches only serve if the track config adds them some other way.
- Timers of type dialTimer are never reset to zero by reset().

**Dependencies (loaded first):** `gameplay_drag_core`, `gameplay_achievement`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_times.dragRaceStarted(vehId)` | Marks a racer's timers as started (racer.timersStarted = true). Called via the dragRaceStarted hook when the green light goes. | 270 |
| `gameplay_drag_times.getImportantTimerValue(racer, data)` | Value of a racer's important timer (data.importantTimerId, time_1_4 by default). | 89 |
| `gameplay_drag_times.getImportantTimerValueForWin(racer, data)` | Effective comparison time for the ranking: value of the important timer plus the reaction time if it is a distance timer (or if the timer is not in the config); the raw value for a speed timer. | 112 |
| `gameplay_drag_times.getNetworkTimersForRacer(racer)` | In MP, returns the table of timers broadcast by the network for the racer's vehicle (key = timer id). Uses a vehicle-to-MP-player cache rebuilt if the race or the players change. | 56 |
| `gameplay_drag_times.getRacerTimerValue(racer, timerId)` | Value of a timer for a racer: the network value in MP if it exists, otherwise the local value. | 82 |
| `gameplay_drag_times.getReactionTimerValue(racer)` | Reaction time of a racer: network timer whose id contains 'reaction' in MP, otherwise the value of the distanceTimer type timer at less than 0.5 m. | 94 |
| `gameplay_drag_times.onDragClear()` | Drag clear hook; does nothing. *(internal)* *(hook)* | 284 |
| `gameplay_drag_times.onDragReset()` | Drag reset hook: calls reset(). *(internal)* *(hook)* | 283 |
| `gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame timer update: elapsed time, distance/speed crossings, reaction, quarter mile achievement, emergency braking, MP synchronization (and the host's checkTimerDrift). No effect if the race is finished. *(internal)* *(hook)* | 138 |
| `gameplay_drag_times.reset()` | Resets all timers except each racer's dial (value 0, isSet = false) and timersStarted = false. | 12 |
| `gameplay_drag_times.resetDragRaceValues()` | Alias of reset(). | 276 |

### Parameter details

#### `gameplay_drag_times.dragRaceStarted(vehId)`

Marks a racer's timers as started (racer.timersStarted = true). Called via the dragRaceStarted hook when the green light goes.

- `vehId` (*integer*) : Racer's vehicle ID.

#### `gameplay_drag_times.getImportantTimerValue(racer, data)`

Value of a racer's important timer (data.importantTimerId, time_1_4 by default).

- `racer` (*table*) : Racer.
- `data` (*table|nil*) : Track data (importantTimerId).
- **returns**: number Value in s (or m/s for a speed timer), 0 if absent.

#### `gameplay_drag_times.getImportantTimerValueForWin(racer, data)`

Effective comparison time for the ranking: value of the important timer plus the reaction time if it is a distance timer (or if the timer is not in the config); the raw value for a speed timer.

- `racer` (*table*) : Racer.
- `data` (*table|nil*) : Track data (importantTimerId, timers).
- **returns**: number Effective time.

#### `gameplay_drag_times.getNetworkTimersForRacer(racer)`

In MP, returns the table of timers broadcast by the network for the racer's vehicle (key = timer id). Uses a vehicle-to-MP-player cache rebuilt if the race or the players change.

- `racer` (*table*) : Racer (vehId).
- **returns**: table|nil Network timers, nil outside MP or if unknown.

#### `gameplay_drag_times.getRacerTimerValue(racer, timerId)`

Value of a timer for a racer: the network value in MP if it exists, otherwise the local value.

- `racer` (*table*) : Racer.
- `timerId` (*string*) : Timer identifier (e.g. 'time_1_4').
- **returns**: number Value, 0 if absent.

#### `gameplay_drag_times.getReactionTimerValue(racer)`

Reaction time of a racer: network timer whose id contains 'reaction' in MP, otherwise the value of the distanceTimer type timer at less than 0.5 m.

- `racer` (*table*) : Racer.
- **returns**: number Reaction time in s (-1 if invalid, 0 if absent).

#### `gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame timer update: elapsed time, distance/speed crossings, reaction, quarter mile achievement, emergency braking, MP synchronization (and the host's checkTimerDrift). No effect if the race is finished.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_achievement. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/times.lua`.*
