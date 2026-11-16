# `ui_vehicleSelector_general`

*File: `lua/ge/extensions/ui/vehicleSelector/general.lua` · VM: Game Engine (GE) · 2046 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_general`: `extensions.load("ui_vehicleSelector_general")`, then the global `ui_vehicleSelector_general`

Central module of the vehicle selector ("vehicleSelector" backend of ui_gridSelector). It builds the UI data (models, configs, filters), manages the persisted display options (/settings/vehicleSelectorData.json), filters, search, favorites and recent vehicles, then opens the selector in various contexts (freeroam, garage, challenge, configurator, pause) by changing the buttons and the breadcrumb root. It also drives the lifecycle of the pause/garage routes (root list and a vehicle's detail page) and sends snapshots to the interface. Most filter and detail functions delegate to filterModule, displayDataModule, ui_vehicleSelector_tiles and ui_vehicleSelector_detailsInteraction.

## Example

```lua
-- open the selector from a script and get the choice
ui_vehicleSelector_general.openVehicleSelectorForChallenge(function(model, config, extra)
  if model then log('I', '', model .. ' / ' .. tostring(config)) end
end)
```

## Notes

- The displayData and filter instances are created on demand (setupInstances / ensureInstances); the display options format version is 11.
- The UI data (getUiData) is rebuilt when vehicleDataChanged is true (mod enabled or disabled, mod manager, language change, clearCache).
- Filters: allowed properties = Drivetrain, Config Type, Body Style, Transmission, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Years, Value, Brand, Country, Region, Source, Type, Derby Class, Performance Class, Off-Road Score, Propulsion, Fuel Type, Induction Type, Commercial Class. The range filters are Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Off-Road Score, Years; Region is a dictionary-type filter.
- 'Powerglow' configs are excluded except in the 'lightRunner' restriction mode (only Powerglow, Car or Truck). The 'busRoute' mode keeps only Body Style = Bus and Commercial Class = Transit Bus.
- The spawnOnly mode is reset to false when leaving the selector route family, and on close (closedFromUI).
- Most functions that accept a requestId then emit a 'vehicleSelectorDisplayDataSnapshot' snapshot; without a requestId (nil) nothing is emitted.
- Probable bug: in vehiclePassesFilters, the range test `not type(propVal) == 'number'` is always false (precedence of `not`), so it does not guard against non-numeric values.
- Probable bug: vehiclePassesFilters reads config.infoFilename without checking that config exists (the code does handle the "no config" case just before): error if showCustomPCFiles is disabled and config is nil.
- M.getDisplayData is defined twice (same behavior). The M.p field is a fake profiler (empty start, add, finish); profilerFinish does nothing because M.p.timer does not exist.
- Debug traces left in: navigateToVehicle does dump() calls, and the openVehicleSelectorForFreeroamModal callback dumps its 4 arguments.

**Dependencies (loaded first):** `core_vehicles`, `ui_vehicleSelector_detailsInteraction`, `ui_vehicleSelector_tiles`, `core_locales`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_general.asyncVehicleLoadComplete()` | Hook called by util_asyncBulkLoader when the asynchronous vehicle loading is finished: builds and emits the pending snapshot (VehicleSelectorDataLoaded), unless the route changed in the meantime. *(internal)* | 1819 |
| `ui_vehicleSelector_general.calculateActiveFilters(...)` | Recomputes the list of active filters (delegates to the filter module). | 934 |
| `ui_vehicleSelector_general.clearAllFilters(...)` | Clears all unlocked filters. | 925 |
| `ui_vehicleSelector_general.clearCache()` | Forces the UI data and display options to be rebuilt on next access. | 747 |
| `ui_vehicleSelector_general.clearDrilldownSelectorState()` | Resets the pending or active vehicle selection and the path set by setCurrentSelectorPath, so that a new snapshot is not rebuilt on an old vehicle. | 1491 |
| `ui_vehicleSelector_general.clearLockedFilters(...)` | Removes all filter locks. | 933 |
| `ui_vehicleSelector_general.closedFromUI()` | To call when the selector closes: resets the breadcrumb root, spawn-only, detail state, locked filters, buttons, exit callback, then emits the onVehicleSelectorClosed hook. | 832 |
| `ui_vehicleSelector_general.consumeFocusSearchOnOpen()` | Returns then resets to false the "focus the search on open" flag set by openFromPause. | 1377 |
| `ui_vehicleSelector_general.createFilters(...)` | Builds the list of UI filters (range or set types) from a list of configs, according to the property whitelist. | 937 |
| `ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId)` | Rebuilds the selector snapshot for the current path and sends it via 'vehicleSelectorDisplayDataSnapshot'. | 2020 |
| `ui_vehicleSelector_general.emptyProfiler()` | Creates a fake profiler whose start, add and finish do nothing. | 588 |
| `ui_vehicleSelector_general.executeButton(...)` | Delegates to detailsInteraction.executeButton. | 972 |
| `ui_vehicleSelector_general.executeDoubleClick(...)` | Delegates to detailsInteraction.executeDoubleClick. | 973 |
| `ui_vehicleSelector_general.getActiveFilters(...)` | Delegates to the filter module: returns the active filters. | 850 |
| `ui_vehicleSelector_general.getDefaultVehicleInfo()` | Reads and caches settings/default.pc (legacy default vehicle). | 766 |
| `ui_vehicleSelector_general.getDefaultVehicleTile()` | Builds the "Legacy default.pc" tile for the grid, from the model indicated by settings/default.pc. | 780 |
| `ui_vehicleSelector_general.getDetails(...)` | Delegates to detailsInteraction.getDetails: details and buttons of an item. | 970 |
| `ui_vehicleSelector_general.getDisplayData(...)` | Returns the effective display options. In freeroam context, showRecentMode takes the value of showRecentModeFreeroamSelector. | 860 |
| `ui_vehicleSelector_general.getDisplayDataOptions(...)` | Returns the list of display options offered to the UI, hiding showRecentMode or showRecentModeFreeroamSelector depending on the context. | 863 |
| `ui_vehicleSelector_general.getFilters(...)` | Initializes the UI data if needed then returns the filters (filterList, filterByProp, lockedFiltersByProp). | 849 |
| `ui_vehicleSelector_general.getManagementDetails(...)` | Delegates to detailsInteraction.getManagementDetails. | 971 |
| `ui_vehicleSelector_general.getRecentVehicles()` | Returns the list of recent vehicles. | 955 |
| `ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path)` | Computes the header title and the breadcrumb segments according to the current path, the active filters and the search. Titles are suffixed "(filtered)" if a filter or search is active, and replaced by "Spawn Vehicle" in spawn-only mode. | 979 |
| `ui_vehicleSelector_general.getSearchText(...)` | Returns the current search text (filter module). | 851 |
| `ui_vehicleSelector_general.getTiles(...)` | Delegates to ui_vehicleSelector_tiles.getTiles. | 859 |
| `ui_vehicleSelector_general.getUiData()` | Returns the selector's UI data (models, configs, filterList, filterByProp, lockedFiltersByProp, activeFilters, displayData, displayInfo), recomputing it if needed. | 818 |
| `ui_vehicleSelector_general.getValidFilters(...)` | Returns the prepared valid filters (delegates to the filter module). | 936 |
| `ui_vehicleSelector_general.goToMod(...)` | Delegates to detailsInteraction.goToMod: opens the mod's page. | 969 |
| `ui_vehicleSelector_general.isFavourite(model, config)` | Returns whether the model/config pair is a favorite. | 940 |
| `ui_vehicleSelector_general.isFilterLocked(...)` | Returns whether a filter is locked. | 930 |
| `ui_vehicleSelector_general.isFreeroamVehicleSelectorContext()` | True if the current UI route is one of the freeroam vehicle selector screens or the freeroam wizard (freeroamLevels.vehicles, freeroamWizard.vehicles and menu./pause. variants). | 632 |
| `ui_vehicleSelector_general.isOpenedFromGarage()` | Returns whether the selector was opened from the garage. | 1098 |
| `ui_vehicleSelector_general.isRecentVehicle(model, config)` | Returns whether the model/config pair is among the recent vehicles. | 945 |
| `ui_vehicleSelector_general.isSpawnOnly()` | Returns whether spawn-only mode is active. | 46 |
| `ui_vehicleSelector_general.lockFilter(...)` | Locks a filter so the user cannot change it (delegates to the filter module). | 928 |
| `ui_vehicleSelector_general.lockFilterMode(...)` | Locks a filter in inclusion mode (delegates to the filter module). | 931 |
| `ui_vehicleSelector_general.lockFilterModeExclusive(...)` | Locks a filter in exclusive mode with the list of allowed values (delegates to the filter module). | 932 |
| `ui_vehicleSelector_general.navigateToVehicle(tile, options)` | Goes from the grid to a vehicle's detail page: stores the selection (path, title, model, config) and navigates to the child route matching the current root route (pause or garage). | 1843 |
| `ui_vehicleSelector_general.onLanguageChanged()` | Hook: the language changes; forces a reload (translated labels). *(internal)* *(hook)* | 751 |
| `ui_vehicleSelector_general.onModActivated()` | Hook: a mod is activated; forces a reload of the selector data. *(internal)* *(hook)* | 735 |
| `ui_vehicleSelector_general.onModDeactivated()` | Hook: a mod is deactivated; forces a reload of the selector data. *(internal)* *(hook)* | 731 |
| `ui_vehicleSelector_general.onModManagerReady()` | Hook: the mod manager is ready; forces a data reload. *(internal)* *(hook)* | 739 |
| `ui_vehicleSelector_general.onModManagerStateChanged()` | Hook: the mod manager state has changed; forces a data reload. *(internal)* *(hook)* | 743 |
| `ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data)` | Route hook: entering a selector root screen (pause, garage); clears the detail state. *(internal)* *(hook)* | 1936 |
| `ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data)` | Route hook: leaving a root screen; resets spawn-only to false outside the family, and if opened from the garage clears locks and filters. *(internal)* *(hook)* | 1972 |
| `ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data)` | Route hook: mounting a root screen; starts the asynchronous loading then the emission of the snapshot for the route's path (default allModels). *(internal)* *(hook)* | 1941 |
| `ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data)` | Route hook: entering a vehicle's detail page. Promotes the pending selection to the active selection. *(internal)* *(hook)* | 1904 |
| `ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data)` | Route hook: leaving the detail page; resets spawn-only to false if the destination is outside the selector family. *(internal)* *(hook)* | 1967 |
| `ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data)` | Route hook: mounting the detail page; starts the asynchronous loading then the emission of the active selection's path snapshot. *(internal)* *(hook)* | 1915 |
| `ui_vehicleSelector_general.onfilechanged(filename, type)` | File watching hook: forgets the settings/default.pc cache when that file changes. *(internal)* | 759 |
| `ui_vehicleSelector_general.openFromPause(routeName, options)` | Opens the selector from the pause menu. Refused (returns false) if an active first drive session does not allow vehicleManagement. | 1345 |
| `ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options)` | Opens the selector to choose an opposing vehicle. Unless options.unrestricted, props and trailers are excluded by a lock on the Type filter. The callback receives (model, config, additionalData) on selection, and no argument on exit. | 1258 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroam()` | Opens the menu's full-screen selector (route 'menu.vehiclesnew') with management buttons and freeroam buttons, then emits onVehicleSelectorOpen. | 1103 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback)` | Opens the selector for the freeroam configurator (route 'menu.vehiclesnew'). The callback receives (model, config, additionalData) and the vehicle is recorded as recent. | 1315 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamModal()` | Opens the selector in "modal" mode: a "Select Vehicle" button (and the exit) send back to 'menu.freeroamselector'. Management buttons disabled. | 1228 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId)` | Like openVehicleSelectorForFreeroam, but filters the source on a given mod. | 1119 |
| `ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly)` | Opens the selector from the garage (routes 'garage.mycars' or 'garage.vehicles'). A "Load" button replaces the current vehicle (or enters a career inventory vehicle), records the recent, then returns to the garage. Locks the source (Custom, Mod, Career or BeamNG - Official). | 1137 |
| `ui_vehicleSelector_general.passesFilters(...)` | Returns whether an item passes the filters and the search (delegates to the filter module). | 938 |
| `ui_vehicleSelector_general.profilerFinish(tag)` | Ends or marks a step of the M.p profiler. No effect with the default fake profiler. | 1087 |
| `ui_vehicleSelector_general.requestDetails(item, requestId)` | Computes the details of a tile (via getDetails) and sends them to the UI via 'vehicleSelectorDetails'. Cluster tiles without showDetails are ignored (warning logged). | 1647 |
| `ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId)` | Resets the display options to their default values. | 874 |
| `ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId)` | Resets a range filter to its full bounds; emits a snapshot if requestId is provided. | 911 |
| `ui_vehicleSelector_general.resetSetFilter(filterKey, requestId)` | Resets a set-type filter to its default state; emits a snapshot if requestId is provided. | 918 |
| `ui_vehicleSelector_general.resolveCurrentSelectorPath()` | Returns the current path: the path set by setCurrentSelectorPath, otherwise that of the active selection, otherwise {keys = {'allModels'}}. | 2004 |
| `ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle)` | Returns the title of the selected vehicle (active selection) for the route's dynamic title, otherwise the title passed as a parameter. | 2036 |
| `ui_vehicleSelector_general.setCurrentSelectorPath(path)` | Records a selector path chosen by a wizard, used by emitDisplayDataSnapshot. nil clears it; accepts {keys = {...}} or a direct list. | 1982 |
| `ui_vehicleSelector_general.setCustomDetailsButtons(...)` | Delegates to detailsInteraction.setCustomDetailsButtons. | 976 |
| `ui_vehicleSelector_general.setDetailsButtonForFreeroam(...)` | Delegates to detailsInteraction.setDetailsButtonForFreeroam. | 975 |
| `ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId)` | Modifies a display option (persisted if save=true); emits a snapshot if requestId is provided. | 866 |
| `ui_vehicleSelector_general.setManagementButtonsEnabled(...)` | Delegates to detailsInteraction.setManagementButtonsEnabled. | 974 |
| `ui_vehicleSelector_general.setSearchText(text, requestId)` | Sets the search text; emits a snapshot if requestId is provided. | 852 |
| `ui_vehicleSelector_general.setSpawnOnly(value)` | Enables the "spawn only" mode; any value other than true disables it. | 41 |
| `ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode)` | Sets a hard vehicle type restriction applied on top of the filters: 'lightRunner', 'busRoute' or nil (none). | 35 |
| `ui_vehicleSelector_general.setupValidFilters(...)` | Prepares the list of valid filters for a filtering pass (delegates to the filter module). | 935 |
| `ui_vehicleSelector_general.toggleFavourite(itemDetails)` | Adds or removes a vehicle from favorites ('model/config' key). For settings/default.pc, toggles the includeDefaultConfigInFavourites option instead. | 882 |
| `ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId)` | Enables or disables a value of a set-type filter; emits a snapshot if requestId is provided. | 897 |
| `ui_vehicleSelector_general.trackRecentVehicle(model, config)` | Records the model/config pair as a recent vehicle. | 950 |
| `ui_vehicleSelector_general.unlockFilter(...)` | Unlocks a filter (delegates to the filter module). | 929 |
| `ui_vehicleSelector_general.updateFilters(...)` | Delegates to filterInstance.updateFilters. | 896 |
| `ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Sets the bounds of a range filter; emits a snapshot if requestId is provided. | 904 |

### Parameter details

#### `ui_vehicleSelector_general.calculateActiveFilters(...)`

Recomputes the list of active filters (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.clearAllFilters(...)`

