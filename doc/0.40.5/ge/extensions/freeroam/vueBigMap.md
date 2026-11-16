# `freeroam_vueBigMap`

*File: `lua/ge/extensions/freeroam/vueBigMap.lua` · VM: Game Engine (GE) · 1037 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_vueBigMap`: `extensions.load("freeroam_vueBigMap")`, then the global `freeroam_vueBigMap`

Lua backend of the big map in the Vue UI: prepares for the UI the list of points of interest (POIs: missions, garages, stations, dealerships, dragstrips, spawn points, the player's vehicle...), the filters and groups of the side list, the game state, and relays the UI's actions (selection, hover, navigation, panning, execution of POI actions) to freeroam_bigMapMode. The data is cached on opening (enterBigMap) and freed on closing (exitBigMap). UI-side calls go through bngApi.engineLua (see the file's header comment); Lua -> Vue goes through guihooks.trigger('showPoiDetails', {poiIds, ignoreReduction}). Depends on gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_missions_missionScreen. Global: freeroam_vueBigMap.

## Example

```lua
freeroam_vueBigMap.enterBigMap({isMenuBigmap = true})
local groups = freeroam_vueBigMap.getGroups()
freeroam_vueBigMap.toggleFilterSectionById('everything')
freeroam_vueBigMap.exitBigMap()
```

## Notes

- Filter structure: sections {key, icon, label, groups = {{key, label, icon, elementCount, visible}}}. The groups (getGroups) only contain visible, non-empty groups, with elementIds (POI ids) and a translated label.
- Icons by POI type: spawnPoint=fastTravel, garage=garage01, gasStation=fuelPump, dealership=carDealer, logisticsParking/logisticsOffice=boxTruckFast, computer=screen, driftSpot=drift01, dragstrip=drag02, crawl=rockCrawling02, playerVehicle=carStarred, other=info.
- POI actions are registered with addAction(callback, meta) (returns meta.actionId) and run by executeAction(actionId) / executePoiAction; clearActionFunctions empties them on leaving the map (exitBigMap).
- setPoiListDisplayMode accepts 'hidden', 'tree' or 'simple' (poiListDisplayMode setting), otherwise returns 'invalid_mode'.
- selectPoiFromList/navigateToPoi/panToPoi treat the strings "undefined" and "null" (sent by the UI) as nil.
- In onPoiSelectedFromBigmap, ignoreNextReductionFlag is set back to false before being passed in `ignoreReduction` of the showPoiDetails hook, which therefore always receives false.
- The gameStateInfoCache.gameMode field is 'mission' when a mission is in the foreground (gameplay_missions_missionManager.getForegroundMissionId()).

**Dependencies (loaded first):** `gameplay_missions_missions`, `freeroam_bigMapMode`, `gameplay_rawPois`, `gameplay_missions_missionScreen`

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_vueBigMap.addAction(callback, meta)` | Registers an action callback and returns the meta table enriched with actionId. | 134 |
| `freeroam_vueBigMap.clearActionFunctions()` | Empties the actions table. | 129 |
| `freeroam_vueBigMap.enterBigMap(options)` | Opens the big map: delegates to freeroam_bigMapMode.enterBigMap (instant), generates the POI/filter/group caches and applies the POIs' visibility. | 809 |
| `freeroam_vueBigMap.executeAction(actionId)` | Runs an action's callback; error log if unknown. | 144 |
| `freeroam_vueBigMap.executePoiAction(actionId)` | Runs a registered POI action (see executeAction). | 992 |
| `freeroam_vueBigMap.exitBigMap()` | Closes the big map (freeroam_bigMapMode.exitBigMap(true)), empties the caches and the actions. | 830 |
| `freeroam_vueBigMap.getAndClearPendingAutoSelectPoiId()` | Retrieves then clears the POI id to auto-select requested when the map opened, from freeroam_bigMapMode. | 996 |
| `freeroam_vueBigMap.getFilters()` | Filter sections, each group with its current `visible` state. | 850 |
| `freeroam_vueBigMap.getFreeActionId()` | Increments and returns a new action identifier. | 123 |
| `freeroam_vueBigMap.getGameStateInfo()` | Game state information for the POI list, with poiListDisplayMode (setting, 'tree' by default). | 907 |
| `freeroam_vueBigMap.getGroups()` | Groups for the POI list: visible, non-empty sections and groups. | 862 |
| `freeroam_vueBigMap.getPoiData()` | Full POI data by id (name, preview, aggregates, available actions), generated if the cache is invalid. | 843 |
| `freeroam_vueBigMap.hoverPoiFromList(poiId, active)` | Highlights the marker of the POI hovered in the list. | 985 |
| `freeroam_vueBigMap.navigateToPoi(poiId)` | Computes a route to the POI (freeroam_bigMapMode.navigateToMission). | 951 |
| `freeroam_vueBigMap.onPoiSelectedFromBigmap(poiId)` | Called by the map when a POI is selected on it: sends showPoiDetails to the UI with the POI ids grouped under the mouse (freeroam_bigMapMarkers.getIdsFromHoveredPoiId) or an empty list. *(internal)* *(hook)* | 967 |
| `freeroam_vueBigMap.panToPoi(poiId)` | Centers the map view on the POI. | 959 |
| `freeroam_vueBigMap.selectPoiFromList(poiId, isCollapsedMode)` | Selects a POI from the list (freeroam_bigMapMode.selectPoi) or deselects if the id is null. | 935 |
| `freeroam_vueBigMap.setPoiListDisplayMode(mode)` | Sets the list display mode ('hidden', 'tree', 'simple') in the settings. | 1002 |
| `freeroam_vueBigMap.setVisibleIds()` | Computes the POI ids of the visible groups and calls freeroam_bigMapMode.setOnlyIdsVisible. | 918 |
| `freeroam_vueBigMap.toggleFilterSectionById(sectionId)` | Shows all groups (sectionId 'everything') or only those of the given section. | 95 |
| `freeroam_vueBigMap.toggleFiltersByIds(filterIds)` | Makes visible only the groups whose keys are given (all the others are hidden) and updates the visibility on the map. | 85 |

