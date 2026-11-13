---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_tiles` : `extensions.load("ui_vehicleSelector_tiles")`, puis la globale `ui_vehicleSelector_tiles`
---@class ui_vehicleSelector_tiles
---@field getClusteredItemsFavouriteIconPercent any
---@field getClusteredItemsStats any
---@field getConfigOrModelPropValue any
---@field getSources any
---@field groupModeFunctions any
---@field sortByNameButOtherAlwaysLast any
---@field sortByValue any
---@field sortByYears any
ui_vehicleSelector_tiles = {}

--- Use clustering module function
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:120
---@param configs any
function ui_vehicleSelector_tiles.clusterItems(configs) end

---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:78
---@param config any
---@param fullName any
function ui_vehicleSelector_tiles.configToTile(config, fullName) end

---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:9
function ui_vehicleSelector_tiles.emptyProfiler() end

--- Main getTiles function - now delegates to the tilesModule
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:661
---@param path any
---@param pathChanged any
function ui_vehicleSelector_tiles.getTiles(path, pathChanged) end

---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:632
function ui_vehicleSelector_tiles.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:130
---@param tile any
function ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile) end

