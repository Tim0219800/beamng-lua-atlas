# `gameplay_drag_saveSystem`

*File: `lua/ge/extensions/gameplay/drag/saveSystem.lua` · VM: Game Engine (GE) · 951 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_saveSystem`: `extensions.load("gameplay_drag_saveSystem")`, then the global `gameplay_drag_saveSystem`

Loading and saving of drag data. Reads the tracks (*.strip.json and *.dragSettings.json files, or old format converted), rebuilds lanes, waypoints, zones and timers, synchronizes the waypoints with the BeamNGWaypoint objects of the scene, precomputes the AI stop point, and spawns/removes the prefabs (tree, signs, decorations, paths). Also manages the player's files: best times per vehicle (dial book) and slip history, in the user's settings/ folder.

## Notes

- Files written: settings/dragDialBest.json (best times per config hash), settings/dragDialHistory.jsonl (one JSON line per race, appended at the end of the file) and settings/dragDialTimes.json (old file, re-read and migrated once). Career backup copy: <save folder>/dragDialTimes.json.
- The book keys are hashes of the vehicle's config file (FS:hashFile on pc_file) or 'vehicle_<id>' if unavailable; time_1_4 serves as the fallback value (10 s by default).
- DEFAULT_TIMERS: reactionTime (0.178 m), time_60 (60 ft), time_330, time_1_8, time_1000, time_1_4 (important), velAt_1_8, velAt_1_4; distances in meters (402.336 m = 1/4 mile).
- The lane waypoints are named <stripId>_wp_<type>_<lane> in the scene; those of the track <stripId>_<type>. They must exist in the level (prefab): the module does not create them, it renames them if needed and re-reads their transform.
- Default phases of a track: stage (dependency), countdown (dependency), race, stop. Default values: dragType 'headsUpRace', context 'freeroam', tree '.500'.
- normalizeTimersConfig does not keep shortLabel: the timers supplied by a dragSettings file lose this field (used by the slip), unlike DEFAULT_TIMERS.
- The AI's automatic stop point (autoStopName) is searched in the navigation graph more than 350 m from the finish line, unless the track defines a drag_stop waypoint.
- onCareerActive does nothing.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_saveSystem.convertLegacyData(legacyData)` | Converts the old track format (stripInfo, strip.lanes) into the current structure (strip, lanes, waypoints), adds the default timers and synchronizes the waypoints with the scene. | 415 |
| `gameplay_drag_saveSystem.ensureDialCache()` | Loads the dial book once per session (settings/dragDialTimes.json, .jsonl history, best times overlay) and migrates the old history out of the main JSON. | 614 |
| `gameplay_drag_saveSystem.generateHashFromFile(vehicleId)` | Stable hash of the vehicle's config (hash of the .pc file) serving as the key for dial and history; cached. Returns 'vehicle_<id>' if the details or the file are unavailable. | 723 |
| `gameplay_drag_saveSystem.getAllLanes()` | All the lanes of all the tracks (*.strip.json) of the current level, with _stripId and _stripName added. | 887 |
| `gameplay_drag_saveSystem.getAllStrips()` | Raw data of all the *.strip.json tracks of the current level's dragstrips folder (with _filePath). | 870 |
| `gameplay_drag_saveSystem.getCurrentLevelDragPath()` | Path /levels/<level>/dragstrips/ of the current level. | 261 |
| `gameplay_drag_saveSystem.getCurrentSavePath()` | Current career save path. | 752 |
| `gameplay_drag_saveSystem.getDialTimes()` | Best times per config hash, without the history; time_1_4 is at least 10 by default. | 706 |
| `gameplay_drag_saveSystem.getHistory(id)` | History of the recorded slips. With id, filters on the matching track of the current level (by dragSettings id, file name or strip id). | 770 |
| `gameplay_drag_saveSystem.getRecentHistory(count)` | The last count slips across all tracks, from most recent to oldest (stripInfo.timestamp). | 851 |
| `gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex)` | Canonical name in the scene of a lane waypoint: <stripId>_wp_<type>_<lane> (the "_wp_" avoids collision with the tree lights). | 118 |
| `gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId)` | Loads a full track from a .strip.json file: lanes (waypoints, boundary, zone, stageToEndNormalized), track waypoints, track zone, default phases/prefabs/timers; then synchronizes with the scene. | 267 |
| `gameplay_drag_saveSystem.loadDragStripData(filepath)` | Loads a track settings file: modular format (stripId field pointing to a .strip.json, plus dragType, context, phases, prefabs, timers) or old format converted by convertLegacyData. | 375 |
| `gameplay_drag_saveSystem.loadPrefabs(data)` | Spawns in the scene the prefabs in use from data.prefabs (christmasTree, displaySign, decorations, paths) at the origin and stores their prefabId. | 919 |
| `gameplay_drag_saveSystem.onCareerActive()` | Career activated hook; does nothing. *(internal)* *(hook)* | 867 |
| `gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath)` | Hook: when the profile is saved, copies the dial book into the save folder (saveDialFile). *(internal)* *(hook)* | 863 |
| `gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData)` | Precomputes for each lane the name of the navigation node where the AI must stop (lane.autoStopName), more than 350 m from the finish line. Does nothing if the track has a drag_stop waypoint or if the graph does not exist. | 239 |
| `gameplay_drag_saveSystem.saveDialFile(dir)` | Writes the dial book to <dir>/dragDialTimes.json. | 758 |
| `gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip)` | For each playable racer, updates its best time (important timer) if beaten, and adds the slip to the history (memory and .jsonl file, with configHash per driver). Writes settings/dragDialBest.json if a record changes. | 650 |
| `gameplay_drag_saveSystem.saveLane(lane, filePath)` | Writes a lane as JSON (human-readable formatting). | 915 |
| `gameplay_drag_saveSystem.saveStrip(strip, filePath)` | Writes a track as JSON after renaming each lane's waypoints according to laneWaypointSceneName. | 901 |
| `gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData)` | For each lane and track waypoint, finds the scene's BeamNGWaypoint by its canonical name, renames it if needed, re-reads its position/rotation/scale, and computes lane.stageToEndNormalized. Rebuilds the navigation graph (map.reset) if a rename took place. | 158 |
| `gameplay_drag_saveSystem.unloadPrefabs(data)` | Removes the prefabs in use from the scene (by prefabId) and clears prefabId. | 938 |

