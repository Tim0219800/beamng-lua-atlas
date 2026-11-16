---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/freshStart.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career starting mode "freshStart" (tier minor, order 200, image start_fresh.jpg): start without tutorial with 10,000 money. Description table loaded by career/career.lua, not an extension. The player (on foot) is teleported in front of the dealership, facing it.
--- Access: extension `career_startingModes_freshStart`: `extensions.load("career_startingModes_freshStart")`, then the global `career_startingModes_freshStart`
---@class career_startingModes_freshStart
---@field id string "freshStart".
---@field image string images/career/start_fresh.jpg.
---@field order number 200.
---@field tier string "minor".
career_startingModes_freshStart = {}

--- Initializes money to 10,000 (label "Starting Capital").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/freshStart.lua:6
---@param playerAttributes table Module career_modules_playerAttributes.
function career_startingModes_freshStart.initPlayerAttributes(playerAttributes) end

--- Teleports the player to (905.54, -542.39, 164.31) and orients them toward the dealership (gameplay_walk.setRot).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/freshStart.lua:9
function career_startingModes_freshStart.setupInventory() end

