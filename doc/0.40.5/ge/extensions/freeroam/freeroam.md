# `freeroam_freeroam`

*File: `lua/ge/extensions/freeroam/freeroam.lua` · VM: Game Engine (GE) · 419 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_freeroam`: `extensions.load("freeroam_freeroam")`, then the global `freeroam_freeroam`

"Freeroam" game mode (free roam): starts a level in freeroam, applies the spawn options (traffic, parked vehicles, time of day, date, time flow), launches the flowgraphs associated with the level, handles the player's reset and radar messages. A modder uses it to launch a level (startFreeroam / startFreeroamByName) or to preconfigure traffic and time via spawningOptionsHelper before launch. Global: freeroam_freeroam.

## Example

```lua
freeroam_freeroam.spawningOptionsHelper.trafficMode = 'enabled'
freeroam_freeroam.spawningOptionsHelper.trafficAmount = 10
freeroam_freeroam.spawningOptionsHelper.timeOfDay = 0.5 -- noon
freeroam_freeroam.startFreeroamByName('gridmap_v2')
```

## Notes

- M.state.freeroamActive is set to true on start and set back to false in onClientEndMission.
- The environment options (timeOfDay, date, timePlay) are reset to default after being applied in onClientPostStartMission. The rest is only reset if resetSpawningOptions is called (field resetOptionsAfterStartingFreeroam not read in this file).
- If a level is already loaded (scenetree.MissionGroup exists), the start is deferred: the game first ends the active game mode (endActiveGameMode) then calls startFreeroam again.
- The onFreeroamLoaded(levelPath) hook is emitted in onClientStartMission when freeroam is active.
- In onClientPostStartMission, the associated flowgraph is only launched if there is no active scenario.
- In onPlayerCameraReady, trafficMode 'fromSetting' (default value) is treated as "disabled" (only 'enabled' loads traffic), and the resetOptionsAfterStartingFreeroam field is not used in this file.

**Dependencies (loaded first):** `core_environment`

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_freeroam.onClientEndMission(levelPath)` | End-of-level hook: disables freeroamActive, removes the ExplorationCheckpointsActionMap action map and unloads mainLevel if loaded. *(internal)* *(hook)* | 301 |
| `freeroam_freeroam.onClientPostStartMission(levelPath)` | Hook after start: applies the date, time of day and time flow requested in spawningOptionsHelper, resets them to default, then launches the flowgraphs associated with the level (unless a scenario is active). *(internal)* *(hook)* | 224 |
| `freeroam_freeroam.onClientPreStartMission(levelPath)` | Hook before the level starts: loads the `mainLevel.lua` file from the level folder at the root if it exists and calls its onClientPreStartMission. *(internal)* *(hook)* | 187 |
| `freeroam_freeroam.onClientStartMission(levelPath)` | Hook when the level starts: if freeroam is active, emits onFreeroamLoaded(levelPath) and pushes the ExplorationCheckpointsActionMap action map if it exists. *(internal)* *(hook)* | 197 |
| `freeroam_freeroam.onPlayerCameraReady()` | Hook called when the player camera is ready: if freeroam is active, decides on traffic and parked vehicles based on spawningOptionsHelper and the trafficParkedVehicles setting, then calls gameplay_traffic.setupTrafficHelper. Does nothing if the level does not support traffic. *(internal)* *(hook)* | 118 |
| `freeroam_freeroam.onRedLightCamTriggered(speedTrapData, playerSpeed)` | Red light camera hook: in freeroam for the player vehicle, displays a message with the license plate. *(internal)* *(hook)* | 393 |
| `freeroam_freeroam.onResetGameplay(playerID)` | Player reset hook: ignored in scenario, campaign, recovery prompt, blocking flowgraph or multiplayer session; otherwise spawn.safeReset if the enableSmartRecovery setting is active, else be:resetVehicle. *(internal)* *(hook)* | 324 |
| `freeroam_freeroam.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | Speed trap hook: in freeroam, if the subject is the player vehicle, records the record in gameplay_speedTrapLeaderboards and displays the speed and record messages (ui_message). *(internal)* *(hook)* | 370 |
| `freeroam_freeroam.onTrafficOrParkingReady()` | Hook called when traffic/parked vehicles are ready: removes the "traffic" loading screen. *(internal)* *(hook)* | 181 |
| `freeroam_freeroam.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: while worldReadyState is 0, initializes the camera (commands.initCamera) and switches to the free camera if there is no player vehicle. *(internal)* *(hook)* | 354 |
| `freeroam_freeroam.onVehicleSpawned(vehID)` | Vehicle spawn hook: resets the part highlights and calls core_vehicle_partmgmt.setNewParts. *(internal)* *(hook)* | 319 |
| `freeroam_freeroam.onVehicleSwitched(oldId, newId, player)` | Vehicle change hook: clears the part highlights of the old vehicle (core_vehicle_partmgmt.clearVehicleHighlights). *(internal)* *(hook)* | 315 |
| `freeroam_freeroam.resetSpawningOptions()` | Resets spawningOptionsHelper to its default values (deep copy of the initial state). | 31 |
| `freeroam_freeroam.startFreeroam(level, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)` | Starts freeroam on a level: shows the loading screen, unloads the automatic extensions, loads the preset extensions, empties the action filter, then core_levels.startLevel. If a level is already loaded, waits for it to finish. | 83 |
| `freeroam_freeroam.startFreeroamByName(levelName, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)` | Finds the level by name (core_levels.getLevelByName) and calls startFreeroam. | 109 |
| `freeroam_freeroam.startTrackBuilder(levelName, forceLoad)` | Loads the trackbuilder_trackBuilder extension and calls its enter(levelName, forceLoad). | 343 |

