---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_pause_vehicleConfigurationOccupants` : `extensions.load("ui_pause_vehicleConfigurationOccupants")`, puis la globale `ui_pause_vehicleConfigurationOccupants`
---@class ui_pause_vehicleConfigurationOccupants
---@field dependencies table
---@field onVehicleReplaced any
---@field onVehicleResetted any
ui_pause_vehicleConfigurationOccupants = {}

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:118
---@param enabled any
function ui_pause_vehicleConfigurationOccupants.beginSession(enabled) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:129
function ui_pause_vehicleConfigurationOccupants.endSession() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:202
function ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:102
function ui_pause_vehicleConfigurationOccupants.getState() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:263
function ui_pause_vehicleConfigurationOccupants.onExtensionUnloaded() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:232
function ui_pause_vehicleConfigurationOccupants.onLocalParticipantsChanged() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:224
---@param _ any
---@param vehId any
function ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:228
---@param _ any
---@param vehId any
function ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:252
function ui_pause_vehicleConfigurationOccupants.onVehicleConfigTargetChanged() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:246
---@param vehId any
function ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:236
---@param vehId any
function ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:216
function ui_pause_vehicleConfigurationOccupants.removeAllDummies() end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:137
---@param enabled any
function ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:143
---@param active any
function ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:148
---@param seatId any
---@param occupant any
function ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant) end

---Source : lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:194
function ui_pause_vehicleConfigurationOccupants.unseatAll() end