Clears all unlocked filters.

- `...` (*any*) : Passed to filterInstance.clearAllFilters.

#### `ui_vehicleSelector_general.clearLockedFilters(...)`

Removes all filter locks.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.consumeFocusSearchOnOpen()`

Returns then resets to false the "focus the search on open" flag set by openFromPause.

- **returns**: boolean true if the search should be focused.

#### `ui_vehicleSelector_general.createFilters(...)`

Builds the list of UI filters (range or set types) from a list of configs, according to the property whitelist.

- `...` (*table*) : List of configs (first argument), passed to createVehicleFilters.
- **returns**: table[] Filter data for the UI.
- **returns**: table Values found per property.

#### `ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId)`

Rebuilds the selector snapshot for the current path and sends it via 'vehicleSelectorDisplayDataSnapshot'.

- `requestId` (*any|nil*) : Identifier returned in the payload.
- **returns**: boolean false if the rebuild failed.

#### `ui_vehicleSelector_general.emptyProfiler()`

Creates a fake profiler whose start, add and finish do nothing.

- **returns**: table {start, add, finish} object.

#### `ui_vehicleSelector_general.executeButton(...)`

Delegates to detailsInteraction.executeButton.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.executeDoubleClick(...)`

Delegates to detailsInteraction.executeDoubleClick.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.getActiveFilters(...)`

Delegates to the filter module: returns the active filters.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.getDefaultVehicleInfo()`

