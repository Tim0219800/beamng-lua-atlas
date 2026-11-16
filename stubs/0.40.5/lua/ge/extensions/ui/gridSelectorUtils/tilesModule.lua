---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Grid selector utility: generic tile production engine. From a config (item -> tile converter, handlers per path type, grouping, sorting, data source), it routes each tile request to the handler matching the first key of the path and gives that handler a "context" of helpers (group finalization, default selection, clustering, favorites/recents groups).
--- Access: extension `ui_gridSelectorUtils_tilesModule`: `extensions.load("ui_gridSelectorUtils_tilesModule")`, then the global `ui_gridSelectorUtils_tilesModule`
---@class ui_gridSelectorUtils_tilesModule
ui_gridSelectorUtils_tilesModule = {}

--- Creates a tile production instance.
---Source: lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua:4
---@param config table { itemToTileConverter, pathHandlers (table pathType -> function(path, data, context)), clusteringFunction, groupingModule, sortingModule, getDataFunction, filterFunction, backendName (default "gridSelector"), profilerName }.
---@return table  Instance with getTiles and createContext.
function ui_gridSelectorUtils_tilesModule.create(config) end

--- Object returned by create().
---@class ui_gridSelectorUtils_tilesModule_instance
local ui_gridSelectorUtils_tilesModule_instance = {}

--- Builds the context passed to the handlers: itemToTileConverter, filterFunction, clusteringFunction, groupingModule, sortingModule, finalizeGroups, setDefaultSelection, matchesGroup, processClusteredItems, handleSpecialGroups, profiler, backendName, data.
---Source: lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua:dyn
---@param data table Data from getDataFunction (contains displayData).
---@param overrideDefaultSelectedTile table|nil See getTiles.
---@param tileFromClusteredItems table|nil See getTiles.
---@return table  Context.
function ui_gridSelectorUtils_tilesModule_instance:createContext(data, overrideDefaultSelectedTile, tileFromClusteredItems) end

--- Calls getDataFunction(), builds the context and delegates to the handler of the first path segment. Returns the handler's result (list of groups) or {}.
---Source: lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua:dyn
---@param path table|nil { keys = {...} } (default { keys = {} }).
---@param pathChanged boolean|nil If true, emits onGridSelectorGetTiles.
---@param overrideDefaultSelectedTile table|nil Tile { key } to select by default.
---@param tileFromClusteredItems table<string, function>|nil Cluster tile factories per clustering mode.
---@return table  Tile groups.
function ui_gridSelectorUtils_tilesModule_instance:getTiles(path, pathChanged, overrideDefaultSelectedTile, tileFromClusteredItems) end

