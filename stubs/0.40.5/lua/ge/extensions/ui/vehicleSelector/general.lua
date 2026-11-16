---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central module of the vehicle selector ("vehicleSelector" backend of ui_gridSelector). It builds the UI data (models, configs, filters), manages the persisted display options (/settings/vehicleSelectorData.json), filters, search, favorites and recent vehicles, then opens the selector in various contexts (freeroam, garage, challenge, configurator, pause) by changing the buttons and the breadcrumb root. It also drives the lifecycle of the pause/garage routes (root list and a vehicle's detail page) and sends snapshots to the interface. Most filter and detail functions delegate to filterModule, displayDataModule, ui_vehicleSelector_tiles and ui_vehicleSelector_detailsInteraction.
--- Access: extension `ui_vehicleSelector_general`: `extensions.load("ui_vehicleSelector_general")`, then the global `ui_vehicleSelector_general`
---@class ui_vehicleSelector_general
---@field dependencies string[] core_vehicles, ui_vehicleSelector_detailsInteraction, ui_vehicleSelector_tiles, core_locales.
---@field p table Dummy profiler (emptyProfiler) with no-op start, add and finish.
ui_vehicleSelector_general = {}

--- Hook called by util_asyncBulkLoader when the asynchronous vehicle loading is finished: builds and emits the pending snapshot (VehicleSelectorDataLoaded), unless the route changed in the meantime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1819
function ui_vehicleSelector_general.asyncVehicleLoadComplete() end

--- Recomputes the list of active filters (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:934
---@param ... any Passed through as is.
function ui_vehicleSelector_general.calculateActiveFilters(...) end

--- Clears all unlocked filters.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:925
---@param ... any Passed to filterInstance.clearAllFilters.
function ui_vehicleSelector_general.clearAllFilters(...) end

--- Forces the UI data and display options to be rebuilt on next access.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:747
function ui_vehicleSelector_general.clearCache() end

--- Resets the pending or active vehicle selection and the path set by setCurrentSelectorPath, so that a new snapshot is not rebuilt on an old vehicle.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1491
function ui_vehicleSelector_general.clearDrilldownSelectorState() end

--- Removes all filter locks.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:933
---@param ... any Passed through as is.
function ui_vehicleSelector_general.clearLockedFilters(...) end

--- To call when the selector closes: resets the breadcrumb root, spawn-only, detail state, locked filters, buttons, exit callback, then emits the onVehicleSelectorClosed hook.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:832
function ui_vehicleSelector_general.closedFromUI() end

--- Returns then resets to false the "focus the search on open" flag set by openFromPause.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1377
---@return boolean  true if the search should be focused.
function ui_vehicleSelector_general.consumeFocusSearchOnOpen() end

--- Builds the list of UI filters (range or set types) from a list of configs, according to the property whitelist.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:937
---@param ... table List of configs (first argument), passed to createVehicleFilters.
---@return table[]  Filter data for the UI.
---@return table  Values found per property.
function ui_vehicleSelector_general.createFilters(...) end

--- Rebuilds the selector snapshot for the current path and sends it via 'vehicleSelectorDisplayDataSnapshot'.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:2020
---@param requestId any|nil Identifier returned in the payload.
---@return boolean  false if the rebuild failed.
function ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId) end

--- Creates a fake profiler whose start, add and finish do nothing.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:588
---@return table  {start, add, finish} object.
function ui_vehicleSelector_general.emptyProfiler() end

--- Delegates to detailsInteraction.executeButton.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:972
---@param ... any Passed through as is.
function ui_vehicleSelector_general.executeButton(...) end

--- Delegates to detailsInteraction.executeDoubleClick.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:973
---@param ... any Passed through as is.
function ui_vehicleSelector_general.executeDoubleClick(...) end

--- Delegates to the filter module: returns the active filters.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:850
---@param ... any Passed through as is.
function ui_vehicleSelector_general.getActiveFilters(...) end

--- Reads and caches settings/default.pc (legacy default vehicle).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:766
---@return table|nil  File contents, or nil if absent or unreadable.
function ui_vehicleSelector_general.getDefaultVehicleInfo() end

--- Builds the "Legacy default.pc" tile for the grid, from the model indicated by settings/default.pc.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:780
---@return table|nil  Tile, or nil if the file or model is not found.
function ui_vehicleSelector_general.getDefaultVehicleTile() end

--- Delegates to detailsInteraction.getDetails: details and buttons of an item.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:970
---@param ... any itemDetails.
function ui_vehicleSelector_general.getDetails(...) end

--- Returns the effective display options. In freeroam context, showRecentMode takes the value of showRecentModeFreeroamSelector.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:860
---@param ... any
---@return table  Display options table (groupMode, sortMode, clusterMode, expandGroups, displaySize, ...).
function ui_vehicleSelector_general.getDisplayData(...) end

--- Returns the list of display options offered to the UI, hiding showRecentMode or showRecentModeFreeroamSelector depending on the context.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:863
---@param ... any
---@return table[]  Option definitions (key, label, type, options...).
function ui_vehicleSelector_general.getDisplayDataOptions(...) end

--- Initializes the UI data if needed then returns the filters (filterList, filterByProp, lockedFiltersByProp).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:849
---@param ... any Passed to filterInstance.getFilters.
---@return table  Filter data.
function ui_vehicleSelector_general.getFilters(...) end

--- Delegates to detailsInteraction.getManagementDetails.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:971
---@param ... any Passed through as is.
function ui_vehicleSelector_general.getManagementDetails(...) end

--- Returns the list of recent vehicles.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:955
---@return table[]  List of {model, config}.
function ui_vehicleSelector_general.getRecentVehicles() end

--- Computes the header title and the breadcrumb segments according to the current path, the active filters and the search. Titles are suffixed "(filtered)" if a filter or search is active, and replaced by "Spawn Vehicle" in spawn-only mode.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:979
---@param path table|nil Path {keys = {...}}; keys[1] is allModels, configsForModel or configsForBrandSubModelOrModel.
---@return table  {title, isFiltered, pathSegments}.
function ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path) end

