# `core_loadMapCmd`

*File: `lua/ge/extensions/core/loadMapCmd.lua` · VM: Game Engine (GE) · 148 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_loadMapCmd`: `extensions.load("core_loadMapCmd")`, then the global `core_loadMapCmd`

GE extension `core_loadMapCmd`: executes the 'openMap' launch command (link of the form beamng:v1/openMap/{level:"levels/gridmap/info.json",camPos:[x,y,z],camRot:[x,y,z,w]}). It waits for the mod manager to be ready, starts the requested level in freeroam, then, once the world is ready, places the free camera, sets the FOV, the time and optionally loads a track (trackBuilder). A modder rarely uses it directly, but can call set() to open a map with a given camera.

## Example

```lua
core_loadMapCmd.set({
  level = 'levels/gridmap_v2/info.json',
  camPos = {0, 0, 100},
  camRot = {0, 0, 0, 1},
  fov = 70,
  timeOfDay = 0.5,
})
```

## Notes

- Fields of the `data` table of set: level (required, string like 'levels/<name>/info.json'), camPos {x,y,z}, camRot {x,y,z,w} (quaternion), fov (degrees, used if > 0), timeOfDay (number passed to core_environment.setTimeOfDay), track (path of a track passed to util/trackBuilder/splineTrack.load).
- parseMapPath only keeps the first two useful segments: 'levels/gridmap/info.json' or '/levels/gridmap/info.json' gives 'levels/gridmap/'. If data.level is nil, split crashes: always provide level.
- The level is only launched when the target exists, or when the mod manager is ready (core_modmanager.isReady): a level coming from a mod can therefore be mounted before being tested. If the map still does not exist, an error toast 'map not found, you may need to add a mod' is displayed.
- If the game is already in freeroam on the same map, the level is not relaunched; onWorldReadyState(2) is called directly to apply the camera, the time, etc.
- The ignoreStartupCmd flag is set to true during a Lua reload (onSerialize), so that the startup command is not replayed: set(data, true) is then ignored.
- onUpdate calls changeMapWhenModManagerReady on every frame as long as args.mapName is defined; once launched, args.mapName is set to nil and the call does nothing anymore.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_loadMapCmd.onClientPostStartMission()` | Hook called after a level starts; does nothing. *(internal)* *(hook)* | 89 |
| `core_loadMapCmd.onDeserialized(d)` | After a Lua reload: restores the ignoreStartupCmd flag. *(internal)* *(hook)* | 133 |
| `core_loadMapCmd.onExtensionLoaded()` | Hook called when the extension loads; does nothing. *(internal)* *(hook)* | 79 |
| `core_loadMapCmd.onExtensionUnloaded()` | Hook called when the extension unloads; does nothing. *(internal)* *(hook)* | 82 |
| `core_loadMapCmd.onModManagerReady()` | Hook emitted by core_modmanager when the mods are mounted: retries the map change. *(internal)* *(hook)* | 85 |
| `core_loadMapCmd.onSerialize()` | Before a Lua reload: returns { ignoreStartupCmd = true } so the launch command is not replayed. *(internal)* *(hook)* | 129 |
| `core_loadMapCmd.onUpdate(dtReal, dtSim, dtRaw)` | Hook called on every frame: retries the map change as long as it is pending. *(internal)* *(hook)* | 93 |
| `core_loadMapCmd.onWorldReadyState(state)` | Hook called when the world state changes. At state 2 (world ready), applies camPos/camRot (free camera), fov, timeOfDay and loads the requested track, then forgets the command. *(internal)* *(hook)* | 97 |
| `core_loadMapCmd.set(data, startCmd)` | Registers a map opening command and tries to launch it (the map starts as soon as the target exists and the mods are ready). | 64 |

### Parameter details

#### `core_loadMapCmd.onDeserialized(d)`

After a Lua reload: restores the ignoreStartupCmd flag.

- `d` (*table*) : Table returned by onSerialize.

#### `core_loadMapCmd.onSerialize()`

Before a Lua reload: returns { ignoreStartupCmd = true } so the launch command is not replayed.

- **returns**: table { ignoreStartupCmd = true }

#### `core_loadMapCmd.onUpdate(dtReal, dtSim, dtRaw)`

Hook called on every frame: retries the map change as long as it is pending.

- `dtReal` (*number*) : Elapsed real time (s), unused.
- `dtSim` (*number*) : Elapsed simulation time (s), unused.
- `dtRaw` (*number*) : Raw time (s), unused.

#### `core_loadMapCmd.onWorldReadyState(state)`

Hook called when the world state changes. At state 2 (world ready), applies camPos/camRot (free camera), fov, timeOfDay and loads the requested track, then forgets the command.

- `state` (*integer*) : Loading step; only the value 2 triggers the action.

#### `core_loadMapCmd.set(data, startCmd)`

Registers a map opening command and tries to launch it (the map starts as soon as the target exists and the mods are ready).

- `data` (*table|nil*) : See notes: { level, camPos, camRot, fov, timeOfDay, track }. nil: does nothing.
- `startCmd` (*boolean|nil*) : True if the command comes from the startup command line: ignored after a Lua reload.

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`
- `core_environment.` `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/loadMapCmd.lua`.*
