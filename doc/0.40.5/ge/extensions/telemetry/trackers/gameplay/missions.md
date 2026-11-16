# `telemetry_trackers_gameplay_missions`

*File: `lua/ge/extensions/telemetry/trackers/gameplay/missions.lua` · VM: Game Engine (GE) · 190 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_gameplay_missions`: `extensions.load("telemetry_trackers_gameplay_missions")`, then the global `telemetry_trackers_gameplay_missions`

Mission telemetry tracker: follows the funnel (which missions start, how they are configured, how they end). The "missionRunning" activity carries the duration; one-off events report the click on Start, the opening of the start/end screens, each finished attempt, restarts, reconfigurations and abandonments.

## Notes

- Never put a "name" key in the activity data: it would replace the activity name and the start and end events could no longer be matched.
- The start/end screen nodes are also used outside missions (split-screen modes): events are only counted during a mission.
- A mission built on the endScreenWhole node never triggers onEndScreenUIOpened; the results come from onMissionAttemptAggregated.
- Activity end outcomes: stopped, abandoned, trackerUnloaded.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom)` | Hook called when the mission actually runs, for all start paths (including those that load a level first). Starts the missionRunning activity. startedFrom: missionScreen (in level), gameplaySelector, discover, withinMission (new attempt, next mission or reconfiguration from the end screen); starts from career tutorials, activity flows, multiplayer or scenarios give "other". *(internal)* *(hook)* | 24 |
| `telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission)` | Hook called before any mission stop, including the instant stop on a level change, a return to the menu or a career start (which skips onMissionStopped). Ends the activity with the outcome "stopped". *(internal)* *(hook)* | 163 |
| `telemetry_trackers_gameplay_missions.onEndScreenUIOpened()` | Hook called when the end screen opens: emits missionEndScreenOpened (without a result). *(internal)* *(hook)* | 67 |
| `telemetry_trackers_gameplay_missions.onExtensionLoaded()` | Hook called on load: manual unload. *(internal)* *(hook)* | 169 |
| `telemetry_trackers_gameplay_missions.onExtensionUnloaded()` | Hook called on unload (game close, Lua reload, tracker disabled): ends the activity with the outcome trackerUnloaded. *(internal)* *(hook)* | 176 |
| `telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer)` | Hook called when the mission is closed prematurely: emits missionAbandoned (byPlayer, attemptsCompleted, which is 0 if no attempt was finished) and ends the activity with the outcome "abandoned". byPlayer is false when the game itself closes the mission, for example after a vehicle spawn failure. *(internal)* *(hook)* | 149 |
| `telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey)` | Hook called when an attempt is recorded (the only moment the full result exists as one table): emits missionAttemptCompleted (outcome, number, stars, time, penalty, points, vehicle model and config). The filled fields depend on the mission type. *(internal)* *(hook)* | 87 |
| `telemetry_trackers_gameplay_missions.onMissionReconfigured(data)` | Hook called when a mission's settings change: emits missionReconfigured with only the modified settings. *(internal)* *(hook)* | 130 |
| `telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id)` | Hook called on click of a recovery message button: if id is restartMission, emits missionRestarted. *(internal)* *(hook)* | 121 |
| `telemetry_trackers_gameplay_missions.onStartScreenFinishedBuilding()` | Hook called when the start screen is built: emits missionStartScreenOpened only once per mission. *(internal)* *(hook)* | 110 |
| `telemetry_trackers_gameplay_missions.onUIStartButtonClicked()` | Hook called on click of the Start button: emits missionStartButtonClicked (only during a mission). *(internal)* *(hook)* | 56 |

### Parameter details

#### `telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom)`

Hook called when the mission actually runs, for all start paths (including those that load a level first). Starts the missionRunning activity. startedFrom: missionScreen (in level), gameplaySelector, discover, withinMission (new attempt, next mission or reconfiguration from the end screen); starts from career tutorials, activity flows, multiplayer or scenarios give "other".

- `state` (*string*) : State; only "started" is taken into account.
- `mission` (*table*) : Mission (must have _isOngoing).
- `userSettings` (*table*) : Player settings for the mission.
- `startedFrom` (*string|nil*) : Origin of the start.

#### `telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission)`

Hook called before any mission stop, including the instant stop on a level change, a return to the menu or a career start (which skips onMissionStopped). Ends the activity with the outcome "stopped".

- `state` (*string*) : Only "stopped" is taken into account.
- `mission` (*table*) : Mission concerned.

#### `telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer)`

Hook called when the mission is closed prematurely: emits missionAbandoned (byPlayer, attemptsCompleted, which is 0 if no attempt was finished) and ends the activity with the outcome "abandoned". byPlayer is false when the game itself closes the mission, for example after a vehicle spawn failure.

- `mission` (*table*) : Mission.
- `byPlayer` (*boolean*) : true if the player abandoned.

#### `telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey)`

Hook called when an attempt is recorded (the only moment the full result exists as one table): emits missionAttemptCompleted (outcome, number, stars, time, penalty, points, vehicle model and config). The filled fields depend on the mission type.

- `attempt` (*table*) : Attempt (type, attemptNumber, unlockedStars, data).
- `mission` (*table*) : Mission.
- `progressKey` (*string*) : Progress key.

#### `telemetry_trackers_gameplay_missions.onMissionReconfigured(data)`

Hook called when a mission's settings change: emits missionReconfigured with only the modified settings.

- `data` (*table*) : {mission, oldUserSettings, newUserSettings}

#### `telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id)`

Hook called on click of a recovery message button: if id is restartMission, emits missionRestarted.

- `id` (*string*) : Button identifier.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/gameplay/missions.lua`.*
