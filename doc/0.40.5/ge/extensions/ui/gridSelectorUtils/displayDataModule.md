# `ui_gridSelectorUtils_displayDataModule`

*File: `lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua` · VM: Game Engine (GE) · 266 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gridSelectorUtils_displayDataModule`: `extensions.load("ui_gridSelectorUtils_displayDataModule")`, then the global `ui_gridSelectorUtils_displayDataModule`

Grid selector utility: manages display options (sorting, display filters, toggles...), the favorites list and the recent items list, with JSON persistence in a file (default /settings/gridSelectorData.json). An option can be linked to a game setting via `settingsKey`. Emits the hooks onGridSelectorDisplayDataChanged and onGridSelectorFavouriteToggled.

## Notes

- Data is loaded lazily on first access (getDisplayData). If the file version is lower than targetVersion, `updateDisplayDataFunction(displayData, 0, targetVersion)` is called to migrate.
- The keys `showAuxContent` (initial value = not shipping_build) and `showCareerContent` (forced to false in shipping builds) get special handling at initialization.
- Only options with `save = true` are actually written back into displayData on save; resetDisplayDataToDefaults also resets only those options.
- Favorites store the os.time() timestamp; recent items are limited to 100 (most recent first).
- Options linked to `settingsKey` read and write via settings.getValue/settings.setValue.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gridSelectorUtils_displayDataModule.create(dataFile, displayDataOptions, updateDisplayDataFunction, backendName, targetVersion)` | Creates a display data, favorites and recents management instance. | 4 |

### Parameter details

#### `ui_gridSelectorUtils_displayDataModule.create(dataFile, displayDataOptions, updateDisplayDataFunction, backendName, targetVersion)`

Creates a display data, favorites and recents management instance.

- `dataFile` (*string|nil*) : JSON save file, default /settings/gridSelectorData.json.
- `displayDataOptions` (*table[]|nil*) : List of options { key, type, default, label, min, max, options, showInModes, description, hideInSimpleMenu, save, settingsKey }.
- `updateDisplayDataFunction` (*function|nil*) : Migration (displayData, oldVersion, newVersion) -> displayData.
- `backendName` (*string|nil*) : Name passed to the hooks, default "gridSelector".
- `targetVersion` (*integer|nil*) : Current data format version, default 1.
- **returns**: table Instance (see classes.instance).

## Class `instance`

Object returned by create().

| Method | Description | Line |
|---|---|---|
| `instance:clearAllFavourites()` | Clears the favorites and saves. | dyn |
| `instance:clearAllRecentItems()` | Clears the recents and saves. | dyn |
| `instance:getDisplayData()` | Returns the key -> value table of the options, initialized on first call. | dyn |
| `instance:getDisplayDataOptions()` | Returns the options list for the UI: label, key, type, min, max, value, options, showInModes, description, hideInSimpleMenu. The value of `searchText` is always nil (handled by the calling module). | dyn |
| `instance:getRecentItems()` | Returns a deep copy of the recents list. | dyn |
| `instance:initializeDisplayData()` | Re-reads the file and rebuilds the options table from the defaults, the file and the linked settings. | dyn |
| `instance:isFavourite(itemKey)` | Returns the favorite's timestamp or nil. | dyn |
| `instance:isRecentItem(itemKey)` | Returns the position in the recents list, or false. | dyn |
| `instance:resetDisplayDataToDefaults()` | Resets the `save` options to their default value, emits the hook for each change and saves. | dyn |
| `instance:setDisplayDataOption(key, value)` | Changes an option (converted to a number if its type is number), emits onGridSelectorDisplayDataChanged(backendName, key, value), propagates to the linked setting and saves. nil or "undefined" values are ignored. | dyn |
| `instance:toggleFavourite(itemKey)` | Adds or removes a favorite, emits onGridSelectorFavouriteToggled(backendName, itemKey, isFavourite) and saves. | dyn |
| `instance:trackRecentItem(itemKey)` | Puts the item at the head of the recents (max 100) and saves. | dyn |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGridSelectorDisplayDataChanged`
- `onGridSelectorFavouriteToggled`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua`.*
