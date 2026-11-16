# `ui_vehicleSelector_tiles`

*File: `lua/ge/extensions/ui/vehicleSelector/tiles.lua` · VM: Game Engine (GE) · 700 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_tiles`: `extensions.load("ui_vehicleSelector_tiles")`, then the global `ui_vehicleSelector_tiles`

Builds the tiles displayed by the vehicle selector grid. It configures a tilesModule (ui/gridSelectorUtils/tilesModule) with three "paths": allModels (all vehicles, grouped then clustered), configsForBrandSubModelOrModel and configsForModel (list of a model's configs, with subgroups). It applies filters, favorites, recents, sorting and default selection, then the first drive tutorial restrictions. It relies on tileSorting, tileGrouping and tileClustering.

## Notes

- A config's tile notably contains key ('model/config'), name, preview, model_key, config_key, configType, showDetails, doubleClickDetails, favouriteIdx, recentIdx, sourceIcons, isAuxiliary, as well as Value, Weight, Top Speed, Power, Power/Weight, 0-60 mph and 0-100 km/h.
- getTiles uses tilesInstance, created in onExtensionLoaded: calling getTiles before the extension is fully loaded would cause an error.
- Display modes of favorites and recents: 'hidden', 'reducedClusters', 'completeClusters' and 'unclustered'; 'completeClusters' removes the individual configs from the special group to keep only the clusters.
- 'Automatic' sort: recents by ascending recentIdx, favorites by descending favouriteIdx, otherwise by Value or Years (depending on groupMode) or by name. In a model's config list, the default automatic sort is by Value.
- The default selection is marked by isDefaultSelected, and forceAutoFocus for the tile requested by overrideDefaultSelectedTile (consumed after the first getTiles).
- Emits the hook onVehicleSelectorGetTiles(path, modelKey, modelSubKey, brandKey, groupMode, groupName) when displaying a model's configs.
- The freeroam tiles mark the configurator's current selection (cornerIcon = 'car') via freeroam_freeroamConfigurator.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_tiles.clusterItems(configs)` | Groups configs into clusters according to the clusterMode of the display options (delegates to tileClustering.clusterItems). | 120 |
| `ui_vehicleSelector_tiles.configToTile(config, fullName)` | Converts a vehicle config into a grid tile. | 78 |
| `ui_vehicleSelector_tiles.emptyProfiler()` | Creates a fake profiler with no effect (start, add, finish). | 9 |
| `ui_vehicleSelector_tiles.getTiles(path, pathChanged)` | Returns the tile groups for a selector path (allModels, configsForModel, configsForBrandSubModelOrModel), then applies any restrictions from gameplay_discover_firstDrive_vehicleSelectorRestriction and freeroamTutorial_vehicleSelectorRestriction. | 661 |
| `ui_vehicleSelector_tiles.onExtensionLoaded()` | Hook called on load: creates the tilesModule instance with the path handlers, the sorting, grouping and clustering modules, and the data and filtering functions of ui_vehicleSelector_general. *(internal)* *(hook)* | 632 |
| `ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile)` | Sets the tile to select and focus by default on the next getTiles (the model_key and config_key or key fields identify the config). | 130 |

### Parameter details

#### `ui_vehicleSelector_tiles.clusterItems(configs)`

Groups configs into clusters according to the clusterMode of the display options (delegates to tileClustering.clusterItems).

- `configs` (*table*) : Configs to group.
- **returns**: table Clusters keyed by name.

#### `ui_vehicleSelector_tiles.configToTile(config, fullName)`

Converts a vehicle config into a grid tile.

- `config` (*table*) : Config (with key and model_key).
- `fullName` (*boolean|nil*) : true to use the full name (Name) rather than the Configuration.
- **returns**: table Tile.

#### `ui_vehicleSelector_tiles.emptyProfiler()`

Creates a fake profiler with no effect (start, add, finish).

- **returns**: table {start, add, finish} object.

#### `ui_vehicleSelector_tiles.getTiles(path, pathChanged)`

Returns the tile groups for a selector path (allModels, configsForModel, configsForBrandSubModelOrModel), then applies any restrictions from gameplay_discover_firstDrive_vehicleSelectorRestriction and freeroamTutorial_vehicleSelectorRestriction.

- `path` (*table*) : Path {keys = {...}}; keys[1] is the path type.
- `pathChanged` (*boolean|nil*) : Indicates that the path has changed (passed to tilesModule).
- **returns**: table List of groups {key, label, tiles, ...}.

#### `ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile)`

Sets the tile to select and focus by default on the next getTiles (the model_key and config_key or key fields identify the config).

- `tile` (*table|nil*) : Target tile, or nil.

## Fields

| Field | Type | Description |
|---|---|---|
| `getClusteredItemsFavouriteIconPercent` | function | Alias of tileClustering.getClusteredItemsFavouriteIconPercent. |
| `getClusteredItemsStats` | function | Alias of tileClustering.getClusteredItemsStats. |
| `getConfigOrModelPropValue` | function | Alias of tileGrouping.getConfigOrModelPropValue. |
| `getSources` | function | Alias of tileClustering.getSources. |
| `groupModeFunctions` | table | Alias of tileGrouping.groupModeFunctions. |
| `sortByNameButOtherAlwaysLast` | function | Alias of the tileSorting comparator. |
| `sortByValue` | function | Alias of the tileSorting comparator. |
| `sortByYears` | function | Alias of the tileSorting comparator. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleSelectorGetTiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/tiles.lua`.*
