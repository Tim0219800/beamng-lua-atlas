---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Single facade between the UI (Vue) and the grid selectors (vehicles, gameplay, apps, freeroam, quick race, light runner, bus routes). Each call receives the backend name as its first argument and is dispatched to the matching `ui_<name>_general` extension. The module normalizes paths, tile groups, filters, display data, header and management details before returning them to the UI, and provides fallback values for optional methods missing from a backend.
--- Access: extension `ui_gridSelector`: `extensions.load("ui_gridSelector")`, then the global `ui_gridSelector`
---@class ui_gridSelector
---@field BackendContract table Describes the expected backend contract: `requiredMethods` (list of names) and `optionalMethods` (list of names).
---@field dependencies table<integer, string> Backend extensions loaded before this module (the seven `ui_*Selector_general`).
ui_gridSelector = {}

--- Clears all filters (optional, fallback: false).
---Source: lua/ge/extensions/ui/gridSelector.lua:415
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return boolean|any  false if not implemented.
function ui_gridSelector.clearAllFilters(backendName, ...) end

--- Notifies the backend that the screen was closed from the UI (optional, fallback: nil).
---Source: lua/ge/extensions/ui/gridSelector.lua:428
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.closedFromUI(backendName, ...) end

--- Executes an action button of the details panel (optional, fallback: nil).
---Source: lua/ge/extensions/ui/gridSelector.lua:432
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.executeButton(backendName, ...) end

--- Executes the double-click action on a tile (optional, fallback: nil).
---Source: lua/ge/extensions/ui/gridSelector.lua:435
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.executeDoubleClick(backendName, ...) end

--- Calls the backend's exitCallback (no fallback).
---Source: lua/ge/extensions/ui/gridSelector.lua:434
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.exitCallback(backendName, ...) end

--- Opens a folder in the system file explorer (Engine.Platform.exploreFolder).
---Source: lua/ge/extensions/ui/gridSelector.lua:495
---@param _backendName string Ignored.
---@param path string Folder path.
function ui_gridSelector.exploreFolder(_backendName, path) end

--- Returns the backend's active filters (no fallback).
---Source: lua/ge/extensions/ui/gridSelector.lua:410
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return any  Active filters.
function ui_gridSelector.getActiveFilters(backendName, ...) end

--- Returns the backend extension table associated with the given name, or nil if the name is unknown.
---Source: lua/ge/extensions/ui/gridSelector.lua:64
---@param backendName string vehicleSelector, gameplaySelector, appSelector, freeroamSelector, quickraceSelector, lightRunnerSelector or busRouteSelector
---@return table|nil  The backend module (e.g. ui_vehicleSelector_general).
function ui_gridSelector.getBackendByName(backendName) end

--- Returns the details of the selected item (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:430
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return any  Details provided by the backend.
function ui_gridSelector.getDetails(backendName, ...) end

--- Returns the backend's display options (sorting, grouping, etc.) (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:419
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return table  Display options.
function ui_gridSelector.getDisplayDataOptions(backendName, ...) end

--- Returns the backend's filters (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:409
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return table  Backend filter data.
function ui_gridSelector.getFilters(backendName, ...) end

--- Alias of getSelectorSnapshot.
---Source: lua/ge/extensions/ui/gridSelector.lua:481
---@param backendName string Backend name.
---@param path table|nil Path.
---@return table  Full snapshot.
function ui_gridSelector.getInitialData(backendName, path) end

--- Returns the management buttons/details (optional, fallback: { buttons = {} }).
---Source: lua/ge/extensions/ui/gridSelector.lua:433
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return table  { buttons = {...}, ... }.
function ui_gridSelector.getManagementDetails(backendName, ...) end

--- Returns the screen header title and path segments for the given path (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:423
---@param backendName string Backend name.
---@param path table|nil Path to normalize.
---@param ... any Arguments passed on.
---@return table  { title, pathSegments }.
function ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...) end

--- Returns the backend's current search text (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:416
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return string  Search text.
function ui_gridSelector.getSearchText(backendName, ...) end

--- Alias of getSelectorSnapshotSlices.
---Source: lua/ge/extensions/ui/gridSelector.lua:440
---@param backendName string Backend name.
---@param path table|nil Path.
---@param options table|nil Slices.
---@return table  See getSelectorSnapshotSlices.
function ui_gridSelector.getSelectorRefresh(backendName, path, options) end

--- Returns a full snapshot (all slices) of the selector for a path.
---Source: lua/ge/extensions/ui/gridSelector.lua:481
---@param backendName string Backend name.
---@param path table|nil Path.
---@return table  See getSelectorSnapshotSlices. The default tile (forceAutoFocus or isDefaultSelected) gives defaultFocusKey.
function ui_gridSelector.getSelectorSnapshot(backendName, path) end

--- Builds a payload containing only the requested slices: tiles (groups + defaultFocusKey), filters, displayData, searchText, managementDetails, header. If no slice is enabled, all of them are.
---Source: lua/ge/extensions/ui/gridSelector.lua:440
---@param backendName string Backend name.
---@param path table|nil Path to normalize.
---@param options table<string, boolean>|nil Slices to include (key = true).
---@return table  { backendName, path, groups?, defaultFocusKey?, filters?, displayData?, searchText?, managementDetails?, header? }.
function ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options) end

