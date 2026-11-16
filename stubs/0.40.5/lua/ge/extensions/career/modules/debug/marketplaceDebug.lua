---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/marketplaceDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Marketplace" career debug tab. Shows the inventory vehicles (and whether they are for sale via career_modules_marketplace.findVehicleListing), the current listings with their offers (value, gap, remaining time) and Accept/Decline buttons, plus a 'Generate Random Offer' button.
--- Access: extension `career_modules_debug_marketplaceDebug`: `extensions.load("career_modules_debug_marketplaceDebug")`, then the global `career_modules_debug_marketplaceDebug`
---@class career_modules_debug_marketplaceDebug
---@field debugName string 'Marketplace'.
---@field debugOrder number Sort order (0).
career_modules_debug_marketplaceDebug = {}

--- Draws the 'Vehicle Inventory' and 'Current Listings' sections (offers with Accept/Decline via career_modules_marketplace.acceptOffer/declineOffer) and the 'Generate Random Offer' button (generateOffer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/marketplaceDebug.lua:42
function career_modules_debug_marketplaceDebug.drawDebugMenu() end

--- Career hook; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/marketplaceDebug.lua:111
function career_modules_debug_marketplaceDebug.onCareerActivated() end

