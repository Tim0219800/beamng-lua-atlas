---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/deliveryRoutes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Delivery > Routes" career debug tab. 'Delivery Access Points' ImGui window listing the delivery facilities and their access points (accessPointsByName), with selection of a point. Also contains a mouse raycast (updateMouseInfo) and an arc drawing helper, largely unfinished.
--- Access: extension `career_modules_debug_deliveryRoutes`: `extensions.load("career_modules_debug_deliveryRoutes")`, then the global `career_modules_debug_deliveryRoutes`
---@class career_modules_debug_deliveryRoutes
---@field debugName string 'Delivery > Routes'.
---@field debugOrder number Sort order in the debug window (10).
career_modules_debug_deliveryRoutes = {}

--- Debug functions submenu; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:29
function career_modules_debug_deliveryRoutes.drawDebugFunctions() end

--- Draws the 'Delivery Access Points' window: tree of facilities (career_modules_delivery_generator.getFacilities) with their selectable access points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:63
---@param dt number Time delta (unused).
function career_modules_debug_deliveryRoutes.drawDebugMenu(dt) end

--- Career hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:12
function career_modules_debug_deliveryRoutes.onCareerActivated() end

--- Updates the local mouseInfo table: camera position, mouse ray, result of cameraMouseRayCast, down/hold/up states of the left button (outside ImGui capture) and click, hold and release positions/normals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:172
function career_modules_debug_deliveryRoutes.updateMouseInfo() end