### Parameter details

#### `freeroam_freeroam.onClientEndMission(levelPath)`

End-of-level hook: disables freeroamActive, removes the ExplorationCheckpointsActionMap action map and unloads mainLevel if loaded.

- `levelPath` (*string*) : Level path.

#### `freeroam_freeroam.onClientPostStartMission(levelPath)`

Hook after start: applies the date, time of day and time flow requested in spawningOptionsHelper, resets them to default, then launches the flowgraphs associated with the level (unless a scenario is active).

- `levelPath` (*string*) : Level path.

#### `freeroam_freeroam.onClientPreStartMission(levelPath)`

Hook before the level starts: loads the `mainLevel.lua` file from the level folder at the root if it exists and calls its onClientPreStartMission.

- `levelPath` (*string*) : Level path.

#### `freeroam_freeroam.onClientStartMission(levelPath)`

Hook when the level starts: if freeroam is active, emits onFreeroamLoaded(levelPath) and pushes the ExplorationCheckpointsActionMap action map if it exists.

- `levelPath` (*string*) : Level path.

#### `freeroam_freeroam.onRedLightCamTriggered(speedTrapData, playerSpeed)`

Red light camera hook: in freeroam for the player vehicle, displays a message with the license plate.

- `speedTrapData` (*table*) : Speed trap data.
- `playerSpeed` (*number*) : Speed (unused).

#### `freeroam_freeroam.onResetGameplay(playerID)`

Player reset hook: ignored in scenario, campaign, recovery prompt, blocking flowgraph or multiplayer session; otherwise spawn.safeReset if the enableSmartRecovery setting is active, else be:resetVehicle.

- `playerID` (*integer*) : Player (-1 = no vehicle).

#### `freeroam_freeroam.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)`

Speed trap hook: in freeroam, if the subject is the player vehicle, records the record in gameplay_speedTrapLeaderboards and displays the speed and record messages (ui_message).

- `speedTrapData` (*table*) : Speed trap data (speedLimit, subjectID...).
- `playerSpeed` (*number*) : Recorded speed (m/s, inferred from code).
- `overSpeed` (*number|boolean*) : Overspeed (inferred from code).

#### `freeroam_freeroam.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: while worldReadyState is 0, initializes the camera (commands.initCamera) and switches to the free camera if there is no player vehicle.

- `dtReal` (*number*) : Real duration (s).
- `dtSim` (*number*) : Simulated duration (s).
- `dtRaw` (*number*) : Raw duration (s).

#### `freeroam_freeroam.onVehicleSpawned(vehID)`

Vehicle spawn hook: resets the part highlights and calls core_vehicle_partmgmt.setNewParts.

- `vehID` (*integer*) : Vehicle id.

#### `freeroam_freeroam.onVehicleSwitched(oldId, newId, player)`

Vehicle change hook: clears the part highlights of the old vehicle (core_vehicle_partmgmt.clearVehicleHighlights).

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer*) : Player (unused).

#### `freeroam_freeroam.startFreeroam(level, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)`

Starts freeroam on a level: shows the loading screen, unloads the automatic extensions, loads the preset extensions, empties the action filter, then core_levels.startLevel. If a level is already loaded, waits for it to finish.

- `level` (*table|string*) : Level table (levelName, misFilePath) or level file path.
- `startPointName` (*string|nil*) : Spawn point name (only used if level is a table, via setSpawnpoint.setDefaultSP).
- `wasDelayed` (*boolean|nil*) : True when the call comes from a deferred start (not used in the active body).
- `spawnVehicle` (*boolean|nil*) : false = do not spawn a vehicle (clears the $beamngVehicle* variables).
- `customLoadingFunction` (*function|nil*) : Custom loading function passed to core_levels.startLevel.

#### `freeroam_freeroam.startFreeroamByName(levelName, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)`

Finds the level by name (core_levels.getLevelByName) and calls startFreeroam.

- `levelName` (*string*) : Level name.
- `startPointName` (*string|nil*) : Start point.
- `wasDelayed` (*boolean|nil*) : See startFreeroam.
- `spawnVehicle` (*boolean|nil*) : See startFreeroam.
- `customLoadingFunction` (*function|nil*) : See startFreeroam.
- **returns**: boolean true if the level exists.

#### `freeroam_freeroam.startTrackBuilder(levelName, forceLoad)`

Loads the trackbuilder_trackBuilder extension and calls its enter(levelName, forceLoad).

- `levelName` (*string*) : Level.
- `forceLoad` (*boolean|nil*) : Force the load.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_environment'} |
| `spawningOptionsHelper` | table | Launch options: trafficMode ('fromSetting'\|'disabled'\|'enabled'), trafficAmount (-1 auto, 0 none, N), trafficPolice ('disabled'\|'enabled'), trafficParked ('disabled'\|'enabled'), trafficParkedAmount (-1 auto), timeOfDay ('default'\|'current'\|'currentUtc'\|level key\|number 0..1), date (Unix epoch seconds), timePlay ('disabled'\|'level'\|'fast'\|'normal'\|'slow'\|'realtime'), resetOptionsAfterStartingFreeroam (boolean). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onFreeroamLoaded`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`, `resetVehicle`
- `core_environment.` `getAuthoredDayLength`, `getDayCycleSeconds`, `getTimeOfDay`, `getTimeOfDayOptions`, `setTimeOfDay`, `syncTimeToRealClock`, `syncTimeToRealClockUtc`
- `scenetree.` `findObject`

**Loads extensions:** `trackbuilder_trackBuilder`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/freeroam.lua`.*
