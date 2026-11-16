# `ui_gridSelector`

*File: `lua/ge/extensions/ui/gridSelector.lua` · VM: Game Engine (GE) · 503 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gridSelector`: `extensions.load("ui_gridSelector")`, then the global `ui_gridSelector`

Single facade between the UI (Vue) and the grid selectors (vehicles, gameplay, apps, freeroam, quick race, light runner, bus routes). Each call receives the backend name as its first argument and is dispatched to the matching `ui_<name>_general` extension. The module normalizes paths, tile groups, filters, display data, header and management details before returning them to the UI, and provides fallback values for optional methods missing from a backend.

## Example

```lua
local snap = ui_gridSelector.getSelectorSnapshot('vehicleSelector', {keys = {}})
for _, group in ipairs(snap.groups) do log('I', 'x', #group.tiles) end
```

## Notes

- Valid backend names: vehicleSelector, gameplaySelector, appSelector, freeroamSelector, quickraceSelector, lightRunnerSelector, busRouteSelector. Any other name gives a log error and nil.
- A path is normalized to { keys = {...} }: accepts { keys = {...} } or an array of segments (string, number, boolean converted to string). Anything else gives { keys = {} } with a warning.
- Backend contract: required methods getTiles, getFilters, getSearchText, setSearchText, getDisplayDataOptions, setDisplayDataOption, resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails. Optional methods with fallback: getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, requestClusterTiles, requestDetails, clearAllFilters, closedFromUI, profilerFinish.
- getActiveFilters, toggleFilter, updateRangeFilter, resetRangeFilter, resetSetFilter and exitCallback are forwarded to the backend but have NO fallback: if the backend does not define them, an error is logged and nil is returned.
- The comment placed before M.toggleFavourite in the code (exploreFolder/goToMod commented out) is disabled code; exploreFolder and goToMod are actually defined further down in the file.
- A tile without `key` gets a generated key `__missingTileKey_<backend>_<n>`.

**Dependencies (loaded first):** `ui_vehicleSelector_general`, `ui_gameplaySelector_general`, `ui_appSelector_general`, `ui_freeroamSelector_general`, `ui_quickraceSelector_general`, `ui_lightRunnerSelector_general`, `ui_busRouteSelector_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gridSelector.clearAllFilters(backendName, ...)` | Clears all filters (optional, fallback: false). | 415 |
| `ui_gridSelector.closedFromUI(backendName, ...)` | Notifies the backend that the screen was closed from the UI (optional, fallback: nil). | 428 |
| `ui_gridSelector.executeButton(backendName, ...)` | Executes an action button of the details panel (optional, fallback: nil). | 432 |
| `ui_gridSelector.executeDoubleClick(backendName, ...)` | Executes the double-click action on a tile (optional, fallback: nil). | 435 |
| `ui_gridSelector.exitCallback(backendName, ...)` | Calls the backend's exitCallback (no fallback). | 434 |
| `ui_gridSelector.exploreFolder(_backendName, path)` | Opens a folder in the system file explorer (Engine.Platform.exploreFolder). | 495 |
| `ui_gridSelector.getActiveFilters(backendName, ...)` | Returns the backend's active filters (no fallback). | 410 |
| `ui_gridSelector.getBackendByName(backendName)` | Returns the backend extension table associated with the given name, or nil if the name is unknown. | 64 |
| `ui_gridSelector.getDetails(backendName, ...)` | Returns the details of the selected item (required). | 430 |
| `ui_gridSelector.getDisplayDataOptions(backendName, ...)` | Returns the backend's display options (sorting, grouping, etc.) (required). | 419 |
| `ui_gridSelector.getFilters(backendName, ...)` | Returns the backend's filters (required). | 409 |
| `ui_gridSelector.getInitialData(backendName, path)` | Alias of getSelectorSnapshot. | 481 |
| `ui_gridSelector.getManagementDetails(backendName, ...)` | Returns the management buttons/details (optional, fallback: { buttons = {} }). | 433 |
| `ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...)` | Returns the screen header title and path segments for the given path (required). | 423 |
| `ui_gridSelector.getSearchText(backendName, ...)` | Returns the backend's current search text (required). | 416 |
| `ui_gridSelector.getSelectorRefresh(backendName, path, options)` | Alias of getSelectorSnapshotSlices. | 440 |
| `ui_gridSelector.getSelectorSnapshot(backendName, path)` | Returns a full snapshot (all slices) of the selector for a path. | 481 |
| `ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options)` | Builds a payload containing only the requested slices: tiles (groups + defaultFocusKey), filters, displayData, searchText, managementDetails, header. If no slice is enabled, all of them are. | 440 |
| `ui_gridSelector.getTiles(backendName, path, ...)` | Requests the tiles from the backend for a path and returns a normalized array of groups (non-table groups and tiles ignored, shallow copy, key generated if missing). | 399 |
| `ui_gridSelector.goToMod(_backendName, modId)` | Navigates the UI to a mod's details page (route menu.mods.details). | 499 |
| `ui_gridSelector.profilerFinish(backendName, ...)` | Notifies the backend that profiling has finished (optional, fallback: nil). | 427 |
| `ui_gridSelector.requestClusterTiles(backendName, path, ...)` | Requests the tiles of a cluster from the backend (optional method, fallback: nil). | 404 |
| `ui_gridSelector.requestDetails(backendName, ...)` | Asks the backend to prepare an item's details (optional, fallback: nil). | 431 |
| `ui_gridSelector.resetDisplayDataToDefaults(backendName, ...)` | Resets the display options to their default values (required). | 421 |
| `ui_gridSelector.resetRangeFilter(backendName, ...)` | Resets a range filter on the backend side (no fallback). | 413 |
| `ui_gridSelector.resetSetFilter(backendName, ...)` | Resets a set-of-values filter on the backend side (no fallback). | 414 |
| `ui_gridSelector.setDisplayDataOption(backendName, ...)` | Changes a backend display option (required). | 420 |
| `ui_gridSelector.setSearchText(backendName, ...)` | Sets the backend's search text (required). | 417 |
| `ui_gridSelector.toggleFavourite(backendName, ...)` | Toggles an item's favorite state (optional, fallback: false). | 438 |
| `ui_gridSelector.toggleFilter(backendName, ...)` | Enables or disables a filter on the backend side (no fallback). | 411 |
| `ui_gridSelector.updateRangeFilter(backendName, ...)` | Updates a range filter on the backend side (no fallback). | 412 |

### Parameter details

#### `ui_gridSelector.clearAllFilters(backendName, ...)`

Clears all filters (optional, fallback: false).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: boolean|any false if not implemented.

#### `ui_gridSelector.closedFromUI(backendName, ...)`

Notifies the backend that the screen was closed from the UI (optional, fallback: nil).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.executeButton(backendName, ...)`

