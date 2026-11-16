# `ui_gridSelectorUtils_tilesModule`

*File: `lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua` · VM: Game Engine (GE) · 249 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gridSelectorUtils_tilesModule`: `extensions.load("ui_gridSelectorUtils_tilesModule")`, then the global `ui_gridSelectorUtils_tilesModule`

Grid selector utility: generic tile production engine. From a config (item -> tile converter, handlers per path type, grouping, sorting, data source), it routes each tile request to the handler matching the first key of the path and gives that handler a "context" of helpers (group finalization, default selection, clustering, favorites/recents groups).

## Notes

- The handler is looked up in config.pathHandlers[path.keys[1]]; if it does not exist, getTiles returns an empty table.
- The hook `onGridSelectorGetTiles(backendName, pathType)` is only emitted if `pathChanged` is true.
- finalizeGroups: limits the "recents" group to 15 tiles, removes empty groups and sorts by `order` then by name (sortingModule.sortByNameButOtherAlwaysLast).
- setDefaultSelection: default tile = the model's default_pc, otherwise the tile imposed by overrideDefaultSelectedTile (forceAutoFocus = true), otherwise the last tile of the group; it gets isDefaultSelected = true.
- In matchesGroup, the local variable groupName shadows the parameter of the same name (`local groupName, _ = ...`); the final test `validGroups[groupName]` uses the original parameter, so it stays consistent but the code is misleading. The Favourites/Recent modes always return true (filtering left to the caller).
- The profiler is disabled (empty functions); a commented-out line allows enabling it.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gridSelectorUtils_tilesModule.create(config)` | Creates a tile production instance. | 4 |

### Parameter details

#### `ui_gridSelectorUtils_tilesModule.create(config)`

Creates a tile production instance.

- `config` (*table*) : { itemToTileConverter, pathHandlers (table pathType -> function(path, data, context)), clusteringFunction, groupingModule, sortingModule, getDataFunction, filterFunction, backendName (default "gridSelector"), profilerName }.
- **returns**: table Instance with getTiles and createContext.

## Class `instance`

Object returned by create().

| Method | Description | Line |
|---|---|---|
| `instance:createContext(data, overrideDefaultSelectedTile, tileFromClusteredItems)` | Builds the context passed to the handlers: itemToTileConverter, filterFunction, clusteringFunction, groupingModule, sortingModule, finalizeGroups, setDefaultSelection, matchesGroup, processClusteredItems, handleSpecialGroups, profiler, backendName, data. | dyn |
| `instance:getTiles(path, pathChanged, overrideDefaultSelectedTile, tileFromClusteredItems)` | Calls getDataFunction(), builds the context and delegates to the handler of the first path segment. Returns the handler's result (list of groups) or {}. | dyn |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGridSelectorGetTiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua`.*
