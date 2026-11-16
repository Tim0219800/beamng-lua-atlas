---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend (`backendName = "appSelector"`) of the interface's app selector, plugged into the generic GridSelector component. It lists the apps known from `ui_apps.getUIAppsData()` as tiles grouped by category (Dashboard, Telemetry, General, Gameplay, Debug, then the others in alphabetical order), handles search, filtering by type, display options (size, auxiliary content, saved in `/settings/appSelectorData.json`) and the details sheet with the "Add to layout" button. Useful to understand how the app editing screen is fed; of little direct use to a modder.
--- Access: extension `ui_appSelector_general`: `extensions.load("ui_appSelector_general")`, then the global `ui_appSelector_general`
---@class ui_appSelector_general
---@field backendName string Backend name: "appSelector".
---@field dependencies table<integer, string> Extensions loaded before: `{'ui_apps'}`.
ui_appSelector_general = {}

--- Clears all filters.
---Source: lua/ge/extensions/ui/appSelector/general.lua:487
---@param requestId any|nil UI-side request identifier.
---@return any  Result of the filters module.
function ui_appSelector_general.clearAllFilters(requestId) end

--- Empty function, present for the GridSelector API.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appSelector/general.lua:756
function ui_appSelector_general.closedFromUI() end

--- Rebuilds the complete snapshot (tiles, filters, options, header) and sends it to the UI via `appSelectorDisplayDataSnapshot`.
---Source: lua/ge/extensions/ui/appSelector/general.lua:736
---@param requestId any UI-side request identifier.
---@return boolean  true if sent, false if the build failed (error logged).
function ui_appSelector_general.emitDisplayDataSnapshot(requestId) end

--- Runs the callback of a details sheet button via the buttons module.
---Source: lua/ge/extensions/ui/appSelector/general.lua:665
---@param buttonId any Button identifier.
---@param data any Data passed to the callback.
---@return any  Callback return.
function ui_appSelector_general.executeButton(buttonId, data) end

--- On a tile double-click, runs the app's "Add to layout" button.
---Source: lua/ge/extensions/ui/appSelector/general.lua:690
---@param details table Table containing `appName`.
function ui_appSelector_general.executeDoubleClick(details) end

--- No effect: only writes a message to the log.
---Source: lua/ge/extensions/ui/appSelector/general.lua:680
---@param path any Path (logged).
function ui_appSelector_general.exploreFolder(path) end

--- Returns the currently active filters.
---Source: lua/ge/extensions/ui/appSelector/general.lua:446
---@return table  Active filters.
function ui_appSelector_general.getActiveFilters() end

--- Returns the selector data (apps, filter instance, filter list, display options), (re)initializing them if needed.
---Source: lua/ge/extensions/ui/appSelector/general.lua:287
---@return table  Table with `apps`, `filterInstance`, `filterList`, `activeFilters`, `lockedFiltersByProp`, `displayData`.
function ui_appSelector_general.getAppData() end

--- Builds an app's details sheet: title, preview, description, specifications (interactivity, version, types, folder outside the shipping build) and "Add to layout" button. Returns a fallback title if the app is unknown.
---Source: lua/ge/extensions/ui/appSelector/general.lua:565
---@param details table Table containing `appName`.
---@return table  `{headerTitle, preview, description, specifications, buttonInfo, appName}`.
function ui_appSelector_general.getDetails(details) end

--- Returns the display options (tile size: list/tiny/small/medium/large/huge; inclusion of auxiliary content).
---Source: lua/ge/extensions/ui/appSelector/general.lua:496
---@return table  Display options.
function ui_appSelector_general.getDisplayDataOptions() end

--- Returns the available filters ("set" type filter on app types).
---Source: lua/ge/extensions/ui/appSelector/general.lua:441
---@return table  Filters of the filters module.
function ui_appSelector_general.getFilters() end

--- Optional function of the GridSelector API: always returns `{buttons = {}}`.
---Source: lua/ge/extensions/ui/appSelector/general.lua:671
---@return table  `{buttons = {}}`.
function ui_appSelector_general.getManagementDetails() end

--- Builds the screen's title and breadcrumb (Menu, Edit apps, Apps, then "Filtered"/"Search: …" if needed).
---Source: lua/ge/extensions/ui/appSelector/general.lua:530
---@param path table Current path (not used).
---@return table  `{title, pathSegments, isFiltered}`.
function ui_appSelector_general.getScreenHeaderTitleAndPath(path) end

--- Returns the current search text.
---Source: lua/ge/extensions/ui/appSelector/general.lua:516
---@return string|nil  Search text.
function ui_appSelector_general.getSearchText() end

