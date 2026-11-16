---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tile generator of the freeroam selector: one tile per spawn point of each level in core_levels.getList(). It also builds a level's details panel (size, biome, roads, country…), the "Start Freeroam" and "Configure" buttons, search text filtering and the opening of the level configuration window. A modder can plug their own buttons into it via the hook onFreeroamSelectorGetDetails.
--- Access: extension `ui_gameplaySelector_tileGenerators_levelTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_levelTiles")`, then the global `ui_gameplaySelector_tileGenerators_levelTiles`
---@class ui_gameplaySelector_tileGenerators_levelTiles
ui_gameplaySelector_tileGenerators_levelTiles = {}

--- Filter hook declared by the tiles (filterHook). If the search text, case-insensitively, appears in the level's biome, suggested use, characteristics, roads or country, sets result.match to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:280
---@param item table Tile tested (field levelName used).
---@param searchText string|nil Text entered; empty or nil, the function does nothing.
---@param result table Table whose match field is set to true on a match.
function ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result) end

--- Hook called when the freeroam selector opens with stored details. Reopens the level configuration window with the level, the spawn point and itemDetails.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:335
---@param itemDetails table|nil Stored details; no effect if nil.
---@param backend table Calling backend (unused, the name "freeroamSelector" is hardcoded).
function ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend) end

--- Hook called when a level tile's details are opened. Finds the level and its spawn point, fills in title, description, preview, favorite, specifications and labels, then adds the "Start Freeroam" (freeroam_freeroam.startFreeroamByName) and "Configure" (opens menu.freeroamconfigurator) buttons. Emits the hook onFreeroamSelectorGetDetails so that other extensions modify the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:185
---@param itemDetails table showDetails data (levelName, spawnPointObjectName, key).
---@param details table List of details blocks to complete.
---@param buttonInstance table Object providing addButton.
---@param backend table Backend offering isFavourite, trackRecent, getUiData and getCustomDetailsButtons.
function ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook called when the selector collects its tiles. Walks through the levels and, for each spawn point, adds a tile (name "point (level)", preview, key spawnPoint_<level>_<object>, region, map size, beamNG, Camshaft or bug icons).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:43
---@param items table List of tiles to complete (modified in place).
function ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items) end

--- Triggers the UI event openLevelConfigurationPopup with the level data to display the configuration window.
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:330
---@param levelData table Table with levelName, spawnPointObjectName, level, spawnPoint, backendName, itemDetails.
function ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData) end

--- Sets the backend's default action: "configureFreeroam" if newValue is true, otherwise "startFreeroam" (via ui_gridSelector.setDisplayDataOption). Logs an error if backendName is missing.
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:321
---@param backendName string Selector backend name.
---@param newValue boolean true to always show the configuration window.
function ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue) end