### Parameter details

#### `gameplay_drag_saveSystem.convertLegacyData(legacyData)`

Converts the old track format (stripInfo, strip.lanes) into the current structure (strip, lanes, waypoints), adds the default timers and synchronizes the waypoints with the scene.

- `legacyData` (*table*) : Data in the old format.
- **returns**: table|nil Converted data, nil if legacyData is nil.

#### `gameplay_drag_saveSystem.ensureDialCache()`

Loads the dial book once per session (settings/dragDialTimes.json, .jsonl history, best times overlay) and migrates the old history out of the main JSON.

- **returns**: table Cache keyed by vehicle config hash ({time_1_4, ..., history}).

#### `gameplay_drag_saveSystem.generateHashFromFile(vehicleId)`

Stable hash of the vehicle's config (hash of the .pc file) serving as the key for dial and history; cached. Returns 'vehicle_<id>' if the details or the file are unavailable.

- `vehicleId` (*integer|nil*) : Vehicle ID (default: player 0's vehicle).
- **returns**: string Hash or fallback key.

#### `gameplay_drag_saveSystem.getAllLanes()`

All the lanes of all the tracks (*.strip.json) of the current level, with _stripId and _stripName added.

- **returns**: table[] Lanes.

#### `gameplay_drag_saveSystem.getAllStrips()`

Raw data of all the *.strip.json tracks of the current level's dragstrips folder (with _filePath).

- **returns**: table[] Tracks.

#### `gameplay_drag_saveSystem.getCurrentLevelDragPath()`

Path /levels/<level>/dragstrips/ of the current level.

- **returns**: string|nil Path, nil (E log) if the level is unknown.

#### `gameplay_drag_saveSystem.getCurrentSavePath()`

Current career save path.

- **returns**: string Path, empty string outside career.

#### `gameplay_drag_saveSystem.getDialTimes()`

Best times per config hash, without the history; time_1_4 is at least 10 by default.

- **returns**: table<string, table> Table hash to {time_1_4, other timers}.

#### `gameplay_drag_saveSystem.getHistory(id)`

History of the recorded slips. With id, filters on the matching track of the current level (by dragSettings id, file name or strip id).

- `id` (*string|nil*) : Track/facility identifier; nil = whole history.
- **returns**: table {history = tickets[]}.

#### `gameplay_drag_saveSystem.getRecentHistory(count)`

The last count slips across all tracks, from most recent to oldest (stripInfo.timestamp).

- `count` (*integer*) : Maximum number of slips.
- **returns**: table[] Slips.

#### `gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex)`

Canonical name in the scene of a lane waypoint: <stripId>_wp_<type>_<lane> (the "_wp_" avoids collision with the tree lights).

- `stripId` (*string*) : Track identifier.
- `wpType` (*string*) : Waypoint type (stage, endLine...).
- `laneIndex` (*integer*) : Lane index.
- **returns**: string Object name.

#### `gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId)`

Loads a full track from a .strip.json file: lanes (waypoints, boundary, zone, stageToEndNormalized), track waypoints, track zone, default phases/prefabs/timers; then synchronizes with the scene.

- `stripId` (*string*) : Path of the strip JSON file.
- **returns**: table|nil Full data, nil (E log) on read failure.

#### `gameplay_drag_saveSystem.loadDragStripData(filepath)`

Loads a track settings file: modular format (stripId field pointing to a .strip.json, plus dragType, context, phases, prefabs, timers) or old format converted by convertLegacyData.

- `filepath` (*string*) : Path of the JSON file (.dragSettings.json).
- **returns**: table|nil Track data or nil.

#### `gameplay_drag_saveSystem.loadPrefabs(data)`

Spawns in the scene the prefabs in use from data.prefabs (christmasTree, displaySign, decorations, paths) at the origin and stores their prefabId.

- `data` (*table*) : Track data with prefabs[key] = {isUsed, path, treeType}.

#### `gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath)`

Hook: when the profile is saved, copies the dial book into the save folder (saveDialFile).

- `currentSavePath` (*string|nil*) : Current save folder.

#### `gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData)`

Precomputes for each lane the name of the navigation node where the AI must stop (lane.autoStopName), more than 350 m from the finish line. Does nothing if the track has a drag_stop waypoint or if the graph does not exist.

- `dragData` (*table*) : Track data.

#### `gameplay_drag_saveSystem.saveDialFile(dir)`

Writes the dial book to <dir>/dragDialTimes.json.

- `dir` (*string*) : Target folder.
- **returns**: boolean Write success.

#### `gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip)`

For each playable racer, updates its best time (important timer) if beaten, and adds the slip to the history (memory and .jsonl file, with configHash per driver). Writes settings/dragDialBest.json if a record changes.

- `dragData` (*table*) : Current race data.
- `timeslip` (*table|nil*) : Slip to record in the history.

#### `gameplay_drag_saveSystem.saveLane(lane, filePath)`

Writes a lane as JSON (human-readable formatting).

- `lane` (*table*) : Lane.
- `filePath` (*string*) : Target file.
- **returns**: boolean Success.

#### `gameplay_drag_saveSystem.saveStrip(strip, filePath)`

Writes a track as JSON after renaming each lane's waypoints according to laneWaypointSceneName.

- `strip` (*table*) : Track (id, lanes with waypoints[] having a type).
- `filePath` (*string*) : Target file.
- **returns**: boolean Success.

#### `gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData)`

For each lane and track waypoint, finds the scene's BeamNGWaypoint by its canonical name, renames it if needed, re-reads its position/rotation/scale, and computes lane.stageToEndNormalized. Rebuilds the navigation graph (map.reset) if a rename took place.

- `dragData` (*table*) : Track data (strip.id required).

#### `gameplay_drag_saveSystem.unloadPrefabs(data)`

Removes the prefabs in use from the scene (by prefabId) and clears prefabId.

- `data` (*table*) : Track data with prefabs.

## Fields

| Field | Type | Description |
|---|---|---|
| `DEFAULT_TIMERS` | table[] | Default timers of a track: {id, label, labelKey, shortLabel, type = 'distanceTimer'\|'velocity', distance (m), important}. |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `hashFile`, `removeFile`, `renameFile`
- `be:` `getPlayerVehicleID`
- `obj:` `getClassName`, `getName`, `getPosition`, `getRotation`, `getScale`, `setName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/saveSystem.lua`.*
