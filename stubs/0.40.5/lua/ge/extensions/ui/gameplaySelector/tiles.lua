---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the "gameplaySelector" backend: it chooses which tiles to display according to the navigation path (all activities, detail of a system or a level, level spawn points, "discover" page). At load time it scans the tileGenerators/ folder and declares each generator (ui_gameplaySelector_tileGenerators_<name>) as a dependency. It relies on the tileClustering and tileSorting modules and provides the selector's grouping and sorting functions.
--- Access: extension `ui_gameplaySelector_tiles`: `extensions.load("ui_gameplaySelector_tiles")`, then the global `ui_gameplaySelector_tiles`
---@class ui_gameplaySelector_tiles
---@field dependencies string[] core_locales plus one extension per file found in lua/ge/extensions/ui/gameplaySelector/tileGenerators/ (list built when the file loads).
ui_gameplaySelector_tiles = {}

--- Returns the tiles or groups to display for a path. Stores the backend, updates showFavouriteIconPercent of each tile (1 if favorite) and the "road" cornerIcon of the selected freeroam spawn points, then routes to the handler matching path.keys[1].
---Source: lua/ge/extensions/ui/gameplaySelector/tiles.lua:548
---@param path table Navigation path: table with keys (list of strings).
---@param _backend table Calling backend (gameplaySelector or freeroamSelector), with getUiData, isFavourite, backendName.
---@param routeName string|nil Route name passed to backend.getUiData.
---@return table  Tiles or groups depending on the path handler.
function ui_gameplaySelector_tiles.getTiles(path, _backend, routeName) end

--- Returns the backend's UI data: backendName ("gameplaySelector"), the grouping functions (Type, Category, Difficulty, Source, System), the sorting functions (Name, Difficulty, Duration, Popularity) and the tileSorting module.
---Source: lua/ge/extensions/ui/gameplaySelector/tiles.lua:594
---@return table  Table backendName, groupModeFunctions, sortModeFunctions, tileSorting.
function ui_gameplaySelector_tiles.getUiData() end

