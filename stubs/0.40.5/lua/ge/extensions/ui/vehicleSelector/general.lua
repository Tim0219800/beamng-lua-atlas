---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_general` : `extensions.load("ui_vehicleSelector_general")`, puis la globale `ui_vehicleSelector_general`
---@class ui_vehicleSelector_general
---@field dependencies table
---@field p any
ui_vehicleSelector_general = {}

--- Listens for the asyncBulkLoader completion hook so we can build and emit the
---  pause vehicle selector snapshot only after the heavy data is ready. The
---  pending route is compared against the active router entry to discard stale
---  completions caused by rapid route changes.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1819
function ui_vehicleSelector_general.asyncVehicleLoadComplete() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:934
---@param ... any
function ui_vehicleSelector_general.calculateActiveFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:925
---@param ... any
function ui_vehicleSelector_general.clearAllFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:747
function ui_vehicleSelector_general.clearCache() end

--- Reset all drilldown / wizard-owned selector state. Used by the root
---  pause.vehicleSelector lifecycle and by closedFromUI so that a refreshed
---  snapshot (via emitDisplayDataSnapshot) never rebuilds against a previously
---  selected vehicle's config path.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1491
function ui_vehicleSelector_general.clearDrilldownSelectorState() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:933
---@param ... any
function ui_vehicleSelector_general.clearLockedFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:832
function ui_vehicleSelector_general.closedFromUI() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1377
function ui_vehicleSelector_general.consumeFocusSearchOnOpen() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:937
---@param ... any
function ui_vehicleSelector_general.createFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:2020
---@param requestId any
function ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:588
function ui_vehicleSelector_general.emptyProfiler() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:972
---@param ... any
function ui_vehicleSelector_general.executeButton(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:973
---@param ... any
function ui_vehicleSelector_general.executeDoubleClick(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:850
---@param ... any
function ui_vehicleSelector_general.getActiveFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:766
function ui_vehicleSelector_general.getDefaultVehicleInfo() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:780
function ui_vehicleSelector_general.getDefaultVehicleTile() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:970
---@param ... any
function ui_vehicleSelector_general.getDetails(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:860
---@param ... any
function ui_vehicleSelector_general.getDisplayData(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:863
---@param ... any
function ui_vehicleSelector_general.getDisplayDataOptions(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:849
---@param ... any
function ui_vehicleSelector_general.getFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:971
---@param ... any
function ui_vehicleSelector_general.getManagementDetails(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:955
function ui_vehicleSelector_general.getRecentVehicles() end

--- Get screen header title based on current path and filter state
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:979
---@param path any
function ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:851
---@param ... any
function ui_vehicleSelector_general.getSearchText(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:859
---@param ... any
function ui_vehicleSelector_general.getTiles(...) end

--- Getter for uiData that initializes if needed
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:818
function ui_vehicleSelector_general.getUiData() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:936
---@param ... any
function ui_vehicleSelector_general.getValidFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:969
---@param ... any
function ui_vehicleSelector_general.goToMod(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:940
---@param model any
---@param config any
function ui_vehicleSelector_general.isFavourite(model, config) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:930
---@param ... any
function ui_vehicleSelector_general.isFilterLocked(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:632
function ui_vehicleSelector_general.isFreeroamVehicleSelectorContext() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1098
function ui_vehicleSelector_general.isOpenedFromGarage() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:945
---@param model any
---@param config any
function ui_vehicleSelector_general.isRecentVehicle(model, config) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:46
function ui_vehicleSelector_general.isSpawnOnly() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:928
---@param ... any
function ui_vehicleSelector_general.lockFilter(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:931
---@param ... any
function ui_vehicleSelector_general.lockFilterMode(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:932
---@param ... any
function ui_vehicleSelector_general.lockFilterModeExclusive(...) end

--- Save the pending selection and let the router navigate; the rest of the
---  snapshot/title/breadcrumb work happens in the lifecycle hooks below.
---  `options` (optional) are forwarded to extensions.ui_router.navigate so
---  callers can influence route activation. Random selection passes
---  { preferredScope = "auxillary" } to keep the auxiliary panel active instead
---  of focusing the grid; normal grid tile clicks pass no options.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1843
---@param tile any
---@param options any
function ui_vehicleSelector_general.navigateToVehicle(tile, options) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:751
function ui_vehicleSelector_general.onLanguageChanged() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:735
function ui_vehicleSelector_general.onModActivated() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:731
function ui_vehicleSelector_general.onModDeactivated() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:739
function ui_vehicleSelector_general.onModManagerReady() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:743
function ui_vehicleSelector_general.onModManagerStateChanged() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1936
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1972
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1941
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1904
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1967
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1915
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:759
---@param filename any
---@param type any
function ui_vehicleSelector_general.onfilechanged(filename, type) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1345
---@param routeName any
---@param options any
function ui_vehicleSelector_general.openFromPause(routeName, options) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1258
---@param callback any
---@param routeName any
---@param options any
function ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options) end

--- opening the vehicle selector
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1103
function ui_vehicleSelector_general.openVehicleSelectorForFreeroam() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1315
---@param callback any
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1228
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamModal() end

--- opening the vehicle selector
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1119
---@param modId any
function ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1137
---@param showOwnedOnly any
function ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:938
---@param ... any
function ui_vehicleSelector_general.passesFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1087
---@param tag any
function ui_vehicleSelector_general.profilerFinish(tag) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1647
---@param item any
---@param requestId any
function ui_vehicleSelector_general.requestDetails(item, requestId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:874
---@param requestId any
function ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:911
---@param filterKey any
---@param requestId any
function ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:918
---@param filterKey any
---@param requestId any
function ui_vehicleSelector_general.resetSetFilter(filterKey, requestId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:2004
function ui_vehicleSelector_general.resolveCurrentSelectorPath() end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:2036
---@param paramTitle any
function ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:1982
---@param path any
function ui_vehicleSelector_general.setCurrentSelectorPath(path) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:976
---@param ... any
function ui_vehicleSelector_general.setCustomDetailsButtons(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:975
---@param ... any
function ui_vehicleSelector_general.setDetailsButtonForFreeroam(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:866
---@param key any
---@param value any
---@param requestId any
function ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:974
---@param ... any
function ui_vehicleSelector_general.setManagementButtonsEnabled(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:852
---@param text any
---@param requestId any
function ui_vehicleSelector_general.setSearchText(text, requestId) end

--- Normalized spawn-only accessors. setSpawnOnly(nil/false/other) always
---  restores normal behavior, so callers can pass options.spawnOnly directly.
---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:41
---@param value any
function ui_vehicleSelector_general.setSpawnOnly(value) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:35
---@param restrictionMode any
function ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:935
---@param ... any
function ui_vehicleSelector_general.setupValidFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:882
---@param itemDetails any
function ui_vehicleSelector_general.toggleFavourite(itemDetails) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:897
---@param filterKey any
---@param value any
---@param requestId any
function ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:950
---@param model any
---@param config any
function ui_vehicleSelector_general.trackRecentVehicle(model, config) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:929
---@param ... any
function ui_vehicleSelector_general.unlockFilter(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:896
---@param ... any
function ui_vehicleSelector_general.updateFilters(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/general.lua:904
---@param filterKey any
---@param min any
---@param max any
---@param requestId any
function ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

