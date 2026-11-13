---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/freeroamSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_freeroamSelector_general` : `extensions.load("ui_freeroamSelector_general")`, puis la globale `ui_freeroamSelector_general`
---@class ui_freeroamSelector_general
---@field backendName string
---@field dependencies table
ui_freeroamSelector_general = {}

--- Clear all filters
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:446
---@param requestId any
function ui_freeroamSelector_general.clearAllFilters(requestId) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:643
function ui_freeroamSelector_general.closedFromUI() end

--- Build the current-view selector snapshot and emit it through guihooks so the
---  UI can refresh the grid in response. Vue correlates the response with its
---  own requestId so rapid control changes can drop stale responses. Lua stays
---  authoritative: it resolves the current path and rebuilds the snapshot.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:733
---@param requestId any
function ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:758
---@param buttonId any
---@param additionalData any
function ui_freeroamSelector_general.executeButton(buttonId, additionalData) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:770
---@param item any
function ui_freeroamSelector_general.executeDoubleClick(item) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:767
function ui_freeroamSelector_general.exitCallback() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:783
---@param path any
function ui_freeroamSelector_general.exploreFolder(path) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:488
function ui_freeroamSelector_general.getActiveFilters() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:754
function ui_freeroamSelector_general.getCustomDetailsButtons() end

--- Details
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:652
---@param item any
function ui_freeroamSelector_general.getDetails(item) end

--- Get display data
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:429
function ui_freeroamSelector_general.getDisplayData() end

--- Display Data
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:544
function ui_freeroamSelector_general.getDisplayDataOptions() end

--- Filters
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:483
function ui_freeroamSelector_general.getFilters() end

--- Getter for gameplayData that initializes if needed
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:382
function ui_freeroamSelector_general.getGameplayData() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:762
function ui_freeroamSelector_general.getManagementDetails() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:566
---@param path any
function ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:531
function ui_freeroamSelector_general.getSearchText() end

--- Get tiles for a specific path
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:403
---@param path any
function ui_freeroamSelector_general.getTiles(path) end

--- Get UI data for the gameplay selector
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:330
function ui_freeroamSelector_general.getUiData() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:788
---@param modId any
function ui_freeroamSelector_general.goToMod(modId) end

--- Check if an item is a favourite
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:455
---@param itemKey any
function ui_freeroamSelector_general.isFavourite(itemKey) end

--- Check if an item is recent
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:469
---@param itemKey any
function ui_freeroamSelector_general.isRecent(itemKey) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:400
function ui_freeroamSelector_general.onLanguageChanged() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:396
function ui_freeroamSelector_general.onModActivated() end

--- Mark data as changed when mods are activated/deactivated
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:395
function ui_freeroamSelector_general.onModDeactivated() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:397
function ui_freeroamSelector_general.onModManagerReady() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:398
function ui_freeroamSelector_general.onModManagerStateChanged() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:399
function ui_freeroamSelector_general.onSettingsChanged() end

--- Open gameplay selector with freeroam filterInstance enabled
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:794
function ui_freeroamSelector_general.openFreeroamSelector() end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:817
---@param callback any
function ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:809
function ui_freeroamSelector_general.openFromPause() end

--- Check if an item passes the current filters
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:413
---@param item any
function ui_freeroamSelector_general.passesFilters(item) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:639
function ui_freeroamSelector_general.profilerFinish() end

--- Build and emit a details payload for the given item so the UI can correlate
---  the response with its own requestId. Mirrors the contract used by
---  gameplaySelector / vehicleSelector requestDetails.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:665
---@param item any
---@param requestId any
function ui_freeroamSelector_general.requestDetails(item, requestId) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:556
---@param requestId any
function ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:515
---@param filterKey any
---@param requestId any
function ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:523
---@param filterKey any
---@param requestId any
function ui_freeroamSelector_general.resetSetFilter(filterKey, requestId) end

--- Resolve the path of the freeroam selector view the user is currently looking
---  at. Falls back to the default root path when no active selection has been
---  recorded, mirroring gameplaySelector / vehicleSelector behavior.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:719
function ui_freeroamSelector_general.resolveCurrentSelectorPath() end

--- Record the path of the selector view currently visible to the user. Route
---  lifecycle code (e.g. the freeroam wizard mounts) should call this so that
---  emitDisplayDataSnapshot rebuilds the snapshot against the right path. Pass
---  nil to clear it back to the default root path.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:705
---@param path any
function ui_freeroamSelector_general.setCurrentSelectorPath(path) end

--- Custom details buttons management
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:750
---@param buttons any
function ui_freeroamSelector_general.setCustomDetailsButtons(buttons) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:548
---@param key any
---@param value any
---@param requestId any
function ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:535
---@param text any
---@param requestId any
function ui_freeroamSelector_general.setSearchText(text, requestId) end

--- Toggle favourite status
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:461
---@param itemDetails any
function ui_freeroamSelector_general.toggleFavourite(itemDetails) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:499
---@param filterKey any
---@param value any
---@param requestId any
function ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId) end

--- Track recent item
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:475
---@param itemKey any
function ui_freeroamSelector_general.trackRecent(itemKey) end

--- Update display data
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:435
---@param key any
---@param value any
function ui_freeroamSelector_general.updateDisplayData(key, value) end

--- Update filterInstance data
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:441
---@param key any
---@param value any
function ui_freeroamSelector_general.updateFilterData(key, value) end

--- Apply a full filterByProp shape directly. Used by route lifecycle code that
---  needs to restore persisted wizard filter state safely without replaying UI
---  toggles. Locked filters are preserved by filterInstance.updateFilters.
---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:495
---@param newFilters any
function ui_freeroamSelector_general.updateFilters(newFilters) end

---Source : lua/ge/extensions/ui/freeroamSelector/general.lua:507
---@param filterKey any
---@param min any
---@param max any
---@param requestId any
function ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

