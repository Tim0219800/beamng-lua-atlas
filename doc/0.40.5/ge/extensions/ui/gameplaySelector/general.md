# `ui_gameplaySelector_general`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/general.lua` · VM : Game Engine (GE) · 1189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_general` : `extensions.load("ui_gameplaySelector_general")`, puis la globale `ui_gameplaySelector_general`

**Dépendances (chargées avant) :** `ui_gameplaySelector_tiles`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_general.asyncGameplaySelectorLoadComplete()` | Listens for the asyncBulkLoader completion hook so we can build and emit the<br> gameplay selector snapshot only after the heavy data is ready. The pending<br> route is compared against the active router entry to discard stale completions<br> caused by rapid route changes. | 1070 |
| `ui_gameplaySelector_general.clearAllFilters()` | Clear all filters | 641 |
| `ui_gameplaySelector_general.closedFromUI()` |  | 821 |
| `ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId)` | Build the current-view selector snapshot and emit it through guihooks so the<br> UI can refresh the grid in response. Vue correlates the response with its<br> own requestId so rapid control changes can drop stale responses. Lua stays<br> authoritative: it resolves the current path and rebuilds groups, filters,<br> displayData, managementDetails, header, etc. | 1107 |
| `ui_gameplaySelector_general.executeButton(buttonId, additionalData)` |  | 837 |
| `ui_gameplaySelector_general.executeDoubleClick(item)` |  | 850 |
| `ui_gameplaySelector_general.exitCallback()` |  | 846 |
| `ui_gameplaySelector_general.exploreFolder(path)` |  | 862 |
| `ui_gameplaySelector_general.getActiveFilters()` |  | 676 |
| `ui_gameplaySelector_general.getDetails(item)` | Details | 827 |
| `ui_gameplaySelector_general.getDisplayData(routeName)` | Get display data | 626 |
| `ui_gameplaySelector_general.getDisplayDataOptions(routeName)` | Display Data | 725 |
| `ui_gameplaySelector_general.getFilters()` | Filters | 671 |
| `ui_gameplaySelector_general.getGameplayData()` | Getter for gameplayData that initializes if needed | 487 |
| `ui_gameplaySelector_general.getManagementDetails()` |  | 841 |
| `ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path)` | General | 746 |
| `ui_gameplaySelector_general.getSearchText()` |  | 712 |
| `ui_gameplaySelector_general.getTiles(path, routeName)` | Get tiles for a specific path | 510 |
| `ui_gameplaySelector_general.getUiData(routeName)` | Get UI data for the gameplay selector | 440 |
| `ui_gameplaySelector_general.goToMod(modId)` |  | 867 |
| `ui_gameplaySelector_general.isFavourite(itemKey)` | Check if an item is a favourite | 647 |
| `ui_gameplaySelector_general.isGameplayDataLoaded()` |  | 498 |
| `ui_gameplaySelector_general.isRecent(itemKey)` | Check if an item is recent | 659 |
| `ui_gameplaySelector_general.navigateToCluster(input)` |  | 582 |
| `ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data)` | *(hook)* | 1130 |
| `ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data)` | *(hook)* | 1142 |
| `ui_gameplaySelector_general.onModActivated()` | *(hook)* | 504 |
| `ui_gameplaySelector_general.onModDeactivated()` | Mark data as changed when mods are activated/deactivated *(hook)* | 503 |
| `ui_gameplaySelector_general.onModManagerReady()` | *(hook)* | 505 |
| `ui_gameplaySelector_general.onModManagerStateChanged()` | *(hook)* | 506 |
| `ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data)` | *(hook)* | 1122 |
| `ui_gameplaySelector_general.onSettingsChanged()` | *(hook)* | 507 |
| `ui_gameplaySelector_general.openExperiencesSelector()` |  | 1184 |
| `ui_gameplaySelector_general.openGameplaySelector()` |  | 1176 |
| `ui_gameplaySelector_general.openRallySelector()` |  | 1180 |
| `ui_gameplaySelector_general.passesFilters(item)` | Check if an item passes the current filters | 610 |
| `ui_gameplaySelector_general.profilerFinish()` |  | 817 |
| `ui_gameplaySelector_general.requestDetails(item, requestId)` |  | 596 |
| `ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId)` |  | 737 |
| `ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId)` |  | 696 |
| `ui_gameplaySelector_general.resetSetFilter(filterKey, requestId)` |  | 704 |
| `ui_gameplaySelector_general.resolveClusterTitle(clusterTitle)` |  | 1158 |
| `ui_gameplaySelector_general.resolveCurrentSelectorPath()` | Resolve the path of the gameplay selector view the user is currently looking<br> at. Cluster routes track their selection through onClusterRouteEnter /<br> onClusterRouteMount, so a non-nil activeClusterSelection means we are in a<br> cluster view. Root routes clear it via onRouteMount. | 1092 |
| `ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId)` |  | 729 |
| `ui_gameplaySelector_general.setSearchText(text, requestId)` |  | 716 |
| `ui_gameplaySelector_general.toggleFavourite(itemDetails)` | Toggle favourite status | 652 |
| `ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId)` |  | 680 |
| `ui_gameplaySelector_general.trackRecent(itemKey)` | Track recent item | 664 |
| `ui_gameplaySelector_general.updateDisplayData(key, value)` | Update display data | 631 |
| `ui_gameplaySelector_general.updateFilterData(key, value)` | Update filterInstance data | 636 |
| `ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId)` |  | 688 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `backendName` | string |  |
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplaySelectorGetDetails` — écouté par 5 module(s)
- `onGameplaySelectorGetTiles` — écouté par 5 module(s)

**Évènements UI (guihooks.trigger) :** `GameplaySelectorDataLoaded`, `gameplaySelectorDetails`, `gameplaySelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/general.lua`.*
