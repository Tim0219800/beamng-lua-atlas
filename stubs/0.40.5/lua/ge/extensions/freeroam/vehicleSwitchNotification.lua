---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/vehicleSwitchNotification.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Displays an on-screen notification when the player changes vehicle or seat: vehicle name (brand, name, configuration), icon by type, occupied seat or spectator mode, and the number of selectable vehicles (current position). Clears the message when the player has no vehicle anymore or switches to walking mode (unicycle). Goes through guihooks.trigger('Message', ...) with the category "vehicleSwitch<player>". Global: freeroam_vehicleSwitchNotification.
--- Access: extension `freeroam_vehicleSwitchNotification`: `extensions.load("freeroam_vehicleSwitchNotification")`, then the global `freeroam_vehicleSwitchNotification`
---@class freeroam_vehicleSwitchNotification
freeroam_vehicleSwitchNotification = {}

--- Hook called when a player's presence in a vehicle/seat changes: displays the corresponding notification.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/vehicleSwitchNotification.lua:159
---@param player integer|nil Player (default 0).
---@param _ any Unused (old presence, inferred from code).
---@param presence table|nil {vehicleId, seatId?, permissionMode?}
function freeroam_vehicleSwitchNotification.onPlayerVehiclePresenceChanged(player, _, presence) end

--- Vehicle change hook: if the new vehicle does not exist or is the unicycle, clears this player's notification (clear=true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/vehicleSwitchNotification.lua:147
---@param _ integer Old id (unused).
---@param newId integer New id (-1 = none).
---@param player integer|nil Player (default 0).
function freeroam_vehicleSwitchNotification.onVehicleSwitched(_, newId, player) end

