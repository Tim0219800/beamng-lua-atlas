# `gameplay_crawl_saveSystem`

*File: `lua/ge/extensions/gameplay/crawl/saveSystem.lua` · VM: Game Engine (GE) · 861 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_saveSystem`: `extensions.load("gameplay_crawl_saveSystem")`, then the global `gameplay_crawl_saveSystem`

File system of the crawl mode. It reads and writes the four types of JSON files of a level, in /levels/<level>/crawls/: *.trail.json (trail), *.boundary.json (boundary zone, gameplay/sites/zone object), *.path.json (path nodes) and *.startingPosition.json (starting position). Each object is loaded on demand then cached, with _filePath, _fileName, _dir and _ext added; an object's id is its file path. It also manages the player's scores per trail (best time, best penalty points, attempts), stored in settings/cloud/crawlTrails/ in freeroam or in the career profile (/career/crawlTrails/).

## Example

```lua
local trails = gameplay_crawl_saveSystem.getAllTrails()
local stats = gameplay_crawl_saveSystem.getPlayerTrailStats(trails[1]._filePath)
```

## Notes

- A trail/boundary/path/startingPosition id is the full file path; its extension must be .trail.json, .boundary.json, .path.json or .startingPosition.json, otherwise loadFromFile refuses.
- In a path, positions are {x,y,z} arrays in the JSON (position field) and vec3 in memory (pos field); rotations are {x,y,z,w} quaternions.
- Smaller = better: bestPenaltyPoints and bestTime equal math.huge as long as no score is recorded (test with < math.huge).
- The functions getAllBoundaries, getAllPaths and getAllStartingPositions take no levelPath and always list the current level; getAllTrails accepts a levelPath.
- getStartingPositionById(id, trail) returns nil if trail.isFromMission is true or if the id is empty.
- In career, scores are saved by onSaveCurrentProfile (if marked _dirty); outside career they are written immediately.
- Inconsistency: saveCrawlData only saves trails that have an id field, whereas loaded trails use _filePath as their identifier (the id field is not set by deserializeTrail).
- The cache is never automatically invalidated by a file change; use clearCache.
- The constants savePathFreeroam/savePathCareer at the top of the file are commented out (reserved for future use).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints)` | Records an attempt: updates the best time (if > 0 and better), the best penalty points (if >= 0 and lower) and increments the attempt count, then saves. | 774 |
| `gameplay_crawl_saveSystem.cleanup()` | Empties all caches. | 840 |
| `gameplay_crawl_saveSystem.clearCache(type)` | Empties the cache of one type ('trails', 'boundaries', 'paths' or 'startingPositions') or of all. | 67 |
| `gameplay_crawl_saveSystem.ensurePlayerSaveDirectories()` | Creates the freeroam save folder settings/cloud/crawlTrails/ if it does not exist. | 687 |
| `gameplay_crawl_saveSystem.getAllBoundaries()` | Loads all the boundary zones of the current level. | 646 |
| `gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath)` | Lists the *.boundary.json files. | 621 |
| `gameplay_crawl_saveSystem.getAllPathFiles(levelPath)` | Lists the *.path.json files. | 625 |
| `gameplay_crawl_saveSystem.getAllPaths()` | Loads all the paths of the current level. | 658 |
| `gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath)` | Lists the *.startingPosition.json files. | 629 |
| `gameplay_crawl_saveSystem.getAllStartingPositions()` | Loads all the starting positions of the current level. | 670 |
| `gameplay_crawl_saveSystem.getAllTrailFiles(levelPath)` | Lists the paths of the *.trail.json files in a folder (non-recursive). | 617 |
| `gameplay_crawl_saveSystem.getAllTrails(levelPath)` | Loads all the trails of a folder. | 634 |
| `gameplay_crawl_saveSystem.getBoundaryById(boundaryId)` | Loads (with cache) a boundary zone, created as a zone object then deserialized. | 569 |
| `gameplay_crawl_saveSystem.getCurrentLevelCrawlPath()` | Returns the folder of the crawl files of the current level. | 20 |
| `gameplay_crawl_saveSystem.getPathById(pathId)` | Loads (with cache) a path; the nodes have pos (vec3), rotation (quat), radius, flags, name. | 578 |
| `gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId)` | Returns the score data of a trail. | 723 |
| `gameplay_crawl_saveSystem.getPlayerCrawlTrailsById()` | Loads (once) the player's scores for all trails of the current level, from the freeroam folder or the career profile. | 727 |
| `gameplay_crawl_saveSystem.getPlayerTrailStats(trailId)` | Returns the player's statistics on a trail. | 827 |
| `gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail)` | Loads (with cache) a starting position. Returns nil for a trail from a mission or an empty id. | 587 |
| `gameplay_crawl_saveSystem.getTrailById(trailId)` | Loads (with cache) a trail from its file path. | 560 |
| `gameplay_crawl_saveSystem.isTrailFromMission(trail)` | Indicates whether a trail comes from a mission (isFromMission). | 857 |
| `gameplay_crawl_saveSystem.loadCrawlData(filename)` | Loads a crawl data file (name, description, icon, metadata, list of trail ids) and resolves each trail via getTrailById. | 428 |
| `gameplay_crawl_saveSystem.onCareerActive()` | Hook called when career changes state: forgets the loaded scores so they are re-read from the right folder. *(internal)* *(hook)* | 695 |
| `gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath)` | Hook called when saving the career profile: writes the modified trail scores (_dirty). *(internal)* *(hook)* | 705 |
| `gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId)` | Resets (math.huge, dates 0, attempts 0) a trail's scores and saves them. | 815 |
| `gameplay_crawl_saveSystem.saveBoundary(boundary, filePath)` | Writes a boundary zone as JSON (via boundary:onSerialize()) and caches it. | 322 |
| `gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath)` | Writes a crawl data file: metadata and trail ids (see notes on the id field). | 469 |
| `gameplay_crawl_saveSystem.savePath(path, filePath)` | Writes a path (list of nodes: name, position, rotation, radius 4.0 by default, flags) as JSON and caches it. | 357 |
| `gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId)` | Marks the trail's scores as modified; outside career, writes them immediately to settings/cloud/crawlTrails/. | 713 |
| `gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath)` | Writes a starting position (transform position/rotation/radius 10.0 by default, iconPosition, metadata) as JSON and caches it. | 392 |
| `gameplay_crawl_saveSystem.saveTrail(trail, filePath)` | Serializes a trail and writes it as JSON (creating the folder if needed), then caches it. | 287 |

