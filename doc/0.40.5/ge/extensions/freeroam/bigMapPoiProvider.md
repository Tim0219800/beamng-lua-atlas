# `freeroam_bigMapPoiProvider`

*File: `lua/ge/extensions/freeroam/bigMapPoiProvider.lua` · VM: Game Engine (GE) · 717 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_bigMapPoiProvider`: `extensions.load("freeroam_bigMapPoiProvider")`, then the global `freeroam_bigMapPoiProvider`

Data provider for the big map: turns the raw POIs (missions, garages, gas stations, dealerships, spawn points, drift, drag, crawl, player vehicles, delivery...) into a UI-ready structure (poiData), groups (groupData: rating_, type_, distance_, difficulty_, branch_, missionType_...) and predefined filters (freeroam or career). Also manages each group's visibility state and sends everything to the UI through the BigmapMissionData UI hook. A modder who adds POIs sees them appear via gameplay_rawPois; this module decides which group they fall into.

## Example

```lua
-- hide the gas station group then send the data back to the big map
freeroam_bigMapPoiProvider.setGroupVisibility('type_gasStation', false)
freeroam_bigMapPoiProvider.sendCurrentLevelMissionsToBigmap()
```

## Notes

- Group visibilities are stored in memory only; an unknown group is considered visible (getGroupVisibility returns true unless the value is false). The default groups are initialized to visible the first time the groups are built.
- The data (cachedGroupData, cachedPoiData, cachedFilters) is rebuilt by sendCurrentLevelMissionsToBigmap; the getCached* accessors trigger it if the cache is invalid.
- Bug: sendCurrentLevelMissionsToBigmap first calls invalidateCache() then tests isCacheValid(), so the cache is never reused: everything is recomputed on every call (and gameplay_rawPois.clear() is called in buildPoiDataCache).
- Bug/inconsistency: the distance sort is neutralized (distance fixed at 10, computation commented out), so all POIs are in the distance_veryClose group.
- sendMissionLocationsToMinimap only sets the sendToMinimap flag to false; it sends nothing to the minimap. forceSend, onClientStartMission and requestMissionLocationsForMinimap set it back to true. clearMissionsFromMinimap sends NavigationStaticMarkers with an empty list.
- The formatting and building functions assume the career_* modules (career_career, career_branches, career_modules_tutorial, career_modules_testDrive, career_modules_delivery_general) exist as globals.
- Filters: in career -> careerPois, one filter per domain (domain_<id>) and delivery if delivery mode is active; in freeroam -> missionsByType, freeroamActivities, freeroamPois.
- gameMode sent to the UI: 'freeroam' by default, 'career' if career is active, 'mission' if a mission is in the foreground (the latter takes priority).

**Dependencies (loaded first):** `gameplay_missions_missions`, `freeroam_bigMapMode`, `gameplay_rawPois`, `gameplay_playmodeMarkers`

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_bigMapPoiProvider.clearMissionsFromMinimap()` | Clears the mission markers from the minimap (NavigationStaticMarkers UI hook with the 'missions' key and an empty list) if a level is loaded. | 158 |
| `freeroam_bigMapPoiProvider.forceSend()` | Sets the sendToMinimap flag to true: the next onPreRender will call sendMissionLocationsToMinimap again. Also serves as onClientStartMission and requestMissionLocationsForMinimap. | 10 |
| `freeroam_bigMapPoiProvider.formatMissionForBigmap(elemData)` | Converts a mission into a table for the UI: id, icon, name, description, thumbnail, previews, difficulty, fast travel available/unlocked, progress, rating, rating key, etc. | 199 |
| `freeroam_bigMapPoiProvider.formatPoiForBigmap(poi)` | Converts a non-mission POI into a table for the UI (id, icon from bigmapMarker.cardIcon or from the type, name, description, thumbnail, previews, fast travel, canSetRoute, aggregates). Fast travel is only available outside career or during the career tutorial. | 177 |
| `freeroam_bigMapPoiProvider.getActiveGroupIds()` | Keys of the groups currently visible (according to the stored state). | 77 |
| `freeroam_bigMapPoiProvider.getAllActiveGroupPoiIds()` | Ids of the POIs belonging to the visible groups of the cached filters (rebuilt if needed). A POI present in several groups appears several times. | 96 |
| `freeroam_bigMapPoiProvider.getAllGroupIds()` | Keys of all known groups (visible or not). | 88 |
| `freeroam_bigMapPoiProvider.getCachedFilters()` | Big map filters (freeroam or career), rebuilt if the cache is invalid. | 143 |
| `freeroam_bigMapPoiProvider.getCachedGroupData()` | Groups keyed by key (label, icon, elements, visible, groupKey), rebuilt if the cache is invalid. | 127 |
| `freeroam_bigMapPoiProvider.getCachedPoiData()` | Formatted POI data keyed by id, each with filterData (groupTags, sortingValues). | 135 |
| `freeroam_bigMapPoiProvider.getGroupVisibility(groupKey)` | Tells whether a group is visible (true by default if unknown). | 63 |
| `freeroam_bigMapPoiProvider.invalidateCache()` | Clears the group, POI and filter cache; it will be rebuilt on the next request. | 45 |
| `freeroam_bigMapPoiProvider.onClientStartMission()` | Hook called when a level starts: equivalent to forceSend(). *(internal)* *(hook)* | 10 |
| `freeroam_bigMapPoiProvider.onPreRender(dtReal, dtSim)` | Hook called every frame: if the game state has game mode markers and a level is loaded and sendToMinimap is true, calls sendMissionLocationsToMinimap (which sets the flag back to false). *(internal)* *(hook)* | 702 |
| `freeroam_bigMapPoiProvider.requestMissionLocationsForMinimap()` | Requests a new send of the mission positions to the minimap (equivalent to forceSend). | 10 |
| `freeroam_bigMapPoiProvider.resetAllGroupsToVisible()` | Sets all known groups back to visible. | 120 |
| `freeroam_bigMapPoiProvider.sendCurrentLevelMissionsToBigmap()` | Rebuilds everything (groups, POIs, filters), determines gameMode and rules (canSetRoute), calls freeroam_bigMapMode.setOnlyIdsVisible with the POIs of the visible groups, then sends everything to the UI via guihooks.trigger('BigmapMissionData', data). | 643 |
| `freeroam_bigMapPoiProvider.sendMissionLocationsToMinimap()` | Sets the internal sendToMinimap flag back to false; actually sends nothing (body reduced to this flag). | 153 |
| `freeroam_bigMapPoiProvider.setGroupVisibility(groupKey, isVisible)` | Sets a group's visibility; the effect only appears after a new send to the big map. | 58 |
| `freeroam_bigMapPoiProvider.toggleGroupVisibility(groupKey)` | Toggles a group's visibility (the big map update is commented out in the code). | 68 |

