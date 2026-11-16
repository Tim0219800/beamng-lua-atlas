# `scenario_quickRaceLoader`

*File: `lua/ge/extensions/scenario/quickRaceLoader.lua` · VM: Game Engine (GE) · 614 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_quickRaceLoader`: `extensions.load("scenario_quickRaceLoader")`, then the global `scenario_quickRaceLoader`

Quick race (quickrace) loader. It walks the levels (levels/<level>/quickrace/*.json, including .race.json files) and the Track Editor tracks (trackEditor/ folder of the user documents), builds the list of levels and tracks shown by the selection screen, then turns a choice (track, vehicle, race type) into a scenario via scenario_scenariosLoader.processScenarioData and launches it. A quickrace track modder uses it indirectly: their files are read by getTracks.

## Example

```lua
-- list the levels that have quickraces and their tracks
local levels = scenario_quickRaceLoader.getQuickraceList()
for _, lvl in ipairs(levels) do
  for _, t in ipairs(lvl.tracks) do log('I', 'x', lvl.levelName .. ' / ' .. t.name) end
end
```

## Notes

- A track file is a JSON read by getTracks. Fields used: name, difficulty, closed (otherwise lapCount forced to 1), lapCount, defaultLaps (with raceFile), reversible, allowRollingStart, tod (index 0 to 9 to a time of day, default 3), lapConfig, startLineCheckpoint, finishLineCheckpoint, spawnSpheres {standing, standingReverse, rolling, rollingReverse} (default <trackName>_standing_spawn etc.), prefabs / reversePrefabs / forwardPrefabs, luaFile (relative to levels/<level>/quickrace/), startHTML (default quickrace/<trackName>.html), introType (default 'htmlOnly', 'none' without HTML), procedural, flowgraph, classification {closed, allowRollingStart, reversible}.
- A file whose extension is 'race.json' is treated as a track based on a race path (raceFile = this file).
- The prefabs <trackName>.prefab[.json], <trackName>_reverse.prefab[.json] and <trackName>_forward.prefab[.json] in the quickrace/ folder are added automatically if they exist.
- Preview images are <trackName>.jpg and <trackName>_reverse.jpg in the track's folder.
- The 'driver_training' level only lists procedural tracks, all other levels only non-procedural tracks. The 'smallgrid' level is renamed "Track Editor Tracks".
- Track Editor tracks: a trackEditor/<name>.json file must have a version field, otherwise it is ignored with a message (old format). They are attached to the level trackData.level (default 'smallgrid').
- loadQuickrace: reverses lapConfig if trackFile.reverse (and swaps the start and finish checkpoints if the track is not closed), appends finishLineCheckpoint at the end of lapConfig, sets isQuickRace = true and the time of day from the tod array, unless levelInfo.disableQuickraceTimeOfDay.
- loadQuickrace modifies the passed tables (scenarioFile, trackFile) in place.
- Dead code: mimicProcTracks and getCustomTracks are not exported. In loadQuickrace, scenarioFile.isReverse = false is written twice.
- getLevel recomputes the whole level list on every call (expensive), and getLevelTrack depends on it.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_quickRaceLoader.customPreviewLoader(levelInfo, levelName)` | Determines the preview images of a level: levelInfo.previews prefixed with the level folder, otherwise the files <level>_preview*.png then .jpg at the level root. Writes levelInfo.directory and levelInfo.previews. | 189 |
| `scenario_quickRaceLoader.getLevel(levelName)` | Finds a level in the quickrace list by its folder name or title. | 162 |
| `scenario_quickRaceLoader.getLevelList()` | Returns the list of level names (levels/ folders containing info.json). | 17 |
| `scenario_quickRaceLoader.getLevelTrack(levelName, trackName)` | Finds a track of a level by its name. | 175 |
| `scenario_quickRaceLoader.getQuickraceList(levelList)` | Builds the list of levels that contain quickraces (JSON files in levels/<level>/quickrace/ or Track Editor tracks). Each entry describes a pseudo-scenario for the UI: levelName, levelInfo, name, previews, tracks, trackCount, vehicles (scenario_player0 player), playersCountRange, etc. | 49 |
| `scenario_quickRaceLoader.getTrackEditorTracks()` | Reads the user's trackEditor/*.json files and creates a quickrace track for each (name, author, difficulty 37 by default, lapCount depending on connected/defaultLaps, jpg/png preview, spawnSpheres '_standing_spawn' etc., luaFile util/trackBuilder/quickraceSetup). | 233 |
| `scenario_quickRaceLoader.getTracks(quickraceFiles, levelName, lvlName)` | Parses the quickrace files of a level and returns the list of completed tracks with default values (see notes), sorted by name. | 339 |
| `scenario_quickRaceLoader.loadQuickrace(scenarioKey, scenarioFile, trackFile, vehicleFile, raceType)` | Turns a chosen track and vehicle into a full scenario: fills scenarioFile (track, vehicle, name, lapCount, lapConfig, prefabs, startHTML, introType, isReverse, rollingStart, levelObjects.tod, isQuickRace, quickraceType) then calls scenario_scenariosLoader.processScenarioData. | 451 |
| `scenario_quickRaceLoader.loadTrackBuilderJSON(originalFilename)` | Reads a Track Editor track JSON: trackEditor/<name>.json. | 320 |
| `scenario_quickRaceLoader.startQuickrace(scenarioFile, trackFile, vehicleFile, raceType)` | Starts a quickrace. If a level is already loaded, delays the start until it is unloaded. Otherwise loads the quickRaceModules extensions, the track's luaFile (and util/trackBuilder/splineTrack for a Track Editor track), builds the scenario with loadQuickrace and calls scenario_scenarios.executeScenario. | 551 |
| `scenario_quickRaceLoader.uiEventStartHotlapping()` | Called by the UI (hotlapping app): loads core_hotlapping on demand if no scenario is running, then calls core_hotlapping.startHotlapping(). *(internal)* | 581 |
| `scenario_quickRaceLoader.uiHotlappingAppDestroyed()` | Called by the UI when the hotlapping app is destroyed: unloads core_hotlapping if no scenario is running. *(internal)* | 593 |