--- Returns the current search text (filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:851
---@param ... any Passed through as is.
function ui_vehicleSelector_general.getSearchText(...) end

--- Delegates to ui_vehicleSelector_tiles.getTiles.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:859
---@param ... any Passed through as is.
function ui_vehicleSelector_general.getTiles(...) end

--- Returns the selector's UI data (models, configs, filterList, filterByProp, lockedFiltersByProp, activeFilters, displayData, displayInfo), recomputing it if needed.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:818
---@return table  UI data.
function ui_vehicleSelector_general.getUiData() end

--- Returns the prepared valid filters (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:936
---@param ... any Passed through as is.
function ui_vehicleSelector_general.getValidFilters(...) end

--- Delegates to detailsInteraction.goToMod: opens the mod's page.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:969
---@param ... any modId.
function ui_vehicleSelector_general.goToMod(...) end

--- Returns whether the model/config pair is a favorite.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:940
---@param model string Model key.
---@param config string Config key.
---@return boolean  true if favorite.
function ui_vehicleSelector_general.isFavourite(model, config) end

--- Returns whether a filter is locked.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:930
---@param ... any Passed through as is.
function ui_vehicleSelector_general.isFilterLocked(...) end

--- True if the current UI route is one of the freeroam vehicle selector screens or the freeroam wizard (freeroamLevels.vehicles, freeroamWizard.vehicles and menu./pause. variants).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:632
---@return boolean  true in freeroam context.
function ui_vehicleSelector_general.isFreeroamVehicleSelectorContext() end

--- Returns whether the selector was opened from the garage.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1098
---@return boolean  true from the garage.
function ui_vehicleSelector_general.isOpenedFromGarage() end

--- Returns whether the model/config pair is among the recent vehicles.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:945
---@param model string Model key.
---@param config string Config key.
---@return boolean  true if recent.
function ui_vehicleSelector_general.isRecentVehicle(model, config) end

--- Returns whether spawn-only mode is active.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:46
---@return boolean  Mode state.
function ui_vehicleSelector_general.isSpawnOnly() end

--- Locks a filter so the user cannot change it (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:928
---@param ... any Passed through as is.
function ui_vehicleSelector_general.lockFilter(...) end

--- Locks a filter in inclusion mode (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:931
---@param ... any Passed through as is.
function ui_vehicleSelector_general.lockFilterMode(...) end

--- Locks a filter in exclusive mode with the list of allowed values (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:932
---@param ... any Passed through as is.
function ui_vehicleSelector_general.lockFilterModeExclusive(...) end

--- Goes from the grid to a vehicle's detail page: stores the selection (path, title, model, config) and navigates to the child route matching the current root route (pause or garage).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1843
---@param tile table Clicked tile (config or cluster).
---@param options table|nil Passed to ui_router.navigate (e.g. {preferredScope = 'auxillary'}).
function ui_vehicleSelector_general.navigateToVehicle(tile, options) end

--- Hook: the language changes; forces a reload (translated labels).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:751
function ui_vehicleSelector_general.onLanguageChanged() end

--- Hook: a mod is activated; forces a reload of the selector data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:735
function ui_vehicleSelector_general.onModActivated() end

--- Hook: a mod is deactivated; forces a reload of the selector data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:731
function ui_vehicleSelector_general.onModDeactivated() end

--- Hook: the mod manager is ready; forces a data reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:739
function ui_vehicleSelector_general.onModManagerReady() end

--- Hook: the mod manager state has changed; forces a data reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:743
function ui_vehicleSelector_general.onModManagerStateChanged() end

--- Route hook: entering a selector root screen (pause, garage); clears the detail state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1936
---@param context any Lifecycle context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Route data.
function ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data) end

--- Route hook: leaving a root screen; resets spawn-only to false outside the family, and if opened from the garage clears locks and filters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1972
---@param context any Lifecycle context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Route data.
function ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data) end

--- Route hook: mounting a root screen; starts the asynchronous loading then the emission of the snapshot for the route's path (default allModels).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1941
---@param context any Lifecycle context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Route data.
function ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data) end

--- Route hook: entering a vehicle's detail page. Promotes the pending selection to the active selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1904
---@param context any Lifecycle context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Route data.
function ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data) end

--- Route hook: leaving the detail page; resets spawn-only to false if the destination is outside the selector family.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1967
---@param context any Lifecycle context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Route data.
function ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data) end

