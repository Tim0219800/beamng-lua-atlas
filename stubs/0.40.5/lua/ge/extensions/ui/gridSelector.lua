---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_gridSelector` : `extensions.load("ui_gridSelector")`, puis la globale `ui_gridSelector`
---@class ui_gridSelector
---@field BackendContract table
---@field dependencies table
ui_gridSelector = {}

---Source : lua/ge/extensions/ui/gridSelector.lua:415
---@param backendName any
---@param ... any
function ui_gridSelector.clearAllFilters(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:428
---@param backendName any
---@param ... any
function ui_gridSelector.closedFromUI(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:432
---@param backendName any
---@param ... any
function ui_gridSelector.executeButton(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:435
---@param backendName any
---@param ... any
function ui_gridSelector.executeDoubleClick(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:434
---@param backendName any
---@param ... any
function ui_gridSelector.exitCallback(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:495
---@param _backendName any
---@param path any
function ui_gridSelector.exploreFolder(_backendName, path) end

---Source : lua/ge/extensions/ui/gridSelector.lua:410
---@param backendName any
---@param ... any
function ui_gridSelector.getActiveFilters(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:64
---@param backendName any
function ui_gridSelector.getBackendByName(backendName) end

--- Details
---Source : lua/ge/extensions/ui/gridSelector.lua:430
---@param backendName any
---@param ... any
function ui_gridSelector.getDetails(backendName, ...) end

--- Display Data
---Source : lua/ge/extensions/ui/gridSelector.lua:419
---@param backendName any
---@param ... any
function ui_gridSelector.getDisplayDataOptions(backendName, ...) end

--- Filters
---Source : lua/ge/extensions/ui/gridSelector.lua:409
---@param backendName any
---@param ... any
function ui_gridSelector.getFilters(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:481
---@param backendName any
---@param path any
function ui_gridSelector.getInitialData(backendName, path) end

---Source : lua/ge/extensions/ui/gridSelector.lua:433
---@param backendName any
---@param ... any
function ui_gridSelector.getManagementDetails(backendName, ...) end

--- General
---Source : lua/ge/extensions/ui/gridSelector.lua:423
---@param backendName any
---@param path any
---@param ... any
function ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:416
---@param backendName any
---@param ... any
function ui_gridSelector.getSearchText(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:440
---@param backendName any
---@param path any
---@param options any
function ui_gridSelector.getSelectorRefresh(backendName, path, options) end

---Source : lua/ge/extensions/ui/gridSelector.lua:481
---@param backendName any
---@param path any
function ui_gridSelector.getSelectorSnapshot(backendName, path) end

---Source : lua/ge/extensions/ui/gridSelector.lua:440
---@param backendName any
---@param path any
---@param options any
function ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options) end

--- Tiles
---Source : lua/ge/extensions/ui/gridSelector.lua:399
---@param backendName any
---@param path any
---@param ... any
function ui_gridSelector.getTiles(backendName, path, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:499
---@param _backendName any
---@param modId any
function ui_gridSelector.goToMod(_backendName, modId) end

---Source : lua/ge/extensions/ui/gridSelector.lua:427
---@param backendName any
---@param ... any
function ui_gridSelector.profilerFinish(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:404
---@param backendName any
---@param path any
---@param ... any
function ui_gridSelector.requestClusterTiles(backendName, path, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:431
---@param backendName any
---@param ... any
function ui_gridSelector.requestDetails(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:421
---@param backendName any
---@param ... any
function ui_gridSelector.resetDisplayDataToDefaults(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:413
---@param backendName any
---@param ... any
function ui_gridSelector.resetRangeFilter(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:414
---@param backendName any
---@param ... any
function ui_gridSelector.resetSetFilter(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:420
---@param backendName any
---@param ... any
function ui_gridSelector.setDisplayDataOption(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:417
---@param backendName any
---@param ... any
function ui_gridSelector.setSearchText(backendName, ...) end

--- M.exploreFolder = function(backendName, ...) return getBackendByName(backendName).exploreFolder(...) end
--- M.goToMod = function(backendName, ...) return getBackendByName(backendName).goToMod(...) end
---Source : lua/ge/extensions/ui/gridSelector.lua:438
---@param backendName any
---@param ... any
function ui_gridSelector.toggleFavourite(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:411
---@param backendName any
---@param ... any
function ui_gridSelector.toggleFilter(backendName, ...) end

---Source : lua/ge/extensions/ui/gridSelector.lua:412
---@param backendName any
---@param ... any
function ui_gridSelector.updateRangeFilter(backendName, ...) end