Reads and caches settings/default.pc (legacy default vehicle).

- **returns**: table|nil File contents, or nil if absent or unreadable.

#### `ui_vehicleSelector_general.getDefaultVehicleTile()`

Builds the "Legacy default.pc" tile for the grid, from the model indicated by settings/default.pc.

- **returns**: table|nil Tile, or nil if the file or model is not found.

#### `ui_vehicleSelector_general.getDetails(...)`

Delegates to detailsInteraction.getDetails: details and buttons of an item.

- `...` (*any*) : itemDetails.

#### `ui_vehicleSelector_general.getDisplayData(...)`

Returns the effective display options. In freeroam context, showRecentMode takes the value of showRecentModeFreeroamSelector.

- `...` (*any*) : 
- **returns**: table Display options table (groupMode, sortMode, clusterMode, expandGroups, displaySize, ...).

#### `ui_vehicleSelector_general.getDisplayDataOptions(...)`

Returns the list of display options offered to the UI, hiding showRecentMode or showRecentModeFreeroamSelector depending on the context.

- `...` (*any*) : 
- **returns**: table[] Option definitions (key, label, type, options...).

#### `ui_vehicleSelector_general.getFilters(...)`

Initializes the UI data if needed then returns the filters (filterList, filterByProp, lockedFiltersByProp).