### Parameter details

#### `gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints)`

Records an attempt: updates the best time (if > 0 and better), the best penalty points (if >= 0 and lower) and increments the attempt count, then saves.

- `trailId` (*string*) : Trail id.
- `time` (*number|nil*) : Time in seconds.
- `penaltyPoints` (*number|nil*) : Penalty points.
- **returns**: table|nil {isNewBestTime, isNewBestPenaltyPoints, bestTime, bestPenaltyPoints}; nil if the trail is unknown (mission trail).

#### `gameplay_crawl_saveSystem.clearCache(type)`

Empties the cache of one type ('trails', 'boundaries', 'paths' or 'startingPositions') or of all.

- `type` (*string|nil*) : Cache key; all caches if nil.

#### `gameplay_crawl_saveSystem.getAllBoundaries()`

Loads all the boundary zones of the current level.

- **returns**: table[] Zones.

#### `gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath)`

Lists the *.boundary.json files.

- `levelPath` (*string|nil*) : Folder; current level if nil.
- **returns**: string[] File paths.

#### `gameplay_crawl_saveSystem.getAllPathFiles(levelPath)`

Lists the *.path.json files.

- `levelPath` (*string|nil*) : Folder; current level if nil.
- **returns**: string[] File paths.

#### `gameplay_crawl_saveSystem.getAllPaths()`

Loads all the paths of the current level.

- **returns**: table[] Paths.

#### `gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath)`

Lists the *.startingPosition.json files.

- `levelPath` (*string|nil*) : Folder; current level if nil.
- **returns**: string[] File paths.

#### `gameplay_crawl_saveSystem.getAllStartingPositions()`

Loads all the starting positions of the current level.

- **returns**: table[] Start positions.

#### `gameplay_crawl_saveSystem.getAllTrailFiles(levelPath)`

Lists the paths of the *.trail.json files in a folder (non-recursive).

- `levelPath` (*string|nil*) : Folder; crawl folder of the current level if nil.
- **returns**: string[] File paths.

#### `gameplay_crawl_saveSystem.getAllTrails(levelPath)`

Loads all the trails of a folder.

- `levelPath` (*string|nil*) : Folder; current level if nil.
- **returns**: table[] Trails.

#### `gameplay_crawl_saveSystem.getBoundaryById(boundaryId)`

Loads (with cache) a boundary zone, created as a zone object then deserialized.

- `boundaryId` (*string*) : Path of the .boundary.json file.
- **returns**: table|nil Zone.

