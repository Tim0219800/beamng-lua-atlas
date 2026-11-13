# `ui_gridSelector`

*Fichier : `lua/ge/extensions/ui/gridSelector.lua` · VM : Game Engine (GE) · 503 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelector` : `extensions.load("ui_gridSelector")`, puis la globale `ui_gridSelector`

**Dépendances (chargées avant) :** `ui_vehicleSelector_general`, `ui_gameplaySelector_general`, `ui_appSelector_general`, `ui_freeroamSelector_general`, `ui_quickraceSelector_general`, `ui_lightRunnerSelector_general`, `ui_busRouteSelector_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelector.clearAllFilters(backendName, ...)` |  | 415 |
| `ui_gridSelector.closedFromUI(backendName, ...)` |  | 428 |
| `ui_gridSelector.executeButton(backendName, ...)` |  | 432 |
| `ui_gridSelector.executeDoubleClick(backendName, ...)` |  | 435 |
| `ui_gridSelector.exitCallback(backendName, ...)` |  | 434 |
| `ui_gridSelector.exploreFolder(_backendName, path)` |  | 495 |
| `ui_gridSelector.getActiveFilters(backendName, ...)` |  | 410 |
| `ui_gridSelector.getBackendByName(backendName)` |  | 64 |
| `ui_gridSelector.getDetails(backendName, ...)` | Details | 430 |
| `ui_gridSelector.getDisplayDataOptions(backendName, ...)` | Display Data | 419 |
| `ui_gridSelector.getFilters(backendName, ...)` | Filters | 409 |
| `ui_gridSelector.getInitialData(backendName, path)` |  | 481 |
| `ui_gridSelector.getManagementDetails(backendName, ...)` |  | 433 |
| `ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...)` | General | 423 |
| `ui_gridSelector.getSearchText(backendName, ...)` |  | 416 |
| `ui_gridSelector.getSelectorRefresh(backendName, path, options)` |  | 440 |
| `ui_gridSelector.getSelectorSnapshot(backendName, path)` |  | 481 |
| `ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options)` |  | 440 |
| `ui_gridSelector.getTiles(backendName, path, ...)` | Tiles | 399 |
| `ui_gridSelector.goToMod(_backendName, modId)` |  | 499 |
| `ui_gridSelector.profilerFinish(backendName, ...)` |  | 427 |
| `ui_gridSelector.requestClusterTiles(backendName, path, ...)` |  | 404 |
| `ui_gridSelector.requestDetails(backendName, ...)` |  | 431 |
| `ui_gridSelector.resetDisplayDataToDefaults(backendName, ...)` |  | 421 |
| `ui_gridSelector.resetRangeFilter(backendName, ...)` |  | 413 |
| `ui_gridSelector.resetSetFilter(backendName, ...)` |  | 414 |
| `ui_gridSelector.setDisplayDataOption(backendName, ...)` |  | 420 |
| `ui_gridSelector.setSearchText(backendName, ...)` |  | 417 |
| `ui_gridSelector.toggleFavourite(backendName, ...)` | M.exploreFolder = function(backendName, ...) return getBackendByName(backendName).exploreFolder(...) end<br>M.goToMod = function(backendName, ...) return getBackendByName(backendName).goToMod(...) end | 438 |
| `ui_gridSelector.toggleFilter(backendName, ...)` |  | 411 |
| `ui_gridSelector.updateRangeFilter(backendName, ...)` |  | 412 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `BackendContract` | table |  |
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelector.lua`.*
