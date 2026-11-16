# `career_modules_spawnPoints`

*File: `lua/ge/extensions/career/modules/spawnPoints.lua` · VM: Game Engine (GE) · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_spawnPoints`: `extensions.load("career_modules_spawnPoints")`, then the global `career_modules_spawnPoints`

Discovery of a level's spawn points in career. Every second, if the player is driving an inventory vehicle, it tests the distance to undiscovered points (threshold 75 m); on discovery it adds a logbook entry (career_modules_logbook.spawnPointUnlocked), emits the onSpawnPointUnlocked(spawnPoint) hook and clears gameplay_rawPois. The state is saved in <save>/career/spawnPoints.json.

## Notes

- Data: table level -> spawn point object name -> true.
- The file is ignored (empty table) if the info.json version is < 42.
- No check is made during the tutorial.
- getSpawnPointTranslation is defined but never used.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_spawnPoints.getUnlockedSpawnpointsData()` | Returns the table of discovered points, per level. | 77 |
| `career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName)` | Indicates whether a spawn point is discovered (creates the level entry if needed). | 91 |
| `career_modules_spawnPoints.onCareerActive(active)` | Hook: loads the discovered points when the career becomes active. *(internal)* *(hook)* | 103 |
| `career_modules_spawnPoints.onExtensionLoaded()` | Hook: loads the discovered points if the career is already active (returns false otherwise). *(internal)* *(hook)* | 98 |
| `career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath)` | Save hook: writes spawnPoints.json to <save>/career/. *(internal)* *(hook)* | 109 |
| `career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: every second (accumulated dtReal), looks for an undiscovered point within 75 m of the player vehicle and unlocks it. *(internal)* *(hook)* | 28 |

### Parameter details

#### `career_modules_spawnPoints.getUnlockedSpawnpointsData()`

Returns the table of discovered points, per level.

- **returns**: table<string, table<string, boolean>> level -> point name -> true.

#### `career_modules_spawnPoints.isSpawnPointDiscovered(level, spawnPointName)`

Indicates whether a spawn point is discovered (creates the level entry if needed).

- `level` (*string*) : Level identifier.
- `spawnPointName` (*string*) : Point object name (objectname).
- **returns**: boolean|nil true if discovered, nil otherwise.

#### `career_modules_spawnPoints.onCareerActive(active)`

Hook: loads the discovered points when the career becomes active.

- `active` (*boolean*) : Nothing if false.

#### `career_modules_spawnPoints.onSaveCurrentProfile(currentSavePath)`

Save hook: writes spawnPoints.json to <save>/career/.

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_spawnPoints.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: every second (accumulated dtReal), looks for an undiscovered point within 75 m of the player vehicle and unlocks it.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulation time (s), unused.
- `dtRaw` (*number*) : Raw time (s), unused.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSpawnPointUnlocked`

## Calls into the engine (C++)

- `obj:` `getPosition`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/spawnPoints.lua`.*
