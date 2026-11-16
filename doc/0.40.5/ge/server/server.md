# `server`

*File: `lua/ge/server/server.lua` · VM: Game Engine (GE) · 424 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `server`

Loading and unloading of a level on the game's "server" side (solo/freeroam mode). `createGame` opens the loading screen then runs the complete sequence: datablocks and materials, creation of the physics world, loading of the level objects (main/ JSON folder, or old .mis format), decals, starting the physics, creation of the camera and the player, then fade-out. `destroy` does the reverse. The duration of each step is logged.

## Example

```lua
server.createGame('/levels/gridmap_v2/info.json')
-- command line: server.setLevelOffset(100, 0, 0) before loading shifts the whole level
```

## Notes

- Bug: M.loadingProgress is copied at module import while the local variable is assigned later (createGameActual); the exported field is therefore always nil.
- Emitted hooks: onClientCustomObjectSpawning (after loading the objects), onPlayerCameraReady (after player spawn), onLoadingScreenFadeout (end of loading). UI event: MenuHide (fadeoutLoadingScreen with skipStart).
- Do not remove the VariableRegistry.set('$loadingLevel', ...): used on the C++ side.
- If the level is not found or there is no MissionGroup, createGameActual logs an error and stops without a fade-out.
- Non-exported local functions: endMission (cleans MissionGroup, MissionCleanup, decals, audio…) and patchLoadingContext (applies the level offset).

## Functions

| Function | Description | Line |
|---|---|---|
| `server.createGame(levelPath, customLoadingFunction)` | Loads a level. Requests the loading screen from core_gamestate, then runs createGameActual (datablocks, materials, objects, physics, camera and player spawn). If customLoadingFunction is given, the fade-out is delayed: that function must call server.fadeoutLoadingScreen. | 405 |
| `server.destroy(p)` | Destroys the session: sets $missionRunning to false, ends the level (endMission), destroys the physics world, deletes the datablocks and increments $Server::Session. | 376 |
| `server.fadeoutLoadingScreen(skipStart)` | Finishes the loading: requests leaving the loading screen, calls clientPostStartMission/clientStartMission (unless skipStart), ends the loading, emits onLoadingScreenFadeout and logs the duration. No effect (warning) if no loading is in progress. | 338 |
| `server.setLevelOffset(x, y, z)` | Sets a global offset applied to the tile transform of the next loaded level. Calling without an argument removes the offset; with incomplete arguments, logs an error. | 61 |

### Parameter details

#### `server.createGame(levelPath, customLoadingFunction)`

Loads a level. Requests the loading screen from core_gamestate, then runs createGameActual (datablocks, materials, objects, physics, camera and player spawn). If customLoadingFunction is given, the fade-out is delayed: that function must call server.fadeoutLoadingScreen.

- `levelPath` (*string*) : level path (info.json, .mis or folder/level name; lowercased)
- `customLoadingFunction` (*function|nil*) : called instead of the automatic fade-out

#### `server.destroy(p)`

Destroys the session: sets $missionRunning to false, ends the level (endMission), destroys the physics world, deletes the datablocks and increments $Server::Session.

- `p` (*table|nil*) : optional profiler exposing :add(name) to mark the steps

#### `server.fadeoutLoadingScreen(skipStart)`

Finishes the loading: requests leaving the loading screen, calls clientPostStartMission/clientStartMission (unless skipStart), ends the loading, emits onLoadingScreenFadeout and logs the duration. No effect (warning) if no loading is in progress.

- `skipStart` (*boolean|nil*) : if true, skips clientPostStartMission/clientStartMission and triggers guihooks MenuHide

#### `server.setLevelOffset(x, y, z)`

Sets a global offset applied to the tile transform of the next loaded level. Calling without an argument removes the offset; with incomplete arguments, logs an error.

- `x` (*number|nil*) : X offset in meters; nil cancels the offset
- `y` (*number|nil*) : Y offset in meters
- `z` (*number|nil*) : Z offset in meters

## Fields

| Field | Type | Description |
|---|---|---|
| `loadingProgress` | any | Exported at module initialization, hence nil (see notes); the real value is the local LoadingManager handle. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onClientCustomObjectSpawning` — listened to by 2 module(s)
- `onLoadingScreenFadeout` — listened to by 7 module(s)
- `onPlayerCameraReady` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `MenuHide`

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`
- `Sim.` `deserializeObjectsFromFile`
- `TorqueScriptLua.` `exec`
- `be:` `decalManagerLoad`, `deleteDataBlocks`, `physicsDestroyWorld`, `physicsInitWorld`, `physicsStartSimulation`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/server/server.lua`.*
