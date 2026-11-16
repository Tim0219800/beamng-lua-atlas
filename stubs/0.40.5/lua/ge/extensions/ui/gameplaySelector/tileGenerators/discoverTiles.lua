---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tile generator of the gameplay selector for "quick-start experiences" (quickStartExperiences system). It reads the pages and cards from gameplay_discover.getDiscoverPages(), creates one tile per page, groups a page's cards into "Experiences" and "Challenges" (missions), and provides the details and the launch button of a card.
--- Access: extension `ui_gameplaySelector_tileGenerators_discoverTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_discoverTiles")`, then the global `ui_gameplaySelector_tileGenerators_discoverTiles`
---@class ui_gameplaySelector_tileGenerators_discoverTiles
---@field dependencies string[] Extensions loaded before this one: gameplay_discover.
ui_gameplaySelector_tileGenerators_discoverTiles = {}

--- Returns the tile groups of a discover page: a "discoverExperiences" group (non-mission cards) and a "discoverChallenges" group (mission cards), each only if it is not empty. Returns an empty table if the page is not found.
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua:106
---@param pageKey string Page key (page.folder, otherwise page.title, otherwise its index).
---@return table[]  List of groups {key, label, tiles}.
function ui_gameplaySelector_tileGenerators_discoverTiles.getPageGroups(pageKey) end

--- Hook called when the details are opened. If itemDetails.discoverId designates a known card, adds to details a block (title, description, preview, favorite, labels) with a "play" button that records the item as recent then launches the card.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua:164
---@param itemDetails table showDetails data (discoverId, key).
---@param details table List of details blocks to complete.
---@param buttonInstance table Object providing addButton.
---@param backend table Backend offering isFavourite and trackRecent.
function ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook called when the selector collects its tiles. For the gameplaySelector backend only, adds a discoverPage tile per page containing at least one card, with gotoPath, sub-element count and official or mod icons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua:142
---@param items table List of tiles to complete.
---@param backend table Calling backend.
function ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetTiles(items, backend) end

