---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle Shopping" career debug tab. Re-reads the current level's *.facilities.json files to get the dealerships, simulates the vehicle draw (util/configListGenerator) and shows, per dealership and per subfilter, the matching configurations (model, config, name) with normalized probability, number of eligible entries and computation time.
--- Access: extension `career_modules_debug_vehicleShoppingDebug`: `extensions.load("career_modules_debug_vehicleShoppingDebug")`, then the global `career_modules_debug_vehicleShoppingDebug`
---@class career_modules_debug_vehicleShoppingDebug
---@field debugName string 'Vehicle Shopping'.
---@field debugOrder number Sort order (0).
career_modules_debug_vehicleShoppingDebug = {}

--- Draws the 'Vehicle Shopping - SubFilter Matches' window: Refresh button (recompute), counters, Search field and results per dealership/subfilter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua:127
function career_modules_debug_vehicleShoppingDebug.drawDebugMenu() end