- `...` (*any*) : Passed to filterInstance.getFilters.
- **returns**: table Filter data.

#### `ui_vehicleSelector_general.getManagementDetails(...)`

Delegates to detailsInteraction.getManagementDetails.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.getRecentVehicles()`

Returns the list of recent vehicles.

- **returns**: table[] List of {model, config}.

#### `ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path)`

Computes the header title and the breadcrumb segments according to the current path, the active filters and the search. Titles are suffixed "(filtered)" if a filter or search is active, and replaced by "Spawn Vehicle" in spawn-only mode.

- `path` (*table|nil*) : Path {keys = {...}}; keys[1] is allModels, configsForModel or configsForBrandSubModelOrModel.
- **returns**: table {title, isFiltered, pathSegments}.

#### `ui_vehicleSelector_general.getSearchText(...)`

Returns the current search text (filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.getTiles(...)`

Delegates to ui_vehicleSelector_tiles.getTiles.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.getUiData()`

Returns the selector's UI data (models, configs, filterList, filterByProp, lockedFiltersByProp, activeFilters, displayData, displayInfo), recomputing it if needed.

- **returns**: table UI data.

#### `ui_vehicleSelector_general.getValidFilters(...)`

Returns the prepared valid filters (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.goToMod(...)`

Delegates to detailsInteraction.goToMod: opens the mod's page.

