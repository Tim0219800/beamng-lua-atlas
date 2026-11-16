---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/freeroamSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "freeroamSelector" backend of the grid selector (gridSelector): the screen where you choose a level and a spawn point for freeroam mode. It collects the tiles via the hook onGameplaySelectorGetTiles (keeping those whose validBackends contains freeroamSelector), handles filters (source, map size, region), search, favorites, recents and display options (saved in /settings/freeroamSelectorData.json), builds the tile details via onGameplaySelectorGetDetails and sends snapshots back to the interface by guihooks. It also knows the routes of the freeroam wizard (level, vehicle, options, multiplayer) in the menu and in pause.
--- Access: extension `ui_freeroamSelector_general`: `extensions.load("ui_freeroamSelector_general")`, then the global `ui_freeroamSelector_general`
---@class ui_freeroamSelector_general
---@field backendName string Backend name: "freeroamSelector".
---@field dependencies string[] Extensions loaded before this one: ui_gameplaySelector_tiles and core_locales.
ui_freeroamSelector_general = {}

--- Clears all filters. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:446
---@param requestId any|nil Interface request identifier.
function ui_freeroamSelector_general.clearAllFilters(requestId) end

--- Called when the interface closes the selector: clears the custom details buttons and the custom root path, then emits the hook onFreeroamSelectorClosed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:643
function ui_freeroamSelector_general.closedFromUI() end

--- Rebuilds the current view's snapshot (ui_gridSelector.getSelectorSnapshot, under pcall) and sends it to the interface via the event freeroamSelectorDisplayDataSnapshot with the requestId. Logs an error and returns false on failure.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:733
---@param requestId any Interface request identifier.
---@return boolean  true if the event was sent.
function ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId) end

--- Runs the details button with the given identifier via the buttonModule.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:758
---@param buttonId any Button identifier.
---@param additionalData any Extra data passed to the callback.
---@return any  Result of buttonInstance.executeButton.
function ui_freeroamSelector_general.executeButton(buttonId, additionalData) end

--- Runs the button marked isDoubleClickAction in a tile's details (or the only button if there is just one).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:770
---@param item table The tile's showDetails data.
function ui_freeroamSelector_general.executeDoubleClick(item) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:767
function ui_freeroamSelector_general.exitCallback() end

--- Only logs the path (not implemented).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:783
---@param path string Folder path.
function ui_freeroamSelector_general.exploreFolder(path) end

--- Returns the active filters.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:488
---@return table  Active filters.
function ui_freeroamSelector_general.getActiveFilters() end

--- Returns the custom details buttons (used by levelTiles).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:754
---@return table  List of buttons, empty by default.
function ui_freeroamSelector_general.getCustomDetailsButtons() end

--- Builds a tile's details by emitting the hook onGameplaySelectorGetDetails (the tile generators add their block to it) and returns the first block.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:652
---@param item table The tile's showDetails data.
---@return table|nil  Details block, nil if no generator responded.
function ui_freeroamSelector_general.getDetails(item) end

--- Returns the current display options (creates the instances if needed).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:429
---@return table  Option values by key.
function ui_freeroamSelector_general.getDisplayData() end

--- Returns the display options definition. The instances must already exist.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:544
---@return table  Display options.
function ui_freeroamSelector_general.getDisplayDataOptions() end

--- Returns the filter definition (list, locked filters) after loading the data.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:483
---@return table  Result of filterInstance.getFilters().
function ui_freeroamSelector_general.getFilters() end

--- Returns the selector data (tiles filtered by validBackends, filters, display options), recomputes them if the mods, settings or language have changed, and creates them on first request.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:382
---@return table  Table items, filterList, activeFilters, lockedFiltersByProp, displayData.
function ui_freeroamSelector_general.getGameplayData() end

--- Always returns { buttons = {} } (TODO in the code).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:762
---@return table  Table with empty buttons.
function ui_freeroamSelector_general.getManagementDetails() end

--- Builds the screen title and the breadcrumb (menu, freeroam selector, optional filters or search segment, current level or group). Uses customRootPath if it was set by openFreeroamSelectorForFreeroamConfigurator.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:566
---@param path table Current path { keys = {...} }.
---@return table  Table title, isFiltered, pathSegments.
function ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path) end

--- Returns the current search text.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:531
---@return string|nil  Entered text.
function ui_freeroamSelector_general.getSearchText() end

--- Returns the tile groups for a path, via ui_gameplaySelector_tiles.getTiles. Clears the first group's label if it is "freeroam".
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:403
---@param path table Navigation path { keys = {...} }.
---@return table[]  Tile groups.
function ui_freeroamSelector_general.getTiles(path) end

--- Returns the selector data: items, displayData, filterList, activeFilters, lockedFiltersByProp and backendName. Loads the tiles if needed.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:330
---@return table  Interface data table.
function ui_freeroamSelector_general.getUiData() end

--- Only logs the mod id (not implemented).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:788
---@param modId string Mod identifier.
function ui_freeroamSelector_general.goToMod(modId) end

--- Indicates whether a tile is a favorite.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:455
---@param itemKey string Tile key.
---@return boolean  true if favorite.
function ui_freeroamSelector_general.isFavourite(itemKey) end

--- Indicates whether a tile is among the recent items.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:469
---@param itemKey string Tile key.
---@return boolean  true if recent.
function ui_freeroamSelector_general.isRecent(itemKey) end

