# `ui_vehicleSelector_general`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/general.lua` · VM : Game Engine (GE) · 2046 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_general` : `extensions.load("ui_vehicleSelector_general")`, puis la globale `ui_vehicleSelector_general`

**Dépendances (chargées avant) :** `core_vehicles`, `ui_vehicleSelector_detailsInteraction`, `ui_vehicleSelector_tiles`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_general.asyncVehicleLoadComplete()` | Listens for the asyncBulkLoader completion hook so we can build and emit the<br> pause vehicle selector snapshot only after the heavy data is ready. The<br> pending route is compared against the active router entry to discard stale<br> completions caused by rapid route changes. | 1819 |
| `ui_vehicleSelector_general.calculateActiveFilters(...)` |  | 934 |
| `ui_vehicleSelector_general.clearAllFilters(...)` |  | 925 |
| `ui_vehicleSelector_general.clearCache()` |  | 747 |
| `ui_vehicleSelector_general.clearDrilldownSelectorState()` | Reset all drilldown / wizard-owned selector state. Used by the root<br> pause.vehicleSelector lifecycle and by closedFromUI so that a refreshed<br> snapshot (via emitDisplayDataSnapshot) never rebuilds against a previously<br> selected vehicle's config path. | 1491 |
| `ui_vehicleSelector_general.clearLockedFilters(...)` |  | 933 |
| `ui_vehicleSelector_general.closedFromUI()` |  | 832 |
| `ui_vehicleSelector_general.consumeFocusSearchOnOpen()` |  | 1377 |
| `ui_vehicleSelector_general.createFilters(...)` |  | 937 |
| `ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId)` |  | 2020 |
| `ui_vehicleSelector_general.emptyProfiler()` |  | 588 |
| `ui_vehicleSelector_general.executeButton(...)` |  | 972 |
| `ui_vehicleSelector_general.executeDoubleClick(...)` |  | 973 |
| `ui_vehicleSelector_general.getActiveFilters(...)` |  | 850 |
| `ui_vehicleSelector_general.getDefaultVehicleInfo()` |  | 766 |
| `ui_vehicleSelector_general.getDefaultVehicleTile()` |  | 780 |
| `ui_vehicleSelector_general.getDetails(...)` |  | 970 |
| `ui_vehicleSelector_general.getDisplayData(...)` |  | 860 |
| `ui_vehicleSelector_general.getDisplayDataOptions(...)` |  | 863 |
| `ui_vehicleSelector_general.getFilters(...)` |  | 849 |
| `ui_vehicleSelector_general.getManagementDetails(...)` |  | 971 |
| `ui_vehicleSelector_general.getRecentVehicles()` |  | 955 |
| `ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path)` | Get screen header title based on current path and filter state | 979 |
| `ui_vehicleSelector_general.getSearchText(...)` |  | 851 |
| `ui_vehicleSelector_general.getTiles(...)` |  | 859 |
| `ui_vehicleSelector_general.getUiData()` | Getter for uiData that initializes if needed | 818 |
| `ui_vehicleSelector_general.getValidFilters(...)` |  | 936 |
| `ui_vehicleSelector_general.goToMod(...)` |  | 969 |
| `ui_vehicleSelector_general.isFavourite(model, config)` |  | 940 |
| `ui_vehicleSelector_general.isFilterLocked(...)` |  | 930 |
| `ui_vehicleSelector_general.isFreeroamVehicleSelectorContext()` |  | 632 |
| `ui_vehicleSelector_general.isOpenedFromGarage()` |  | 1098 |
| `ui_vehicleSelector_general.isRecentVehicle(model, config)` |  | 945 |
| `ui_vehicleSelector_general.isSpawnOnly()` |  | 46 |
| `ui_vehicleSelector_general.lockFilter(...)` |  | 928 |
| `ui_vehicleSelector_general.lockFilterMode(...)` |  | 931 |
| `ui_vehicleSelector_general.lockFilterModeExclusive(...)` |  | 932 |
| `ui_vehicleSelector_general.navigateToVehicle(tile, options)` | Save the pending selection and let the router navigate; the rest of the<br> snapshot/title/breadcrumb work happens in the lifecycle hooks below.<br> `options` (optional) are forwarded to extensions.ui_router.navigate so<br> callers can influence route activation. Random selection passes<br> { preferredScope = "auxillary" } to keep the auxiliary panel active instead<br> of focusing the grid; normal grid tile clicks pass no options. | 1843 |
| `ui_vehicleSelector_general.onLanguageChanged()` | *(hook)* | 751 |
| `ui_vehicleSelector_general.onModActivated()` | *(hook)* | 735 |
| `ui_vehicleSelector_general.onModDeactivated()` | *(hook)* | 731 |
| `ui_vehicleSelector_general.onModManagerReady()` | *(hook)* | 739 |
| `ui_vehicleSelector_general.onModManagerStateChanged()` | *(hook)* | 743 |
| `ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data)` | *(hook)* | 1936 |
| `ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data)` | *(hook)* | 1972 |
| `ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data)` | *(hook)* | 1941 |
| `ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data)` | *(hook)* | 1904 |
| `ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data)` | *(hook)* | 1967 |
| `ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data)` | *(hook)* | 1915 |
| `ui_vehicleSelector_general.onfilechanged(filename, type)` |  | 759 |
| `ui_vehicleSelector_general.openFromPause(routeName, options)` |  | 1345 |
| `ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options)` |  | 1258 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroam()` | opening the vehicle selector | 1103 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback)` |  | 1315 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamModal()` |  | 1228 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId)` | opening the vehicle selector | 1119 |
| `ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly)` |  | 1137 |
| `ui_vehicleSelector_general.passesFilters(...)` |  | 938 |
| `ui_vehicleSelector_general.profilerFinish(tag)` |  | 1087 |
| `ui_vehicleSelector_general.requestDetails(item, requestId)` |  | 1647 |
| `ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId)` |  | 874 |
| `ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId)` |  | 911 |
| `ui_vehicleSelector_general.resetSetFilter(filterKey, requestId)` |  | 918 |
| `ui_vehicleSelector_general.resolveCurrentSelectorPath()` |  | 2004 |
| `ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle)` |  | 2036 |
| `ui_vehicleSelector_general.setCurrentSelectorPath(path)` |  | 1982 |
| `ui_vehicleSelector_general.setCustomDetailsButtons(...)` |  | 976 |
| `ui_vehicleSelector_general.setDetailsButtonForFreeroam(...)` |  | 975 |
| `ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId)` |  | 866 |
| `ui_vehicleSelector_general.setManagementButtonsEnabled(...)` |  | 974 |
| `ui_vehicleSelector_general.setSearchText(text, requestId)` |  | 852 |
| `ui_vehicleSelector_general.setSpawnOnly(value)` | Normalized spawn-only accessors. setSpawnOnly(nil/false/other) always<br> restores normal behavior, so callers can pass options.spawnOnly directly. | 41 |
| `ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode)` |  | 35 |
| `ui_vehicleSelector_general.setupValidFilters(...)` |  | 935 |
| `ui_vehicleSelector_general.toggleFavourite(itemDetails)` |  | 882 |
| `ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId)` |  | 897 |
| `ui_vehicleSelector_general.trackRecentVehicle(model, config)` |  | 950 |
| `ui_vehicleSelector_general.unlockFilter(...)` |  | 929 |
| `ui_vehicleSelector_general.updateFilters(...)` |  | 896 |
| `ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId)` |  | 904 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `p` | any |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorClosed`
- `onVehicleSelectorOpen`

**Évènements UI (guihooks.trigger) :** `VehicleSelectorDataLoaded`, `gridSelectorRefreshAll`, `vehicleSelectorDetails`, `vehicleSelectorDisplayDataSnapshot`

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/general.lua`.*
