# `ui_appSelector_general`

*File: `lua/ge/extensions/ui/appSelector/general.lua` · VM: Game Engine (GE) · 761 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_appSelector_general`: `extensions.load("ui_appSelector_general")`, then the global `ui_appSelector_general`

Backend (`backendName = "appSelector"`) of the interface's app selector, plugged into the generic GridSelector component. It lists the apps known from `ui_apps.getUIAppsData()` as tiles grouped by category (Dashboard, Telemetry, General, Gameplay, Debug, then the others in alphabetical order), handles search, filtering by type, display options (size, auxiliary content, saved in `/settings/appSelectorData.json`) and the details sheet with the "Add to layout" button. Useful to understand how the app editing screen is fed; of little direct use to a modder.

## Notes

- In simple menu (`Engine.UI.isSimpleMenu()`), auxiliary apps, those with mandatory interactivity (`required`) and Debug-type apps are hidden from the selector.
- getTiles also discards `photomode == true` apps and, unless the `includeAuxContent` option is set, auxiliary apps.
- The "Add to layout" button (and the double-click) triggers the UI hook `appContainer:spawn` then navigates to the route `pause.hudApps.editlayout`.
- The data is recomputed on the next access after onModActivated, onModDeactivated or onModManagerReady.
- setDisplayDataOption and resetDisplayDataToDefaults use `displayDataInstance` directly, which is only created lazily by getDisplayDataInstance (called via getAppData): called before any data access, they would fail on nil.
- toggleFavourite, getManagementDetails, exploreFolder, goToMod, profilerFinish and closedFromUI are empty shells, present to satisfy the GridSelector API.

**Dependencies (loaded first):** `ui_apps`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_appSelector_general.clearAllFilters(requestId)` | Clears all filters. | 487 |
| `ui_appSelector_general.closedFromUI()` | Empty function, present for the GridSelector API. *(internal)* | 756 |
| `ui_appSelector_general.emitDisplayDataSnapshot(requestId)` | Rebuilds the complete snapshot (tiles, filters, options, header) and sends it to the UI via `appSelectorDisplayDataSnapshot`. | 736 |
| `ui_appSelector_general.executeButton(buttonId, data)` | Runs the callback of a details sheet button via the buttons module. | 665 |
| `ui_appSelector_general.executeDoubleClick(details)` | On a tile double-click, runs the app's "Add to layout" button. | 690 |
| `ui_appSelector_general.exploreFolder(path)` | No effect: only writes a message to the log. | 680 |
| `ui_appSelector_general.getActiveFilters()` | Returns the currently active filters. | 446 |
| `ui_appSelector_general.getAppData()` | Returns the selector data (apps, filter instance, filter list, display options), (re)initializing them if needed. | 287 |
| `ui_appSelector_general.getDetails(details)` | Builds an app's details sheet: title, preview, description, specifications (interactivity, version, types, folder outside the shipping build) and "Add to layout" button. Returns a fallback title if the app is unknown. | 565 |
| `ui_appSelector_general.getDisplayDataOptions()` | Returns the display options (tile size: list/tiny/small/medium/large/huge; inclusion of auxiliary content). | 496 |
| `ui_appSelector_general.getFilters()` | Returns the available filters ("set" type filter on app types). | 441 |
| `ui_appSelector_general.getManagementDetails()` | Optional function of the GridSelector API: always returns `{buttons = {}}`. | 671 |
| `ui_appSelector_general.getScreenHeaderTitleAndPath(path)` | Builds the screen's title and breadcrumb (Menu, Edit apps, Apps, then "Filtered"/"Search: …" if needed). | 530 |
| `ui_appSelector_general.getSearchText()` | Returns the current search text. | 516 |
| `ui_appSelector_general.getTiles(path)` | Builds the app tile groups (filtered, sorted: non-auxiliary first then by name, grouped by category). | 354 |
| `ui_appSelector_general.goToMod(modId)` | No effect: only writes a message to the log. | 685 |
| `ui_appSelector_general.onModActivated()` | Hook called when a mod is activated: forces the data to reload on next access. *(internal)* *(hook)* | 301 |
| `ui_appSelector_general.onModDeactivated()` | Hook called when a mod is deactivated: forces the data to reload on next access. *(internal)* *(hook)* | 300 |
| `ui_appSelector_general.onModManagerReady()` | Hook called when the mod manager is ready: forces the data to reload. *(internal)* *(hook)* | 302 |
| `ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data)` | Hook called by the UI router when the route is mounted: attaches a selector snapshot to `data.appSelector`. *(internal)* *(hook)* | 751 |
| `ui_appSelector_general.profilerFinish()` | Empty function, present for the GridSelector API. *(internal)* | 755 |
| `ui_appSelector_general.requestDetails(item, requestId)` | Computes an app's details sheet and sends it to the UI via the `appSelectorDetails` hook. | 653 |
| `ui_appSelector_general.resetDisplayDataToDefaults(requestId)` | Resets the display options to their default values. | 508 |
| `ui_appSelector_general.resetRangeFilter(filterKey, requestId)` | Resets a range filter. | 469 |
| `ui_appSelector_general.resetSetFilter(filterKey, requestId)` | Resets a "set" type filter. | 478 |
| `ui_appSelector_general.resolveCurrentSelectorPath()` | Returns the selector's default path: `{keys = {"allApps"}}`. | 732 |
| `ui_appSelector_general.setDisplayDataOption(key, value, requestId)` | Changes a display option and saves it. | 500 |
| `ui_appSelector_general.setSearchText(val, requestId)` | Sets the search text (compared in lowercase against the translated name, app name and description). | 521 |
| `ui_appSelector_general.toggleFavourite(itemDetails)` | No effect: apps have no favorites. Returns false. | 675 |
| `ui_appSelector_general.toggleFilter(filterKey, value, requestId)` | Enables or disables a filter value. If `requestId` is provided, also returns a snapshot to the UI. | 451 |
| `ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Updates a range filter (not used by the current filters, which are all of "set" type). | 460 |

### Parameter details

#### `ui_appSelector_general.clearAllFilters(requestId)`

Clears all filters.

- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: any Result of the filters module.

#### `ui_appSelector_general.emitDisplayDataSnapshot(requestId)`

Rebuilds the complete snapshot (tiles, filters, options, header) and sends it to the UI via `appSelectorDisplayDataSnapshot`.

- `requestId` (*any*) : UI-side request identifier.
- **returns**: boolean true if sent, false if the build failed (error logged).

#### `ui_appSelector_general.executeButton(buttonId, data)`

Runs the callback of a details sheet button via the buttons module.

- `buttonId` (*any*) : Button identifier.
- `data` (*any*) : Data passed to the callback.
- **returns**: any Callback return.

#### `ui_appSelector_general.executeDoubleClick(details)`

On a tile double-click, runs the app's "Add to layout" button.

- `details` (*table*) : Table containing `appName`.

#### `ui_appSelector_general.exploreFolder(path)`

No effect: only writes a message to the log.

- `path` (*any*) : Path (logged).

#### `ui_appSelector_general.getActiveFilters()`

Returns the currently active filters.

- **returns**: table Active filters.

#### `ui_appSelector_general.getAppData()`

Returns the selector data (apps, filter instance, filter list, display options), (re)initializing them if needed.

- **returns**: table Table with `apps`, `filterInstance`, `filterList`, `activeFilters`, `lockedFiltersByProp`, `displayData`.

#### `ui_appSelector_general.getDetails(details)`

Builds an app's details sheet: title, preview, description, specifications (interactivity, version, types, folder outside the shipping build) and "Add to layout" button. Returns a fallback title if the app is unknown.

- `details` (*table*) : Table containing `appName`.
- **returns**: table `{headerTitle, preview, description, specifications, buttonInfo, appName}`.

#### `ui_appSelector_general.getDisplayDataOptions()`

Returns the display options (tile size: list/tiny/small/medium/large/huge; inclusion of auxiliary content).

- **returns**: table Display options.

#### `ui_appSelector_general.getFilters()`

Returns the available filters ("set" type filter on app types).

- **returns**: table Filters of the filters module.

#### `ui_appSelector_general.getManagementDetails()`

Optional function of the GridSelector API: always returns `{buttons = {}}`.

- **returns**: table `{buttons = {}}`.

#### `ui_appSelector_general.getScreenHeaderTitleAndPath(path)`

Builds the screen's title and breadcrumb (Menu, Edit apps, Apps, then "Filtered"/"Search: …" if needed).

- `path` (*table*) : Current path (not used).
- **returns**: table `{title, pathSegments, isFiltered}`.

#### `ui_appSelector_general.getSearchText()`

Returns the current search text.

- **returns**: string|nil Search text.

#### `ui_appSelector_general.getTiles(path)`

Builds the app tile groups (filtered, sorted: non-auxiliary first then by name, grouped by category).

- `path` (*table*) : Navigation path (not used for the content).
- **returns**: table<integer, table> List of `{label, tiles}`.

#### `ui_appSelector_general.goToMod(modId)`

No effect: only writes a message to the log.

- `modId` (*any*) : Mod ID (logged).

#### `ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data)`

Hook called by the UI router when the route is mounted: attaches a selector snapshot to `data.appSelector`.

- `context` (*any*) : Route context (not used).
- `toRoute` (*any*) : Destination route (not used).
- `fromRoute` (*any*) : Source route (not used).
- `data` (*table*) : Route data to which the snapshot is added.

#### `ui_appSelector_general.requestDetails(item, requestId)`

Computes an app's details sheet and sends it to the UI via the `appSelectorDetails` hook.

- `item` (*table*) : Selected item (with `appName`).
- `requestId` (*any*) : UI-side request identifier.
- **returns**: table Payload sent: `{backendName, requestId, item, details}`.

#### `ui_appSelector_general.resetDisplayDataToDefaults(requestId)`

Resets the display options to their default values.

- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: table Updated display data.

#### `ui_appSelector_general.resetRangeFilter(filterKey, requestId)`

Resets a range filter.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: any Result of the filters module.

#### `ui_appSelector_general.resetSetFilter(filterKey, requestId)`

Resets a "set" type filter.

- `filterKey` (*string*) : Filter name.
- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: any Result of the filters module.

#### `ui_appSelector_general.resolveCurrentSelectorPath()`

Returns the selector's default path: `{keys = {"allApps"}}`.

- **returns**: table Normalized path.

#### `ui_appSelector_general.setDisplayDataOption(key, value, requestId)`

Changes a display option and saves it.

- `key` (*string*) : Option key (displaySize, includeAuxContent).
- `value` (*any*) : New value.
- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: table Updated display data.

#### `ui_appSelector_general.setSearchText(val, requestId)`

Sets the search text (compared in lowercase against the translated name, app name and description).

- `val` (*string*) : Searched text.
- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: any Result of the filters module.

#### `ui_appSelector_general.toggleFavourite(itemDetails)`

No effect: apps have no favorites. Returns false.

- `itemDetails` (*table*) : Not used.
- **returns**: boolean Always false.

#### `ui_appSelector_general.toggleFilter(filterKey, value, requestId)`

Enables or disables a filter value. If `requestId` is provided, also returns a snapshot to the UI.

- `filterKey` (*string*) : Filter name (for example "Type").
- `value` (*any*) : Value to toggle.
- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: any Result of the filters module.

#### `ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Updates a range filter (not used by the current filters, which are all of "set" type).

- `filterKey` (*string*) : Filter name.
- `min` (*number*) : Minimum.
- `max` (*number*) : Maximum.
- `requestId` (*any|nil*) : UI-side request identifier.
- **returns**: any Result of the filters module.

## Fields

| Field | Type | Description |
|---|---|---|
| `backendName` | string | Backend name: "appSelector". |
| `dependencies` | table<integer, string> | Extensions loaded before: `{'ui_apps'}`. |

**UI events (guihooks.trigger):** `appContainer:spawn`, `appSelectorDetails`, `appSelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/appSelector/general.lua`.*