--- Hook called when the language changes: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:400
function ui_freeroamSelector_general.onLanguageChanged() end

--- Hook called when a mod is activated: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:396
function ui_freeroamSelector_general.onModActivated() end

--- Hook called when a mod is deactivated: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:395
function ui_freeroamSelector_general.onModDeactivated() end

--- Hook called when the mod manager is ready: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:397
function ui_freeroamSelector_general.onModManagerReady() end

--- Hook called when the mod manager state changes: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:398
function ui_freeroamSelector_general.onModManagerStateChanged() end

--- Hook called when the settings change: marks the data as needing recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:399
function ui_freeroamSelector_general.onSettingsChanged() end

--- Clears the filters, sets groupMode to "system" and clusterMode to "automatic", enables the "freeroam" system filter and navigates to the route "menu.gameplay".
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:794
function ui_freeroamSelector_general.openFreeroamSelector() end

--- Opens the selector to choose a spawn point: installs a "Select spawnpoint" button whose callback receives (levelName, spawnPointName), sets its own breadcrumb, navigates to "menu.freeroamselector" and emits the hook onFreeroamSelectorOpen.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:817
---@param callback function Function called with levelName and spawnPointName on selection.
function ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback) end

--- Opens the freeroam wizard from the pause menu, on the step configured in the setting freeroamSetupDefaultStep (level by default; level, vehicle, options or multiplayer), with returnRoute = "pause".
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:809
function ui_freeroamSelector_general.openFromPause() end

--- Indicates whether a tile passes the filters, the search and the showAuxContent option; an isCareerOnly tile is refused as long as displayData.showCareerContent is false.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:413
---@param item table Tile tested.
---@return boolean  true if the tile is displayed.
function ui_freeroamSelector_general.passesFilters(item) end

--- Does nothing (TODO in the code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:639
function ui_freeroamSelector_general.profilerFinish() end

--- Builds a tile's details and sends them to the interface via the event freeroamSelectorDetails, with backendName, requestId, item and details.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:665
---@param item table The tile's showDetails data.
---@param requestId any Interface request identifier.
---@return table  The payload sent.
function ui_freeroamSelector_general.requestDetails(item, requestId) end

--- Resets the display options to their default values. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:556
---@param requestId any|nil Request identifier.
---@return table  Display data.
function ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId) end

--- Resets a range filter. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:515
---@param filterKey string Filter name.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.resetRangeFilter.
function ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId) end

--- Resets a multiple-choice filter. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:523
---@param filterKey string Filter name.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.resetSetFilter.
function ui_freeroamSelector_general.resetSetFilter(filterKey, requestId) end

--- Returns the current view's path, or the default root path { keys = {"allFreeroam"} } if none was stored.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:719
---@return table  Copy of the path.
function ui_freeroamSelector_general.resolveCurrentSelectorPath() end

--- Stores the path of the visible view, so that emitDisplayDataSnapshot rebuilds the snapshot on the right path. An invalid path is ignored; nil goes back to the root path.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:705
---@param path table|nil Path { keys = {...} } (non-empty string keys).
function ui_freeroamSelector_general.setCurrentSelectorPath(path) end

--- Replaces the details buttons with a custom list (nil empties it). Each button has callback(levelName, spawnPointName, key) and meta (label, icon, primary, isDoubleClickAction, trackRecent).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:750
---@param buttons table|nil List of buttons.
function ui_freeroamSelector_general.setCustomDetailsButtons(buttons) end

--- Sets a display option and returns the updated display data. Emits a snapshot if requestId is provided. Used for example by levelTiles.setAlwaysShowDialogue.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:548
---@param key string Option key.
---@param value any Value.
---@param requestId any|nil Request identifier.
---@return table  Display data.
function ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId) end

--- Sets the search text. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:535
---@param text string Search text.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.setSearchText.
function ui_freeroamSelector_general.setSearchText(text, requestId) end

--- Toggles a tile's favorite status and returns the new state.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:461
---@param itemDetails table Table with the field key.
---@return boolean  New favorite state.
function ui_freeroamSelector_general.toggleFavourite(itemDetails) end

--- Enables or disables a filter value. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:499
---@param filterKey string Filter name.
---@param value any Option value.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.toggleFilter.
function ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId) end

--- Records a tile as recently used.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:475
---@param itemKey string Tile key.
function ui_freeroamSelector_general.trackRecent(itemKey) end

--- Changes a display option (displayDataInstance.setDisplayDataOption).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:435
---@param key string Option key.
---@param value any New value.
function ui_freeroamSelector_general.updateDisplayData(key, value) end

--- Updates an internal datum of the filters module (filterInstance.updateData).
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:441
---@param key string Data key.
---@param value any Value.
function ui_freeroamSelector_general.updateFilterData(key, value) end

--- Directly applies a complete filterByProp table, for example to restore the wizard's saved state without replaying the clicks. Locked filters are kept.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:495
---@param newFilters table filterByProp form.
---@return any  Result of filterInstance.updateFilters.
function ui_freeroamSelector_general.updateFilters(newFilters) end

--- Sets the bounds of a range filter. Emits a snapshot if requestId is provided.
---Source: lua/ge/extensions/ui/freeroamSelector/general.lua:507
---@param filterKey string Filter name.
---@param min number Bottom bound.
---@param max number Top bound.
---@param requestId any|nil Request identifier.
---@return any  Result of filterInstance.updateRangeFilter.
function ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

