# `ui_gameplaySelector_general`

*File: `lua/ge/extensions/ui/gameplaySelector/general.lua` · VM: Game Engine (GE) · 1189 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_general`: `extensions.load("ui_gameplaySelector_general")`, then the global `ui_gameplaySelector_general`

"gameplaySelector" backend of the grid selector: the screen that lists missions, scenarios, campaigns, quick-start experiences and rally selectors. It collects the tiles through the hook onGameplaySelectorGetTiles (validBackends must contain gameplaySelector), handles filters, search, favorites, recents and display options (saved in /settings/gameplaySelectorData.json), builds the details via onGameplaySelectorGetDetails and sends snapshots to the interface (GameplaySelectorDataLoaded, gameplaySelectorDisplayDataSnapshot, gameplaySelectorDetails). It also applies presets according to the route (menu.gameplay, menu.rallySelector, menu.experiencesSelector) and handles navigation to "clusters".

## Example

```lua
-- open the rally selector (applies the rallyStage and rallyLoop filters)
ui_gameplaySelector_general.openRallySelector()
```

## Notes

- Routes handled: menu.gameplay (and menu.gameplay.type for a cluster), menu.rallySelector, menu.experiencesSelector (and menu.experiencesSelector.type). For rally, groupMode and clusterMode come from groupModeRally (default "type") and clusterModeRally (default "none"); for experiences, groupMode is "system" and clusterMode "automatic".
- The route presets (GAMEPLAY_ROUTE_PRESETS) clear filters and search then enable the quickStartExperiences system (experiences) or the types bigMap.missionLabels.rallyStage and rallyLoop (rally).
- When a route is mounted, the heavy loading goes through util_asyncBulkLoader.loadGameplaySelector; the snapshot is only emitted at the end (hook asyncGameplaySelectorLoadComplete) and only if the current route is still the requested one. Without asyncBulkLoader, or if it answers "alreadyLoaded", the snapshot is emitted right away.
- The data is recomputed on next access after onModActivated, onModDeactivated, onModManagerReady, onModManagerStateChanged or onSettingsChanged. Unlike the freeroam backend, onLanguageChanged is not listened to here.
- Several functions accept an optional requestId: if provided, a snapshot is emitted so that the interface ignores stale responses. clearAllFilters does not have this parameter.
- Display options: groupMode, clusterMode, groupModeRally, clusterModeRally, displaySize, showAuxContent, showCareerContent (false by default), sorting, showRecentMode, showFavouritesMode, defaultFreeroamAction. The data version is 12.
- The "system" filter offers quick values: quickStartExperiences, challenges, scenarios, scenariosMultiplayer and, outside the simplified menu, campaigns.
- Debug left in the code: navigateToCluster and onClusterRouteMount call dump(), and the steps of the asynchronous mount write with print().
- Inconsistencies in range filtering: the test "not type(propVal) == 'number'" is always false because of the precedence of not (it should be type(propVal) ~= 'number'), and an assignment propVal = item[propKey] is repeated with no effect in the filter creation.
- exploreFolder, goToMod, closedFromUI, exitCallback and profilerFinish are shells (log or TODO); getManagementDetails always returns { buttons = {} }.
- The field M.displayDataInstance is exposed after the first initialization.

**Dependencies (loaded first):** `ui_gameplaySelector_tiles`, `core_locales`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_general.asyncGameplaySelectorLoadComplete()` | End hook of the asynchronous loading (util_asyncBulkLoader). Emits the GameplaySelectorDataLoaded snapshot of the pending route, unless the user changed route in the meantime. *(internal)* | 1070 |
| `ui_gameplaySelector_general.clearAllFilters()` | Clears all filters. | 641 |
| `ui_gameplaySelector_general.closedFromUI()` | Called when the interface closes the selector. Does nothing for now (TODO). *(internal)* | 821 |
| `ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId)` | Rebuilds the current view's snapshot (groups, filters, display options, management details, search text, header) and sends it via the event gameplaySelectorDisplayDataSnapshot with the requestId. Returns false and logs an error on failure. | 1107 |
| `ui_gameplaySelector_general.executeButton(buttonId, additionalData)` | Runs the details button with the given identifier via the buttonModule. | 837 |
| `ui_gameplaySelector_general.executeDoubleClick(item)` | Runs the button marked isDoubleClickAction in a tile's details (or the only button if there is just one). | 850 |
| `ui_gameplaySelector_general.exitCallback()` | Does nothing (TODO). *(internal)* | 846 |
| `ui_gameplaySelector_general.exploreFolder(path)` | Only logs the path (not implemented). | 862 |
| `ui_gameplaySelector_general.getActiveFilters()` | Returns the active filters. | 676 |
| `ui_gameplaySelector_general.getDetails(item)` | Builds a tile's details by emitting the hook onGameplaySelectorGetDetails and returns the first block. | 827 |
| `ui_gameplaySelector_general.getDisplayData(routeName)` | Returns the effective display options, adapted to the route (rally or experiences). | 626 |
| `ui_gameplaySelector_general.getDisplayDataOptions(routeName)` | Returns the display options definition adapted to the route: hides groupMode and clusterMode in rally or experiences mode, and hides groupModeRally and clusterModeRally elsewhere. | 725 |
| `ui_gameplaySelector_general.getFilters()` | Returns the filter definition after loading the data. | 671 |
| `ui_gameplaySelector_general.getGameplayData()` | Returns the selector data (tiles whose validBackends contains gameplaySelector, filters, display options), recomputes them if the mods or settings have changed, and creates them on first request. | 487 |
| `ui_gameplaySelector_general.getManagementDetails()` | Always returns { buttons = {} } (TODO in the code). | 841 |
| `ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path)` | Builds the screen title and the breadcrumb (menu, gameplay selector, filters or search segment, cluster or discover page). Adds "(filtered)" to the title if filters or a search are active. | 746 |
| `ui_gameplaySelector_general.getSearchText()` | Returns the current search text. | 712 |
| `ui_gameplaySelector_general.getTiles(path, routeName)` | Returns the tile groups for a path, via ui_gameplaySelector_tiles.getTiles. | 510 |
| `ui_gameplaySelector_general.getUiData(routeName)` | Returns the selector data: items, displayData (adapted to the route: rally or experiences), filterList, activeFilters, lockedFiltersByProp and backendName. Loads the tiles if needed. | 440 |
| `ui_gameplaySelector_general.goToMod(modId)` | Only logs the mod id (not implemented). | 867 |
| `ui_gameplaySelector_general.isFavourite(itemKey)` | Indicates whether a tile is a favorite. | 647 |
| `ui_gameplaySelector_general.isGameplayDataLoaded()` | Indicates whether the data has already been built and is up to date. | 498 |
| `ui_gameplaySelector_general.isRecent(itemKey)` | Indicates whether a tile is among the recent items. | 659 |
| `ui_gameplaySelector_general.navigateToCluster(input)` | Prepares then opens a tile cluster's screen. Computes the path keys (gotoPath, keys or the table itself) and a title, stores the pending selection and navigates to menu.gameplay.type (or menu.experiencesSelector.type from the experiences selector). | 582 |
| `ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data)` | Route hook called on entering a cluster route. Promotes the selection prepared by navigateToCluster, otherwise falls back to the default cluster. *(internal)* *(hook)* | 1130 |
| `ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data)` | Route hook called when a cluster route is mounted. Starts the asynchronous loading with the active cluster's keys and title. *(internal)* *(hook)* | 1142 |
| `ui_gameplaySelector_general.onModActivated()` | Hook called when a mod is activated: marks the data as needing recomputation. *(internal)* *(hook)* | 504 |
| `ui_gameplaySelector_general.onModDeactivated()` | Hook called when a mod is deactivated: marks the data as needing recomputation. *(internal)* *(hook)* | 503 |
| `ui_gameplaySelector_general.onModManagerReady()` | Hook called when the mod manager is ready: marks the data as needing recomputation. *(internal)* *(hook)* | 505 |
| `ui_gameplaySelector_general.onModManagerStateChanged()` | Hook called when the mod manager state changes: marks the data as needing recomputation. *(internal)* *(hook)* | 506 |
| `ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data)` | Route hook called when a root route of the selector is mounted. Resets the cluster selection, stores the active route and starts the asynchronous loading with the allGameplay path. *(internal)* *(hook)* | 1122 |
| `ui_gameplaySelector_general.onSettingsChanged()` | Hook called when the settings change: marks the data as needing recomputation. *(internal)* *(hook)* | 507 |
| `ui_gameplaySelector_general.openExperiencesSelector()` | Opens menu.experiencesSelector with the system filter quickStartExperiences. | 1184 |
| `ui_gameplaySelector_general.openGameplaySelector()` | Applies the preset of the menu.gameplay route (clears filters and search) then navigates to it. | 1176 |
| `ui_gameplaySelector_general.openRallySelector()` | Opens menu.rallySelector with the type filters rallyStage and rallyLoop. | 1180 |
| `ui_gameplaySelector_general.passesFilters(item)` | Indicates whether a tile passes the filters and the search; an isCareerOnly tile is refused as long as displayData.showCareerContent is false. | 610 |
| `ui_gameplaySelector_general.profilerFinish()` | Does nothing (TODO in the code). *(internal)* | 817 |
| `ui_gameplaySelector_general.requestDetails(item, requestId)` | Builds a tile's details and sends them to the interface via the event gameplaySelectorDetails with backendName, requestId, item and details. | 596 |
| `ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId)` | Resets the display options to their default values. Emits a snapshot if requestId is provided. | 737 |
| `ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId)` | Resets a range filter. Emits a snapshot if requestId is provided. | 696 |
| `ui_gameplaySelector_general.resetSetFilter(filterKey, requestId)` | Resets a multiple-choice filter. Emits a snapshot if requestId is provided. | 704 |
| `ui_gameplaySelector_general.resolveClusterTitle(clusterTitle)` | Returns the active cluster's title, otherwise clusterTitle if it is a non-empty string, otherwise nil. | 1158 |
| `ui_gameplaySelector_general.resolveCurrentSelectorPath()` | Returns the current view's path: that of the active cluster, otherwise the root path { keys = {"allGameplay"} }. | 1092 |
| `ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId)` | Sets a display option and returns the updated display data. Emits a snapshot if requestId is provided. | 729 |
| `ui_gameplaySelector_general.setSearchText(text, requestId)` | Sets the search text. Emits a snapshot if requestId is provided. | 716 |
| `ui_gameplaySelector_general.toggleFavourite(itemDetails)` | Toggles a tile's favorite status and returns the new state. | 652 |
| `ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId)` | Enables or disables a filter value. Emits a snapshot if requestId is provided. | 680 |
| `ui_gameplaySelector_general.trackRecent(itemKey)` | Records a tile as recently used. | 664 |
| `ui_gameplaySelector_general.updateDisplayData(key, value)` | Changes a display option (displayDataInstance.setDisplayDataOption). | 631 |
| `ui_gameplaySelector_general.updateFilterData(key, value)` | Updates an internal datum of the filters module (filterInstance.updateData). | 636 |
| `ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Sets the bounds of a range filter. Emits a snapshot if requestId is provided. | 688 |

### Parameter details

#### `ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId)`

Rebuilds the current view's snapshot (groups, filters, display options, management details, search text, header) and sends it via the event gameplaySelectorDisplayDataSnapshot with the requestId. Returns false and logs an error on failure.

- `requestId` (*any*) : Interface request identifier.
- **returns**: boolean true if the event was sent.

#### `ui_gameplaySelector_general.executeButton(buttonId, additionalData)`

Runs the details button with the given identifier via the buttonModule.

- `buttonId` (*any*) : Button identifier.
- `additionalData` (*any*) : Extra data passed to the callback.
- **returns**: any Result of buttonInstance.executeButton.

#### `ui_gameplaySelector_general.executeDoubleClick(item)`

Runs the button marked isDoubleClickAction in a tile's details (or the only button if there is just one).

- `item` (*table*) : The tile's showDetails data.

#### `ui_gameplaySelector_general.exploreFolder(path)`

Only logs the path (not implemented).

- `path` (*string*) : Folder path.

#### `ui_gameplaySelector_general.getActiveFilters()`

Returns the active filters.

- **returns**: table Active filters.

#### `ui_gameplaySelector_general.getDetails(item)`

Builds a tile's details by emitting the hook onGameplaySelectorGetDetails and returns the first block.

- `item` (*table*) : The tile's showDetails data.
- **returns**: table|nil Details block, nil if no generator responded.

#### `ui_gameplaySelector_general.getDisplayData(routeName)`

Returns the effective display options, adapted to the route (rally or experiences).

- `routeName` (*string|nil*) : Name of the road.
- **returns**: table Option values by key.

#### `ui_gameplaySelector_general.getDisplayDataOptions(routeName)`

Returns the display options definition adapted to the route: hides groupMode and clusterMode in rally or experiences mode, and hides groupModeRally and clusterModeRally elsewhere.

- `routeName` (*string|nil*) : Route name (the active route by default).
- **returns**: table[] Visible options.

#### `ui_gameplaySelector_general.getFilters()`

Returns the filter definition after loading the data.

- **returns**: table Result of filterInstance.getFilters().

#### `ui_gameplaySelector_general.getGameplayData()`

Returns the selector data (tiles whose validBackends contains gameplaySelector, filters, display options), recomputes them if the mods or settings have changed, and creates them on first request.

- **returns**: table Table items, filterList, activeFilters, lockedFiltersByProp, displayData.

#### `ui_gameplaySelector_general.getManagementDetails()`

Always returns { buttons = {} } (TODO in the code).

- **returns**: table Table with empty buttons.

#### `ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path)`

Builds the screen title and the breadcrumb (menu, gameplay selector, filters or search segment, cluster or discover page). Adds "(filtered)" to the title if filters or a search are active.

- `path` (*table*) : Current path { keys = {...} }.
- **returns**: table Table title, isFiltered, pathSegments.

#### `ui_gameplaySelector_general.getSearchText()`

Returns the current search text.

- **returns**: string|nil Entered text.

#### `ui_gameplaySelector_general.getTiles(path, routeName)`

Returns the tile groups for a path, via ui_gameplaySelector_tiles.getTiles.

- `path` (*table*) : Navigation path { keys = {...} }.
- `routeName` (*string|nil*) : Name of the road.
- **returns**: table[] Tile groups.

#### `ui_gameplaySelector_general.getUiData(routeName)`

Returns the selector data: items, displayData (adapted to the route: rally or experiences), filterList, activeFilters, lockedFiltersByProp and backendName. Loads the tiles if needed.

- `routeName` (*string|nil*) : Route name, to adapt groupMode and clusterMode.
- **returns**: table Interface data table.

#### `ui_gameplaySelector_general.goToMod(modId)`

Only logs the mod id (not implemented).

- `modId` (*string*) : Mod identifier.

#### `ui_gameplaySelector_general.isFavourite(itemKey)`

Indicates whether a tile is a favorite.

- `itemKey` (*string*) : Tile key.
- **returns**: boolean true if favorite.

#### `ui_gameplaySelector_general.isGameplayDataLoaded()`

Indicates whether the data has already been built and is up to date.

- **returns**: boolean|nil True if loaded and not invalidated (nil or false otherwise).

#### `ui_gameplaySelector_general.isRecent(itemKey)`

Indicates whether a tile is among the recent items.

- `itemKey` (*string*) : Tile key.
- **returns**: boolean true if recent.

#### `ui_gameplaySelector_general.navigateToCluster(input)`

Prepares then opens a tile cluster's screen. Computes the path keys (gotoPath, keys or the table itself) and a title, stores the pending selection and navigates to menu.gameplay.type (or menu.experiencesSelector.type from the experiences selector).

- `input` (*table*) : Tile or path table: gotoPath, keys, or list of keys; name, label or title for the title.
- **returns**: any Result of ui_router.navigate.

#### `ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data)`

Route hook called on entering a cluster route. Promotes the selection prepared by navigateToCluster, otherwise falls back to the default cluster.

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table|nil*) : Origin route.
- `data` (*table*) : Route data.

#### `ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data)`

Route hook called when a cluster route is mounted. Starts the asynchronous loading with the active cluster's keys and title.

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Destination route (name used).
- `fromRoute` (*table|nil*) : Origin route.
- `data` (*table*) : Route data.

#### `ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data)`

Route hook called when a root route of the selector is mounted. Resets the cluster selection, stores the active route and starts the asynchronous loading with the allGameplay path.

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Destination route (name used).
- `fromRoute` (*table|nil*) : Origin route.
- `data` (*table*) : Route data (not used).

#### `ui_gameplaySelector_general.passesFilters(item)`

Indicates whether a tile passes the filters and the search; an isCareerOnly tile is refused as long as displayData.showCareerContent is false.

- `item` (*table*) : Tile tested.
- **returns**: boolean true if the tile is displayed.

#### `ui_gameplaySelector_general.requestDetails(item, requestId)`

Builds a tile's details and sends them to the interface via the event gameplaySelectorDetails with backendName, requestId, item and details.

- `item` (*table*) : The tile's showDetails data.
- `requestId` (*any*) : Interface request identifier.
- **returns**: table The payload sent.

#### `ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId)`

Resets the display options to their default values. Emits a snapshot if requestId is provided.

- `requestId` (*any|nil*) : Request identifier.
- **returns**: table Display data.

#### `ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId)`

Resets a range filter. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.resetRangeFilter.

#### `ui_gameplaySelector_general.resetSetFilter(filterKey, requestId)`

Resets a multiple-choice filter. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.resetSetFilter.

#### `ui_gameplaySelector_general.resolveClusterTitle(clusterTitle)`

Returns the active cluster's title, otherwise clusterTitle if it is a non-empty string, otherwise nil.

- `clusterTitle` (*string|nil*) : Fallback title.
- **returns**: string|nil Resolved title.

#### `ui_gameplaySelector_general.resolveCurrentSelectorPath()`

Returns the current view's path: that of the active cluster, otherwise the root path { keys = {"allGameplay"} }.

- **returns**: table Path { keys = {...} }.

#### `ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId)`

Sets a display option and returns the updated display data. Emits a snapshot if requestId is provided.

- `key` (*string*) : Option key.
- `value` (*any*) : Value.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: table Display data.

#### `ui_gameplaySelector_general.setSearchText(text, requestId)`

Sets the search text. Emits a snapshot if requestId is provided.

- `text` (*string*) : Search text.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.setSearchText.

#### `ui_gameplaySelector_general.toggleFavourite(itemDetails)`

Toggles a tile's favorite status and returns the new state.

- `itemDetails` (*table*) : Table with the field key.
- **returns**: boolean New favorite state.

#### `ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId)`

Enables or disables a filter value. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `value` (*any*) : Option value.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.toggleFilter.

#### `ui_gameplaySelector_general.trackRecent(itemKey)`

Records a tile as recently used.

- `itemKey` (*string*) : Tile key.

#### `ui_gameplaySelector_general.updateDisplayData(key, value)`

Changes a display option (displayDataInstance.setDisplayDataOption).

- `key` (*string*) : Option key.
- `value` (*any*) : New value.

#### `ui_gameplaySelector_general.updateFilterData(key, value)`

Updates an internal datum of the filters module (filterInstance.updateData).

- `key` (*string*) : Data key.
- `value` (*any*) : Value.

#### `ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Sets the bounds of a range filter. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `min` (*number*) : Bottom bound.
- `max` (*number*) : Top bound.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.updateRangeFilter.

## Fields

| Field | Type | Description |
|---|---|---|
| `backendName` | string | Backend name: "gameplaySelector". |
| `dependencies` | string[] | Extensions loaded before this one: ui_gameplaySelector_tiles and core_locales. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGameplaySelectorGetDetails` — listened to by 5 module(s)
- `onGameplaySelectorGetTiles` — listened to by 5 module(s)

**UI events (guihooks.trigger):** `GameplaySelectorDataLoaded`, `gameplaySelectorDetails`, `gameplaySelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/general.lua`.*
