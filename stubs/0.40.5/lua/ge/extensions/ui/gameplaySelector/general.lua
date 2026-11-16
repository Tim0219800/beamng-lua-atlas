---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "gameplaySelector" backend of the grid selector: the screen that lists missions, scenarios, campaigns, quick-start experiences and rally selectors. It collects the tiles through the hook onGameplaySelectorGetTiles (validBackends must contain gameplaySelector), handles filters, search, favorites, recents and display options (saved in /settings/gameplaySelectorData.json), builds the details via onGameplaySelectorGetDetails and sends snapshots to the interface (GameplaySelectorDataLoaded, gameplaySelectorDisplayDataSnapshot, gameplaySelectorDetails). It also applies presets according to the route (menu.gameplay, menu.rallySelector, menu.experiencesSelector) and handles navigation to "clusters".
--- Access: extension `ui_gameplaySelector_general`: `extensions.load("ui_gameplaySelector_general")`, then the global `ui_gameplaySelector_general`
---@class ui_gameplaySelector_general
---@field backendName string Backend name: "gameplaySelector".
---@field dependencies string[] Extensions loaded before this one: ui_gameplaySelector_tiles and core_locales.
ui_gameplaySelector_general = {}

--- End hook of the asynchronous loading (util_asyncBulkLoader). Emits the GameplaySelectorDataLoaded snapshot of the pending route, unless the user changed route in the meantime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1070
function ui_gameplaySelector_general.asyncGameplaySelectorLoadComplete() end

--- Clears all filters.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:641
function ui_gameplaySelector_general.clearAllFilters() end

--- Called when the interface closes the selector. Does nothing for now (TODO).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:821
function ui_gameplaySelector_general.closedFromUI() end

--- Rebuilds the current view's snapshot (groups, filters, display options, management details, search text, header) and sends it via the event gameplaySelectorDisplayDataSnapshot with the requestId. Returns false and logs an error on failure.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1107
---@param requestId any Interface request identifier.
---@return boolean  true if the event was sent.
function ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId) end

--- Runs the details button with the given identifier via the buttonModule.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:837
---@param buttonId any Button identifier.
---@param additionalData any Extra data passed to the callback.
---@return any  Result of buttonInstance.executeButton.
function ui_gameplaySelector_general.executeButton(buttonId, additionalData) end

--- Runs the button marked isDoubleClickAction in a tile's details (or the only button if there is just one).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:850
---@param item table The tile's showDetails data.
function ui_gameplaySelector_general.executeDoubleClick(item) end

--- Does nothing (TODO).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:846
function ui_gameplaySelector_general.exitCallback() end

--- Only logs the path (not implemented).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:862
---@param path string Folder path.
function ui_gameplaySelector_general.exploreFolder(path) end

--- Returns the active filters.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:676
---@return table  Active filters.
function ui_gameplaySelector_general.getActiveFilters() end

--- Builds a tile's details by emitting the hook onGameplaySelectorGetDetails and returns the first block.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:827
---@param item table The tile's showDetails data.
---@return table|nil  Details block, nil if no generator responded.
function ui_gameplaySelector_general.getDetails(item) end

--- Returns the effective display options, adapted to the route (rally or experiences).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:626
---@param routeName string|nil Name of the road.
---@return table  Option values by key.
function ui_gameplaySelector_general.getDisplayData(routeName) end

--- Returns the display options definition adapted to the route: hides groupMode and clusterMode in rally or experiences mode, and hides groupModeRally and clusterModeRally elsewhere.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:725
---@param routeName string|nil Route name (the active route by default).
---@return table[]  Visible options.
function ui_gameplaySelector_general.getDisplayDataOptions(routeName) end

--- Returns the filter definition after loading the data.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:671
---@return table  Result of filterInstance.getFilters().
function ui_gameplaySelector_general.getFilters() end

--- Returns the selector data (tiles whose validBackends contains gameplaySelector, filters, display options), recomputes them if the mods or settings have changed, and creates them on first request.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:487
---@return table  Table items, filterList, activeFilters, lockedFiltersByProp, displayData.
function ui_gameplaySelector_general.getGameplayData() end

--- Always returns { buttons = {} } (TODO in the code).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:841
---@return table  Table with empty buttons.
function ui_gameplaySelector_general.getManagementDetails() end

--- Builds the screen title and the breadcrumb (menu, gameplay selector, filters or search segment, cluster or discover page). Adds "(filtered)" to the title if filters or a search are active.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:746
---@param path table Current path { keys = {...} }.
---@return table  Table title, isFiltered, pathSegments.
function ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path) end

--- Returns the current search text.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:712
---@return string|nil  Entered text.
function ui_gameplaySelector_general.getSearchText() end

--- Returns the tile groups for a path, via ui_gameplaySelector_tiles.getTiles.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:510
---@param path table Navigation path { keys = {...} }.
---@param routeName string|nil Name of the road.
---@return table[]  Tile groups.
function ui_gameplaySelector_general.getTiles(path, routeName) end

--- Returns the selector data: items, displayData (adapted to the route: rally or experiences), filterList, activeFilters, lockedFiltersByProp and backendName. Loads the tiles if needed.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:440
---@param routeName string|nil Route name, to adapt groupMode and clusterMode.
---@return table  Interface data table.
function ui_gameplaySelector_general.getUiData(routeName) end

--- Only logs the mod id (not implemented).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:867
---@param modId string Mod identifier.
function ui_gameplaySelector_general.goToMod(modId) end

--- Indicates whether a tile is a favorite.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:647
---@param itemKey string Tile key.
---@return boolean  true if favorite.
function ui_gameplaySelector_general.isFavourite(itemKey) end