#### `gameplay_crawl_saveSystem.getCurrentLevelCrawlPath()`

Returns the folder of the crawl files of the current level.

- **returns**: string|nil '/levels/<level>/crawls/', or nil if no level is loaded.

#### `gameplay_crawl_saveSystem.getPathById(pathId)`

Loads (with cache) a path; the nodes have pos (vec3), rotation (quat), radius, flags, name.

- `pathId` (*string*) : Path of the .path.json file.
- **returns**: table|nil Path {name, description, nodes, id}.

#### `gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId)`

Returns the score data of a trail.

- `trailId` (*string*) : Id (file path) of the trail.
- **returns**: table|nil {id, trail, saveData}.

#### `gameplay_crawl_saveSystem.getPlayerCrawlTrailsById()`

Loads (once) the player's scores for all trails of the current level, from the freeroam folder or the career profile.

- **returns**: table<string, table> Dictionary id -> {id, trail, saveData{bestTime, bestPenaltyPoints, bestTimeDate, bestPenaltyPointsDate, attempts}}.

#### `gameplay_crawl_saveSystem.getPlayerTrailStats(trailId)`

Returns the player's statistics on a trail.

- `trailId` (*string*) : Trail id.
- **returns**: table|nil {bestTime, bestPenaltyPoints, attempts}; nil if unknown.

#### `gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail)`

Loads (with cache) a starting position. Returns nil for a trail from a mission or an empty id.

- `startingPositionId` (*string|nil*) : Path of the .startingPosition.json file.
- `trail` (*table|nil*) : Trail; ignored if isFromMission.
- **returns**: table|nil Starting position {transform, iconPosition, ...}.

#### `gameplay_crawl_saveSystem.getTrailById(trailId)`

Loads (with cache) a trail from its file path.

- `trailId` (*string*) : Path of the .trail.json file.
- **returns**: table|nil Trail, with _filePath, _fileName, _dir, _ext.

#### `gameplay_crawl_saveSystem.isTrailFromMission(trail)`

Indicates whether a trail comes from a mission (isFromMission).

- `trail` (*table|nil*) : Trails.
- **returns**: boolean true if isFromMission is true.

#### `gameplay_crawl_saveSystem.loadCrawlData(filename)`

Loads a crawl data file (name, description, icon, metadata, list of trail ids) and resolves each trail via getTrailById.

- `filename` (*string*) : JSON file to read.
- **returns**: table|nil {name, description, icon ('rockCrawling01' by default), metadata, trails}.

#### `gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath)`

Hook called when saving the career profile: writes the modified trail scores (_dirty).

- `currentSavePath` (*string*) : Current profile folder.

#### `gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId)`

Resets (math.huge, dates 0, attempts 0) a trail's scores and saves them.

- `trailId` (*string*) : Trail id.

#### `gameplay_crawl_saveSystem.saveBoundary(boundary, filePath)`

Writes a boundary zone as JSON (via boundary:onSerialize()) and caches it.

- `boundary` (*table*) : Zone (gameplay/sites/zone object).
- `filePath` (*string*) : Path of the .boundary.json file.
- **returns**: boolean true if written.

#### `gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath)`

Writes a crawl data file: metadata and trail ids (see notes on the id field).

- `saveData` (*table*) : {name, description, icon, metadata, trails}.
- `filepath` (*string*) : Output file.
- **returns**: boolean true if written.

#### `gameplay_crawl_saveSystem.savePath(path, filePath)`

Writes a path (list of nodes: name, position, rotation, radius 4.0 by default, flags) as JSON and caches it.

- `path` (*table*) : Path {name, description, nodes}.
- `filePath` (*string*) : Path of the .path.json file.
- **returns**: boolean true if written.

#### `gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId)`

Marks the trail's scores as modified; outside career, writes them immediately to settings/cloud/crawlTrails/.

- `trailId` (*string*) : Trail id.

#### `gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath)`

Writes a starting position (transform position/rotation/radius 10.0 by default, iconPosition, metadata) as JSON and caches it.

- `startingPosition` (*table*) : Start position.
- `filePath` (*string*) : Path of the .startingPosition.json file.
- **returns**: boolean true if written.

#### `gameplay_crawl_saveSystem.saveTrail(trail, filePath)`

Serializes a trail and writes it as JSON (creating the folder if needed), then caches it.

- `trail` (*table*) : Trail (name, description, pathId, boundaryId, startingPositionId, rules, prefabs...).
- `filePath` (*string*) : Path of the .trail.json file.
- **returns**: boolean true if written.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/saveSystem.lua`.*
