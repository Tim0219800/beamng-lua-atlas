# `ui_oneshotRaceSelector_core`

*File: `lua/ge/extensions/ui/oneshotRaceSelector/core.lua` · VM: Game Engine (GE) · 246 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_oneshotRaceSelector_core`: `extensions.load("ui_oneshotRaceSelector_core")`, then the global `ui_oneshotRaceSelector_core`

Common base of the ui_gridSelector back-ends for the three "oneshot race" selectors (quickraceSelector, lightRunnerSelector, busRouteSelector). It provides text search, persistence of display options, empty filters, building of the title and breadcrumb, and the dispatch of getDetails according to the shape of the path (levels or items of a level: tracks/routes). Formatting of tiles and details is left to a "descriptor" passed to createBackend.

## Example

```lua
local backend = ui_oneshotRaceSelector_core.createBackend(descriptor)
local tiles = backend.getTiles({keys = {}})
```

## Notes

- difficultyLabel divides the value by 25 (rounded down): 0-24 easy, 25-49 medium, 50-74 hard, 75-99 very hard; beyond 99 (key 4+) returns nil.
- The returned back-end handles no filters, buttons or favorites: getFilters returns empty lists, executeButton/executeDoubleClick return nil, toggleFavourite returns false.
- Display options are saved in /settings/<backendName>Data.json (a single option: displaySize, default medium).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_oneshotRaceSelector_core.createBackend(descriptor)` | Builds a gridSelector back-end from a descriptor. The back-end exposes findLevel, findMiddle, getTiles, getFilters, getActiveFilters, getSearchText/setSearchText, getDisplayDataOptions/setDisplayDataOption/resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails, getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, profilerFinish and closedFromUI. Descriptor contract: backendName (string); middlePathKey ("tracks" or "routes", path.keys[1] of the detail level); levelListTitleKey and middleListTitleKey (translation ids); getLevels(); findLevel(levelName) optional (otherwise search on level.levelName); getMiddleItems(level); middleName(middle); levelDisplayName(level) and middleDisplayName(middle) (already translated); levelToTile(level); middleToTile(middle, levelName); getLevelDetails(level); getMiddleDetails(middle, levelName). | 42 |
| `ui_oneshotRaceSelector_core.difficultyLabel(value)` | Converts a numeric difficulty value (0-99) to a translated label (easy/medium/hard/very hard) via _tr. Returns nil if the value is not numeric or outside the four tiers. | 23 |

### Parameter details

#### `ui_oneshotRaceSelector_core.createBackend(descriptor)`

Builds a gridSelector back-end from a descriptor. The back-end exposes findLevel, findMiddle, getTiles, getFilters, getActiveFilters, getSearchText/setSearchText, getDisplayDataOptions/setDisplayDataOption/resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails, getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, profilerFinish and closedFromUI. Descriptor contract: backendName (string); middlePathKey ("tracks" or "routes", path.keys[1] of the detail level); levelListTitleKey and middleListTitleKey (translation ids); getLevels(); findLevel(levelName) optional (otherwise search on level.levelName); getMiddleItems(level); middleName(middle); levelDisplayName(level) and middleDisplayName(middle) (already translated); levelToTile(level); middleToTile(middle, levelName); getLevelDetails(level); getMiddleDetails(middle, levelName).

- `descriptor` (*table*) : Table describing the mode (see desc for the full contract).
- **returns**: table Back-end usable by ui_gridSelector.

#### `ui_oneshotRaceSelector_core.difficultyLabel(value)`

Converts a numeric difficulty value (0-99) to a translated label (easy/medium/hard/very hard) via _tr. Returns nil if the value is not numeric or outside the four tiers.

- `value` (*number|string|nil*) : Difficulty; the tier is floor(value / 25).
- **returns**: string|nil Translated label, or nil.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/oneshotRaceSelector/core.lua`.*
