---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehOfferDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Delivery > Veh Offers" career debug tab. 'Vehicle Offer Debug' window listing, per delivery facility, the non-expired vehicle/trailer offers (career_modules_delivery_vehicleOfferManager). The entry '> Available vehicle/trailer per facility' prints the number of offers per unlock level (1 to 5) via isVehicleTagUnlocked.
--- Access: extension `career_modules_debug_vehOfferDebug`: `extensions.load("career_modules_debug_vehOfferDebug")`, then the global `career_modules_debug_vehOfferDebug`
---@class career_modules_debug_vehOfferDebug
---@field debugName string 'Delivery > Veh Offers'.
---@field debugOrder number Sort order (11).
career_modules_debug_vehOfferDebug = {}

--- Entries '> Available vehicle per facility' and '> Available trailer per facility': count the non-expired offers per level and print the sorted result.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehOfferDebug.lua:35
function career_modules_debug_vehOfferDebug.drawDebugFunctions() end

--- Draws the 'Vehicle Offer Debug' window: delivery time, facility choice (all, auto or id) and offer tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehOfferDebug.lua:117
function career_modules_debug_vehOfferDebug.drawDebugMenu() end

--- Hook: stores the delivery modules and parcelDebug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehOfferDebug.lua:13
function career_modules_debug_vehOfferDebug.onCareerActivated() end

