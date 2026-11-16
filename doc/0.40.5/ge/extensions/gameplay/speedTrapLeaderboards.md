# `gameplay_speedTrapLeaderboards`

*File: `lua/ge/extensions/gameplay/speedTrapLeaderboards.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_speedTrapLeaderboards`: `extensions.load("gameplay_speedTrapLeaderboards")`, then the global `gameplay_speedTrapLeaderboards`

Extension that keeps the speed camera leaderboards (top 10), per level and per camera (triggerName), in freeroam mode only. Leaderboards are loaded from settings/cloud/speedTrapLeaderboards/<level>.json at level start and saved at the end of the mission or before career mode activation. An entry contains speed (m/s), modelName (JBeam name) and date (UTC ISO 8601).

## Example

```lua
local isBest, board = gameplay_speedTrapLeaderboards.addRecord(data, vehSpeed, overSpeed, veh)
```

## Notes

- Automatic loading and saving only if the game state is "freeroam" and career is not active.
- Only levels marked "dirty" (new record added) are rewritten, unless forceOverwrite.
- onSerialize uses career_career.isActive() without checking that career_career exists; if the extension is absent, a Lua error is possible.
- The code comment notes the absence of an "onFreeroamStart" hook: loading is done on onClientPostStartMission.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh)` | Adds an entry to the current level's camera leaderboard if there is room (10 entries max) or if it beats the last entry, then sorts by descending speed. | 58 |
| `gameplay_speedTrapLeaderboards.getLeaderboards()` | Returns all leaderboards in memory. | 106 |
| `gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath)` | Clears memory then loads all *.json files of the folder; the file name without extension is used as the level name. | 21 |
| `gameplay_speedTrapLeaderboards.onBeforeCareerActivate()` | Hook called before career activation: in freeroam, saves. *(internal)* *(hook)* | 100 |
| `gameplay_speedTrapLeaderboards.onClientEndMission()` | Hook called at the end of the mission: in freeroam, saves the leaderboards. *(internal)* *(hook)* | 94 |
| `gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath)` | Hook called after a level starts: in freeroam, loads the leaderboards. *(internal)* *(hook)* | 88 |
| `gameplay_speedTrapLeaderboards.onDeserialized(data)` | Restores the state after a Lua reload. *(internal)* *(hook)* | 116 |
| `gameplay_speedTrapLeaderboards.onSerialize()` | Saves the state before a Lua reload (leaderboards and modified levels); returns nothing if career is active. *(internal)* *(hook)* | 110 |
| `gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite)` | Writes the modified leaderboards to disk (one file per level). | 35 |

### Parameter details

#### `gameplay_speedTrapLeaderboards.addRecord(speedTrapData, playerSpeed, overSpeed, veh)`

Adds an entry to the current level's camera leaderboard if there is room (10 entries max) or if it beats the last entry, then sorts by descending speed.

- `speedTrapData` (*table*) : Trigger data (uses triggerName).
- `playerSpeed` (*number*) : Vehicle speed in m/s.
- `overSpeed` (*number*) : Speed limit excess in m/s (not used for the entry).
- `veh` (*userdata*) : Vehicle object (its JBeam field gives the model).
- **returns**: boolean true if the speed equals or exceeds the leaderboard's best score.
- **returns**: table[] This camera's leaderboard, sorted.

#### `gameplay_speedTrapLeaderboards.getLeaderboards()`

Returns all leaderboards in memory.

- **returns**: table<string, table> level -> camera -> list of entries {speed, modelName, date}.

#### `gameplay_speedTrapLeaderboards.loadLeaderboards(folderPath)`

Clears memory then loads all *.json files of the folder; the file name without extension is used as the level name.

- `folderPath` (*string|nil*) : Folder; default settings/cloud/speedTrapLeaderboards/.

#### `gameplay_speedTrapLeaderboards.onClientPostStartMission(levelPath)`

Hook called after a level starts: in freeroam, loads the leaderboards.

- `levelPath` (*string*) : Level path.

#### `gameplay_speedTrapLeaderboards.onDeserialized(data)`

Restores the state after a Lua reload.

- `data` (*table*) : Table {leaderboards, dirtyLevels}.

#### `gameplay_speedTrapLeaderboards.saveLeaderboards(folderPath, forceOverwrite)`

Writes the modified leaderboards to disk (one file per level).

- `folderPath` (*string|nil*) : Folder; default settings/cloud/speedTrapLeaderboards/.
- `forceOverwrite` (*boolean|nil*) : Write all levels, even unmodified ones.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/speedTrapLeaderboards.lua`.*
