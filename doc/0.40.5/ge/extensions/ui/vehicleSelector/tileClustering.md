# `ui_vehicleSelector_tileClustering`

*File: `lua/ge/extensions/ui/vehicleSelector/tileClustering.lua` · VM: Game Engine (GE) · 328 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_tileClustering`: `extensions.load("ui_vehicleSelector_tileClustering")`, then the global `ui_vehicleSelector_tileClustering`

Groups vehicle configurations into "clusters" (one tile per model or per brand + sub-model) for the vehicle selector grid, and builds each cluster's tile: name, preview, navigation path, favorites and recents, statistics of the representative config, source icons. It is called by ui_vehicleSelector_tiles; a modder rarely uses it directly.

## Notes

- Two cluster modes: 'brandSubModelOrModel' (key = "Brand SubModel", the sub-model defaulting to the model key) and 'model' (key = model_key, followed by the vehicleSelectorSubCluster if useSubCluster is true).
- A cluster's preview is /vehicles/<model>/default.png if it exists, otherwise model.preview, otherwise default.jpg. The representative config is the model's default_pc (Automatic or Name sort); otherwise the last of the list sorted according to sortMode.
- getClusteredItemsStats sorts clusteredItems.list in place when sortMode is neither 'Automatic' nor 'Name'.
- clusterItems: an unknown cluster mode causes an error (clusterModeFunctions[clusterMode] is called without checking).
- Cluster tiles carry doubleClickMode = 'capture' and a gotoPath field {'configsForBrandSubModelOrModel', model, sub-model, brand} followed by group.gotoParams.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode)` | Groups configs according to the cluster mode. Each cluster contains configsByKey, count, list, as well as years and value (minimums of the configs, for sorting). | 280 |
| `ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)` | Creates a cluster's tile according to the requested mode. | 309 |
| `ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode)` | Returns the function that computes a config's cluster name for a given mode. | 318 |
| `ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)` | Walks a cluster to determine the favorites and recents it contains. | 24 |
| `ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)` | Chooses a cluster's preview, model, config and representative config according to sortMode. | 46 |
| `ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons)` | Returns the provenance labels and icons of a config: official BeamNG ('beamNG'), custom ('wrench'), Automation (SVG logo), mod ('puzzleModule'), missing jbeam files ('danger'). | 92 |

### Parameter details

#### `ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode)`

Groups configs according to the cluster mode. Each cluster contains configsByKey, count, list, as well as years and value (minimums of the configs, for sorting).

- `configs` (*table*) : Configs to group (each with key and model_key).
- `clusterMode` (*string*) : 'brandSubModelOrModel' or 'model'.
- **returns**: table<string, table> Clusters keyed by group name.

#### `ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)`

Creates a cluster's tile according to the requested mode.

- `clusteredItems` (*table*) : A cluster from clusterItems.
- `group` (*table*) : Parent group (key, gotoParams).
- `clusterMode` (*string*) : 'brandSubModelOrModel' or 'model'.
- **returns**: table|nil Tile (key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, doubleClickDetails, sourceIcons, Value, Weight, Top Speed, Power, Power/Weight, 0-60 mph, 0-100 km/h, isAuxiliary...), or nil if the mode is unknown.

#### `ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode)`

Returns the function that computes a config's cluster name for a given mode.

- `clusterMode` (*string*) : Cluster mode.
- **returns**: function|nil Function (config) -> string, or nil.

#### `ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)`

Walks a cluster to determine the favorites and recents it contains.

- `clusteredItems` (*table*) : Cluster (configsByKey, count).
- **returns**: number Highest favorite index (0 if none).
- **returns**: number Lowest recent index (math.huge if none).
- **returns**: number Share of favorite configs, between 0 and 1.
- **returns**: table|nil Favorite config with the highest index.
- **returns**: table|nil Most recent config.

#### `ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)`

Chooses a cluster's preview, model, config and representative config according to sortMode.

- `clusteredItems` (*table*) : Cluster.
- `sortMode` (*string*) : Sort mode (Automatic, Name, Value, Weight, ...).
- **returns**: string Path of the preview image.
- **returns**: string Model key.
- **returns**: string Key of the representative config.
- **returns**: table Representative config.

#### `ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons)`

Returns the provenance labels and icons of a config: official BeamNG ('beamNG'), custom ('wrench'), Automation (SVG logo), mod ('puzzleModule'), missing jbeam files ('danger').

- `config` (*table*) : Vehicle config.
- `model` (*table*) : Model data.
- `onlyIcons` (*boolean*) : true to return only the icons, without the translated text.
- **returns**: string[] List of icons (and texts if onlyIcons is false).

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/tileClustering.lua`.*
