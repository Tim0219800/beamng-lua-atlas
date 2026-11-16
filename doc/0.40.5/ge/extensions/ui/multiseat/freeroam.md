# `ui_multiseat_freeroam`

*File: `lua/ge/extensions/ui/multiseat/freeroam.lua` · VM: Game Engine (GE) · 353 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_multiseat_freeroam`: `extensions.load("ui_multiseat_freeroam")`, then the global `ui_multiseat_freeroam`

Manages the multi-seat session (split screen) in freeroam: choice of suggested vehicles, spawn plan (level positions, otherwise a group of nearby parking spots, otherwise road), opening the multiseat settings, enabling/disabling split screen and traffic, exit to solo mode, and restoration after a UI or Lua reload. A level can provide mainLevel.getMultiseatSuggestedVehicles(playerCount) and mainLevel.getMultiseatSpawnPositions(playerCount), or multiseat.suggestedVehicles in info.json.

## Notes

- The positions returned by mainLevel.getMultiseatSpawnPositions can be {parkingSpot}, a parking object (with moveResetVehicleTo) or {pos, rot}; at least one per player is required, otherwise the fallback plan (parking) is used.
- The parking plan looks for a group of free standard-size spots within a 30 m radius (PARKING_CLUSTER_RADIUS) large enough for all players; otherwise the vehicles are placed on the road via reconcileFreeroamVehicles.
- Reason codes returned by startSplitscreenFreeroam: no_players, vehicle_assignment_failed, vehicle_spawn_failed.
- onSerialize returns {restoreAsFreeroam = true} only if the session (or a gamemode) is active; onUiReady then restores the multiseat setting, the split screen and the "multiseat" UI route.
- exitMultiseat keeps player 0's vehicle, deletes the others, disables multiseat (settings multiseat = false) and unloads render_splitScreen and gameplay_traffic_source.

**Dependencies (loaded first):** `gameplay_city`, `gameplay_parking`, `gameplay_traffic`, `ui_multiseat_multiseatSettings`, `ui_multiseat_multiseatVehicles`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_multiseat_freeroam.activate()` | Loads gameplay_multiseat_gamemodeManager and marks the multiseat freeroam session as active. | 109 |
| `ui_multiseat_freeroam.deactivate()` | Marks the session as inactive and cancels any pending restoration. | 114 |
| `ui_multiseat_freeroam.exitMultiseat(options)` | Returns to solo freeroam: stops the multiseat gamemode, optionally applies an assignment cache (options.assignmentCache), stops drag races and a non-mission crawl, deletes all vehicles except player 0's, clears the session, turns off multiseat and gives the vehicle back to player 0 with the game camera. | 191 |
| `ui_multiseat_freeroam.isActive()` | Returns whether the multiseat freeroam session is active. | 119 |
| `ui_multiseat_freeroam.onClientEndMission()` | Hook called at the end of the level; deactivates the session and cancels any restoration. *(internal)* *(hook)* | 343 |
| `ui_multiseat_freeroam.onDeserialized(data)` | Hook called after a Lua reload; if the restoreAsFreeroam marker is present, calls restoreAfterReload. *(internal)* *(hook)* | 295 |
| `ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result)` | Hook called when the multiseat settings have been applied. Activates the session; with more than one player, loads render_splitScreen, gives it the players and adds the players to the traffic sources; with a single player, unloads split screen and traffic. Then closes the menu. No effect if result.success == false or result.exitAfterApply == true. *(internal)* *(hook)* | 164 |
| `ui_multiseat_freeroam.onMultiseatSettingsClosed()` | Hook called when the multiseat settings are closed; does nothing here. *(internal)* *(hook)* | 250 |
| `ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton)` | Pause menu home rail hook: adds the buttons "home.changeMultiseatSettings" (opens pause.multiseatSettings) and "home.exitMultiseat" (confirmation, then exitMultiseat and return to "play"). Nothing is added if neither the session nor a multiseat gamemode is active. *(internal)* *(hook)* | 253 |
| `ui_multiseat_freeroam.onSerialize(reason)` | Hook called before a Lua reload; returns {restoreAsFreeroam = true} if a session is active, otherwise nothing. *(internal)* *(hook)* | 280 |
| `ui_multiseat_freeroam.onUiReady()` | Hook called when the UI is ready; if a restoration is pending, restores multiseat, the split screen, the traffic and reloads the "multiseat" UI route (set as the game route). *(internal)* *(hook)* | 304 |
| `ui_multiseat_freeroam.openSettings()` | Starts a multiseat configuration (source "settings") and navigates to the route "pause.multiseatSettings". If navigation fails, the configuration is abandoned. | 155 |
| `ui_multiseat_freeroam.restoreAfterReload()` | Marks the session active and queues a restoration, executed at the next onUiReady. *(internal)* | 123 |
| `ui_multiseat_freeroam.startSplitscreenFreeroam(levelName)` | Starts freeroam in split screen: assigns each registered player a vehicle suggested for the level, builds a spawn plan (level, then parking, otherwise road), spawns the vehicles and activates the session on success. If spawning fails, the vehicles are removed. | 129 |

