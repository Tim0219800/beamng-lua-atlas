---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tile generator of the gameplay selector for campaigns (legacy system). It adds one tile per campaign returned by campaign_campaignsLoader.getList() and builds the details panel with a "Start Campaign" button. It is called via the hooks onGameplaySelectorGetTiles and onGameplaySelectorGetDetails.
--- Access: extension `ui_gameplaySelector_tileGenerators_campaignTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_campaignTiles")`, then the global `ui_gameplaySelector_tileGenerators_campaignTiles`
---@class ui_gameplaySelector_tileGenerators_campaignTiles
ui_gameplaySelector_tileGenerators_campaignTiles = {}

--- Hook called when the user opens a tile's details. If itemDetails.campaignSourceFile exists, loads the campaign and adds to details a block with title, description, preview, favorite, specifications (difficulty, authors, date, players, number of scenarios), labels (official, auxiliary, mod) and a "Start Campaign" button. This button records the item as recent, navigates to "play" and launches campaign_campaignsLoader.start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua:122
---@param itemDetails table Tile showDetails data (campaignSourceFile, key).
---@param details table List of details blocks to complete.
---@param buttonInstance table Object providing addButton to create the buttons.
---@param backend table Backend offering isFavourite and trackRecent.
function ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per campaign (translated name, preview, level, beamNG or bug icons, key campaign_<sourceFile>). In all cases adds a "More Campaigns..." tile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua:7
---@param items table List of tiles to complete (modified in place).
---@param backend table Calling backend; backendName must be "gameplaySelector" for the campaign tiles.
function ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetTiles(items, backend) end

