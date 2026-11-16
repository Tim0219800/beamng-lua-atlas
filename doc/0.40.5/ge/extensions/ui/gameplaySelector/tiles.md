# `ui_gameplaySelector_tiles`

*File: `lua/ge/extensions/ui/gameplaySelector/tiles.lua` · VM: Game Engine (GE) · 606 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameplaySelector_tiles`: `extensions.load("ui_gameplaySelector_tiles")`, then the global `ui_gameplaySelector_tiles`

Core of the "gameplaySelector" backend: it chooses which tiles to display according to the navigation path (all activities, detail of a system or a level, level spawn points, "discover" page). At load time it scans the tileGenerators/ folder and declares each generator (ui_gameplaySelector_tileGenerators_<name>) as a dependency. It relies on the tileClustering and tileSorting modules and provides the selector's grouping and sorting functions.

## Notes

- Tiles come from backend.getUiData(routeName).items, filled by the generators' onGameplaySelectorGetTiles hooks; getTiles does not recompute them.
- For the freeroamSelector backend, the validItems list is built by filtering on validBackends but is never used afterwards: the handlers receive the full items list (probable inconsistency).
- Recognized path types (path.keys[1]): allGameplay (default and unknown path), detailGameplay, spawnPointsForLevel, discoverPage.

**Dependencies (loaded first):** `core_locales`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameplaySelector_tiles.getTiles(path, _backend, routeName)` | Returns the tiles or groups to display for a path. Stores the backend, updates showFavouriteIconPercent of each tile (1 if favorite) and the "road" cornerIcon of the selected freeroam spawn points, then routes to the handler matching path.keys[1]. | 548 |
| `ui_gameplaySelector_tiles.getUiData()` | Returns the backend's UI data: backendName ("gameplaySelector"), the grouping functions (Type, Category, Difficulty, Source, System), the sorting functions (Name, Difficulty, Duration, Popularity) and the tileSorting module. | 594 |

### Parameter details

#### `ui_gameplaySelector_tiles.getTiles(path, _backend, routeName)`

Returns the tiles or groups to display for a path. Stores the backend, updates showFavouriteIconPercent of each tile (1 if favorite) and the "road" cornerIcon of the selected freeroam spawn points, then routes to the handler matching path.keys[1].

- `path` (*table*) : Navigation path: table with keys (list of strings).
- `_backend` (*table*) : Calling backend (gameplaySelector or freeroamSelector), with getUiData, isFavourite, backendName.
- `routeName` (*string|nil*) : Route name passed to backend.getUiData.
- **returns**: table Tiles or groups depending on the path handler.

#### `ui_gameplaySelector_tiles.getUiData()`

Returns the backend's UI data: backendName ("gameplaySelector"), the grouping functions (Type, Category, Difficulty, Source, System), the sorting functions (Name, Difficulty, Duration, Popularity) and the tileSorting module.

- **returns**: table Table backendName, groupModeFunctions, sortModeFunctions, tileSorting.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_locales plus one extension per file found in lua/ge/extensions/ui/gameplaySelector/tileGenerators/ (list built when the file loads). |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameplaySelector/tiles.lua`.*