### Parameter details

#### `ui_multiseat_freeroam.exitMultiseat(options)`

Returns to solo freeroam: stops the multiseat gamemode, optionally applies an assignment cache (options.assignmentCache), stops drag races and a non-mission crawl, deletes all vehicles except player 0's, clears the session, turns off multiseat and gives the vehicle back to player 0 with the game camera.

- `options` (*table|nil*) : Options; assignmentCache = player assignments to cache before exiting.
- **returns**: boolean false if the session was not active or the cache could not be saved, otherwise true.

#### `ui_multiseat_freeroam.isActive()`

Returns whether the multiseat freeroam session is active.

- **returns**: boolean true if active.

#### `ui_multiseat_freeroam.onDeserialized(data)`

Hook called after a Lua reload; if the restoreAsFreeroam marker is present, calls restoreAfterReload.

- `data` (*table*) : Data returned by onSerialize.

#### `ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result)`

Hook called when the multiseat settings have been applied. Activates the session; with more than one player, loads render_splitScreen, gives it the players and adds the players to the traffic sources; with a single player, unloads split screen and traffic. Then closes the menu. No effect if result.success == false or result.exitAfterApply == true.

- `changeSet` (*table*) : Applied changes (unused here).
- `result` (*table*) : Application result (success, exitAfterApply).

#### `ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton)`

Pause menu home rail hook: adds the buttons "home.changeMultiseatSettings" (opens pause.multiseatSettings) and "home.exitMultiseat" (confirmation, then exitMultiseat and return to "play"). Nothing is added if neither the session nor a multiseat gamemode is active.

- `actions` (*table*) : List of actions to complete.
- `_context` (*table*) : Context (unused).
- `registerButton` (*function*) : Function that registers a button and its callback.

#### `ui_multiseat_freeroam.onSerialize(reason)`

Hook called before a Lua reload; returns {restoreAsFreeroam = true} if a session is active, otherwise nothing.

- `reason` (*string*) : Serialization reason (log).
- **returns**: table|nil Restoration marker.

#### `ui_multiseat_freeroam.openSettings()`

Starts a multiseat configuration (source "settings") and navigates to the route "pause.multiseatSettings". If navigation fails, the configuration is abandoned.

- **returns**: boolean false if navigation failed, otherwise true.

#### `ui_multiseat_freeroam.startSplitscreenFreeroam(levelName)`

Starts freeroam in split screen: assigns each registered player a vehicle suggested for the level, builds a spawn plan (level, then parking, otherwise road), spawns the vehicles and activates the session on success. If spawning fails, the vehicles are removed.

- `levelName` (*string*) : Level name, used to find the suggested vehicles.
- **returns**: boolean true if everything succeeded.
- **returns**: string|nil Failure reason (see notes).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: gameplay_city, gameplay_parking, gameplay_traffic, ui_multiseat_multiseatSettings, ui_multiseat_multiseatVehicles. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSplitScreenStartRequested` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `onDragRaceTimeslipData`, `onDragReset`

## Calls into the engine (C++)

- `be:` `enterVehicle`

**Loads extensions:** `gameplay_multiseat_gamemodeManager`, `gameplay_traffic_source`, `render_splitScreen`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/multiseat/freeroam.lua`.*
