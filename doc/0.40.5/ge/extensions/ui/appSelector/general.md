# `ui_appSelector_general`

*Fichier : `lua/ge/extensions/ui/appSelector/general.lua` · VM : Game Engine (GE) · 761 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appSelector_general` : `extensions.load("ui_appSelector_general")`, puis la globale `ui_appSelector_general`

**Dépendances (chargées avant) :** `ui_apps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appSelector_general.clearAllFilters(requestId)` |  | 487 |
| `ui_appSelector_general.closedFromUI()` |  | 756 |
| `ui_appSelector_general.emitDisplayDataSnapshot(requestId)` |  | 736 |
| `ui_appSelector_general.executeButton(buttonId, data)` |  | 665 |
| `ui_appSelector_general.executeDoubleClick(details)` |  | 690 |
| `ui_appSelector_general.exploreFolder(path)` |  | 680 |
| `ui_appSelector_general.getActiveFilters()` |  | 446 |
| `ui_appSelector_general.getAppData()` | Getter for appData that initializes if needed | 287 |
| `ui_appSelector_general.getDetails(details)` | Details | 565 |
| `ui_appSelector_general.getDisplayDataOptions()` |  | 496 |
| `ui_appSelector_general.getFilters()` |  | 441 |
| `ui_appSelector_general.getManagementDetails()` | No-op / optional API | 671 |
| `ui_appSelector_general.getScreenHeaderTitleAndPath(path)` |  | 530 |
| `ui_appSelector_general.getSearchText()` |  | 516 |
| `ui_appSelector_general.getTiles(path)` |  | 354 |
| `ui_appSelector_general.goToMod(modId)` |  | 685 |
| `ui_appSelector_general.onModActivated()` | *(hook)* | 301 |
| `ui_appSelector_general.onModDeactivated()` | Mark data as changed when apps are updated *(hook)* | 300 |
| `ui_appSelector_general.onModManagerReady()` | *(hook)* | 302 |
| `ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data)` | *(hook)* | 751 |
| `ui_appSelector_general.profilerFinish()` |  | 755 |
| `ui_appSelector_general.requestDetails(item, requestId)` |  | 653 |
| `ui_appSelector_general.resetDisplayDataToDefaults(requestId)` |  | 508 |
| `ui_appSelector_general.resetRangeFilter(filterKey, requestId)` |  | 469 |
| `ui_appSelector_general.resetSetFilter(filterKey, requestId)` |  | 478 |
| `ui_appSelector_general.resolveCurrentSelectorPath()` |  | 732 |
| `ui_appSelector_general.setDisplayDataOption(key, value, requestId)` |  | 500 |
| `ui_appSelector_general.setSearchText(val, requestId)` |  | 521 |
| `ui_appSelector_general.toggleFavourite(itemDetails)` |  | 675 |
| `ui_appSelector_general.toggleFilter(filterKey, value, requestId)` |  | 451 |
| `ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId)` |  | 460 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `backendName` | string |  |
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `appContainer:spawn`, `appSelectorDetails`, `appSelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appSelector/general.lua`.*
