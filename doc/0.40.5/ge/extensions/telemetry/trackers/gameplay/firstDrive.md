# `telemetry_trackers_gameplay_firstDrive`

*File: `lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua` · VM: Game Engine (GE) · 189 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_gameplay_firstDrive`: `extensions.load("telemetry_trackers_gameplay_firstDrive")`, then the global `telemetry_trackers_gameplay_firstDrive`

"First Drive" tutorial telemetry tracker: the session (activity "firstDriveActive"), its lessons (started, stopped, completed, with duration) and the vehicle recoveries made during the session. Outside a session, only a "firstDriveProgress" snapshot (completed lessons, read from settings/firstDriveLearning.json) is sent, at most once per survey interval or when the progress changes.

## Notes

- Vehicle changes (vehicleUsed) and resets (vehicleReset) come from the vehicle tracker and are not repeated here; a recovery also triggers trackVehReset so it also appears as a vehicleReset.
- Session end reasons (onFirstDriveEnded): completed, skipToFreeroam, mainMenu, startFailed, clientEndMission; internally also restarted (restart from the pause menu) and trackerUnloaded.
- Lesson stop reasons: pauseMenu when the player stops it, otherwise leftArea, leftStartArea, sessionEnded, completionFailed or a reason specific to the lesson (e.g. vehicleChanged).
- Default survey interval: 7 days (24*7 h) via telemetry_configManager.getSurveyIntervalHours; the last survey sent is stored in surveys/firstDriveSurvey.json of the telemetry data folder.
- Extension in manual unload: the core unloads the trackers before their onExit, so the session end is done in onExtensionUnloaded.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_gameplay_firstDrive.onExtensionLoaded()` | Hook called on load: manual unload, then possible send of the progress snapshot. *(internal)* *(hook)* | 171 |
| `telemetry_trackers_gameplay_firstDrive.onExtensionUnloaded()` | Hook called on unload (game close, Lua reload or tracker disabled): ends the session with the reason trackerUnloaded. *(internal)* *(hook)* | 179 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason)` | Hook called when First Drive ends: ends the activity; if reason is completed, also emits firstDriveCompleted with the duration. *(internal)* *(hook)* | 120 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id)` | Hook called when a lesson is passed: emits firstDriveLessonCompleted with duration. *(internal)* *(hook)* | 153 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id)` | Hook called at the start of a lesson: emits firstDriveLessonStarted (ignored outside a session). *(internal)* *(hook)* | 124 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason)` | Hook called when a lesson is interrupted: emits firstDriveLessonStopped with reason and duration. *(internal)* *(hook)* | 149 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout)` | Hook called when First Drive starts (also on a restart from the pause menu, which closes the previous session): starts the firstDriveActive activity with completed lessons. *(internal)* *(hook)* | 104 |
| `telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer)` | Hook called when vehicle recovery stops: emits firstDriveVehicleRecovered with the hold duration, the phase and the lesson (ignored during the recovery preview). *(internal)* *(hook)* | 157 |

### Parameter details

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason)`

Hook called when First Drive ends: ends the activity; if reason is completed, also emits firstDriveCompleted with the duration.

- `reason` (*string*) : completed, skipToFreeroam, mainMenu, startFailed or clientEndMission.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id)`

Hook called when a lesson is passed: emits firstDriveLessonCompleted with duration.

- `id` (*string*) : Lesson identifier.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id)`

Hook called at the start of a lesson: emits firstDriveLessonStarted (ignored outside a session).

- `id` (*string*) : Lesson identifier.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason)`

Hook called when a lesson is interrupted: emits firstDriveLessonStopped with reason and duration.

- `id` (*string*) : Lesson identifier.
- `reason` (*string*) : Reason for the stop.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout)`

Hook called when First Drive starts (also on a restart from the pause menu, which closes the previous session): starts the firstDriveActive activity with completed lessons.

- `startAtLookout` (*boolean*) : true if the start is at the viewpoint.

#### `telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer)`

Hook called when vehicle recovery stops: emits firstDriveVehicleRecovered with the hold duration, the phase and the lesson (ignored during the recovery preview).

- `timer` (*number*) : Hold duration in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Calls into the engine (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua`.*
