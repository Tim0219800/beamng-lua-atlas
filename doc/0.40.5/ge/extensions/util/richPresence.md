# `util_richPresence`

*File: `lua/ge/extensions/util/richPresence.lua` · VM: Game Engine (GE) · 729 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_richPresence`: `extensions.load("util_richPresence")`, then the global `util_richPresence`

Manages the game's "rich presence": the status shown in Steam (rich presence and Steam timeline), the UDS activity (startActivityByID) and the Discord status. It infers the current activity (replay, photo mode, career and its sub-modes, garage, mission, scenario, drag, crawl, drift, level, main menu) and the status text (for example "Playing X on Level with Brand Model"), and it adds events to the Steam timeline (crash, rollover, attempt, race lap, result...). The set and setActivity functions are replaced by nop when the feature is disabled (development builds or richPresence setting false).

## Example

```lua
print(extensions.util_richPresence.set('yolo'))
```

## Notes

- Rich presence is only active for a release build (window title containing RELEASE and "shipping" build) or if UDS exists, and if the richPresence setting is true; the richPresenceDiscord setting controls Discord.
- M.set is defined only by enableToggleableFunctions (called at the end of the file or in onSettingsChanged); without that it is nil until then.
- Activities are identifiers (challenge_type_*, level_*, career_*, freeroam_*, main_menu, etc.); an unknown mission type or level falls back to challenge_generic or level_generic.
- The "gridmap" level corresponds to the level_gridmap_v2 activity in the activities table, but getCurrentActivity builds "level_" + level identifier: a level whose identifier is gridmap_v2 is recognized, gridmap alone is not.
- Steam timeline events registered via gameplay_statistic.callbackRegister: vehicle/crash, vehicle/airtime.time (range), vehicle/rollover, vehicle/jturn, drift/crashes.
- Steam timeline game modes used: 1 playing, 2 setup/editor, 3 menu, 4 loading screen.
- The hooks onDragReset, onDragDataSet, onDragClear, onDragClearComplete, onCrawlStarted, onCrawlCleared, onDriftContextChanged, onCareerActive, onDeliveryModeStarted/Stopped, onPartShopping*, onScenarioChange and onWorldReadyState simply recompute the activity.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_richPresence.clientEndMission(levelpath)` | Hook called at the end of a level: sets the Steam timeline to loading screen mode (4). *(internal)* | 526 |
| `util_richPresence.clientPreStartMission(levelpath)` | Hook called before a level starts: sets the Steam timeline to loading screen mode (4). *(internal)* | 526 |
| `util_richPresence.onAnyMissionChanged()` | Hook called when a mission changes: updates the message and the activity. *(internal)* *(hook)* | 398 |
| `util_richPresence.onAttemptCompleted(attemptData)` | Hook called on attempt success: "Completed" event in the Steam timeline. *(internal)* *(hook)* | 616 |
| `util_richPresence.onAttemptFailed(attemptData)` | Hook called on attempt failure: "Failed" event in the Steam timeline. *(internal)* *(hook)* | 606 |
| `util_richPresence.onCareerActive()` | Hook: recomputes the activity when the career becomes active. *(internal)* *(hook)* | 230 |
| `util_richPresence.onClientPostStartMission(levelPath)` | Hook called after a level starts: stores the level's identifier and readable name, updates the message and the activity. *(internal)* *(hook)* | 357 |
| `util_richPresence.onCrawlCleared()` | Hook: recomputes the activity at the end of a crawl course. *(internal)* *(hook)* | 242 |
| `util_richPresence.onCrawlStarted()` | Hook: recomputes the activity at the start of a crawl course. *(internal)* *(hook)* | 241 |
| `util_richPresence.onDeliveryModeStarted()` | Hook: recomputes the activity at the start of delivery mode. *(internal)* *(hook)* | 231 |
| `util_richPresence.onDeliveryModeStopped()` | Hook: recomputes the activity at the end of delivery mode. *(internal)* *(hook)* | 232 |
| `util_richPresence.onDragClear()` | Hook: recomputes the activity when drag data is cleared. *(internal)* *(hook)* | 239 |
| `util_richPresence.onDragClearComplete()` | Hook: recomputes the activity once the drag clearing is complete. *(internal)* *(hook)* | 240 |
| `util_richPresence.onDragDataSet()` | Hook: recomputes the activity when drag data is set. *(internal)* *(hook)* | 238 |
| `util_richPresence.onDragReset()` | Hook: recomputes the activity on drag reset. *(internal)* *(hook)* | 237 |
| `util_richPresence.onDriftContextChanged()` | Hook: recomputes the activity when the drift context changes. *(internal)* *(hook)* | 243 |
| `util_richPresence.onEditorActivated()` | Hook called when the editor opens: message "Using World Editor" and Steam game mode 2. *(internal)* *(hook)* | 379 |
| `util_richPresence.onEditorDeactivated()` | Hook called when the editor closes: updates the message and resets the Steam game mode to 1. *(internal)* *(hook)* | 386 |
| `util_richPresence.onExtensionLoaded()` | Called on load: initializes Steam and Discord rich presence according to the settings and registers the statistics callbacks for the Steam timeline. *(internal)* *(hook)* | 440 |
| `util_richPresence.onExtensionUnloaded()` | Called on unload: clears the Steam status and the Discord activity and removes the statistics callbacks. *(internal)* *(hook)* | 460 |
| `util_richPresence.onGameStateUpdate(state)` | Hook called when the game state changes: updates the message and the activity. *(internal)* *(hook)* | 393 |
| `util_richPresence.onMissionAttemptAggregated(attempt, mission)` | Hook called when a mission attempt is aggregated: "Mission <type>" event with the mission name in the Steam timeline. *(internal)* *(hook)* | 669 |
| `util_richPresence.onNewAttempt(attemptData)` | Hook called at the start of an attempt: "New attempt" event in the Steam timeline. *(internal)* *(hook)* | 596 |
| `util_richPresence.onPartShoppingCancelled()` | Hook: recomputes the activity when a part purchase is canceled. *(internal)* *(hook)* | 236 |
| `util_richPresence.onPartShoppingStarted()` | Hook: recomputes the activity at the start of a part shopping session. *(internal)* *(hook)* | 233 |
| `util_richPresence.onPartShoppingTransactionComplete()` | Hook: recomputes the activity after a part shopping transaction. *(internal)* *(hook)* | 234 |
| `util_richPresence.onRaceBranchChosen(data)` | Hook called when a race branch is chosen: "Race branch" event in the Steam timeline. *(internal)* *(hook)* | 647 |
| `util_richPresence.onRaceLap(data)` | Hook called at the end of a lap: "Race lap N" event with the time formatted as mm:ss.mmm in the Steam timeline. *(internal)* *(hook)* | 636 |
| `util_richPresence.onRaceResult(data)` | Hook called on race result: "Race Result" event with the formatted final time in the Steam timeline. *(internal)* *(hook)* | 658 |
| `util_richPresence.onRaceWaypointReached(data)` | Hook called when passing a race checkpoint: "Race waypoint" event in the Steam timeline. *(internal)* *(hook)* | 626 |
| `util_richPresence.onResetGameplay()` | Hook called on gameplay reset: adds a "reset" event to the Steam timeline. *(internal)* *(hook)* | 586 |
| `util_richPresence.onScenarioChange()` | Hook: recomputes the activity on scenario change. *(internal)* *(hook)* | 235 |
| `util_richPresence.onSettingsChanged()` | Hook called when settings change: enables or disables rich presence (Steam, Discord, set/setActivity) according to richPresence and richPresenceDiscord. *(internal)* *(hook)* | 493 |
| `util_richPresence.onUiChangedState(toState, fromState)` | Hook called when the UI state changes: updates the game mode and the state description of the Steam timeline. *(internal)* *(hook)* | 562 |
| `util_richPresence.onUiReady()` | Hook called when the UI is ready: infers the Steam game mode (menu, loading, setup, playing) from the current state and updates the activity. *(internal)* *(hook)* | 533 |
| `util_richPresence.onVehicleSwitched(oldId, newId, player)` | Hook called when the player vehicle changes: rereads the vehicle's name and brand (info.json) and updates the message. *(internal)* *(hook)* | 339 |
| `util_richPresence.onWorldReadyState(levelpath)` | Hook: recomputes the activity when the world state changes. *(internal)* *(hook)* | 244 |
| `util_richPresence.set(v)` | Sets the Steam rich presence text (key 'b'); returns success. Replaced by nop if rich presence is disabled. (dynamically assigned) | dyn |
| `util_richPresence.setActivity(activityId)` | Starts a UDS activity by identifier if it differs from the last one sent. Replaced by nop if disabled. (dynamically assigned) | dyn |

