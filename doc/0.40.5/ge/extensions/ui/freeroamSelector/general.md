# `ui_freeroamSelector_general`

*Fichier : `lua/ge/extensions/ui/freeroamSelector/general.lua` · VM : Game Engine (GE) · 847 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_freeroamSelector_general` : `extensions.load("ui_freeroamSelector_general")`, puis la globale `ui_freeroamSelector_general`

**Dépendances (chargées avant) :** `ui_gameplaySelector_tiles`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_freeroamSelector_general.clearAllFilters(requestId)` | Clear all filters | 446 |
| `ui_freeroamSelector_general.closedFromUI()` |  | 643 |
| `ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId)` | Build the current-view selector snapshot and emit it through guihooks so the<br> UI can refresh the grid in response. Vue correlates the response with its<br> own requestId so rapid control changes can drop stale responses. Lua stays<br> authoritative: it resolves the current path and rebuilds the snapshot. | 733 |
| `ui_freeroamSelector_general.executeButton(buttonId, additionalData)` |  | 758 |
| `ui_freeroamSelector_general.executeDoubleClick(item)` |  | 770 |
| `ui_freeroamSelector_general.exitCallback()` |  | 767 |
| `ui_freeroamSelector_general.exploreFolder(path)` |  | 783 |
| `ui_freeroamSelector_general.getActiveFilters()` |  | 488 |
| `ui_freeroamSelector_general.getCustomDetailsButtons()` |  | 754 |
| `ui_freeroamSelector_general.getDetails(item)` | Details | 652 |
| `ui_freeroamSelector_general.getDisplayData()` | Get display data | 429 |
| `ui_freeroamSelector_general.getDisplayDataOptions()` | Display Data | 544 |
| `ui_freeroamSelector_general.getFilters()` | Filters | 483 |
| `ui_freeroamSelector_general.getGameplayData()` | Getter for gameplayData that initializes if needed | 382 |
| `ui_freeroamSelector_general.getManagementDetails()` |  | 762 |
| `ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path)` |  | 566 |
| `ui_freeroamSelector_general.getSearchText()` |  | 531 |
| `ui_freeroamSelector_general.getTiles(path)` | Get tiles for a specific path | 403 |
| `ui_freeroamSelector_general.getUiData()` | Get UI data for the gameplay selector | 330 |
| `ui_freeroamSelector_general.goToMod(modId)` |  | 788 |
| `ui_freeroamSelector_general.isFavourite(itemKey)` | Check if an item is a favourite | 455 |
| `ui_freeroamSelector_general.isRecent(itemKey)` | Check if an item is recent | 469 |
| `ui_freeroamSelector_general.onLanguageChanged()` | *(hook)* | 400 |
| `ui_freeroamSelector_general.onModActivated()` | *(hook)* | 396 |
| `ui_freeroamSelector_general.onModDeactivated()` | Mark data as changed when mods are activated/deactivated *(hook)* | 395 |
| `ui_freeroamSelector_general.onModManagerReady()` | *(hook)* | 397 |
| `ui_freeroamSelector_general.onModManagerStateChanged()` | *(hook)* | 398 |
| `ui_freeroamSelector_general.onSettingsChanged()` | *(hook)* | 399 |
| `ui_freeroamSelector_general.openFreeroamSelector()` | Open gameplay selector with freeroam filterInstance enabled | 794 |
| `ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback)` |  | 817 |
| `ui_freeroamSelector_general.openFromPause()` |  | 809 |
| `ui_freeroamSelector_general.passesFilters(item)` | Check if an item passes the current filters | 413 |
| `ui_freeroamSelector_general.profilerFinish()` |  | 639 |
| `ui_freeroamSelector_general.requestDetails(item, requestId)` | Build and emit a details payload for the given item so the UI can correlate<br> the response with its own requestId. Mirrors the contract used by<br> gameplaySelector / vehicleSelector requestDetails. | 665 |
| `ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId)` |  | 556 |
| `ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId)` |  | 515 |
| `ui_freeroamSelector_general.resetSetFilter(filterKey, requestId)` |  | 523 |
| `ui_freeroamSelector_general.resolveCurrentSelectorPath()` | Resolve the path of the freeroam selector view the user is currently looking<br> at. Falls back to the default root path when no active selection has been<br> recorded, mirroring gameplaySelector / vehicleSelector behavior. | 719 |
| `ui_freeroamSelector_general.setCurrentSelectorPath(path)` | Record the path of the selector view currently visible to the user. Route<br> lifecycle code (e.g. the freeroam wizard mounts) should call this so that<br> emitDisplayDataSnapshot rebuilds the snapshot against the right path. Pass<br> nil to clear it back to the default root path. | 705 |
| `ui_freeroamSelector_general.setCustomDetailsButtons(buttons)` | Custom details buttons management | 750 |
| `ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId)` |  | 548 |
| `ui_freeroamSelector_general.setSearchText(text, requestId)` |  | 535 |
| `ui_freeroamSelector_general.toggleFavourite(itemDetails)` | Toggle favourite status | 461 |
| `ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId)` |  | 499 |
| `ui_freeroamSelector_general.trackRecent(itemKey)` | Track recent item | 475 |
| `ui_freeroamSelector_general.updateDisplayData(key, value)` | Update display data | 435 |
| `ui_freeroamSelector_general.updateFilterData(key, value)` | Update filterInstance data | 441 |
| `ui_freeroamSelector_general.updateFilters(newFilters)` | Apply a full filterByProp shape directly. Used by route lifecycle code that<br> needs to restore persisted wizard filter state safely without replaying UI<br> toggles. Locked filters are preserved by filterInstance.updateFilters. | 495 |
| `ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId)` |  | 507 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `backendName` | string |  |
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFreeroamSelectorClosed`
- `onFreeroamSelectorOpen`
- `onGameplaySelectorGetDetails` — écouté par 5 module(s)
- `onGameplaySelectorGetTiles` — écouté par 5 module(s)

**Évènements UI (guihooks.trigger) :** `freeroamSelectorDetails`, `freeroamSelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/freeroamSelector/general.lua`.*