--- Route hook: mounting the detail page; starts the asynchronous loading then the emission of the active selection's path snapshot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1915
---@param context any Lifecycle context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Route data.
function ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data) end

--- File watching hook: forgets the settings/default.pc cache when that file changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:759
---@param filename string Modified file.
---@param type string Change type.
function ui_vehicleSelector_general.onfilechanged(filename, type) end

--- Opens the selector from the pause menu. Refused (returns false) if an active first drive session does not allow vehicleManagement.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1345
---@param routeName string|nil Route to open, default 'pause.vehicleSelector'.
---@param options table|nil options.spawnOnly (boolean) and options.focusSearch (focuses the search on open).
---@return boolean  false if refused, otherwise true.
function ui_vehicleSelector_general.openFromPause(routeName, options) end

--- Opens the selector to choose an opposing vehicle. Unless options.unrestricted, props and trailers are excluded by a lock on the Type filter. The callback receives (model, config, additionalData) on selection, and no argument on exit.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1258
---@param callback function|nil Function called with the selection or with no argument if the user exits.
---@param routeName string|nil UI route to open, default 'mission.control.vehicleSelector'.
---@param options table|nil options.unrestricted = true to clear all filters.
function ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options) end

--- Opens the menu's full-screen selector (route 'menu.vehiclesnew') with management buttons and freeroam buttons, then emits onVehicleSelectorOpen.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1103
function ui_vehicleSelector_general.openVehicleSelectorForFreeroam() end

--- Opens the selector for the freeroam configurator (route 'menu.vehiclesnew'). The callback receives (model, config, additionalData) and the vehicle is recorded as recent.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1315
---@param callback function Called with the selection.
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback) end

--- Opens the selector in "modal" mode: a "Select Vehicle" button (and the exit) send back to 'menu.freeroamselector'. Management buttons disabled.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1228
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamModal() end

--- Like openVehicleSelectorForFreeroam, but filters the source on a given mod.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1119
---@param modId string Mod identifier (via getModById).
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId) end

--- Opens the selector from the garage (routes 'garage.mycars' or 'garage.vehicles'). A "Load" button replaces the current vehicle (or enters a career inventory vehicle), records the recent, then returns to the garage. Locks the source (Custom, Mod, Career or BeamNG - Official).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1137
---@param showOwnedOnly boolean|nil true to show only owned vehicles (Custom, Mod, Career).
function ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly) end

--- Returns whether an item passes the filters and the search (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:938
---@param ... any Passed through as is.
function ui_vehicleSelector_general.passesFilters(...) end

--- Ends or marks a step of the M.p profiler. No effect with the default fake profiler.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1087
---@param tag string|nil Step label; empty or 'undefined' = end.
function ui_vehicleSelector_general.profilerFinish(tag) end

--- Computes the details of a tile (via getDetails) and sends them to the UI via 'vehicleSelectorDetails'. Cluster tiles without showDetails are ignored (warning logged).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1647
---@param item table Tile with showDetails = {model, config}, or directly {model, config}.
---@param requestId any|nil Request identifier returned in the payload.
---@return table|nil  Payload {backendName, requestId, item, details}, or nil.
function ui_vehicleSelector_general.requestDetails(item, requestId) end

--- Resets the display options to their default values.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:874
---@param requestId any|nil Identifier for the return snapshot.
---@return table  Display options after reset.
function ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId) end