- `...` (*any*) : modId.

#### `ui_vehicleSelector_general.isFavourite(model, config)`

Returns whether the model/config pair is a favorite.

- `model` (*string*) : Model key.
- `config` (*string*) : Config key.
- **returns**: boolean true if favorite.

#### `ui_vehicleSelector_general.isFilterLocked(...)`

Returns whether a filter is locked.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.isFreeroamVehicleSelectorContext()`

True if the current UI route is one of the freeroam vehicle selector screens or the freeroam wizard (freeroamLevels.vehicles, freeroamWizard.vehicles and menu./pause. variants).

- **returns**: boolean true in freeroam context.

#### `ui_vehicleSelector_general.isOpenedFromGarage()`

Returns whether the selector was opened from the garage.

- **returns**: boolean true from the garage.

#### `ui_vehicleSelector_general.isRecentVehicle(model, config)`

Returns whether the model/config pair is among the recent vehicles.

- `model` (*string*) : Model key.
- `config` (*string*) : Config key.
- **returns**: boolean true if recent.

#### `ui_vehicleSelector_general.isSpawnOnly()`

Returns whether spawn-only mode is active.

- **returns**: boolean Mode state.

#### `ui_vehicleSelector_general.lockFilter(...)`

Locks a filter so the user cannot change it (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.lockFilterMode(...)`

