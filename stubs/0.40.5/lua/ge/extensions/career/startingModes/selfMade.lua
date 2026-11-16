---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/selfMade.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career starting mode "selfMade" (tier minor, order 300, ignore = true): 1,000 money and a randomly generated old car. setupInventory picks, among the eligible vehicles (util_configListGenerator), those passing a filter (years 1990-2005, value 1000-50000, config types Factory or Service), draws a year, estimates by bisection (28 iterations) the mileage that brings the adjusted value closest to a target of 4000 to 5000, keeps the best candidate, spawns it at (838.51, -522.42, 165.75) with a random paint, adds it to the inventory and fills the tanks to 15%. Description table loaded by career/career.lua, not an extension.
--- Access: extension `career_startingModes_selfMade`: `extensions.load("career_startingModes_selfMade")`, then the global `career_startingModes_selfMade`
---@class career_startingModes_selfMade
---@field description string "Start with nothing but a beaten down car, a handful of dollars and a dream."
---@field high number
---@field id string "selfMade".
---@field ignore boolean true.
---@field image string images/career/start_beater.jpg.
---@field maxYear any
---@field order number 300.
---@field rot any
---@field tier string "minor".
---@field title string "Self-Made".
career_startingModes_selfMade = {}

--- Initializes money to 1,000.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/selfMade.lua:9
---@param playerAttributes table Module career_modules_playerAttributes.
function career_startingModes_selfMade.initPlayerAttributes(playerAttributes) end

--- Generates and spawns the starting car (see module description) and adds it to the inventory with initPartConditions for the estimated mileage.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/selfMade.lua:12
---@param inventoryModule table Module career_modules_inventory (uses addVehicle).
function career_startingModes_selfMade.setupInventory(inventoryModule) end

