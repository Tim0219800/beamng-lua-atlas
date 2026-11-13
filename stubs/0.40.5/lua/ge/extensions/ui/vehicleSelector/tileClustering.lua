---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileClustering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_tileClustering` : `extensions.load("ui_vehicleSelector_tileClustering")`, puis la globale `ui_vehicleSelector_tileClustering`
---@class ui_vehicleSelector_tileClustering
ui_vehicleSelector_tileClustering = {}

--- Cluster configs by the specified cluster mode
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:280
---@param configs any
---@param clusterMode any
function ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode) end

--- Create tile from clustered items
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:309
---@param clusteredItems any
---@param group any
---@param clusterMode any
function ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode) end

--- Get cluster mode function
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:318
---@param clusterMode any
function ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode) end

--- Get favourite and recent vehicle statistics for clustered items
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:24
---@param clusteredItems any
function ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems) end

--- Get statistics for clustered items (preview, model, config selection)
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:46
---@param clusteredItems any
---@param sortMode any
function ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode) end

--- Get sources for a config
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:92
---@param config any
---@param model any
---@param onlyIcons any
function ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons) end

