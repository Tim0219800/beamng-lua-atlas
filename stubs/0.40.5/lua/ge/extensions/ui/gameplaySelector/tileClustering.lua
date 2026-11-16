---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileClustering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Groups the gameplay selector's items into "clusters" (by level, by type or automatically depending on the system) and builds the tile representing each cluster: name, preview, item count, highest favorite/recent, navigation path (gotoPath), source icons. Used by ui_gameplaySelector_general, which must first call setBackend with a backend exposing isFavourite(key) and isRecent(key).
--- Access: extension `ui_gameplaySelector_tileClustering`: `extensions.load("ui_gameplaySelector_tileClustering")`, then the global `ui_gameplaySelector_tileClustering`
---@class ui_gameplaySelector_tileClustering
ui_gameplaySelector_tileClustering = {}

--- Distributes the items into clusters according to the given mode.
---Source: lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:307
---@param items table Items to group (iterated with pairs), each with a key field.
---@param clusterMode string 'level', 'type', 'automatic' or 'none'.
---@return table<string, {itemsByKey: table, count: integer, list: table}>  Clusters keyed by group name.
function ui_gameplaySelector_tileClustering.clusterItems(items, clusterMode) end

--- Builds a cluster's tile according to the mode (level, type or automatic).
---Source: lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:326
---@param clusteredItems table A cluster {itemsByKey, count, list}.
---@param group table Parent group: key, gotoParams, isRecentGroup, isFavouriteGroup.
---@param clusterMode string 'level', 'type' or 'automatic'.
---@return table|nil  Tile {key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, showFavouriteIconPercent, doubleClickDetails, doubleClickMode, sourceIcons, isAuxiliary, ...}; nil for a mode without a tile ('none').
function ui_gameplaySelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode) end

--- Returns the function that gives an item's group name for a mode.
---Source: lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:335
---@param clusterMode string 'level', 'type', 'automatic' or 'none'.
---@return function|nil  function(item) -> string, nil if mode unknown.
function ui_gameplaySelector_tileClustering.getClusterModeFunction(clusterMode) end

--- Computes a cluster's favorite/recent statistics.
---Source: lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:40
---@param clusteredItems table A cluster {itemsByKey, count, list}.
---@return number  Highest favorite index (0 if none).
---@return number  Lowest recent index (math.huge if none).
---@return number  Share of favorite items (0 to 1).
---@return table|nil  Favorite item with the highest index.
---@return table|nil  Most recent item.
function ui_gameplaySelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems) end

--- Chooses a cluster's representative item and its preview (default image /gameplay/default/preview.jpg).
---Source: lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:67
---@param clusteredItems table A cluster {itemsByKey, count, list}.
---@param sortMode string|nil 'Name' to take the first item in alphabetical order.
---@return string  Preview path.
---@return table  Representative item.
function ui_gameplaySelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode) end

--- Collects a cluster's source icons (item.sourceIcons) without duplicates, sorted: beamNG, camshaft, puzzleModule, cup, bug first, then the others by name.
---Source: lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:141
---@param clusteredItems table A cluster {itemsByKey, count, list}.
---@return table[]  List of {svg = path} (if it ends in .svg) or {icon = name}.
function ui_gameplaySelector_tileClustering.getSourceIcons(clusteredItems) end

--- Registers the backend used to know whether an item is a favorite or recent (backend.isFavourite(key), backend.isRecent(key)).
---Source: lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:4
---@param _backend table Selector backend (ui_gameplaySelector_general or equivalent).
function ui_gameplaySelector_tileClustering.setBackend(_backend) end

