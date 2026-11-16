# `gameplay_missions_startTrigger`

*File: `lua/ge/extensions/gameplay/missions/startTrigger.lua` · VM: Game Engine (GE) · 192 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_startTrigger`: `extensions.load("gameplay_missions_startTrigger")`, then the global `gameplay_missions_startTrigger`

Transforms a mission's `startTrigger` field into a list of "locations" (start zones) and groups nearby zones into clusters for the map. Only the "coordinates" type (level + position + radius) actually produces a location; "league" and "none" produce none (nop). Used by gameplay_missions_missions (getLocations) and by the mission markers.

## Example

```lua
local clusters = gameplay_missions_startTrigger.getMissionClusters(30)
for _, c in ipairs(clusters) do print(c.clusterId, c.level, c.pos, c.radius, dumps(c.missionIds)) end
```

## Notes

- Required fields per type: level -> {level}; coordinates -> {level,pos,radius}; league -> {level}; none -> {}.
- A location is a table {type='coordinates', level, pos=vec3, rot=quat, radius, check=defaultLocationCheck, displayMarker=defaultLocationDisplayMarker}. rot defaults to quat(0,0,0,1).
- getMissionClusters caches the result per merge radius (key -1 if mergeRadius is nil); the cache is cleared by onAnyMissionChanged.
- For a single-mission cluster, clusterId = the mission id and missionIds is a list {id}. For a multi-mission cluster, clusterId is the concatenation of the ids and missionIds = tableKeys(...) (order not guaranteed).
- The radius of a merged cluster is max(radius + distance to center) - 1.
- In defaultLocationDisplayMarker, `canBeStarted` is hardcoded to true (the call to gameplay_missions_missionManager.canBeStarted is commented out): the marker is therefore green as soon as the player is in the zone.
- getMissionClusters modifies the location tables returned by gameplay_missions_missions.getLocations by adding id, missionId and _qtId (inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission)` | Tests whether the player is in the start zone: same level, position and radius defined, and distance to the center <= radius. | 16 |
| `gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition)` | Draws a start zone marker with debugDrawer: a ground cylinder of radius `radius` and a 5 m pole. Red outside the zone, green inside. | 21 |
| `gameplay_missions_startTrigger.getMissionClusters(mergeRadius)` | Groups all "coordinates" locations of all missions into clusters, level by level, using a quadtree. Two zones are grouped if their disks overlap (fixed merge radius if mergeRadius is given). | 127 |
| `gameplay_missions_startTrigger.onAnyMissionChanged()` | Hook emitted by missionManager when a mission changes state: clears the clusters cache. *(internal)* *(hook)* | 187 |
| `gameplay_missions_startTrigger.parseMission(mission)` | Creates a mission's list of locations from mission.startTrigger. Checks the type and the required fields. | 62 |

### Parameter details

#### `gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission)`

Tests whether the player is in the start zone: same level, position and radius defined, and distance to the center <= radius.

- `location` (*table*) : Location {level, pos, radius}.
- `level` (*string*) : Current level identifier (lowercase).
- `playerPosition` (*vec3*) : Player position.
- `mission` (*table*) : Mission concerned (not used).
- **returns**: boolean true if the player is in the zone.

#### `gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition)`

Draws a start zone marker with debugDrawer: a ground cylinder of radius `radius` and a 5 m pole. Red outside the zone, green inside.

- `location` (*table*) : Location {pos, radius}.
- `playerPosition` (*vec3*) : Player position.

#### `gameplay_missions_startTrigger.getMissionClusters(mergeRadius)`

Groups all "coordinates" locations of all missions into clusters, level by level, using a quadtree. Two zones are grouped if their disks overlap (fixed merge radius if mergeRadius is given).

- `mergeRadius` (*number|nil*) : Radius (m) used in place of each location's own radius; nil = the missions' radii.
- **returns**: table List of clusters {type, level, pos, rot, radius, check, displayMarker, missionIds, clusterId}.

#### `gameplay_missions_startTrigger.parseMission(mission)`

Creates a mission's list of locations from mission.startTrigger. Checks the type and the required fields.

- `mission` (*table*) : Mission whose startTrigger field exists (assumed checked by the caller).
- **returns**: table List of locations (empty on error or for league/none types).
- **returns**: string|nil Error message (invalid type or missing fields), nil if all is well.

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/startTrigger.lua`.*
