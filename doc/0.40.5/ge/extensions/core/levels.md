# `core_levels`

*File: `lua/ge/extensions/core/levels.lua` · VM: Game Engine (GE) · 597 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_levels`: `extensions.load("core_levels")`, then the global `core_levels`

GE extension `core_levels`: catalog of levels (folders in /levels/), reading of their info.json, and launching a level (startLevel). A modder uses it to list the available maps (including those from mods), find a map's title or preview, or load a map by script. The list is computed once (slow disk read) then cached; the cache is invalidated when a file under /levels/ changes.

## Example

```lua
local lvl = core_levels.getLevelByName('west_coast_usa')
if lvl then log('I','', lvl.title .. ' ' .. tostring(lvl.supportsTraffic)) end
-- load a map (the folder or the .level.json file)
core_levels.startLevel('/levels/gridmap_v2/')
```

## Notes

- getList() walks /levels/: the list entries are the info.json tables enriched (levelName, dir, misFilePath, fullfilename, modID, modName, modTitle, official, previews, spawnPoints, minimap, multiseat.maxPlayers, supportsTraffic, supportsTimeOfDay). The info.json keys not listed are kept as is.
- A level without an entry point (main/ folder, old main file, or a .mis) is ignored with an error in the log. If a level exists as .level.json and as .mis, only the json version is kept.
- The /levels/mod_info folder is ignored. The obsolete `hidden` flag of info.json is converted to `isAuxiliary` with a warning.
- The preview paths (`previews`, `spawnPoints[].previews`, `minimap[].file`) are prefixed with the level folder. Levels without `previews` have their `title` overwritten by the folder name (levelName), even if info.json had a title.
- Probable bug in getList: the call `imageExistsDefault(l.dirEntry..'.png', imageExistsDefault(l.dirEntry..'_preview.png'))` nests the 2nd call as the default value of the first instead of passing it two distinct arguments (inferred from code).
- getLevelPreview writes a `print` line on every uncached call, which pollutes the log.
- The title, preview and time-of-day options caches are keyed by lowercase level name; the lookup by name is case-insensitive.
- startLevel does nothing if a 'levels' loading is already in progress. If a level is already loaded (scenetree.MissionCleanup exists), it disconnects first, then loads. The spawnVehicle parameter is stored in a local variable and consumed by maybeSpawnDefaultVehicle.
- onGetRawPoiListForLevel does not check that levelInfo is non-nil: an unknown level would cause an error (levelInfo.spawnPoints).

**Dependencies (loaded first):** `freeroam_levelStats`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_levels.expandMissionFileName(missionFileName)` | Resolves a level file name: returns as is an existing folder, otherwise the expanded file if it exists, otherwise tries the .level.json and .mis variants. | 443 |
| `core_levels.getLevelByName(levelName)` | Looks up a level by its folder name, case-insensitively. | 246 |
| `core_levels.getLevelName(path)` | Extracts the level name from a path of the form '/levels/<name>/...'. | 512 |
| `core_levels.getLevelNames()` | Returns only the names (levelName) of the levels, in getList order. | 225 |
| `core_levels.getLevelPaths()` | Returns the level folders, each ending with '/'. | 233 |
| `core_levels.getLevelPreview(levelName)` | Returns the first preview image path of the level. Result cached; writes a line to the log on every computation. | 281 |
| `core_levels.getLevelTitle(levelName)` | Returns the level's displayable title (title field, otherwise levelName). Result cached. | 256 |
| `core_levels.getList()` | Returns the array of all valid levels, sorted by name case-insensitively. Built on the first call (slow, disk access) then cached. Returns {} if /levels/ does not exist. | 74 |
| `core_levels.getListWithStats()` | Returns the levels list with the UI statistics provided by freeroam_levelStats. | 567 |
| `core_levels.getSimpleList()` | Alias of getLevelNames, kept for compatibility. | 225 |
| `core_levels.getTimeOfDayOptions(levelName)` | Returns the time-of-day choices offered for the level (taken from core_environment.getDefaultTimeOfDayOptions), only if the level has supportsTimeOfDay. Sorted: values > 0.5 first (ascending), then values <= 0.5 (ascending). | 311 |
| `core_levels.isListLoaded()` | Indicates whether the levels list cache is already built. | 220 |
| `core_levels.maybeSpawnDefaultVehicle()` | Spawns the player vehicle ('thePlayer') chosen via startLevel (or the default vehicle) at the 'player' spawn point, adds it to MissionCleanup and MissionGroup and marks it canSave = false. Called by the level loading flow. *(internal)* | 382 |
| `core_levels.onClientPostStartMission()` | Hook called after a level starts on the client side: regenerates all DecalRoads in the scene. *(internal)* *(hook)* | 434 |
| `core_levels.onFilesChanged(files)` | Hook called when files change. If a path starts with '/levels/', clears all caches and sends the list back to the interface (onLevelsChanged). *(internal)* *(hook)* | 359 |
| `core_levels.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook to collect a level's points of interest: adds to `elements` a POI of type spawnPoint (big map marker, fast travel) for each spawnPoint that has an objectname found in the scene. In career mode, only discovered points are added. *(internal)* *(hook)* | 539 |
| `core_levels.requestData()` | Alias of notifyUI: sends to the interface the list with statistics via guihooks.trigger('onLevelsChanged', levels, uiStats). | 241 |
| `core_levels.startLevel(levelPath, delayedStart, customLoadingFunction, spawnVehicle)` | Loads a level with the 'levels' loading screen. Disconnects first if a level is already loaded. Ignored if a loading is already in progress. | 516 |

### Parameter details

#### `core_levels.expandMissionFileName(missionFileName)`

Resolves a level file name: returns as is an existing folder, otherwise the expanded file if it exists, otherwise tries the .level.json and .mis variants.

- `missionFileName` (*string*) : Level path (folder, .mis, .level.json or without extension).
- **returns**: string|nil Existing path found, or nil (no explicit return).

#### `core_levels.getLevelByName(levelName)`

Looks up a level by its folder name, case-insensitively.

- `levelName` (*string*) : Level name (e.g. 'west_coast_usa').
- **returns**: table|nil The getList entry, or nil if not found.

#### `core_levels.getLevelName(path)`

Extracts the level name from a path of the form '/levels/<name>/...'.

- `path` (*string*) : Virtual path containing levels/<name>/.
- **returns**: string|nil Level name, or nil if the pattern does not match.

#### `core_levels.getLevelNames()`

Returns only the names (levelName) of the levels, in getList order.

- **returns**: string[] Level folder names.

#### `core_levels.getLevelPaths()`

Returns the level folders, each ending with '/'.

- **returns**: string[] Paths like '/levels/gridmap_v2/'.

#### `core_levels.getLevelPreview(levelName)`

Returns the first preview image path of the level. Result cached; writes a line to the log on every computation.

- `levelName` (*string|nil*) : Level name.
- **returns**: string|nil Image path, or nil.

#### `core_levels.getLevelTitle(levelName)`

Returns the level's displayable title (title field, otherwise levelName). Result cached.

- `levelName` (*string|nil*) : Level name; nil returns nil.
- **returns**: string|nil Title, or nil if the level is unknown.

#### `core_levels.getList()`

Returns the array of all valid levels, sorted by name case-insensitively. Built on the first call (slow, disk access) then cached. Returns {} if /levels/ does not exist.

- **returns**: table[] List of level infos (enriched info.json, see notes).

#### `core_levels.getListWithStats()`

Returns the levels list with the UI statistics provided by freeroam_levelStats.

- **returns**: table { levels = getList(), uiStats = freeroam_levelStats.getUiStats() }

#### `core_levels.getSimpleList()`

Alias of getLevelNames, kept for compatibility.

- **returns**: string[] Level folder names.

#### `core_levels.getTimeOfDayOptions(levelName)`

Returns the time-of-day choices offered for the level (taken from core_environment.getDefaultTimeOfDayOptions), only if the level has supportsTimeOfDay. Sorted: values > 0.5 first (ascending), then values <= 0.5 (ascending).

- `levelName` (*string|nil*) : Level name; nil returns {}.
- **returns**: table[] Elements { key, value, label }. Empty if unsupported or level unknown.

#### `core_levels.isListLoaded()`

Indicates whether the levels list cache is already built.

- **returns**: boolean true if getList has already been computed and not invalidated since.

#### `core_levels.onFilesChanged(files)`

Hook called when files change. If a path starts with '/levels/', clears all caches and sends the list back to the interface (onLevelsChanged).

- `files` (*table[]*) : Elements with a filename field.

#### `core_levels.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook to collect a level's points of interest: adds to `elements` a POI of type spawnPoint (big map marker, fast travel) for each spawnPoint that has an objectname found in the scene. In career mode, only discovered points are added.

