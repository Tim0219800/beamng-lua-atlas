---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileClustering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_gameplaySelector_tileClustering` : `extensions.load("ui_gameplaySelector_tileClustering")`, puis la globale `ui_gameplaySelector_tileClustering`
---@class ui_gameplaySelector_tileClustering
ui_gameplaySelector_tileClustering = {}

--- Cluster items by the specified cluster mode
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:307
---@param items any
---@param clusterMode any
function ui_gameplaySelector_tileClustering.clusterItems(items, clusterMode) end

--- Create tile from clustered items
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:326
---@param clusteredItems any
---@param group any
---@param clusterMode any
function ui_gameplaySelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode) end

--- Get cluster mode function
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:335
---@param clusterMode any
function ui_gameplaySelector_tileClustering.getClusterModeFunction(clusterMode) end

--- Get favourite and recent statistics for clustered items
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:40
---@param clusteredItems any
function ui_gameplaySelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems) end

--- Get statistics for clustered items (preview, item selection)
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:67
---@param clusteredItems any
---@param sortMode any
function ui_gameplaySelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:141
---@param clusteredItems any
function ui_gameplaySelector_tileClustering.getSourceIcons(clusteredItems) end

---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:4
---@param _backend any
function ui_gameplaySelector_tileClustering.setBackend(_backend) end