### Parameter details

#### `util_richPresence.clientEndMission(levelpath)`

Hook called at the end of a level: sets the Steam timeline to loading screen mode (4).

- `levelpath` (*string*) : Level path

#### `util_richPresence.clientPreStartMission(levelpath)`

Hook called before a level starts: sets the Steam timeline to loading screen mode (4).

- `levelpath` (*string*) : Level path

#### `util_richPresence.onAttemptCompleted(attemptData)`

Hook called on attempt success: "Completed" event in the Steam timeline.

- `attemptData` (*table*) : Attempt data (not used)

#### `util_richPresence.onAttemptFailed(attemptData)`

Hook called on attempt failure: "Failed" event in the Steam timeline.

- `attemptData` (*table*) : Attempt data (not used)

#### `util_richPresence.onClientPostStartMission(levelPath)`

Hook called after a level starts: stores the level's identifier and readable name, updates the message and the activity.

- `levelPath` (*string*) : Level path

#### `util_richPresence.onGameStateUpdate(state)`

Hook called when the game state changes: updates the message and the activity.

- `state` (*table*) : New state (not used directly)

#### `util_richPresence.onMissionAttemptAggregated(attempt, mission)`

Hook called when a mission attempt is aggregated: "Mission <type>" event with the mission name in the Steam timeline.