### Parameter details

#### `scenario_quickRaceLoader.customPreviewLoader(levelInfo, levelName)`

Determines the preview images of a level: levelInfo.previews prefixed with the level folder, otherwise the files <level>_preview*.png then .jpg at the level root. Writes levelInfo.directory and levelInfo.previews.

- `levelInfo` (*table*) : Level entry being built (must have levelInfo.levelInfo).
- `levelName` (*string*) : Level folder name.
- **returns**: string[] List of image paths (warning in the log if empty).

#### `scenario_quickRaceLoader.getLevel(levelName)`

Finds a level in the quickrace list by its folder name or title.

- `levelName` (*string*) : Folder name or title (levelInfo.title).
- **returns**: table|nil Level entry, or nil.

#### `scenario_quickRaceLoader.getLevelList()`

Returns the list of level names (levels/ folders containing info.json).

- **returns**: string[] Level names; empty list if the levels/ folder does not exist.

#### `scenario_quickRaceLoader.getLevelTrack(levelName, trackName)`

Finds a track of a level by its name.

- `levelName` (*string*) : Level name or title.
- `trackName` (*string*) : Track name field.
- **returns**: table|nil The track, or nil.

#### `scenario_quickRaceLoader.getQuickraceList(levelList)`

Builds the list of levels that contain quickraces (JSON files in levels/<level>/quickrace/ or Track Editor tracks). Each entry describes a pseudo-scenario for the UI: levelName, levelInfo, name, previews, tracks, trackCount, vehicles (scenario_player0 player), playersCountRange, etc.

- `levelList` (*string[]|nil*) : Levels to examine; default getLevelList().
- **returns**: table[] List of level entries with at least one track.

#### `scenario_quickRaceLoader.getTrackEditorTracks()`

Reads the user's trackEditor/*.json files and creates a quickrace track for each (name, author, difficulty 37 by default, lapCount depending on connected/defaultLaps, jpg/png preview, spawnSpheres '_standing_spawn' etc., luaFile util/trackBuilder/quickraceSetup).

- **returns**: table<string, table[]> Tracks grouped by level name.

#### `scenario_quickRaceLoader.getTracks(quickraceFiles, levelName, lvlName)`

Parses the quickrace files of a level and returns the list of completed tracks with default values (see notes), sorted by name.

- `quickraceFiles` (*string[]*) : Paths of the quickrace JSON files.
- `levelName` (*string*) : Level folder name.
- `lvlName` (*string*) : Level name, used to detect 'driver_training' (procedural tracks).
- **returns**: table[] Tracks, with trackName, directory, previews, spawnSpheres, official, etc.

#### `scenario_quickRaceLoader.loadQuickrace(scenarioKey, scenarioFile, trackFile, vehicleFile, raceType)`

Turns a chosen track and vehicle into a full scenario: fills scenarioFile (track, vehicle, name, lapCount, lapConfig, prefabs, startHTML, introType, isReverse, rollingStart, levelObjects.tod, isQuickRace, quickraceType) then calls scenario_scenariosLoader.processScenarioData.

- `scenarioKey` (*string|nil*) : Scenario key (nil from startQuickrace).
- `scenarioFile` (*table*) : Level entry from getQuickraceList, modified in place.
- `trackFile` (*table*) : Chosen track; track.reverse, track.rollingStart and track.tod are read.
- `vehicleFile` (*table*) : Chosen vehicle (model, config, file...).
- `raceType` (*string*) : Race type, stored in quickraceType (inferred from code).
- **returns**: table Processed scenario.

#### `scenario_quickRaceLoader.loadTrackBuilderJSON(originalFilename)`

Reads a Track Editor track JSON: trackEditor/<name>.json.

- `originalFilename` (*string*) : Track name without folder or extension.
- **returns**: table|nil JSON content, or nil (file missing or unreadable, info message in the log).

#### `scenario_quickRaceLoader.startQuickrace(scenarioFile, trackFile, vehicleFile, raceType)`

Starts a quickrace. If a level is already loaded, delays the start until it is unloaded. Otherwise loads the quickRaceModules extensions, the track's luaFile (and util/trackBuilder/splineTrack for a Track Editor track), builds the scenario with loadQuickrace and calls scenario_scenarios.executeScenario.

- `scenarioFile` (*table*) : Level entry.
- `trackFile` (*table*) : Chosen track.
- `vehicleFile` (*table*) : Chosen vehicle.
- `raceType` (*string*) : Race type.

## Fields

| Field | Type | Description |
|---|---|---|
| `quickRaceModules` | string[] | Extensions loaded when a quickrace starts: scenario_scenarios, statistics_statistics, scenario_waypoints, scenario_quickRace, core_hotlapping. |

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/quickRaceLoader.lua`.*
