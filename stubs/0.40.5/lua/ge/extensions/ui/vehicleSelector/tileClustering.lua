---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileClustering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Groups vehicle configurations into "clusters" (one tile per model or per brand + sub-model) for the vehicle selector grid, and builds each cluster's tile: name, preview, navigation path, favorites and recents, statistics of the representative config, source icons. It is called by ui_vehicleSelector_tiles; a modder rarely uses it directly.
--- Access: extension `ui_vehicleSelector_tileClustering`: `extensions.load("ui_vehicleSelector_tileClustering")`, then the global `ui_vehicleSelector_tileClustering`
---@class ui_vehicleSelector_tileClustering
ui_vehicleSelector_tileClustering = {}

--- Groups configs according to the cluster mode. Each cluster contains configsByKey, count, list, as well as years and value (minimums of the configs, for sorting).
---Source: lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:280
---@param configs table Configs to group (each with key and model_key).
---@param clusterMode string 'brandSubModelOrModel' or 'model'.
---@return table<string, table>  Clusters keyed by group name.
function ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode) end

--- Creates a cluster's tile according to the requested mode.
---Source: lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:309
---@param clusteredItems table A cluster from clusterItems.
---@param group table Parent group (key, gotoParams).
---@param clusterMode string 'brandSubModelOrModel' or 'model'.
---@return table|nil  Tile (key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, doubleClickDetails, sourceIcons, Value, Weight, Top Speed, Power, Power/Weight, 0-60 mph, 0-100 km/h, isAuxiliary...), or nil if the mode is unknown.
function ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode) end

--- Returns the function that computes a config's cluster name for a given mode.
---Source: lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:318
---@param clusterMode string Cluster mode.
---@return function|nil  Function (config) -> string, or nil.
function ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode) end

--- Walks a cluster to determine the favorites and recents it contains.
---Source: lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:24
---@param clusteredItems table Cluster (configsByKey, count).
---@return number  Highest favorite index (0 if none).
---@return number  Lowest recent index (math.huge if none).
---@return number  Share of favorite configs, between 0 and 1.
---@return table|nil  Favorite config with the highest index.
---@return table|nil  Most recent config.
function ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems) end

--- Chooses a cluster's preview, model, config and representative config according to sortMode.
---Source: lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:46
---@param clusteredItems table Cluster.
---@param sortMode string Sort mode (Automatic, Name, Value, Weight, ...).
---@return string  Path of the preview image.
---@return string  Model key.
---@return string  Key of the representative config.
---@return table  Representative config.
function ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode) end

--- Returns the provenance labels and icons of a config: official BeamNG ('beamNG'), custom ('wrench'), Automation (SVG logo), mod ('puzzleModule'), missing jbeam files ('danger').
---Source: lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:92
---@param config table Vehicle config.
---@param model table Model data.
---@param onlyIcons boolean true to return only the icons, without the translated text.
---@return string[]  List of icons (and texts if onlyIcons is false).
function ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons) end