- `levelIdentifier` (*string*) : Level name.
- `elements` (*table[]*) : POI list to complete (modified in place).

#### `core_levels.startLevel(levelPath, delayedStart, customLoadingFunction, spawnVehicle)`

Loads a level with the 'levels' loading screen. Disconnects first if a level is already loaded. Ignored if a loading is already in progress.

- `levelPath` (*string*) : Level folder or main.level.json file (converted to a folder if the file does not exist).
- `delayedStart` (*boolean|nil*) : If true, first ends the active game mode (endActiveGameMode) then loads.
- `customLoadingFunction` (*function|nil*) : Passed to server.createGame to replace the standard loading (inferred from code).
- `spawnVehicle` (*table|false|nil*) : Vehicle to spawn on load: { model, options }; false = none; nil = default vehicle.
- **returns**: any Result of the disconnection or loading; false if the path is invalid; nil otherwise.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: { "freeroam_levelStats" }. |
| `levelsDir` | string | Always '/levels/', kept for compatibility with old scripts. |

**UI events (guihooks.trigger):** `onLevelsChanged`

## Calls into the engine (C++)

- `FS:` `directoryExists`, `expandFilename`, `fileExists`, `findFiles`
- `core_environment.` `getDefaultTimeOfDayOptions`
- `obj:` `getPosition`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/levels.lua`.*
