---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gameplay selector tile generator for scenarios (legacy system). It adds one tile per scenario returned by scenario_scenariosLoader.getList and builds the details panel with a "Start Scenario" button. Local multiplayer scenarios are classified in the scenariosMultiplayer system.
--- Access: extension `ui_gameplaySelector_tileGenerators_scenarioTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_scenarioTiles")`, then the global `ui_gameplaySelector_tileGenerators_scenarioTiles`
---@class ui_gameplaySelector_tileGenerators_scenarioTiles
ui_gameplaySelector_tileGenerators_scenarioTiles = {}

--- Hook called when a tile's details are opened. If itemDetails.scenarioSourceFile exists, loads the scenario and adds to details a block (title, description, preview, favorite, specifications, official, auxiliary, multiplayer, mod labels) with a "Start Scenario" button that records the item as recent and then calls scenario_scenariosLoader.start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua:148
---@param itemDetails table Tile showDetails data (scenarioSourceFile, key).
---@param details table List of details blocks to complete.
---@param buttonInstance table Object providing addButton.
---@param backend table Backend offering isFavourite and trackRecent.
function ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per scenario (translated name, preview, level, key scenario_<sourceFile>). A scenario whose playersCountRange.max exceeds 1 gets the helmets icon and the scenarioMultiplayer type; the beamNG and bug icons flag official and auxiliary scenarios.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua:7
---@param items table List of tiles to complete (modified in place).
---@param backend table Calling backend; backendName must be "gameplaySelector".
function ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetTiles(items, backend) end