Executes an action button of the details panel (optional, fallback: nil).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.executeDoubleClick(backendName, ...)`

Executes the double-click action on a tile (optional, fallback: nil).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.exitCallback(backendName, ...)`

Calls the backend's exitCallback (no fallback).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.exploreFolder(_backendName, path)`

Opens a folder in the system file explorer (Engine.Platform.exploreFolder).

- `_backendName` (*string*) : Ignored.
- `path` (*string*) : Folder path.

#### `ui_gridSelector.getActiveFilters(backendName, ...)`

Returns the backend's active filters (no fallback).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: any Active filters.

#### `ui_gridSelector.getBackendByName(backendName)`

Returns the backend extension table associated with the given name, or nil if the name is unknown.

- `backendName` (*string*) : vehicleSelector, gameplaySelector, appSelector, freeroamSelector, quickraceSelector, lightRunnerSelector or busRouteSelector
- **returns**: table|nil The backend module (e.g. ui_vehicleSelector_general).

#### `ui_gridSelector.getDetails(backendName, ...)`

Returns the details of the selected item (required).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: any Details provided by the backend.

#### `ui_gridSelector.getDisplayDataOptions(backendName, ...)`

Returns the backend's display options (sorting, grouping, etc.) (required).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: table Display options.

#### `ui_gridSelector.getFilters(backendName, ...)`

Returns the backend's filters (required).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: table Backend filter data.

#### `ui_gridSelector.getInitialData(backendName, path)`

Alias of getSelectorSnapshot.

- `backendName` (*string*) : Backend name.
- `path` (*table|nil*) : Path.
- **returns**: table Full snapshot.

#### `ui_gridSelector.getManagementDetails(backendName, ...)`

