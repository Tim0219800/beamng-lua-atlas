---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds the tiles displayed by the vehicle selector grid. It configures a tilesModule (ui/gridSelectorUtils/tilesModule) with three "paths": allModels (all vehicles, grouped then clustered), configsForBrandSubModelOrModel and configsForModel (list of a model's configs, with subgroups). It applies filters, favorites, recents, sorting and default selection, then the first drive tutorial restrictions. It relies on tileSorting, tileGrouping and tileClustering.
--- Access: extension `ui_vehicleSelector_tiles`: `extensions.load("ui_vehicleSelector_tiles")`, then the global `ui_vehicleSelector_tiles`
---@class ui_vehicleSelector_tiles
---@field getClusteredItemsFavouriteIconPercent function Alias of tileClustering.getClusteredItemsFavouriteIconPercent.
---@field getClusteredItemsStats function Alias of tileClustering.getClusteredItemsStats.
---@field getConfigOrModelPropValue function Alias of tileGrouping.getConfigOrModelPropValue.
---@field getSources function Alias of tileClustering.getSources.
---@field groupModeFunctions table Alias of tileGrouping.groupModeFunctions.
---@field sortByNameButOtherAlwaysLast function Alias of the tileSorting comparator.
---@field sortByValue function Alias of the tileSorting comparator.
---@field sortByYears function Alias of the tileSorting comparator.
ui_vehicleSelector_tiles = {}

--- Groups configs into clusters according to the clusterMode of the display options (delegates to tileClustering.clusterItems).
---Source: lua/ge/extensions/ui/vehicleSelector/tiles.lua:120
---@param configs table Configs to group.
---@return table  Clusters keyed by name.
function ui_vehicleSelector_tiles.clusterItems(configs) end

--- Converts a vehicle config into a grid tile.
---Source: lua/ge/extensions/ui/vehicleSelector/tiles.lua:78
---@param config table Config (with key and model_key).
---@param fullName boolean|nil true to use the full name (Name) rather than the Configuration.
---@return table  Tile.
function ui_vehicleSelector_tiles.configToTile(config, fullName) end

--- Creates a fake profiler with no effect (start, add, finish).
---Source: lua/ge/extensions/ui/vehicleSelector/tiles.lua:9
---@return table  {start, add, finish} object.
function ui_vehicleSelector_tiles.emptyProfiler() end

--- Returns the tile groups for a selector path (allModels, configsForModel, configsForBrandSubModelOrModel), then applies any restrictions from gameplay_discover_firstDrive_vehicleSelectorRestriction and freeroamTutorial_vehicleSelectorRestriction.
---Source: lua/ge/extensions/ui/vehicleSelector/tiles.lua:661
---@param path table Path {keys = {...}}; keys[1] is the path type.
---@param pathChanged boolean|nil Indicates that the path has changed (passed to tilesModule).
---@return table  List of groups {key, label, tiles, ...}.
function ui_vehicleSelector_tiles.getTiles(path, pathChanged) end

--- Hook called on load: creates the tilesModule instance with the path handlers, the sorting, grouping and clustering modules, and the data and filtering functions of ui_vehicleSelector_general.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/tiles.lua:632
function ui_vehicleSelector_tiles.onExtensionLoaded() end

--- Sets the tile to select and focus by default on the next getTiles (the model_key and config_key or key fields identify the config).
---Source: lua/ge/extensions/ui/vehicleSelector/tiles.lua:130
---@param tile table|nil Target tile, or nil.
function ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile) end

