# `gameplay_sites_sitesManager`

*File: `lua/ge/extensions/gameplay/sites/sitesManager.lua` · VM: Game Engine (GE) · 134 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_sites_sitesManager`: `extensions.load("gameplay_sites_sitesManager")`, then the global `gameplay_sites_sitesManager`

Extension that lists the *.sites.json files of each level, loads them into "sites" objects (locations, zones, parking spots) and caches them. Scenarios, missions and traffic go through it to get a map's sites. Keeps a cache per file path, cleared at the end of the mission.

## Example

```lua
local sites = gameplay_sites_sitesManager.loadSites(gameplay_sites_sitesManager.getCurrentLevelSitesFileByName('parking'))
```

## Notes

- getCurrentLevelSitesFileByName compares the name to the private file's name minus its last 11 characters (".sites.json" + 1: string.sub(siteName, 0, -12)); the name passed must therefore have no extension.
- getCurrentLevelSitesFiles ignores its "name" parameter.
- getBestParkingSpotForVehicleFromList returns the last spot of the list as a last resort (and crashes if the list is empty).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_sites_sitesManager.getAllLevelSites()` | Walks the levels (core_levels.getList) and rebuilds the table of *.sites.json files per level (key = lowercase level name). Logs the number of files found. | 13 |
| `gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots)` | Returns the first spot where the vehicle fits (vehicleFits) and that is not occupied by any vehicle (hasAnyVehicles), otherwise the last one in the list. | 121 |
| `gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name)` | Finds the current level's sites file whose name (without ".sites.json") matches. | 112 |
| `gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name)` | List of the current level's sites files (getCurrentLevelIdentifier). | 108 |
| `gameplay_sites_sitesManager.getSitesFilesByLevel()` | Returns the level -> list of sites files table (builds it if needed). | 104 |
| `gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache)` | Loads a .sites.json file and returns the sites object (deserialized and finalized). Uses the cache if present, unless force. Adds site.dir and site.filename. | 30 |
| `gameplay_sites_sitesManager.onClientEndMission()` | Hook called at the end of the mission: clears the sites cache. *(internal)* *(hook)* | 62 |
| `gameplay_sites_sitesManager.onClientStartMission()` | Hook called at the start of a mission/level: stores the current level. *(internal)* *(hook)* | 58 |
| `gameplay_sites_sitesManager.onDeserialized(data)` | Restores the state after a Lua reload. *(internal)* *(hook)* | 89 |
| `gameplay_sites_sitesManager.onModManagerReady()` | Hook called when the mod manager is ready: builds the list of sites files. *(internal)* *(hook)* | 54 |
| `gameplay_sites_sitesManager.onSerialize()` | Serializes the file list, the current level and the cache for the Lua reload. Returns nil if nothing is cached. *(internal)* *(hook)* | 73 |

### Parameter details

#### `gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots)`

Returns the first spot where the vehicle fits (vehicleFits) and that is not occupied by any vehicle (hasAnyVehicles), otherwise the last one in the list.

- `vehId` (*integer|nil*) : Vehicle; default the player 0 vehicle.
- `parkingSpots` (*table[]*) : List of parkingSpot objects.
- **returns**: table Chosen spot.

#### `gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name)`

Finds the current level's sites file whose name (without ".sites.json") matches.

- `name` (*string*) : File name without extension.
- **returns**: string|nil Full path or nil.

#### `gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name)`

List of the current level's sites files (getCurrentLevelIdentifier).

- `name` (*any*) : Unused.
- **returns**: string[] Paths, empty table if none.

#### `gameplay_sites_sitesManager.getSitesFilesByLevel()`

Returns the level -> list of sites files table (builds it if needed).

- **returns**: table<string, string[]> Files per level.

#### `gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache)`

Loads a .sites.json file and returns the sites object (deserialized and finalized). Uses the cache if present, unless force. Adds site.dir and site.filename.

- `filepath` (*string*) : Path of the .sites.json file.
- `force` (*boolean|nil*) : Reload even if cached.
- `ignoreCache` (*boolean|nil*) : Do not store the result in the cache.
- **returns**: table|nil Sites object, or nil if the file is unreadable (error logged).

#### `gameplay_sites_sitesManager.onDeserialized(data)`

Restores the state after a Lua reload.

- `data` (*table|nil*) : Data from onSerialize.

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/sites/sitesManager.lua`.*
