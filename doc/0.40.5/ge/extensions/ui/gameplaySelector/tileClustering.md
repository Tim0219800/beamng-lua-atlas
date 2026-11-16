# `ui_gameplaySelector_tileClustering`

*File: `lua/ge/extensions/ui/gameplaySelector/tileClustering.lua` · VM: Game Engine (GE) · 344 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tileClustering`: `extensions.load("ui_gameplaySelector_tileClustering")`, then the global `ui_gameplaySelector_tileClustering`

Groups the gameplay selector's items into "clusters" (by level, by type or automatically depending on the system) and builds the tile representing each cluster: name, preview, item count, highest favorite/recent, navigation path (gotoPath), source icons. Used by ui_gameplaySelector_general, which must first call setBackend with a backend exposing isFavourite(key) and isRecent(key).

## Notes

- Clustering modes: 'level' (item.level), 'type' (item.type), 'automatic' (according to item.system) and 'none' (everything in "None"). Default value of a group: "Other...".
- Automatic mode: campaigns and "Other Gameplay" -> "None" (no grouping); freeroam, scenarios, scenariosMultiplayer -> by level; challenges -> by type; otherwise by level if present.
- An item has the form {key, name, preview, system, level, type, ...}; a cluster is {itemsByKey, count, list}.
- getClusteredItemsStats: if all items are freeroamSpawnpoint and one is the default start point, its preview is used; if all have the same missionTypeLabel, the mission's default preview is used; with sortMode 'Name' the first by name; otherwise the first found (pairs order, nondeterministic).
- clusterItems calls clusterModeFunctions[clusterMode] without a test: an unknown mode raises a Lua error.
- No undefined field; M.clusterItems, createTileFromClusteredItems and getClusterModeFunction are defined directly with function M.x, the other three via the "Public API" section.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tileClustering.clusterItems(items, clusterMode)` | Distributes the items into clusters according to the given mode. | 307 |
| `ui_gameplaySelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)` | Builds a cluster's tile according to the mode (level, type or automatic). | 326 |
| `ui_gameplaySelector_tileClustering.getClusterModeFunction(clusterMode)` | Returns the function that gives an item's group name for a mode. | 335 |
| `ui_gameplaySelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)` | Computes a cluster's favorite/recent statistics. | 40 |
| `ui_gameplaySelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)` | Chooses a cluster's representative item and its preview (default image /gameplay/default/preview.jpg). | 67 |
| `ui_gameplaySelector_tileClustering.getSourceIcons(clusteredItems)` | Collects a cluster's source icons (item.sourceIcons) without duplicates, sorted: beamNG, camshaft, puzzleModule, cup, bug first, then the others by name. | 141 |
| `ui_gameplaySelector_tileClustering.setBackend(_backend)` | Registers the backend used to know whether an item is a favorite or recent (backend.isFavourite(key), backend.isRecent(key)). | 4 |

### Parameter details

#### `ui_gameplaySelector_tileClustering.clusterItems(items, clusterMode)`

Distributes the items into clusters according to the given mode.

- `items` (*table*) : Items to group (iterated with pairs), each with a key field.
- `clusterMode` (*string*) : 'level', 'type', 'automatic' or 'none'.
- **returns**: table<string, {itemsByKey: table, count: integer, list: table}> Clusters keyed by group name.

#### `ui_gameplaySelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)`

Builds a cluster's tile according to the mode (level, type or automatic).

- `clusteredItems` (*table*) : A cluster {itemsByKey, count, list}.
- `group` (*table*) : Parent group: key, gotoParams, isRecentGroup, isFavouriteGroup.
- `clusterMode` (*string*) : 'level', 'type' or 'automatic'.
- **returns**: table|nil Tile {key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, showFavouriteIconPercent, doubleClickDetails, doubleClickMode, sourceIcons, isAuxiliary, ...}; nil for a mode without a tile ('none').

#### `ui_gameplaySelector_tileClustering.getClusterModeFunction(clusterMode)`

Returns the function that gives an item's group name for a mode.

- `clusterMode` (*string*) : 'level', 'type', 'automatic' or 'none'.
- **returns**: function|nil function(item) -> string, nil if mode unknown.

#### `ui_gameplaySelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)`

Computes a cluster's favorite/recent statistics.

- `clusteredItems` (*table*) : A cluster {itemsByKey, count, list}.
- **returns**: number Highest favorite index (0 if none).
- **returns**: number Lowest recent index (math.huge if none).
- **returns**: number Share of favorite items (0 to 1).
- **returns**: table|nil Favorite item with the highest index.
- **returns**: table|nil Most recent item.

#### `ui_gameplaySelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)`

Chooses a cluster's representative item and its preview (default image /gameplay/default/preview.jpg).

- `clusteredItems` (*table*) : A cluster {itemsByKey, count, list}.
- `sortMode` (*string|nil*) : 'Name' to take the first item in alphabetical order.
- **returns**: string Preview path.
- **returns**: table Representative item.

#### `ui_gameplaySelector_tileClustering.getSourceIcons(clusteredItems)`

Collects a cluster's source icons (item.sourceIcons) without duplicates, sorted: beamNG, camshaft, puzzleModule, cup, bug first, then the others by name.

- `clusteredItems` (*table*) : A cluster {itemsByKey, count, list}.
- **returns**: table[] List of {svg = path} (if it ends in .svg) or {icon = name}.

#### `ui_gameplaySelector_tileClustering.setBackend(_backend)`

Registers the backend used to know whether an item is a favorite or recent (backend.isFavourite(key), backend.isRecent(key)).

- `_backend` (*table*) : Selector backend (ui_gameplaySelector_general or equivalent).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tileClustering.lua`.*