### Parameter details

#### `freeroam_vueBigMap.addAction(callback, meta)`

Registers an action callback and returns the meta table enriched with actionId.

- `callback` (*function*) : Function to call.
- `meta` (*table|nil*) : Metadata (label, etc.).
- **returns**: table meta with actionId.

#### `freeroam_vueBigMap.enterBigMap(options)`

Opens the big map: delegates to freeroam_bigMapMode.enterBigMap (instant), generates the POI/filter/group caches and applies the POIs' visibility.

- `options` (*table|nil*) : {controllerUsed?: boolean, isMenuBigmap?: boolean, ignoreUiStateChange?: boolean}; ignoreUiStateChange defaults to isMenuBigmap; the action maps are ignored if controllerUsed and isMenuBigmap.

#### `freeroam_vueBigMap.executeAction(actionId)`

Runs an action's callback; error log if unknown.

- `actionId` (*integer*) : Identifier.
- **returns**: string 'success' or 'error'.

#### `freeroam_vueBigMap.executePoiAction(actionId)`

Runs a registered POI action (see executeAction).

- `actionId` (*integer*) : Action identifier.

#### `freeroam_vueBigMap.getAndClearPendingAutoSelectPoiId()`

Retrieves then clears the POI id to auto-select requested when the map opened, from freeroam_bigMapMode.

- **returns**: string|nil POI id.

#### `freeroam_vueBigMap.getFilters()`

Filter sections, each group with its current `visible` state.

- **returns**: table[] Filter sections.

#### `freeroam_vueBigMap.getFreeActionId()`

Increments and returns a new action identifier.

- **returns**: integer Identifier.

#### `freeroam_vueBigMap.getGameStateInfo()`

Game state information for the POI list, with poiListDisplayMode (setting, 'tree' by default).

- **returns**: table State.

#### `freeroam_vueBigMap.getGroups()`

Groups for the POI list: visible, non-empty sections and groups.

- **returns**: table[] Sections {key, icon, title, groups[{key, label, icon, elementIds, visible, openByDefault}]}.

#### `freeroam_vueBigMap.getPoiData()`

Full POI data by id (name, preview, aggregates, available actions), generated if the cache is invalid.

- **returns**: table POIs by id.

#### `freeroam_vueBigMap.hoverPoiFromList(poiId, active)`

Highlights the marker of the POI hovered in the list.

- `poiId` (*string*) : POI id.
- `active` (*boolean*) : Active hover.
- **returns**: string 'success'
- **returns**: boolean active

#### `freeroam_vueBigMap.navigateToPoi(poiId)`

Computes a route to the POI (freeroam_bigMapMode.navigateToMission).

- `poiId` (*string|nil*) : POI id.
- **returns**: string 'success'

#### `freeroam_vueBigMap.onPoiSelectedFromBigmap(poiId)`

Called by the map when a POI is selected on it: sends showPoiDetails to the UI with the POI ids grouped under the mouse (freeroam_bigMapMarkers.getIdsFromHoveredPoiId) or an empty list.

- `poiId` (*string|nil*) : Id of the selected POI.

#### `freeroam_vueBigMap.panToPoi(poiId)`

Centers the map view on the POI.

- `poiId` (*string|nil*) : POI id.
- **returns**: string 'success'

#### `freeroam_vueBigMap.selectPoiFromList(poiId, isCollapsedMode)`

Selects a POI from the list (freeroam_bigMapMode.selectPoi) or deselects if the id is null.

- `poiId` (*string|nil*) : POI id ('undefined'/'null' = none).
- `isCollapsedMode` (*boolean|nil*) : If false, the next group reduction is ignored.
- **returns**: string 'success'

#### `freeroam_vueBigMap.setPoiListDisplayMode(mode)`

Sets the list display mode ('hidden', 'tree', 'simple') in the settings.

- `mode` (*string*) : Mode.
- **returns**: string 'success' or 'invalid_mode'.

#### `freeroam_vueBigMap.toggleFilterSectionById(sectionId)`

Shows all groups (sectionId 'everything') or only those of the given section.

- `sectionId` (*string*) : Section key or 'everything'.

#### `freeroam_vueBigMap.toggleFiltersByIds(filterIds)`

Makes visible only the groups whose keys are given (all the others are hidden) and updates the visibility on the map.

- `filterIds` (*string[]*) : Group keys.

## Fields

| Field | Type | Description |
|---|---|---|
| `actionFunctions` | table<integer, function> | POI action callbacks, by id. |
| `actionIdCounter` | integer | POI action id counter. |
| `dependencies` | string[] | Extensions loaded before. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBigmapBuildCustomGroupStructures` — listened to by 1 module(s)
- `onBigmapBuildGroupData` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `showPoiDetails`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/vueBigMap.lua`.*
