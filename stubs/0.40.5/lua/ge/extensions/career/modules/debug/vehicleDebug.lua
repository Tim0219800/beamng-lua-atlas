---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehicleDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicles" career debug tab. Lets you add the player vehicle to the inventory, respawn it (career_modules_inventory.debugRespawnCurrentVehicle), switch to an owned vehicle (enterVehicle) or sell it (sellVehicleFromInventory).
--- Access: extension `career_modules_debug_vehicleDebug`: `extensions.load("career_modules_debug_vehicleDebug")`, then the global `career_modules_debug_vehicleDebug`
---@class career_modules_debug_vehicleDebug
---@field debugName string 'Vehicles'.
---@field debugOrder number Sort order (2).
career_modules_debug_vehicleDebug = {}

--- Draws the buttons to add/respawn the current vehicle, the current inventory vehicle and the list of owned vehicles with enter and sell buttons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehicleDebug.lua:9
function career_modules_debug_vehicleDebug.drawDebugMenu() end

