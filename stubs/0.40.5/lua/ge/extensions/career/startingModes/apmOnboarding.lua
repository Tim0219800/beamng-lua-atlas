---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/apmOnboarding.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career starting mode "apmOnboarding" (tier major, order 100, image start_apm.jpg): this is the start with tutorial. This file does not return an extension module but a simple description table, loaded by career/career.lua from the startingModes folder. It starts the money at 0 and prepares the tutorial vehicles with gameplay_tutorial_setup.setupVehicles().
--- Access: extension `career_startingModes_apmOnboarding`: `extensions.load("career_startingModes_apmOnboarding")`, then the global `career_startingModes_apmOnboarding`
---@class career_startingModes_apmOnboarding
---@field id string "apmOnboarding".
---@field image string images/career/start_apm.jpg.
---@field order number 100 (display order).
---@field tier string "major".
career_startingModes_apmOnboarding = {}

--- Initializes the player's attributes: money = 0 (label "Starting Capital").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/apmOnboarding.lua:6
---@param playerAttributes table Module career_modules_playerAttributes (uses setAttributes).
function career_startingModes_apmOnboarding.initPlayerAttributes(playerAttributes) end

--- Prepares the tutorial vehicles (gameplay_tutorial_setup.setupVehicles).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/apmOnboarding.lua:9
function career_startingModes_apmOnboarding.setupInventory() end