Locks a filter in inclusion mode (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.lockFilterModeExclusive(...)`

Locks a filter in exclusive mode with the list of allowed values (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.navigateToVehicle(tile, options)`

Goes from the grid to a vehicle's detail page: stores the selection (path, title, model, config) and navigates to the child route matching the current root route (pause or garage).

- `tile` (*table*) : Clicked tile (config or cluster).
- `options` (*table|nil*) : Passed to ui_router.navigate (e.g. {preferredScope = 'auxillary'}).

#### `ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data)`

Route hook: entering a selector root screen (pause, garage); clears the detail state.

- `context` (*any*) : Lifecycle context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Route data.

#### `ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data)`

Route hook: leaving a root screen; resets spawn-only to false outside the family, and if opened from the garage clears locks and filters.

- `context` (*any*) : Lifecycle context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Route data.

#### `ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data)`

Route hook: mounting a root screen; starts the asynchronous loading then the emission of the snapshot for the route's path (default allModels).

- `context` (*any*) : Lifecycle context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Route data.

#### `ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data)`

Route hook: entering a vehicle's detail page. Promotes the pending selection to the active selection.

- `context` (*any*) : Lifecycle context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Route data.

#### `ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data)`

Route hook: leaving the detail page; resets spawn-only to false if the destination is outside the selector family.

- `context` (*any*) : Lifecycle context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Route data.

#### `ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data)`

Route hook: mounting the detail page; starts the asynchronous loading then the emission of the active selection's path snapshot.

- `context` (*any*) : Lifecycle context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Route data.

#### `ui_vehicleSelector_general.onfilechanged(filename, type)`

File watching hook: forgets the settings/default.pc cache when that file changes.

- `filename` (*string*) : Modified file.
- `type` (*string*) : Change type.

#### `ui_vehicleSelector_general.openFromPause(routeName, options)`

Opens the selector from the pause menu. Refused (returns false) if an active first drive session does not allow vehicleManagement.

- `routeName` (*string|nil*) : Route to open, default 'pause.vehicleSelector'.
- `options` (*table|nil*) : options.spawnOnly (boolean) and options.focusSearch (focuses the search on open).
- **returns**: boolean false if refused, otherwise true.

#### `ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options)`

Opens the selector to choose an opposing vehicle. Unless options.unrestricted, props and trailers are excluded by a lock on the Type filter. The callback receives (model, config, additionalData) on selection, and no argument on exit.

- `callback` (*function|nil*) : Function called with the selection or with no argument if the user exits.
- `routeName` (*string|nil*) : UI route to open, default 'mission.control.vehicleSelector'.
- `options` (*table|nil*) : options.unrestricted = true to clear all filters.

#### `ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback)`

Opens the selector for the freeroam configurator (route 'menu.vehiclesnew'). The callback receives (model, config, additionalData) and the vehicle is recorded as recent.

- `callback` (*function*) : Called with the selection.

#### `ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId)`

Like openVehicleSelectorForFreeroam, but filters the source on a given mod.

- `modId` (*string*) : Mod identifier (via getModById).

#### `ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly)`

Opens the selector from the garage (routes 'garage.mycars' or 'garage.vehicles'). A "Load" button replaces the current vehicle (or enters a career inventory vehicle), records the recent, then returns to the garage. Locks the source (Custom, Mod, Career or BeamNG - Official).

- `showOwnedOnly` (*boolean|nil*) : true to show only owned vehicles (Custom, Mod, Career).

#### `ui_vehicleSelector_general.passesFilters(...)`

Returns whether an item passes the filters and the search (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.profilerFinish(tag)`

Ends or marks a step of the M.p profiler. No effect with the default fake profiler.

- `tag` (*string|nil*) : Step label; empty or 'undefined' = end.

#### `ui_vehicleSelector_general.requestDetails(item, requestId)`

Computes the details of a tile (via getDetails) and sends them to the UI via 'vehicleSelectorDetails'. Cluster tiles without showDetails are ignored (warning logged).

- `item` (*table*) : Tile with showDetails = {model, config}, or directly {model, config}.
- `requestId` (*any|nil*) : Request identifier returned in the payload.
- **returns**: table|nil Payload {backendName, requestId, item, details}, or nil.

#### `ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId)`

Resets the display options to their default values.

- `requestId` (*any|nil*) : Identifier for the return snapshot.
- **returns**: table Display options after reset.

#### `ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId)`

Resets a range filter to its full bounds; emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : Identifier for the return snapshot.

#### `ui_vehicleSelector_general.resetSetFilter(filterKey, requestId)`

Resets a set-type filter to its default state; emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : Identifier for the return snapshot.

#### `ui_vehicleSelector_general.resolveCurrentSelectorPath()`

Returns the current path: the path set by setCurrentSelectorPath, otherwise that of the active selection, otherwise {keys = {'allModels'}}.

- **returns**: table {keys = string[]}.

#### `ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle)`

Returns the title of the selected vehicle (active selection) for the route's dynamic title, otherwise the title passed as a parameter.

- `paramTitle` (*string|nil*) : Fallback title.
- **returns**: string|nil Title found.

#### `ui_vehicleSelector_general.setCurrentSelectorPath(path)`

Records a selector path chosen by a wizard, used by emitDisplayDataSnapshot. nil clears it; accepts {keys = {...}} or a direct list.

- `path` (*table|nil*) : Path.

#### `ui_vehicleSelector_general.setCustomDetailsButtons(...)`

Delegates to detailsInteraction.setCustomDetailsButtons.

- `...` (*any*) : List of custom buttons.

#### `ui_vehicleSelector_general.setDetailsButtonForFreeroam(...)`

Delegates to detailsInteraction.setDetailsButtonForFreeroam.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId)`

