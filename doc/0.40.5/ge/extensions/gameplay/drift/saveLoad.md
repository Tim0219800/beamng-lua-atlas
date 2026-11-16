# `gameplay_drift_saveLoad`

*File: `lua/ge/extensions/gameplay/drift/saveLoad.lua` · VM: Game Engine (GE) · 175 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_saveLoad`: `extensions.load("gameplay_drift_saveLoad")`, then the global `gameplay_drift_saveLoad`

Loads and saves the drift spots of free roaming. Scans /levels/<level>/driftSpots/ looking for spot.driftSpot.json, builds a spots table keyed by id (level/folder) with their UI info, preview, saved scores and objectives, hides the marker objects of the scene, and writes the modified scores. Also loads the cascade zones (stuntZones) from a JSON file.

## Notes

- Freeroam save: settings/cloud/driftSpots/<spotId>.json; career save: <profile>/career/driftSpots/<spotId>.json (written by onSaveCurrentProfile, only for spots marked _dirty).
- The spotsById cache is built lazily by getDriftSpotsById; clearCache or onCareerActive empty it to force a reload.
- Each loaded spot has the fields: id, spatialInfo, racePath, bounds, level, info (with preview and name), saveData {scores, objectivesCompleted}, unlocked=true.
- The scores in saveData.scores are sorted by descending score at load.
- The objects listed in spatialInfo.lines[].markerObjects are hidden (setHidden(true)) as soon as loaded; a warning is logged if an object cannot be found.
- The onAfterDriftSpotsLoaded(spotsById) hook is only emitted in active career.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_saveLoad.clearCache()` | Empties the spots cache; the next call to getDriftSpotsById will re-read everything from disk. | 17 |
| `gameplay_drift_saveLoad.getDriftSpotById(spotId)` | Returns the data of a spot, or nil if it does not exist in the current level. | 45 |
| `gameplay_drift_saveLoad.getDriftSpotsById()` | Returns (building it if needed) the table of all the drift spots of the current level, keyed by id. Uses the career save folder if career is active, otherwise settings/cloud/driftSpots/. | 50 |
| `gameplay_drift_saveLoad.getPreviewWithFallback(dir)` | Looks for preview.jpg, preview.png or preview.jpeg in the given folder; otherwise returns /ui/images/noPreview.jpg. | 119 |
| `gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap()` | Returns the list (array) of the spots whose level is the current level. | 132 |
| `gameplay_drift_saveLoad.loadDriftData(fileName)` | Reads a drift data JSON file, converts pos/rot/scl of each stuntZone to vec3/quat, then calls gameplay_drift_stuntZones.setStuntZones(json.stuntZones). Logs an error and returns if the file is absent. | 142 |
| `gameplay_drift_saveLoad.onCareerActive()` | Hook: called when career is activated, empties the spots cache. *(internal)* *(hook)* | 13 |
| `gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath)` | Hook: called when saving the career profile; writes to <currentSavePath>/career/driftSpots/ all the spots marked _dirty. *(internal)* *(hook)* | 27 |
| `gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId)` | Marks the spot as modified (_dirty). Outside career, immediately writes its scores file in settings/cloud/driftSpots/; in career, the write is deferred to onSaveCurrentProfile. | 36 |

### Parameter details

#### `gameplay_drift_saveLoad.getDriftSpotById(spotId)`

Returns the data of a spot, or nil if it does not exist in the current level.

- `spotId` (*string*) : Spot id.
- **returns**: table|nil Spot data (id, spatialInfo, racePath, bounds, level, info, saveData, unlocked).

#### `gameplay_drift_saveLoad.getDriftSpotsById()`

Returns (building it if needed) the table of all the drift spots of the current level, keyed by id. Uses the career save folder if career is active, otherwise settings/cloud/driftSpots/.

- **returns**: table<string, table> Spots keyed by id.

#### `gameplay_drift_saveLoad.getPreviewWithFallback(dir)`

Looks for preview.jpg, preview.png or preview.jpeg in the given folder; otherwise returns /ui/images/noPreview.jpg.

- `dir` (*string*) : Spot folder.
- **returns**: string Path of the preview image.

#### `gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap()`

Returns the list (array) of the spots whose level is the current level.

- **returns**: table[] Array of spots.

#### `gameplay_drift_saveLoad.loadDriftData(fileName)`

Reads a drift data JSON file, converts pos/rot/scl of each stuntZone to vec3/quat, then calls gameplay_drift_stuntZones.setStuntZones(json.stuntZones). Logs an error and returns if the file is absent.

- `fileName` (*string|nil*) : Path of the JSON file; does nothing if nil.

#### `gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath)`

Hook: called when saving the career profile; writes to <currentSavePath>/career/driftSpots/ all the spots marked _dirty.

- `currentSavePath` (*string*) : Save folder of the current profile.

#### `gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId)`

Marks the spot as modified (_dirty). Outside career, immediately writes its scores file in settings/cloud/driftSpots/; in career, the write is deferred to onSaveCurrentProfile.

- `spotId` (*string*) : Spot id, of the form "level/folder".

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAfterDriftSpotsLoaded`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/saveLoad.lua`.*