--- Indicates whether the data has already been built and is up to date.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:498
---@return boolean|nil  True if loaded and not invalidated (nil or false otherwise).
function ui_gameplaySelector_general.isGameplayDataLoaded() end

--- Indicates whether a tile is among the recent items.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:659
---@param itemKey string Tile key.
---@return boolean  true if recent.
function ui_gameplaySelector_general.isRecent(itemKey) end

--- Prepares then opens a tile cluster's screen. Computes the path keys (gotoPath, keys or the table itself) and a title, stores the pending selection and navigates to menu.gameplay.type (or menu.experiencesSelector.type from the experiences selector).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:582
---@param input table Tile or path table: gotoPath, keys, or list of keys; name, label or title for the title.
---@return any  Result of ui_router.navigate.
function ui_gameplaySelector_general.navigateToCluster(input) end

--- Route hook called on entering a cluster route. Promotes the selection prepared by navigateToCluster, otherwise falls back to the default cluster.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1130
---@param context any Router context.
---@param toRoute table Destination route.
---@param fromRoute table|nil Origin route.
---@param data table Route data.
function ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data) end

--- Route hook called when a cluster route is mounted. Starts the asynchronous loading with the active cluster's keys and title.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1142
---@param context any Router context.
---@param toRoute table Destination route (name used).
---@param fromRoute table|nil Origin route.
---@param data table Route data.
function ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data) end

--- Hook called when a mod is activated: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:504
function ui_gameplaySelector_general.onModActivated() end

--- Hook called when a mod is deactivated: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:503
function ui_gameplaySelector_general.onModDeactivated() end

--- Hook called when the mod manager is ready: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:505
function ui_gameplaySelector_general.onModManagerReady() end

--- Hook called when the mod manager state changes: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:506
function ui_gameplaySelector_general.onModManagerStateChanged() end

--- Route hook called when a root route of the selector is mounted. Resets the cluster selection, stores the active route and starts the asynchronous loading with the allGameplay path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1122
---@param context any Router context.
---@param toRoute table Destination route (name used).
---@param fromRoute table|nil Origin route.
---@param data table Route data (not used).
function ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook called when the settings change: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:507
function ui_gameplaySelector_general.onSettingsChanged() end

--- Opens menu.experiencesSelector with the system filter quickStartExperiences.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1184
function ui_gameplaySelector_general.openExperiencesSelector() end

--- Applies the preset of the menu.gameplay route (clears filters and search) then navigates to it.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1176
function ui_gameplaySelector_general.openGameplaySelector() end

--- Opens menu.rallySelector with the type filters rallyStage and rallyLoop.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1180
function ui_gameplaySelector_general.openRallySelector() end

--- Indicates whether a tile passes the filters and the search; an isCareerOnly tile is refused as long as displayData.showCareerContent is false.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:610
---@param item table Tile tested.
---@return boolean  true if the tile is displayed.
function ui_gameplaySelector_general.passesFilters(item) end

--- Does nothing (TODO in the code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:817
function ui_gameplaySelector_general.profilerFinish() end

--- Builds a tile's details and sends them to the interface via the event gameplaySelectorDetails with backendName, requestId, item and details.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:596
---@param item table The tile's showDetails data.
---@param requestId any Interface request identifier.
---@return table  The payload sent.
function ui_gameplaySelector_general.requestDetails(item, requestId) end

--- Resets the display options to their default values. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:737
---@param requestId any|nil Request identifier.
---@return table  Display data.
function ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId) end

--- Resets a range filter. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:696
---@param filterKey string Filter name.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.resetRangeFilter.
function ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId) end

--- Resets a multiple-choice filter. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:704
---@param filterKey string Filter name.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.resetSetFilter.
function ui_gameplaySelector_general.resetSetFilter(filterKey, requestId) end

--- Returns the active cluster's title, otherwise clusterTitle if it is a non-empty string, otherwise nil.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1158
---@param clusterTitle string|nil Fallback title.
---@return string|nil  Resolved title.
function ui_gameplaySelector_general.resolveClusterTitle(clusterTitle) end

--- Returns the current view's path: that of the active cluster, otherwise the root path { keys = {"allGameplay"} }.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:1092
---@return table  Path { keys = {...} }.
function ui_gameplaySelector_general.resolveCurrentSelectorPath() end

--- Sets a display option and returns the updated display data. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:729
---@param key string Option key.
---@param value any Value.
---@param requestId any|nil Request identifier.
---@return table  Display data.
function ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId) end

--- Sets the search text. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:716
---@param text string Search text.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.setSearchText.
function ui_gameplaySelector_general.setSearchText(text, requestId) end

--- Toggles a tile's favorite status and returns the new state.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:652
---@param itemDetails table Table with the field key.
---@return boolean  New favorite state.
function ui_gameplaySelector_general.toggleFavourite(itemDetails) end

--- Enables or disables a filter value. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:680
---@param filterKey string Filter name.
---@param value any Option value.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.toggleFilter.
function ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId) end

--- Records a tile as recently used.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:664
---@param itemKey string Tile key.
function ui_gameplaySelector_general.trackRecent(itemKey) end

--- Changes a display option (displayDataInstance.setDisplayDataOption).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:631
---@param key string Option key.
---@param value any New value.
function ui_gameplaySelector_general.updateDisplayData(key, value) end

--- Updates an internal datum of the filters module (filterInstance.updateData).
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:636
---@param key string Data key.
---@param value any Value.
function ui_gameplaySelector_general.updateFilterData(key, value) end

--- Sets the bounds of a range filter. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/gameplaySelector/general.lua:688
---@param filterKey string Filter name.
---@param min number Bottom bound.
---@param max number Top bound.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.updateRangeFilter.
function ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId) end