Modifies a display option (persisted if save=true); emits a snapshot if requestId is provided.

- `key` (*string*) : Option key.
- `value` (*any*) : New value.
- `requestId` (*any|nil*) : UI request identifier for the return snapshot.
- **returns**: table Display options after modification.

#### `ui_vehicleSelector_general.setManagementButtonsEnabled(...)`

Delegates to detailsInteraction.setManagementButtonsEnabled.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.setSearchText(text, requestId)`

Sets the search text; emits a snapshot if requestId is provided.

- `text` (*string*) : Searched text.
- `requestId` (*any|nil*) : Identifier for the return snapshot.

#### `ui_vehicleSelector_general.setSpawnOnly(value)`

Enables the "spawn only" mode; any value other than true disables it.

- `value` (*boolean|nil*) : true to enable.

#### `ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode)`

Sets a hard vehicle type restriction applied on top of the filters: 'lightRunner', 'busRoute' or nil (none).

- `restrictionMode` (*string|nil*) : 'lightRunner', 'busRoute' or nil.

#### `ui_vehicleSelector_general.setupValidFilters(...)`

Prepares the list of valid filters for a filtering pass (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.toggleFavourite(itemDetails)`

Adds or removes a vehicle from favorites ('model/config' key). For settings/default.pc, toggles the includeDefaultConfigInFavourites option instead.

- `itemDetails` (*table*) : Table with the fields model and config.
- **returns**: boolean true if the item is now a favorite.

#### `ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId)`

Enables or disables a value of a set-type filter; emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `value` (*any*) : Value to toggle.
- `requestId` (*any|nil*) : Identifier for the return snapshot.

#### `ui_vehicleSelector_general.trackRecentVehicle(model, config)`

Records the model/config pair as a recent vehicle.

- `model` (*string*) : Model key.
- `config` (*string*) : Config key.

#### `ui_vehicleSelector_general.unlockFilter(...)`

Unlocks a filter (delegates to the filter module).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.updateFilters(...)`

Delegates to filterInstance.updateFilters.

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Sets the bounds of a range filter; emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `min` (*number*) : Bottom bound.
- `max` (*number*) : Top bound.
- `requestId` (*any|nil*) : Identifier for the return snapshot.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicles, ui_vehicleSelector_detailsInteraction, ui_vehicleSelector_tiles, core_locales. |
| `p` | table | Dummy profiler (emptyProfiler) with no-op start, add and finish. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleSelectorClosed`
- `onVehicleSelectorOpen`

**UI events (guihooks.trigger):** `VehicleSelectorDataLoaded`, `gridSelectorRefreshAll`, `vehicleSelectorDetails`, `vehicleSelectorDisplayDataSnapshot`

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/general.lua`.*