Returns the management buttons/details (optional, fallback: { buttons = {} }).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: table { buttons = {...}, ... }.

#### `ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...)`

Returns the screen header title and path segments for the given path (required).

- `backendName` (*string*) : Backend name.
- `path` (*table|nil*) : Path to normalize.
- `...` (*any*) : Arguments passed on.
- **returns**: table { title, pathSegments }.

#### `ui_gridSelector.getSearchText(backendName, ...)`

Returns the backend's current search text (required).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: string Search text.

#### `ui_gridSelector.getSelectorRefresh(backendName, path, options)`

Alias of getSelectorSnapshotSlices.

- `backendName` (*string*) : Backend name.
- `path` (*table|nil*) : Path.
- `options` (*table|nil*) : Slices.
- **returns**: table See getSelectorSnapshotSlices.

#### `ui_gridSelector.getSelectorSnapshot(backendName, path)`

Returns a full snapshot (all slices) of the selector for a path.

- `backendName` (*string*) : Backend name.
- `path` (*table|nil*) : Path.
- **returns**: table See getSelectorSnapshotSlices. The default tile (forceAutoFocus or isDefaultSelected) gives defaultFocusKey.

#### `ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options)`

Builds a payload containing only the requested slices: tiles (groups + defaultFocusKey), filters, displayData, searchText, managementDetails, header. If no slice is enabled, all of them are.

- `backendName` (*string*) : Backend name.
- `path` (*table|nil*) : Path to normalize.
- `options` (*table<string, boolean>|nil*) : Slices to include (key = true).
- **returns**: table { backendName, path, groups?, defaultFocusKey?, filters?, displayData?, searchText?, managementDetails?, header? }.

#### `ui_gridSelector.getTiles(backendName, path, ...)`

Requests the tiles from the backend for a path and returns a normalized array of groups (non-table groups and tiles ignored, shallow copy, key generated if missing).

- `backendName` (*string*) : Backend name.
- `path` (*table|nil*) : Path { keys = {...} } or array of segments.
- `...` (*any*) : Extra arguments passed to the backend.
- **returns**: table[] List of groups { tiles = {...}, ... }.

#### `ui_gridSelector.goToMod(_backendName, modId)`

Navigates the UI to a mod's details page (route menu.mods.details).

- `_backendName` (*string*) : Ignored.
- `modId` (*string*) : Mod identifier.

#### `ui_gridSelector.profilerFinish(backendName, ...)`

Notifies the backend that profiling has finished (optional, fallback: nil).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.requestClusterTiles(backendName, path, ...)`

Requests the tiles of a cluster from the backend (optional method, fallback: nil).

- `backendName` (*string*) : Backend name.
- `path` (*table|nil*) : Path to normalize.
- `...` (*any*) : Arguments passed on.
- **returns**: any Backend result.

#### `ui_gridSelector.requestDetails(backendName, ...)`

Asks the backend to prepare an item's details (optional, fallback: nil).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.resetDisplayDataToDefaults(backendName, ...)`

Resets the display options to their default values (required).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.resetRangeFilter(backendName, ...)`

Resets a range filter on the backend side (no fallback).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.resetSetFilter(backendName, ...)`

Resets a set-of-values filter on the backend side (no fallback).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.setDisplayDataOption(backendName, ...)`

Changes a backend display option (required).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.setSearchText(backendName, ...)`

Sets the backend's search text (required).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Forwarded arguments (text).

#### `ui_gridSelector.toggleFavourite(backendName, ...)`

Toggles an item's favorite state (optional, fallback: false).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.
- **returns**: boolean|any false if not implemented.

#### `ui_gridSelector.toggleFilter(backendName, ...)`

Enables or disables a filter on the backend side (no fallback).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

#### `ui_gridSelector.updateRangeFilter(backendName, ...)`

Updates a range filter on the backend side (no fallback).

- `backendName` (*string*) : Backend name.
- `...` (*any*) : Arguments passed on.

## Fields

| Field | Type | Description |
|---|---|---|
| `BackendContract` | table | Describes the expected backend contract: `requiredMethods` (list of names) and `optionalMethods` (list of names). |
| `dependencies` | table<integer, string> | Backend extensions loaded before this module (the seven `ui_*Selector_general`). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gridSelector.lua`.*