- `attempt` (*table*) : Attempt (type field used)
- `mission` (*table*) : Mission (name field used)

#### `util_richPresence.onNewAttempt(attemptData)`

Hook called at the start of an attempt: "New attempt" event in the Steam timeline.

- `attemptData` (*table*) : Attempt data (not used)

#### `util_richPresence.onRaceBranchChosen(data)`

Hook called when a race branch is chosen: "Race branch" event in the Steam timeline.

- `data` (*table*) : Branch data (not used)

#### `util_richPresence.onRaceLap(data)`

Hook called at the end of a lap: "Race lap N" event with the time formatted as mm:ss.mmm in the Steam timeline.

- `data` (*table*) : Contains lap (lap number) and time (seconds)

#### `util_richPresence.onRaceResult(data)`

Hook called on race result: "Race Result" event with the formatted final time in the Steam timeline.

- `data` (*table*) : Contains finalTime (seconds)

#### `util_richPresence.onRaceWaypointReached(data)`

Hook called when passing a race checkpoint: "Race waypoint" event in the Steam timeline.

- `data` (*table*) : Checkpoint data (not used)

#### `util_richPresence.onUiChangedState(toState, fromState)`

Hook called when the UI state changes: updates the game mode and the state description of the Steam timeline.

- `toState` (*string*) : New state (menu.*, loading, scenario-*, other)
- `fromState` (*string*) : Old state

#### `util_richPresence.onVehicleSwitched(oldId, newId, player)`

Hook called when the player vehicle changes: rereads the vehicle's name and brand (info.json) and updates the message.

- `oldId` (*integer*) : Old vehicle id
- `newId` (*integer*) : New vehicle id
- `player` (*integer*) : Player index

#### `util_richPresence.onWorldReadyState(levelpath)`

Hook: recomputes the activity when the world state changes.

- `levelpath` (*string*) : Level path (not used)

#### `util_richPresence.set(v)`

Sets the Steam rich presence text (key 'b'); returns success. Replaced by nop if rich presence is disabled. (dynamically assigned)

- `v` (*any*) : Text to display (converted with tostring)
- **returns**: boolean|nil true on success (return value of OnlineServiceProvider.setRichPresence)

#### `util_richPresence.setActivity(activityId)`

Starts a UDS activity by identifier if it differs from the last one sent. Replaced by nop if disabled. (dynamically assigned)

- `activityId` (*string*) : Activity identifier (see the activities table in the file)

## Fields

| Field | Type | Description |
|---|---|---|
| `onDeserialized` | function | nop (do not remove, according to the code comment) |
| `richPresenceEnabled` | boolean | true if the set/setActivity functions are active |
| `state` | table | {levelName, vehicleName, levelIdentifier, vehicleJbeam?}: state used to compose the message |

## Calls into the engine (C++)

- `Steam.` `timelineAddEvent`, `timelineSetGameMode`, `timelineSetStateDescription`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/richPresence.lua`.*
