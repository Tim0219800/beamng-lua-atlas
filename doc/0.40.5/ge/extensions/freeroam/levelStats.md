# `freeroam_levelStats`

*File: `lua/ge/extensions/freeroam/levelStats.lua` · VM: Game Engine (GE) · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_levelStats`: `extensions.load("freeroam_levelStats")`, then the global `freeroam_levelStats`

Usage statistics of levels and spawn points for the UI: counts how many times each level/spawn point was launched and when. The data is persisted in `/settings/cloud/uiStats.json` (`levels` table with count, lastUsed, spawnPoints, and `vehicles` table). Global: freeroam_levelStats.

## Notes

- The default spawn point has no name: it is stored under the internal name `__default__` and returned with spawnPointName=nil.
- Dates are in ISO 8601 UTC (os.date '!%Y-%m-%dT%H:%M:%SZ').
- Every recordLevelSpawn rewrites the whole JSON file.
- The sorted lists put the most recently used item first, then the others by decreasing launch count (ties: most recent first).

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_levelStats.getTopLevels()` | Levels sorted by usage (last used first, then by count). | 34 |
| `freeroam_levelStats.getTopSpawnPoints(levelName)` | A level's spawn points sorted the same way. | 52 |
| `freeroam_levelStats.getUiStats()` | Groups topLevels and topSpawnPoints (the spawn points of all levels, concatenated, with no level name). | 70 |
| `freeroam_levelStats.recordLevelSpawn(levelName, spawnPointName)` | Increments the counter and the date of the level and of the spawn point, then saves the stats file. | 16 |

### Parameter details

#### `freeroam_levelStats.getTopLevels()`

Levels sorted by usage (last used first, then by count).

- **returns**: table List of {levelName, count, lastUsed}.

#### `freeroam_levelStats.getTopSpawnPoints(levelName)`

A level's spawn points sorted the same way.

- `levelName` (*string*) : Level name.
- **returns**: table List of {spawnPointName|nil, count, lastUsed}.

#### `freeroam_levelStats.getUiStats()`

Groups topLevels and topSpawnPoints (the spawn points of all levels, concatenated, with no level name).

- **returns**: table {topLevels, topSpawnPoints}

#### `freeroam_levelStats.recordLevelSpawn(levelName, spawnPointName)`

Increments the counter and the date of the level and of the spawn point, then saves the stats file.

- `levelName` (*string*) : Level name.
- `spawnPointName` (*string|nil*) : Spawn point name; nil = default point.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/levelStats.lua`.*
