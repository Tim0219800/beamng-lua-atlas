---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/parcelDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Delivery > Parcels" career debug tab. 'Parcel Debug' ImGui window showing, for each delivery facility (all, the nearest within a 50 m radius, or a chosen one), the header, the outgoing (outCargo) and incoming (inCargo) parcels. The entry '> Available parcel per facility' prints to the console the number of available parcels per tier (L1 to L5) and per facility.
--- Access: extension `career_modules_debug_parcelDebug`: `extensions.load("career_modules_debug_parcelDebug")`, then the global `career_modules_debug_parcelDebug`
---@class career_modules_debug_parcelDebug
---@field debugName string 'Delivery > Parcels'.
---@field debugOrder number Sort order (10).
career_modules_debug_parcelDebug = {}

--- Entry '> Available parcel per facility': counts the non-expired/non-delivered parcels per minimum tier (according to career_modules_delivery_parcelMods.lockedBecauseOfMods) and prints the sorted table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/parcelDebug.lua:33
function career_modules_debug_parcelDebug.drawDebugFunctions() end

--- Draws the 'Parcel Debug' window: delivery time, facility choice (all, auto, or id) then the tables of the selected facilities.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/parcelDebug.lua:85
function career_modules_debug_parcelDebug.drawDebugMenu() end

--- Draws the header (table) of a delivery facility: name, storages and generation information.
---Source: lua/ge/extensions/career/modules/debug/parcelDebug.lua:136
---@param facility table Delivery facility.
---@param outCargo table Outgoing parcels of the facility.
---@param inCargo table Incoming parcels of the facility.
---@param ignoreGenerators boolean|nil Hides generator information if true.
function career_modules_debug_parcelDebug.drawFacilityHeader(facility, outCargo, inCargo, ignoreGenerators) end

--- Draws the table of a facility's incoming parcels (Id, Name, Slots…).
---Source: lua/ge/extensions/career/modules/debug/parcelDebug.lua:272
---@param facility table Delivery facility.
---@param inCargo table Incoming parcels.
function career_modules_debug_parcelDebug.drawFacilityInCargo(facility, inCargo) end

--- Draws the table of a facility's outgoing parcels (Id, Name…).
---Source: lua/ge/extensions/career/modules/debug/parcelDebug.lua:200
---@param facility table Delivery facility.
---@param outCargo table Outgoing parcels.
function career_modules_debug_parcelDebug.drawFacilityOutCargo(facility, outCargo) end

--- Hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/parcelDebug.lua:12
function career_modules_debug_parcelDebug.onCareerActivated() end

