# `gameplay_drag_saveSystem`

*Fichier : `lua/ge/extensions/gameplay/drag/saveSystem.lua` · VM : Game Engine (GE) · 951 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_saveSystem` : `extensions.load("gameplay_drag_saveSystem")`, puis la globale `gameplay_drag_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_saveSystem.convertLegacyData(legacyData)` | Converts legacy drag strip format to current strip/lanes/waypoints structure.<br> legacyData: table in old format | 415 |
| `gameplay_drag_saveSystem.ensureDialCache()` | Loads dial times once per session. Legacy history is moved out of the pretty JSON file so later finishes do not rewrite it. | 614 |
| `gameplay_drag_saveSystem.generateHashFromFile(vehicleId)` | Generates a stable hash from the vehicle's config file for dial/history keys.<br> vehicleId: vehicle ID (defaults to player vehicle) | 723 |
| `gameplay_drag_saveSystem.getAllLanes()` | Returns all lanes from all strips in current level. | 887 |
| `gameplay_drag_saveSystem.getAllStrips()` | Returns all strip data from current level. | 870 |
| `gameplay_drag_saveSystem.getCurrentLevelDragPath()` | Returns path to current level's dragstrips folder, or nil. | 261 |
| `gameplay_drag_saveSystem.getCurrentSavePath()` | Returns current career save path, or empty string. | 752 |
| `gameplay_drag_saveSystem.getDialTimes()` | Returns dial times keyed by config hash. | 706 |
| `gameplay_drag_saveSystem.getHistory(id)` | Returns history entries from dial times. Optionally filters by drag settings id / strip file id on this level. | 770 |
| `gameplay_drag_saveSystem.getRecentHistory(count)` | Returns up to `count` saved timeslips across all strips, newest first. | 851 |
| `gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex)` | Canonical scenetree name for a lane waypoint. Uses _wp_ so types like "stage" never collide with tree lights (<stripId>_stage_<lane>). | 118 |
| `gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId)` | Loads full drag race data from a strip file path (strip + lanes, waypoints, phases).<br> stripId: path to the strip JSON file | 267 |
| `gameplay_drag_saveSystem.loadDragStripData(filepath)` | Loads drag strip data from file path. Supports modular (stripId + dragSettings) and legacy format.<br> filepath: path to JSON file | 375 |
| `gameplay_drag_saveSystem.loadPrefabs(data)` | Spawns prefabs from data.prefabs into the scene.<br> data: drag data with prefabs table | 919 |
| `gameplay_drag_saveSystem.onCareerActive()` | *(hook)* | 867 |
| `gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath)` | Hook: saves dial file when save slot changes.<br> currentSavePath: path to current save directory *(hook)* | 863 |
| `gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData)` | Precomputes each lane's AI stopping point once, at drag data setup time, instead of walking the<br> navgraph on every AI racer's stop phase. Only needed as a fallback when the strip has no explicit<br> strip-level drag_stop waypoint; skipped entirely otherwise. | 239 |
| `gameplay_drag_saveSystem.saveDialFile(dir)` | Copies dial times to a save directory.<br> dir: target directory path | 758 |
| `gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip)` | Saves dial times and optional timeslip history for playable racers.<br> dragData: current drag data, timeslip: optional timeslip table to save to history | 650 |
| `gameplay_drag_saveSystem.saveLane(lane, filePath)` |  | 915 |
| `gameplay_drag_saveSystem.saveStrip(strip, filePath)` |  | 901 |
| `gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData)` | Resolves BeamNGWaypoints: lane entries use <stripId>_wp_<type>_<lane>; strip-level use <stripId>_<type>. | 158 |
| `gameplay_drag_saveSystem.unloadPrefabs(data)` | Removes prefabs from the scene and clears prefabId on data.<br> data: drag data with prefabs table | 938 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `DEFAULT_TIMERS` | table |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `hashFile`, `removeFile`, `renameFile`
- `be:` `getPlayerVehicleID`
- `obj:` `getClassName`, `getName`, `getPosition`, `getRotation`, `getScale`, `setName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/saveSystem.lua`.*
