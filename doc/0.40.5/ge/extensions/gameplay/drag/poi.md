# `gameplay_drag_poi`

*File: `lua/ge/extensions/gameplay/drag/poi.lua` · VM: Game Engine (GE) · 221 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_poi`: `extensions.load("gameplay_drag_poi")`, then the global `gameplay_drag_poi`

Points of interest (POI) of the drag tracks. For each lane of each track of the level, creates an invisible trigger of 6 m radius placed on the stage line. When a vehicle enters it, the module arms the track (core.setDragRaceData with the saved user rules) and starts the race (core.startDragRaceActivity), or opens the MP menu if multiplayer mode is active. Also handles multiseat entry (several players, one per lane) and prevents rejoining immediately after a race as long as the vehicle stays at the line.

## Notes

- Trigger radius: 6 m (JOIN_RADIUS_SQ = 36). In multiseat, only the lane closest to the vehicle takes it over.
- In the career tutorial (career_modules_tutorial active), the POI's stage point is shifted 10 m behind the line.
- The POIs are only generated if core.isDragEnabled() is true (career active or enableDragRaceInFreeroam setting).
- POI identifier: 'drag##<track file name>-<lane shortName or laneN>'.
- In solo freeroam, if a race is finished and the player returns to the trigger, the race is reset (dragBridge.reset).
- Only one startDragRaceActivity call per lane as long as the request is not cleared (poiJoinRequestSent).

**Dependencies (loaded first):** `gameplay_drag_rulesMenu`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId)` | Applies to data the rules saved by the user for the track (dragType, importantTimerId, prefabs.christmasTree.treeType). | 55 |
| `gameplay_drag_poi.blockRejoinForStagedRacers()` | Marks the racers still within 6 m of a stage line: they cannot restart a race until they have left all the stage triggers. | 40 |
| `gameplay_drag_poi.clearRejoinBlocks()` | Clears the list of vehicles forbidden to restart. | 51 |
| `gameplay_drag_poi.createStagePoi(data, lane, laneIndex)` | Creates the definition of a POI (id and multiseat markerInfo.invisibleTrigger with onInside/onExit) for a lane. Returns nil with a warning if the lane has no stage point. | 68 |
| `gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook (relayed by core): adds to elements one POI per lane of each drag track of the level, if drag is enabled. *(internal)* *(hook)* | 205 |

### Parameter details

#### `gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId)`

Applies to data the rules saved by the user for the track (dragType, importantTimerId, prefabs.christmasTree.treeType).

- `data` (*table*) : Track data, modified in place.
- `stripId` (*string|nil*) : Track identifier.
- `levelId` (*string|nil*) : Level identifier.

#### `gameplay_drag_poi.createStagePoi(data, lane, laneIndex)`

Creates the definition of a POI (id and multiseat markerInfo.invisibleTrigger with onInside/onExit) for a lane. Returns nil with a warning if the lane has no stage point.

- `data` (*table*) : Track data (strip, _fnWithoutExt...).
- `lane` (*table*) : Lane (waypoints.stage, shortName).
- `laneIndex` (*integer*) : Lane index.
- **returns**: table|nil POI {id, markerInfo} or nil.

#### `gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook (relayed by core): adds to elements one POI per lane of each drag track of the level, if drag is enabled.

- `levelIdentifier` (*string*) : Level name.
- `elements` (*table[]*) : POI list completed in place.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_rulesMenu. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/poi.lua`.*
