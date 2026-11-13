---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_gameplaySelector_general` : `extensions.load("ui_gameplaySelector_general")`, puis la globale `ui_gameplaySelector_general`
---@class ui_gameplaySelector_general
---@field backendName string
---@field dependencies table
ui_gameplaySelector_general = {}

--- Listens for the asyncBulkLoader completion hook so we can build and emit the
---  gameplay selector snapshot only after the heavy data is ready. The pending
---  route is compared against the active router entry to discard stale completions
---  caused by rapid route changes.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1070
function ui_gameplaySelector_general.asyncGameplaySelectorLoadComplete() end

--- Clear all filters
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:641
function ui_gameplaySelector_general.clearAllFilters() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:821
function ui_gameplaySelector_general.closedFromUI() end

--- Build the current-view selector snapshot and emit it through guihooks so the
---  UI can refresh the grid in response. Vue correlates the response with its
---  own requestId so rapid control changes can drop stale responses. Lua stays
---  authoritative: it resolves the current path and rebuilds groups, filters,
---  displayData, managementDetails, header, etc.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1107
---@param requestId any
function ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:837
---@param buttonId any
---@param additionalData any
function ui_gameplaySelector_general.executeButton(buttonId, additionalData) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:850
---@param item any
function ui_gameplaySelector_general.executeDoubleClick(item) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:846
function ui_gameplaySelector_general.exitCallback() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:862
---@param path any
function ui_gameplaySelector_general.exploreFolder(path) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:676
function ui_gameplaySelector_general.getActiveFilters() end

--- Details
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:827
---@param item any
function ui_gameplaySelector_general.getDetails(item) end

--- Get display data
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:626
---@param routeName any
function ui_gameplaySelector_general.getDisplayData(routeName) end

--- Display Data
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:725
---@param routeName any
function ui_gameplaySelector_general.getDisplayDataOptions(routeName) end

--- Filters
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:671
function ui_gameplaySelector_general.getFilters() end

--- Getter for gameplayData that initializes if needed
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:487
function ui_gameplaySelector_general.getGameplayData() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:841
function ui_gameplaySelector_general.getManagementDetails() end

--- General
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:746
---@param path any
function ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:712
function ui_gameplaySelector_general.getSearchText() end

--- Get tiles for a specific path
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:510
---@param path any
---@param routeName any
function ui_gameplaySelector_general.getTiles(path, routeName) end

--- Get UI data for the gameplay selector
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:440
---@param routeName any
function ui_gameplaySelector_general.getUiData(routeName) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:867
---@param modId any
function ui_gameplaySelector_general.goToMod(modId) end

--- Check if an item is a favourite
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:647
---@param itemKey any
function ui_gameplaySelector_general.isFavourite(itemKey) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:498
function ui_gameplaySelector_general.isGameplayDataLoaded() end

--- Check if an item is recent
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:659
---@param itemKey any
function ui_gameplaySelector_general.isRecent(itemKey) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:582
---@param input any
function ui_gameplaySelector_general.navigateToCluster(input) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1130
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1142
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:504
function ui_gameplaySelector_general.onModActivated() end

--- Mark data as changed when mods are activated/deactivated
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:503
function ui_gameplaySelector_general.onModDeactivated() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:505
function ui_gameplaySelector_general.onModManagerReady() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:506
function ui_gameplaySelector_general.onModManagerStateChanged() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1122
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:507
function ui_gameplaySelector_general.onSettingsChanged() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1184
function ui_gameplaySelector_general.openExperiencesSelector() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1176
function ui_gameplaySelector_general.openGameplaySelector() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1180
function ui_gameplaySelector_general.openRallySelector() end

--- Check if an item passes the current filters
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:610
---@param item any
function ui_gameplaySelector_general.passesFilters(item) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:817
function ui_gameplaySelector_general.profilerFinish() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:596
---@param item any
---@param requestId any
function ui_gameplaySelector_general.requestDetails(item, requestId) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:737
---@param requestId any
function ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:696
---@param filterKey any
---@param requestId any
function ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:704
---@param filterKey any
---@param requestId any
function ui_gameplaySelector_general.resetSetFilter(filterKey, requestId) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1158
---@param clusterTitle any
function ui_gameplaySelector_general.resolveClusterTitle(clusterTitle) end

--- Resolve the path of the gameplay selector view the user is currently looking
---  at. Cluster routes track their selection through onClusterRouteEnter /
---  onClusterRouteMount, so a non-nil activeClusterSelection means we are in a
---  cluster view. Root routes clear it via onRouteMount.
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:1092
function ui_gameplaySelector_general.resolveCurrentSelectorPath() end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:729
---@param key any
---@param value any
---@param requestId any
function ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:716
---@param text any
---@param requestId any
function ui_gameplaySelector_general.setSearchText(text, requestId) end

--- Toggle favourite status
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:652
---@param itemDetails any
function ui_gameplaySelector_general.toggleFavourite(itemDetails) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:680
---@param filterKey any
---@param value any
---@param requestId any
function ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId) end

--- Track recent item
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:664
---@param itemKey any
function ui_gameplaySelector_general.trackRecent(itemKey) end

--- Update display data
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:631
---@param key any
---@param value any
function ui_gameplaySelector_general.updateDisplayData(key, value) end

--- Update filterInstance data
---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:636
---@param key any
---@param value any
function ui_gameplaySelector_general.updateFilterData(key, value) end

---Source : lua/ge/extensions/ui/gameplaySelector/general.lua:688
---@param filterKey any
---@param min any
---@param max any
---@param requestId any
function ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId) end