### Parameter details

#### `freeroam_bigMapPoiProvider.formatMissionForBigmap(elemData)`

Converts a mission into a table for the UI: id, icon, name, description, thumbnail, previews, difficulty, fast travel available/unlocked, progress, rating, rating key, etc.

- `elemData` (*table*) : Mission POI data (uses missionId and idInCluster).
- **returns**: table|nil Formatted table, nil if the mission does not exist.

#### `freeroam_bigMapPoiProvider.formatPoiForBigmap(poi)`

Converts a non-mission POI into a table for the UI (id, icon from bigmapMarker.cardIcon or from the type, name, description, thumbnail, previews, fast travel, canSetRoute, aggregates). Fast travel is only available outside career or during the career tutorial.

- `poi` (*table*) : Raw POI from gameplay_rawPois with markerInfo.bigmapMarker.
- **returns**: table Table formatted for the big map.

#### `freeroam_bigMapPoiProvider.getActiveGroupIds()`

Keys of the groups currently visible (according to the stored state).

- **returns**: string[] Visible group keys.

#### `freeroam_bigMapPoiProvider.getAllActiveGroupPoiIds()`

Ids of the POIs belonging to the visible groups of the cached filters (rebuilt if needed). A POI present in several groups appears several times.

- **returns**: string[] POI ids.

#### `freeroam_bigMapPoiProvider.getAllGroupIds()`

Keys of all known groups (visible or not).

- **returns**: string[] Group keys.

#### `freeroam_bigMapPoiProvider.getCachedFilters()`

Big map filters (freeroam or career), rebuilt if the cache is invalid.

- **returns**: table[] List of filters {key, icon, title, groups}.

#### `freeroam_bigMapPoiProvider.getCachedGroupData()`

Groups keyed by key (label, icon, elements, visible, groupKey), rebuilt if the cache is invalid.

- **returns**: table<string, table> Group data.

#### `freeroam_bigMapPoiProvider.getCachedPoiData()`

Formatted POI data keyed by id, each with filterData (groupTags, sortingValues).

- **returns**: table<string, table> Formatted POIs.

#### `freeroam_bigMapPoiProvider.getGroupVisibility(groupKey)`

Tells whether a group is visible (true by default if unknown).

- `groupKey` (*string*) : Group key, e.g. 'type_garage'.
- **returns**: boolean true if visible.

#### `freeroam_bigMapPoiProvider.onPreRender(dtReal, dtSim)`

Hook called every frame: if the game state has game mode markers and a level is loaded and sendToMinimap is true, calls sendMissionLocationsToMinimap (which sets the flag back to false).

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulation elapsed time (s).

#### `freeroam_bigMapPoiProvider.setGroupVisibility(groupKey, isVisible)`

Sets a group's visibility; the effect only appears after a new send to the big map.

- `groupKey` (*string*) : Group key.
- `isVisible` (*boolean*) : true to show.

#### `freeroam_bigMapPoiProvider.toggleGroupVisibility(groupKey)`

Toggles a group's visibility (the big map update is commented out in the code).

- `groupKey` (*string*) : Group key.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_playmodeMarkers. |

**UI events (guihooks.trigger):** `BigmapMissionData`, `NavigationStaticMarkers`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/bigMapPoiProvider.lua`.*
