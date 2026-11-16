---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/advancedwheeldebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug extension that computes for each wheel the camber, toe, caster, steering axis inclination (SAI) angles and the wheel pressure, relative to the surface under the vehicle, and sends them to the UI via gui.send('advancedWheelDebugData'). Only active if at least one 'debug user' has enabled it through registerDebugUser.
--- Access: extension `advancedwheeldebug`: `extensions.load (vehicle VM)("advancedwheeldebug")`, then the global `advancedwheeldebug`
---@class advancedwheeldebug
advancedwheeldebug = {}

--- Hook called at extension initialization: clears the debug users and disables the computation.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/advancedwheeldebug.lua:12
function advancedwheeldebug.onInit() end

--- Registers or removes a debug requester; the computation is active as long as at least one value is true.
---Source: lua/vehicle/extensions/advancedwheeldebug.lua:17
---@param user string Requester identifier.
---@param value boolean true to request the display, false to remove it.
function advancedwheeldebug.registerDebugUser(user, value) end

--- Called every frame: computes and sends the wheel data if debug is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/advancedwheeldebug.lua:26
---@param dt number Time step in seconds (unused).
function advancedwheeldebug.updateGFX(dt) end

