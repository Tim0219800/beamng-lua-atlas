# `core_hotlapping`

*File: `lua/ge/extensions/core/hotlapping.lua` · VM: Game Engine (GE) · 1072 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_hotlapping`: `extensions.load("core_hotlapping")`, then the global `core_hotlapping`

GE extension `core_hotlapping`: freeroam "timed laps" mode (Hotlapping app). The player places checkpoints (waypoints with position, direction and radius) to define a circuit, the timer starts when passing through the first one, then laps and sections are timed with gaps relative to the best lap. The circuit can be saved/loaded (gameplay/hotlapping/<level>/*.race.json) and AI vehicles can drive it. The module also serves as a time display for race scenarios (old `onRace*` system) and for the new race system (`newRace*`).

## Example

```lua
extensions.load('core_hotlapping')
core_hotlapping.startHotlapping()      -- enters edit mode (creates the 1st checkpoint at the vehicle's position)
-- drive to the next point then:
core_hotlapping.addCheckPoint()
-- go through the 1st checkpoint again to start the timer
core_hotlapping.save()                 -- saves as <date>.race.json
```

## Notes

- Units: all internal times are in MILLISECONDS (os.clock()*1000, or race.time*1000 for the new system). formatMillis gives 'MM:SS.mmm'. Checkpoint radii are in meters: automatic default (autoRadius) = 5, otherwise max(3, interpolated road radius + 1) if a road is within 30 m; changeRadius clamps to 1..15.
- Structure of getTimeInfoRaw(): times[lap] = {startTime, endTime, duration, diff, skipped, lap, [cp] = {startTime, endTime, duration, diff, cp, current}}; lap and cp are numbered from 1. The gap (diff) of a lap/section is in ms relative to the best lap (bestLapIndex), absent during the 1st lap and for branching circuits.
- getTimeInfo() returns {normal = list per lap, detail = flat list sections then lap} ready for the UI (formatted fields duration, total, diff, diffColor 'red'/'green', durationStyle in inline CSS, best, isSection, isLap).
- UI events: HotlappingTimer (timer state, sent when passing a checkpoint, at the end of a lap or when forceSendToGui is true), HotlappingTimerPause, HotlappingResetApp, HotlappingSuccessfullyLoaded(name), HotlappingSuccessfullySaved(name).
- Pause: when be:getEnabled() is false (simulation paused), the pause duration is accumulated then subtracted from the total time.
- Three feeding paths depending on the race source: the internal freeroam mode (onCheckPointPassed + onUpdate), the old scenario system (onRaceStart, onRaceWaypointReached, onRaceResult, scenario timer in seconds x1000) and the new system (newRaceStart, newRacePathnodeReached, newRaceLapSkipped, newRaceStop).
- Inconsistencies: the comment of refreshTracklist says it sends the list to the app but it only returns it; rename calls renameFile then removeFile of the old path (the second call is useless); onCheckPointPassed is never called in this file; the automatic list cites the same onRace* hooks twice, which are hooks of the old system.
- In freeroam mode, the AI mode (startAi) imposes on non-player, non-traffic/non-parked vehicles ai.driveUsingPath with 1000 laps, aggression 0.9, turnForceCoef 4, awarenessForceCoef 0.15; it marks these vehicles with the dynamic field isHotlapping.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_hotlapping.addCheckPoint(cpPos, cpDir, cpRadius)` | Adds a checkpoint to the circuit (edit mode only) and links it to the previous one with a segment. Without arguments, uses the player vehicle's position placed on the surface (or the camera), its direction if the vehicle is within 5 m, and the current radius (automatic or set by changeRadius). | 250 |
| `core_hotlapping.changeRadius(sign)` | Changes the radius of all checkpoints: +1 m if sign > 0, -1 m if sign < 0 (clamped 1..15), back to the automatic radius if sign == 0 (the 1st change starts from 5). | 842 |
| `core_hotlapping.clearAllCP()` | Forgets the counter and the id of the last checkpoint and stops the AI. Does not clear the path itself. | 291 |
| `core_hotlapping.formatMillis(timeInMillis, addSign)` | Formats milliseconds as 'MM:SS.mmm' (rounded to the integer); with addSign, prefixes '+' or '-'. | 714 |
| `core_hotlapping.getDiffColor(val)` | CSS color of a gap: 'red' if > 0 (slower), 'green' if < 0, '' if zero. | 732 |
| `core_hotlapping.getTimeInfo()` | Time data formatted for the UI: {normal = summary per lap, detail = sections then lap}. The table is reused on every call. | 592 |
| `core_hotlapping.getTimeInfoRaw()` | Raw table of times per lap and section (see notes). | 584 |
| `core_hotlapping.load(originalFilename)` | Loads a circuit from gameplay/hotlapping/<level>/<name>.race.json; failing that, looks for the old format in settings/hotlapping (files whose path contains the name). Then stops the timer, clears, restarts hotlapping mode and notifies the UI. | 748 |
| `core_hotlapping.newRaceLapSkipped(state, info)` | New system hook: the current lap was skipped; marks it 'skipped' and resets the checkpoint to 1 if state.skippedLap. *(internal)* | 932 |
| `core_hotlapping.newRacePathnodeReached(state, info)` | New system hook: player passes a pathnode. Ends the race if state.complete, otherwise advances lap/checkpoint (ignores recoveries) and updates the times. *(internal)* | 906 |
| `core_hotlapping.newRaceStart(race)` | New race system hook: starts tracking (closed race, laps from 1, clock = race.time*1000) and detects branching circuits (comparisons disabled). *(internal)* | 890 |
| `core_hotlapping.newRaceStop()` | New system hook: race stop (started = false). *(internal)* | 961 |
| `core_hotlapping.onCheckPointPassed(index)` | Intended for passing a checkpoint (legacy freeroam mode): if index is the next expected one, advances the lap/checkpoint counter. No call in this file. *(internal)* *(hook)* | 329 |
| `core_hotlapping.onClientEndMission()` | Level end hook: stops hotlapping mode. *(internal)* *(hook)* | 878 |
| `core_hotlapping.onClientStartMission()` | Level start hook: stops hotlapping mode and resets the app (HotlappingResetApp). *(internal)* *(hook)* | 873 |
| `core_hotlapping.onExtensionUnloaded()` | Unload hook: stops hotlapping mode. *(internal)* *(hook)* | 882 |
| `core_hotlapping.onGameStateUpdate(...)` | Game state change hook: forces the next send to the UI. *(internal)* *(hook)* | 949 |
| `core_hotlapping.onMenuToggled(...)` | Menu open/close hook: forces the next send to the UI. *(internal)* *(hook)* | 953 |
| `core_hotlapping.onPreRender(dt, dtSim)` | Render hook: in edit mode, draws spheres, vertical columns (the first in orange) and direction arrows of the checkpoints; otherwise renders the race markers. *(internal)* *(hook)* | 362 |
| `core_hotlapping.onRaceResult(final)` | Old system hook: race end; stops the timer and stores the detailed times in scenario.detailedTimes. *(internal)* *(hook)* | 1017 |
| `core_hotlapping.onRaceStart()` | Old race scenario system hook: starts tracking with the scenario timer (scenario.timer in seconds), closed race, laps from 1; branching circuits if lapConfigBranches is defined. *(internal)* *(hook)* | 969 |
| `core_hotlapping.onRaceWaypointReached(wpInfo)` | Old system hook: the player reached a waypoint. Handles race end, lap change (lapDiff == 1) or checkpoint change and updates the times. Ignores the other vehicles. *(internal)* *(hook)* | 986 |
| `core_hotlapping.onScreenFadeState(...)` | Screen fade hook: forces the next send to the UI. *(internal)* *(hook)* | 957 |
| `core_hotlapping.onUpdate(dt, dtSim)` | Per-frame hook: starts the race when the player enters the first checkpoint, handles pause, updates the race and the total time, then sends the state to the UI. *(internal)* *(hook)* | 389 |
| `core_hotlapping.onVehicleResetted(id)` | Vehicle reset hook: if the player is reset near (less than 80 m) the start during a race, stops the AI and puts it back at its start point. *(internal)* *(hook)* | 866 |
| `core_hotlapping.passTimeToGUI()` | Sends the timer state (getTimeInfo plus stop, justLapped, delta, closed, running, justStarted) to the UI (HotlappingTimer) if a checkpoint was just passed, a lap was completed or a forced send is requested. | 459 |
| `core_hotlapping.refreshTracklist()` | Lists the available circuits (current level, plus older ones in settings/hotlapping) without extension. | 827 |
| `core_hotlapping.rename(oldName, newName)` | Renames a circuit of the current level (<old>.race.json -> <new>.race.json). | 813 |
| `core_hotlapping.save(filePath)` | Saves the circuit as JSON (gameplay/hotlapping/<level>/<date>.race.json by default), sends HotlappingSuccessfullySaved to the UI. Refuses if the path is invalid. | 797 |
| `core_hotlapping.setEndTime()` | Freezes the section and lap times at totalTime at the end of the race and updates the gap and best lap. | 475 |
| `core_hotlapping.setTime(ignoreNewLap)` | Updates the current times: creates the lap and checkpoint record if needed, closes the previous one, computes durations, gaps relative to the best lap and updates the best lap (comparisons disabled for branching races). | 504 |
| `core_hotlapping.setVisible(value)` | Shows or hides the race markers and mutes/unmutes the checkpoint sound. | 298 |
| `core_hotlapping.skipLap(keepLapProgress)` | Skips the current lap (marked 'skipped' in the times) via raceData:skipLap for the player vehicle. | 209 |
| `core_hotlapping.start()` | Starts the timer (called automatically when the player passes through the first checkpoint). In edit mode, validates the path, creates the race object (1000 laps, hotlapping app, checkpoint audio), the visual markers and plays the UI_Checkpoint sound. Stops immediately if the path is invalid. | 168 |
| `core_hotlapping.startAi()` | Makes all non-traffic/non-parked AI vehicles drive the circuit in a loop (1000 laps, vehicle avoidance enabled). If no race is started and we are in edit mode, starts the race first. | 104 |
| `core_hotlapping.startHotlapping()` | Enters circuit edit mode: resets the state, creates a path object (gameplay/race/path) and adds the first checkpoint at the vehicle's position. Disables the mode (warning) if there is no player vehicle. | 56 |
| `core_hotlapping.stopAi(respawn)` | Stops the vehicles marked isHotlapping (ai.setMode('stop')) and, if respawn, puts them back at their saved position (recovery.loadHome). | 135 |
| `core_hotlapping.stopHotlapping()` | Stops everything: stops the timer, leaves edit mode, destroys the path and removes the isHotlapping marking from the vehicles. | 88 |
| `core_hotlapping.stopTimer()` | Stops the timer, clears the times, stops the race and the markers; goes back to edit mode if a race was running; stops the AI. | 216 |

### Parameter details

#### `core_hotlapping.addCheckPoint(cpPos, cpDir, cpRadius)`

Adds a checkpoint to the circuit (edit mode only) and links it to the previous one with a segment. Without arguments, uses the player vehicle's position placed on the surface (or the camera), its direction if the vehicle is within 5 m, and the current radius (automatic or set by changeRadius).

- `cpPos` (*vec3|nil*) : World position of the center.
- `cpDir` (*vec3|nil*) : Direction/normal; nil = no normal (passing in both directions).
- `cpRadius` (*number|nil*) : Radius in meters.

#### `core_hotlapping.changeRadius(sign)`

Changes the radius of all checkpoints: +1 m if sign > 0, -1 m if sign < 0 (clamped 1..15), back to the automatic radius if sign == 0 (the 1st change starts from 5).

- `sign` (*number*) : +1, -1 or 0.

#### `core_hotlapping.formatMillis(timeInMillis, addSign)`

Formats milliseconds as 'MM:SS.mmm' (rounded to the integer); with addSign, prefixes '+' or '-'.

- `timeInMillis` (*number|nil*) : Time in ms.
- `addSign` (*boolean|nil*) : true = adds the sign (gaps).
- **returns**: string|nil Text; nil if timeInMillis is nil.

#### `core_hotlapping.getDiffColor(val)`

CSS color of a gap: 'red' if > 0 (slower), 'green' if < 0, '' if zero.

- `val` (*number*) : Gap in ms.
- **returns**: string 'red', 'green' or ''.

#### `core_hotlapping.getTimeInfo()`

Time data formatted for the UI: {normal = summary per lap, detail = sections then lap}. The table is reused on every call.

- **returns**: table {normal, detail}.

#### `core_hotlapping.getTimeInfoRaw()`

Raw table of times per lap and section (see notes).

- **returns**: table times (internal reference).

#### `core_hotlapping.load(originalFilename)`

Loads a circuit from gameplay/hotlapping/<level>/<name>.race.json; failing that, looks for the old format in settings/hotlapping (files whose path contains the name). Then stops the timer, clears, restarts hotlapping mode and notifies the UI.

- `originalFilename` (*string*) : Circuit name without extension.

#### `core_hotlapping.newRaceLapSkipped(state, info)`

New system hook: the current lap was skipped; marks it 'skipped' and resets the checkpoint to 1 if state.skippedLap.

- `state` (*table*) : Vehicle state.
- `info` (*table*) : Not used.

#### `core_hotlapping.newRacePathnodeReached(state, info)`

New system hook: player passes a pathnode. Ends the race if state.complete, otherwise advances lap/checkpoint (ignores recoveries) and updates the times.

- `state` (*table*) : Vehicle state in the race (complete, events).
- `info` (*table*) : Passing info (lapped).

#### `core_hotlapping.newRaceStart(race)`

New race system hook: starts tracking (closed race, laps from 1, clock = race.time*1000) and detects branching circuits (comparisons disabled).

- `race` (*table*) : Race object (time, path.pathnodes, path.config.branching).

#### `core_hotlapping.onCheckPointPassed(index)`

Intended for passing a checkpoint (legacy freeroam mode): if index is the next expected one, advances the lap/checkpoint counter. No call in this file.

- `index` (*integer*) : Index of the passed checkpoint (0 = start line).

#### `core_hotlapping.onGameStateUpdate(...)`

Game state change hook: forces the next send to the UI.

- `...` (*any*) : Not used.

#### `core_hotlapping.onMenuToggled(...)`

Menu open/close hook: forces the next send to the UI.

- `...` (*any*) : Not used.

#### `core_hotlapping.onPreRender(dt, dtSim)`

Render hook: in edit mode, draws spheres, vertical columns (the first in orange) and direction arrows of the checkpoints; otherwise renders the race markers.

- `dt` (*number*) : Render time delta in seconds.
- `dtSim` (*number*) : Simulation time delta.

#### `core_hotlapping.onRaceResult(final)`

Old system hook: race end; stops the timer and stores the detailed times in scenario.detailedTimes.

- `final` (*any*) : Not used.

#### `core_hotlapping.onRaceWaypointReached(wpInfo)`

Old system hook: the player reached a waypoint. Handles race end, lap change (lapDiff == 1) or checkpoint change and updates the times. Ignores the other vehicles.

- `wpInfo` (*table*) : {vehicleId, next, lapDiff, …}.

#### `core_hotlapping.onScreenFadeState(...)`

Screen fade hook: forces the next send to the UI.

- `...` (*any*) : Not used.

#### `core_hotlapping.onUpdate(dt, dtSim)`

Per-frame hook: starts the race when the player enters the first checkpoint, handles pause, updates the race and the total time, then sends the state to the UI.

- `dt` (*number*) : Real-time delta in seconds.
- `dtSim` (*number*) : Simulation time delta.

#### `core_hotlapping.onVehicleResetted(id)`

Vehicle reset hook: if the player is reset near (less than 80 m) the start during a race, stops the AI and puts it back at its start point.

- `id` (*integer*) : Vehicle id.

#### `core_hotlapping.refreshTracklist()`

Lists the available circuits (current level, plus older ones in settings/hotlapping) without extension.

- **returns**: string[] Circuit names (alphanumeric characters, '-' and '_' before the first other character).

#### `core_hotlapping.rename(oldName, newName)`

Renames a circuit of the current level (<old>.race.json -> <new>.race.json).

- `oldName` (*string*) : Old name without extension.
- `newName` (*string*) : New name without extension.

#### `core_hotlapping.save(filePath)`

Saves the circuit as JSON (gameplay/hotlapping/<level>/<date>.race.json by default), sends HotlappingSuccessfullySaved to the UI. Refuses if the path is invalid.

- `filePath` (*string|nil*) : Output path; default dated in the current level's folder.

#### `core_hotlapping.setTime(ignoreNewLap)`

Updates the current times: creates the lap and checkpoint record if needed, closes the previous one, computes durations, gaps relative to the best lap and updates the best lap (comparisons disabled for branching races).

- `ignoreNewLap` (*any*) : Not used in the code.

#### `core_hotlapping.setVisible(value)`

Shows or hides the race markers and mutes/unmutes the checkpoint sound.

- `value` (*boolean*) : true = visible.

#### `core_hotlapping.skipLap(keepLapProgress)`

Skips the current lap (marked 'skipped' in the times) via raceData:skipLap for the player vehicle.

- `keepLapProgress` (*boolean|nil*) : Passed to raceData:skipLap: whether or not to keep the progress within the lap (inferred from code).

#### `core_hotlapping.stopAi(respawn)`

Stops the vehicles marked isHotlapping (ai.setMode('stop')) and, if respawn, puts them back at their saved position (recovery.loadHome).

- `respawn` (*boolean|nil*) : true = put the vehicles back to their 'home'.

**UI events (guihooks.trigger):** `HotlappingResetApp`, `HotlappingSuccessfullyLoaded`, `HotlappingSuccessfullySaved`, `HotlappingTimer`, `HotlappingTimerPause`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`
- `be:` `getEnabled`, `getObjectOOBBCenterXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/hotlapping.lua`.*
