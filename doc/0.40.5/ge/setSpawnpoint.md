# `setSpawnpoint`

*File: `lua/ge/setSpawnpoint.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `setSpawnpoint`

Stores and rereads the default spawn point chosen for each level. The data is stored in settings/cloud/game-state.json (key levels[levelName].defaultSpawnPointName, plus lastLevelName). It is used by spawn.pickSpawnPoint and by the level selection menu.

## Example

```lua
setSpawnpoint.setDefaultSP('spawn_garage', 'gridmap_v2')
print(setSpawnpoint.loadDefaultSpawnpoint('gridmap_v2'))
```

## Notes

- In setDefaultSP, 'levelName:lower() or core_levels.getLevelName(...)' can never use the fallback: if levelName is nil, the :lower() call already raises an error. levelName must always be provided.
- In loadDefaultSpawnpoint, the error message uses 'levelname' (lowercase, nonexistent variable) instead of 'levelName': it always displays 'nil'.
- loadDefaultSpawnpoint always returns a string (empty '' if nothing) and not nil: an 'if result then' test is therefore always true (see spawn.pickSpawnPoint).
- The file's logTag is 'spawn.lua' (copied from spawn.lua), so the logs appear under that name.

## Functions

| Function | Description | Line |
|---|---|---|
| `setSpawnpoint.getLastLevelName()` | Reads lastLevelName from the save file. | 58 |
| `setSpawnpoint.loadDefaultSpawnpoint(levelName)` | Returns the name of the level's default spawn point: the one recorded by the user if it is in the spawnPoints list of the level's info file and exists in the scene, otherwise defaultSpawnPointName from the level's info file, otherwise ''. | 30 |
| `setSpawnpoint.setDefaultSP(defaultSPName, levelName)` | Records in settings/cloud/game-state.json the default spawn point for a level and remembers this level as the last level. Logs a warning if the write fails. | 14 |

### Parameter details

#### `setSpawnpoint.getLastLevelName()`

Reads lastLevelName from the save file.

- **returns**: string|nil Name of the last level recorded by setDefaultSP, nil if absent.

#### `setSpawnpoint.loadDefaultSpawnpoint(levelName)`

Returns the name of the level's default spawn point: the one recorded by the user if it is in the spawnPoints list of the level's info file and exists in the scene, otherwise defaultSpawnPointName from the level's info file, otherwise ''.

- `levelName` (*string|nil*) : Level name (current level by default, via core_levels.getLevelName(getMissionFilename())).
- **returns**: string Name (editor name) of the spawn point, or ''; also '' if the level's info file is unreadable.

#### `setSpawnpoint.setDefaultSP(defaultSPName, levelName)`

Records in settings/cloud/game-state.json the default spawn point for a level and remembers this level as the last level. Logs a warning if the write fails.

- `defaultSPName` (*string*) : Name (editor name) of the spawn point.
- `levelName` (*string*) : Level name (converted to lowercase).

## Fields

| Field | Type | Description |
|---|---|---|
| `settingsFilePath` | string | Path of the JSON save file: 'settings/cloud/game-state.json'. |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/setSpawnpoint.lua`.*