--- Requests the tiles from the backend for a path and returns a normalized array of groups (non-table groups and tiles ignored, shallow copy, key generated if missing).
---Source: lua/ge/extensions/ui/gridSelector.lua:399
---@param backendName string Backend name.
---@param path table|nil Path { keys = {...} } or array of segments.
---@param ... any Extra arguments passed to the backend.
---@return table[]  List of groups { tiles = {...}, ... }.
function ui_gridSelector.getTiles(backendName, path, ...) end

--- Navigates the UI to a mod's details page (route menu.mods.details).
---Source: lua/ge/extensions/ui/gridSelector.lua:499
---@param _backendName string Ignored.
---@param modId string Mod identifier.
function ui_gridSelector.goToMod(_backendName, modId) end

--- Notifies the backend that profiling has finished (optional, fallback: nil).
---Source: lua/ge/extensions/ui/gridSelector.lua:427
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.profilerFinish(backendName, ...) end

--- Requests the tiles of a cluster from the backend (optional method, fallback: nil).
---Source: lua/ge/extensions/ui/gridSelector.lua:404
---@param backendName string Backend name.
---@param path table|nil Path to normalize.
---@param ... any Arguments passed on.
---@return any  Backend result.
function ui_gridSelector.requestClusterTiles(backendName, path, ...) end

--- Asks the backend to prepare an item's details (optional, fallback: nil).
---Source: lua/ge/extensions/ui/gridSelector.lua:431
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.requestDetails(backendName, ...) end

--- Resets the display options to their default values (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:421
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.resetDisplayDataToDefaults(backendName, ...) end

--- Resets a range filter on the backend side (no fallback).
---Source: lua/ge/extensions/ui/gridSelector.lua:413
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.resetRangeFilter(backendName, ...) end

--- Resets a set-of-values filter on the backend side (no fallback).
---Source: lua/ge/extensions/ui/gridSelector.lua:414
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.resetSetFilter(backendName, ...) end

--- Changes a backend display option (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:420
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.setDisplayDataOption(backendName, ...) end

--- Sets the backend's search text (required).
---Source: lua/ge/extensions/ui/gridSelector.lua:417
---@param backendName string Backend name.
---@param ... any Forwarded arguments (text).
function ui_gridSelector.setSearchText(backendName, ...) end

--- Toggles an item's favorite state (optional, fallback: false).
---Source: lua/ge/extensions/ui/gridSelector.lua:438
---@param backendName string Backend name.
---@param ... any Arguments passed on.
---@return boolean|any  false if not implemented.
function ui_gridSelector.toggleFavourite(backendName, ...) end

--- Enables or disables a filter on the backend side (no fallback).
---Source: lua/ge/extensions/ui/gridSelector.lua:411
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.toggleFilter(backendName, ...) end

--- Updates a range filter on the backend side (no fallback).
---Source: lua/ge/extensions/ui/gridSelector.lua:412
---@param backendName string Backend name.
---@param ... any Arguments passed on.
function ui_gridSelector.updateRangeFilter(backendName, ...) end