--- Builds the app tile groups (filtered, sorted: non-auxiliary first then by name, grouped by category).
---Source: lua/ge/extensions/ui/appSelector/general.lua:354
---@param path table Navigation path (not used for the content).
---@return table<integer, table>  List of `{label, tiles}`.
function ui_appSelector_general.getTiles(path) end

--- No effect: only writes a message to the log.
---Source: lua/ge/extensions/ui/appSelector/general.lua:685
---@param modId any Mod ID (logged).
function ui_appSelector_general.goToMod(modId) end

--- Hook called when a mod is activated: forces the data to reload on next access.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appSelector/general.lua:301
function ui_appSelector_general.onModActivated() end

--- Hook called when a mod is deactivated: forces the data to reload on next access.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appSelector/general.lua:300
function ui_appSelector_general.onModDeactivated() end

--- Hook called when the mod manager is ready: forces the data to reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appSelector/general.lua:302
function ui_appSelector_general.onModManagerReady() end

--- Hook called by the UI router when the route is mounted: attaches a selector snapshot to `data.appSelector`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appSelector/general.lua:751
---@param context any Route context (not used).
---@param toRoute any Destination route (not used).
---@param fromRoute any Source route (not used).
---@param data table Route data to which the snapshot is added.
function ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data) end

--- Empty function, present for the GridSelector API.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appSelector/general.lua:755
function ui_appSelector_general.profilerFinish() end

--- Computes an app's details sheet and sends it to the UI via the `appSelectorDetails` hook.
---Source: lua/ge/extensions/ui/appSelector/general.lua:653
---@param item table Selected item (with `appName`).
---@param requestId any UI-side request identifier.
---@return table  Payload sent: `{backendName, requestId, item, details}`.
function ui_appSelector_general.requestDetails(item, requestId) end

--- Resets the display options to their default values.
---Source: lua/ge/extensions/ui/appSelector/general.lua:508
---@param requestId any|nil UI-side request identifier.
---@return table  Updated display data.
function ui_appSelector_general.resetDisplayDataToDefaults(requestId) end

--- Resets a range filter.
---Source: lua/ge/extensions/ui/appSelector/general.lua:469
---@param filterKey string Filter name.
---@param requestId any|nil UI-side request identifier.
---@return any  Result of the filters module.
function ui_appSelector_general.resetRangeFilter(filterKey, requestId) end

--- Resets a "set" type filter.
---Source: lua/ge/extensions/ui/appSelector/general.lua:478
---@param filterKey string Filter name.
---@param requestId any|nil UI-side request identifier.
---@return any  Result of the filters module.
function ui_appSelector_general.resetSetFilter(filterKey, requestId) end

--- Returns the selector's default path: `{keys = {"allApps"}}`.
---Source: lua/ge/extensions/ui/appSelector/general.lua:732
---@return table  Normalized path.
function ui_appSelector_general.resolveCurrentSelectorPath() end

--- Changes a display option and saves it.
---Source: lua/ge/extensions/ui/appSelector/general.lua:500
---@param key string Option key (displaySize, includeAuxContent).
---@param value any New value.
---@param requestId any|nil UI-side request identifier.
---@return table  Updated display data.
function ui_appSelector_general.setDisplayDataOption(key, value, requestId) end

--- Sets the search text (compared in lowercase against the translated name, app name and description).
---Source: lua/ge/extensions/ui/appSelector/general.lua:521
---@param val string Searched text.
---@param requestId any|nil UI-side request identifier.
---@return any  Result of the filters module.
function ui_appSelector_general.setSearchText(val, requestId) end

--- No effect: apps have no favorites. Returns false.
---Source: lua/ge/extensions/ui/appSelector/general.lua:675
---@param itemDetails table Not used.
---@return boolean  Always false.
function ui_appSelector_general.toggleFavourite(itemDetails) end

--- Enables or disables a filter value. If `requestId` is provided, also returns a snapshot to the UI.
---Source: lua/ge/extensions/ui/appSelector/general.lua:451
---@param filterKey string Filter name (for example "Type").
---@param value any Value to toggle.
---@param requestId any|nil UI-side request identifier.
---@return any  Result of the filters module.
function ui_appSelector_general.toggleFilter(filterKey, value, requestId) end

--- Updates a range filter (not used by the current filters, which are all of "set" type).
---Source: lua/ge/extensions/ui/appSelector/general.lua:460
---@param filterKey string Filter name.
---@param min number Minimum.
---@param max number Maximum.
---@param requestId any|nil UI-side request identifier.
---@return any  Result of the filters module.
function ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