--- Resets a range filter to its full bounds; emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:911
---@param filterKey string Filter name.
---@param requestId any|nil Identifier for the return snapshot.
function ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId) end

--- Resets a set-type filter to its default state; emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:918
---@param filterKey string Filter name.
---@param requestId any|nil Identifier for the return snapshot.
function ui_vehicleSelector_general.resetSetFilter(filterKey, requestId) end

--- Returns the current path: the path set by setCurrentSelectorPath, otherwise that of the active selection, otherwise {keys = {'allModels'}}.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:2004
---@return table  {keys = string[]}.
function ui_vehicleSelector_general.resolveCurrentSelectorPath() end

--- Returns the title of the selected vehicle (active selection) for the route's dynamic title, otherwise the title passed as a parameter.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:2036
---@param paramTitle string|nil Fallback title.
---@return string|nil  Title found.
function ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle) end

--- Records a selector path chosen by a wizard, used by emitDisplayDataSnapshot. nil clears it; accepts {keys = {...}} or a direct list.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:1982
---@param path table|nil Path.
function ui_vehicleSelector_general.setCurrentSelectorPath(path) end

--- Delegates to detailsInteraction.setCustomDetailsButtons.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:976
---@param ... any List of custom buttons.
function ui_vehicleSelector_general.setCustomDetailsButtons(...) end

--- Delegates to detailsInteraction.setDetailsButtonForFreeroam.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:975
---@param ... any Passed through as is.
function ui_vehicleSelector_general.setDetailsButtonForFreeroam(...) end

--- Modifies a display option (persisted if save=true); emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:866
---@param key string Option key.
---@param value any New value.
---@param requestId any|nil UI request identifier for the return snapshot.
---@return table  Display options after modification.
function ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId) end

--- Delegates to detailsInteraction.setManagementButtonsEnabled.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:974
---@param ... any Passed through as is.
function ui_vehicleSelector_general.setManagementButtonsEnabled(...) end

--- Sets the search text; emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:852
---@param text string Searched text.
---@param requestId any|nil Identifier for the return snapshot.
function ui_vehicleSelector_general.setSearchText(text, requestId) end

--- Enables the "spawn only" mode; any value other than true disables it.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:41
---@param value boolean|nil true to enable.
function ui_vehicleSelector_general.setSpawnOnly(value) end

--- Sets a hard vehicle type restriction applied on top of the filters: 'lightRunner', 'busRoute' or nil (none).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:35
---@param restrictionMode string|nil 'lightRunner', 'busRoute' or nil.
function ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode) end

--- Prepares the list of valid filters for a filtering pass (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:935
---@param ... any Passed through as is.
function ui_vehicleSelector_general.setupValidFilters(...) end

--- Adds or removes a vehicle from favorites ('model/config' key). For settings/default.pc, toggles the includeDefaultConfigInFavourites option instead.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:882
---@param itemDetails table Table with the fields model and config.
---@return boolean  true if the item is now a favorite.
function ui_vehicleSelector_general.toggleFavourite(itemDetails) end

--- Enables or disables a value of a set-type filter; emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:897
---@param filterKey string Filter name.
---@param value any Value to toggle.
---@param requestId any|nil Identifier for the return snapshot.
function ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId) end

--- Records the model/config pair as a recent vehicle.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:950
---@param model string Model key.
---@param config string Config key.
function ui_vehicleSelector_general.trackRecentVehicle(model, config) end

--- Unlocks a filter (delegates to the filter module).
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:929
---@param ... any Passed through as is.
function ui_vehicleSelector_general.unlockFilter(...) end

--- Delegates to filterInstance.updateFilters.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:896
---@param ... any Passed through as is.
function ui_vehicleSelector_general.updateFilters(...) end

--- Sets the bounds of a range filter; emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/vehicleSelector/general.lua:904
---@param filterKey string Filter name.
---@param min number Bottom bound.
---@param max number Top bound.
---@param requestId any|nil Identifier for the return snapshot.
function ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

