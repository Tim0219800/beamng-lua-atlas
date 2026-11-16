# `ui_freeroamSelector_general`

*File: `lua/ge/extensions/ui/freeroamSelector/general.lua` · VM: Game Engine (GE) · 847 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_freeroamSelector_general`: `extensions.load("ui_freeroamSelector_general")`, then the global `ui_freeroamSelector_general`

"freeroamSelector" backend of the grid selector (gridSelector): the screen where you choose a level and a spawn point for freeroam mode. It collects the tiles via the hook onGameplaySelectorGetTiles (keeping those whose validBackends contains freeroamSelector), handles filters (source, map size, region), search, favorites, recents and display options (saved in /settings/freeroamSelectorData.json), builds the tile details via onGameplaySelectorGetDetails and sends snapshots back to the interface by guihooks. It also knows the routes of the freeroam wizard (level, vehicle, options, multiplayer) in the menu and in pause.

## Example

```lua
-- open the selector to choose a spawn point and receive the choice
ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(function(levelName, spawnPointName)
  log('I', 'mod', levelName .. ' / ' .. tostring(spawnPointName))
end)
```

## Notes

- The tiles and filters are recomputed on next access when gameplayDataChanged is true: this happens on onModActivated, onModDeactivated, onModManagerReady, onModManagerStateChanged, onSettingsChanged and onLanguageChanged.
- Filters defined: source (official, mod), mapSize (steps 0, 1024², 2048², 4096², 8192², 16384²; the level's area is compared to the steps) and region. The text search covers the name, the level, the translated property values and the tile's optional filter hook (item.filterHook).
- Display options: groupMode, clusterMode, displaySize (list, tiny, small, medium, large, huge; saved), showAuxContent (saved), sorting, showRecentMode, showFavouritesMode and defaultFreeroamAction ("startFreeroam" or "configureFreeroam", default "configureFreeroam", saved). The data version is 13.
- Several functions accept an optional requestId: if provided, a snapshot is emitted via freeroamSelectorDisplayDataSnapshot so that the Vue interface ignores stale responses.
- The default root path is { keys = {"allFreeroam"} }, whereas the breadcrumbs use "allGameplay": tiles.getTiles treats any unknown path as allGameplay, so the result is identical.
- getDisplayDataOptions, setDisplayDataOption, resetDisplayDataToDefaults and updateFilterData do not call ensureInstances: they assume the instances have already been created (by getGameplayData, getDisplayData…), otherwise an error on nil.
- exploreFolder and goToMod only log (TODO); getManagementDetails always returns { buttons = {} } and profilerFinish does nothing.
- In getScreenHeaderTitleAndPath, string.format("%s", clusterKey, groupKey, groupName) receives extra arguments (ignored).
- The field M.displayDataInstance is also exposed after the first initialization.

**Dependencies (loaded first):** `ui_gameplaySelector_tiles`, `core_locales`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_freeroamSelector_general.clearAllFilters(requestId)` | Clears all filters. Emits a snapshot if requestId is provided. | 446 |
| `ui_freeroamSelector_general.closedFromUI()` | Called when the interface closes the selector: clears the custom details buttons and the custom root path, then emits the hook onFreeroamSelectorClosed. *(internal)* | 643 |
| `ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId)` | Rebuilds the current view's snapshot (ui_gridSelector.getSelectorSnapshot, under pcall) and sends it to the interface via the event freeroamSelectorDisplayDataSnapshot with the requestId. Logs an error and returns false on failure. | 733 |
| `ui_freeroamSelector_general.executeButton(buttonId, additionalData)` | Runs the details button with the given identifier via the buttonModule. | 758 |
| `ui_freeroamSelector_general.executeDoubleClick(item)` | Runs the button marked isDoubleClickAction in a tile's details (or the only button if there is just one). | 770 |
| `ui_freeroamSelector_general.exitCallback()` | Does nothing. *(internal)* | 767 |
| `ui_freeroamSelector_general.exploreFolder(path)` | Only logs the path (not implemented). | 783 |
| `ui_freeroamSelector_general.getActiveFilters()` | Returns the active filters. | 488 |
| `ui_freeroamSelector_general.getCustomDetailsButtons()` | Returns the custom details buttons (used by levelTiles). | 754 |
| `ui_freeroamSelector_general.getDetails(item)` | Builds a tile's details by emitting the hook onGameplaySelectorGetDetails (the tile generators add their block to it) and returns the first block. | 652 |
| `ui_freeroamSelector_general.getDisplayData()` | Returns the current display options (creates the instances if needed). | 429 |
| `ui_freeroamSelector_general.getDisplayDataOptions()` | Returns the display options definition. The instances must already exist. | 544 |
| `ui_freeroamSelector_general.getFilters()` | Returns the filter definition (list, locked filters) after loading the data. | 483 |
| `ui_freeroamSelector_general.getGameplayData()` | Returns the selector data (tiles filtered by validBackends, filters, display options), recomputes them if the mods, settings or language have changed, and creates them on first request. | 382 |
| `ui_freeroamSelector_general.getManagementDetails()` | Always returns { buttons = {} } (TODO in the code). | 762 |
| `ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path)` | Builds the screen title and the breadcrumb (menu, freeroam selector, optional filters or search segment, current level or group). Uses customRootPath if it was set by openFreeroamSelectorForFreeroamConfigurator. | 566 |
| `ui_freeroamSelector_general.getSearchText()` | Returns the current search text. | 531 |
| `ui_freeroamSelector_general.getTiles(path)` | Returns the tile groups for a path, via ui_gameplaySelector_tiles.getTiles. Clears the first group's label if it is "freeroam". | 403 |
| `ui_freeroamSelector_general.getUiData()` | Returns the selector data: items, displayData, filterList, activeFilters, lockedFiltersByProp and backendName. Loads the tiles if needed. | 330 |
| `ui_freeroamSelector_general.goToMod(modId)` | Only logs the mod id (not implemented). | 788 |
| `ui_freeroamSelector_general.isFavourite(itemKey)` | Indicates whether a tile is a favorite. | 455 |
| `ui_freeroamSelector_general.isRecent(itemKey)` | Indicates whether a tile is among the recent items. | 469 |
| `ui_freeroamSelector_general.onLanguageChanged()` | Hook called when the language changes: marks the data as needing recomputation. *(internal)* *(hook)* | 400 |
| `ui_freeroamSelector_general.onModActivated()` | Hook called when a mod is activated: marks the data as needing recomputation. *(internal)* *(hook)* | 396 |
| `ui_freeroamSelector_general.onModDeactivated()` | Hook called when a mod is deactivated: marks the data as needing recomputation. *(internal)* *(hook)* | 395 |
| `ui_freeroamSelector_general.onModManagerReady()` | Hook called when the mod manager is ready: marks the data as needing recomputation. *(internal)* *(hook)* | 397 |
| `ui_freeroamSelector_general.onModManagerStateChanged()` | Hook called when the mod manager state changes: marks the data as needing recomputation. *(internal)* *(hook)* | 398 |
| `ui_freeroamSelector_general.onSettingsChanged()` | Hook called when the settings change: marks the data as needing recomputation. *(internal)* *(hook)* | 399 |
| `ui_freeroamSelector_general.openFreeroamSelector()` | Clears the filters, sets groupMode to "system" and clusterMode to "automatic", enables the "freeroam" system filter and navigates to the route "menu.gameplay". | 794 |
| `ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback)` | Opens the selector to choose a spawn point: installs a "Select spawnpoint" button whose callback receives (levelName, spawnPointName), sets its own breadcrumb, navigates to "menu.freeroamselector" and emits the hook onFreeroamSelectorOpen. | 817 |
| `ui_freeroamSelector_general.openFromPause()` | Opens the freeroam wizard from the pause menu, on the step configured in the setting freeroamSetupDefaultStep (level by default; level, vehicle, options or multiplayer), with returnRoute = "pause". | 809 |
| `ui_freeroamSelector_general.passesFilters(item)` | Indicates whether a tile passes the filters, the search and the showAuxContent option; an isCareerOnly tile is refused as long as displayData.showCareerContent is false. | 413 |
| `ui_freeroamSelector_general.profilerFinish()` | Does nothing (TODO in the code). *(internal)* | 639 |
| `ui_freeroamSelector_general.requestDetails(item, requestId)` | Builds a tile's details and sends them to the interface via the event freeroamSelectorDetails, with backendName, requestId, item and details. | 665 |
| `ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId)` | Resets the display options to their default values. Emits a snapshot if requestId is provided. | 556 |
| `ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId)` | Resets a range filter. Emits a snapshot if requestId is provided. | 515 |
| `ui_freeroamSelector_general.resetSetFilter(filterKey, requestId)` | Resets a multiple-choice filter. Emits a snapshot if requestId is provided. | 523 |
| `ui_freeroamSelector_general.resolveCurrentSelectorPath()` | Returns the current view's path, or the default root path { keys = {"allFreeroam"} } if none was stored. | 719 |
| `ui_freeroamSelector_general.setCurrentSelectorPath(path)` | Stores the path of the visible view, so that emitDisplayDataSnapshot rebuilds the snapshot on the right path. An invalid path is ignored; nil goes back to the root path. | 705 |
| `ui_freeroamSelector_general.setCustomDetailsButtons(buttons)` | Replaces the details buttons with a custom list (nil empties it). Each button has callback(levelName, spawnPointName, key) and meta (label, icon, primary, isDoubleClickAction, trackRecent). | 750 |
| `ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId)` | Sets a display option and returns the updated display data. Emits a snapshot if requestId is provided. Used for example by levelTiles.setAlwaysShowDialogue. | 548 |
| `ui_freeroamSelector_general.setSearchText(text, requestId)` | Sets the search text. Emits a snapshot if requestId is provided. | 535 |
| `ui_freeroamSelector_general.toggleFavourite(itemDetails)` | Toggles a tile's favorite status and returns the new state. | 461 |
| `ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId)` | Enables or disables a filter value. Emits a snapshot if requestId is provided. | 499 |
| `ui_freeroamSelector_general.trackRecent(itemKey)` | Records a tile as recently used. | 475 |
| `ui_freeroamSelector_general.updateDisplayData(key, value)` | Changes a display option (displayDataInstance.setDisplayDataOption). | 435 |
| `ui_freeroamSelector_general.updateFilterData(key, value)` | Updates an internal datum of the filters module (filterInstance.updateData). | 441 |
| `ui_freeroamSelector_general.updateFilters(newFilters)` | Directly applies a complete filterByProp table, for example to restore the wizard's saved state without replaying the clicks. Locked filters are kept. | 495 |
| `ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Sets the bounds of a range filter. Emits a snapshot if requestId is provided. | 507 |

### Parameter details

#### `ui_freeroamSelector_general.clearAllFilters(requestId)`

Clears all filters. Emits a snapshot if requestId is provided.

- `requestId` (*any|nil*) : Interface request identifier.

#### `ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId)`

Rebuilds the current view's snapshot (ui_gridSelector.getSelectorSnapshot, under pcall) and sends it to the interface via the event freeroamSelectorDisplayDataSnapshot with the requestId. Logs an error and returns false on failure.

- `requestId` (*any*) : Interface request identifier.
- **returns**: boolean true if the event was sent.

#### `ui_freeroamSelector_general.executeButton(buttonId, additionalData)`

Runs the details button with the given identifier via the buttonModule.

- `buttonId` (*any*) : Button identifier.
- `additionalData` (*any*) : Extra data passed to the callback.
- **returns**: any Result of buttonInstance.executeButton.

#### `ui_freeroamSelector_general.executeDoubleClick(item)`

Runs the button marked isDoubleClickAction in a tile's details (or the only button if there is just one).

- `item` (*table*) : The tile's showDetails data.

#### `ui_freeroamSelector_general.exploreFolder(path)`

Only logs the path (not implemented).

- `path` (*string*) : Folder path.

#### `ui_freeroamSelector_general.getActiveFilters()`

Returns the active filters.

- **returns**: table Active filters.

#### `ui_freeroamSelector_general.getCustomDetailsButtons()`

Returns the custom details buttons (used by levelTiles).

- **returns**: table List of buttons, empty by default.

#### `ui_freeroamSelector_general.getDetails(item)`

Builds a tile's details by emitting the hook onGameplaySelectorGetDetails (the tile generators add their block to it) and returns the first block.

- `item` (*table*) : The tile's showDetails data.
- **returns**: table|nil Details block, nil if no generator responded.

#### `ui_freeroamSelector_general.getDisplayData()`

Returns the current display options (creates the instances if needed).

- **returns**: table Option values by key.

#### `ui_freeroamSelector_general.getDisplayDataOptions()`

Returns the display options definition. The instances must already exist.

- **returns**: table Display options.

#### `ui_freeroamSelector_general.getFilters()`

Returns the filter definition (list, locked filters) after loading the data.

- **returns**: table Result of filterInstance.getFilters().

#### `ui_freeroamSelector_general.getGameplayData()`

Returns the selector data (tiles filtered by validBackends, filters, display options), recomputes them if the mods, settings or language have changed, and creates them on first request.

- **returns**: table Table items, filterList, activeFilters, lockedFiltersByProp, displayData.

#### `ui_freeroamSelector_general.getManagementDetails()`

Always returns { buttons = {} } (TODO in the code).

- **returns**: table Table with empty buttons.

#### `ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path)`

Builds the screen title and the breadcrumb (menu, freeroam selector, optional filters or search segment, current level or group). Uses customRootPath if it was set by openFreeroamSelectorForFreeroamConfigurator.

- `path` (*table*) : Current path { keys = {...} }.
- **returns**: table Table title, isFiltered, pathSegments.

#### `ui_freeroamSelector_general.getSearchText()`

Returns the current search text.

- **returns**: string|nil Entered text.

#### `ui_freeroamSelector_general.getTiles(path)`

Returns the tile groups for a path, via ui_gameplaySelector_tiles.getTiles. Clears the first group's label if it is "freeroam".

- `path` (*table*) : Navigation path { keys = {...} }.
- **returns**: table[] Tile groups.

#### `ui_freeroamSelector_general.getUiData()`

Returns the selector data: items, displayData, filterList, activeFilters, lockedFiltersByProp and backendName. Loads the tiles if needed.

- **returns**: table Interface data table.

#### `ui_freeroamSelector_general.goToMod(modId)`

Only logs the mod id (not implemented).

- `modId` (*string*) : Mod identifier.

#### `ui_freeroamSelector_general.isFavourite(itemKey)`

Indicates whether a tile is a favorite.

- `itemKey` (*string*) : Tile key.
- **returns**: boolean true if favorite.

#### `ui_freeroamSelector_general.isRecent(itemKey)`

Indicates whether a tile is among the recent items.

- `itemKey` (*string*) : Tile key.
- **returns**: boolean true if recent.

#### `ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback)`

Opens the selector to choose a spawn point: installs a "Select spawnpoint" button whose callback receives (levelName, spawnPointName), sets its own breadcrumb, navigates to "menu.freeroamselector" and emits the hook onFreeroamSelectorOpen.

- `callback` (*function*) : Function called with levelName and spawnPointName on selection.

#### `ui_freeroamSelector_general.passesFilters(item)`

Indicates whether a tile passes the filters, the search and the showAuxContent option; an isCareerOnly tile is refused as long as displayData.showCareerContent is false.

- `item` (*table*) : Tile tested.
- **returns**: boolean true if the tile is displayed.

#### `ui_freeroamSelector_general.requestDetails(item, requestId)`

Builds a tile's details and sends them to the interface via the event freeroamSelectorDetails, with backendName, requestId, item and details.

- `item` (*table*) : The tile's showDetails data.
- `requestId` (*any*) : Interface request identifier.
- **returns**: table The payload sent.

#### `ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId)`

Resets the display options to their default values. Emits a snapshot if requestId is provided.

- `requestId` (*any|nil*) : Request identifier.
- **returns**: table Display data.

#### `ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId)`

Resets a range filter. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.resetRangeFilter.

#### `ui_freeroamSelector_general.resetSetFilter(filterKey, requestId)`

Resets a multiple-choice filter. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.resetSetFilter.

#### `ui_freeroamSelector_general.resolveCurrentSelectorPath()`

Returns the current view's path, or the default root path { keys = {"allFreeroam"} } if none was stored.

- **returns**: table Copy of the path.

#### `ui_freeroamSelector_general.setCurrentSelectorPath(path)`

Stores the path of the visible view, so that emitDisplayDataSnapshot rebuilds the snapshot on the right path. An invalid path is ignored; nil goes back to the root path.

- `path` (*table|nil*) : Path { keys = {...} } (non-empty string keys).

#### `ui_freeroamSelector_general.setCustomDetailsButtons(buttons)`

Replaces the details buttons with a custom list (nil empties it). Each button has callback(levelName, spawnPointName, key) and meta (label, icon, primary, isDoubleClickAction, trackRecent).

- `buttons` (*table|nil*) : List of buttons.

#### `ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId)`

Sets a display option and returns the updated display data. Emits a snapshot if requestId is provided. Used for example by levelTiles.setAlwaysShowDialogue.

- `key` (*string*) : Option key.
- `value` (*any*) : Value.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: table Display data.

#### `ui_freeroamSelector_general.setSearchText(text, requestId)`

Sets the search text. Emits a snapshot if requestId is provided.

- `text` (*string*) : Search text.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.setSearchText.

#### `ui_freeroamSelector_general.toggleFavourite(itemDetails)`

Toggles a tile's favorite status and returns the new state.

- `itemDetails` (*table*) : Table with the field key.
- **returns**: boolean New favorite state.

#### `ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId)`

Enables or disables a filter value. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `value` (*any*) : Option value.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.toggleFilter.

#### `ui_freeroamSelector_general.trackRecent(itemKey)`

Records a tile as recently used.

- `itemKey` (*string*) : Tile key.

#### `ui_freeroamSelector_general.updateDisplayData(key, value)`

Changes a display option (displayDataInstance.setDisplayDataOption).

- `key` (*string*) : Option key.
- `value` (*any*) : New value.

#### `ui_freeroamSelector_general.updateFilterData(key, value)`

Updates an internal datum of the filters module (filterInstance.updateData).

- `key` (*string*) : Data key.
- `value` (*any*) : Value.

#### `ui_freeroamSelector_general.updateFilters(newFilters)`

Directly applies a complete filterByProp table, for example to restore the wizard's saved state without replaying the clicks. Locked filters are kept.

- `newFilters` (*table*) : filterByProp form.
- **returns**: any Result of filterInstance.updateFilters.

#### `ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Sets the bounds of a range filter. Emits a snapshot if requestId is provided.

- `filterKey` (*string*) : Filter name.
- `min` (*number*) : Bottom bound.
- `max` (*number*) : Top bound.
- `requestId` (*any|nil*) : Request identifier.
- **returns**: any Result of filterInstance.updateRangeFilter.

## Fields

| Field | Type | Description |
|---|---|---|
| `backendName` | string | Backend name: "freeroamSelector". |
| `dependencies` | string[] | Extensions loaded before this one: ui_gameplaySelector_tiles and core_locales. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onFreeroamSelectorClosed`
- `onFreeroamSelectorOpen`
- `onGameplaySelectorGetDetails` — listened to by 5 module(s)
- `onGameplaySelectorGetTiles` — listened to by 5 module(s)

**UI events (guihooks.trigger):** `freeroamSelectorDetails`, `freeroamSelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/freeroamSelector/general.lua`.*
