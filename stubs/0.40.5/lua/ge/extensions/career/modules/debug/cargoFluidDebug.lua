---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Delivery > Fluid Cargo" career debug tab. 'Fluid CargoDebug' ImGui window that shows, per delivery facility (all, the nearest or a chosen one), the material (fluid) storages: suppliers, rates and connections, relying on career_modules_delivery_* and career_modules_debug_parcelDebug.
--- Access: extension `career_modules_debug_cargoFluidDebug`: `extensions.load("career_modules_debug_cargoFluidDebug")`, then the global `career_modules_debug_cargoFluidDebug`
---@class career_modules_debug_cargoFluidDebug
---@field debugName string 'Delivery > Fluid Cargo'.
---@field debugOrder number Sort order in the debug window (11).
career_modules_debug_cargoFluidDebug = {}

--- Debug functions submenu; empty in this module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua:35
function career_modules_debug_cargoFluidDebug.drawDebugFunctions() end

--- Draws the 'Fluid CargoDebug' window: delivery time, facility choice (all, auto, or a facility with materialStorages) and a Fluid / Rate / Connections table per facility.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua:111
function career_modules_debug_cargoFluidDebug.drawDebugMenu() end

--- Career hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager) and career_modules_debug_parcelDebug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua:13
function career_modules_debug_cargoFluidDebug.onCareerActivated() end

