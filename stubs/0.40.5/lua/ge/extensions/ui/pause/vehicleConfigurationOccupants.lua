---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension that feeds the "Occupants" tab of the vehicle configuration screen (pause menu). It lists the seats of the configured vehicle (via gameplay_seatOccupants), the available players (core_multiseat / core_playerPersonas) and lets you seat a player, a dummy or nobody on each seat. The targeted vehicle is the session's (sessionVehicleId) or, failing that, the one resolved by core_vehicle_configTarget. Each change triggers the UI hook VehicleConfigOccupantsStateChanged.
--- Access: extension `ui_pause_vehicleConfigurationOccupants`: `extensions.load("ui_pause_vehicleConfigurationOccupants")`, then the global `ui_pause_vehicleConfigurationOccupants`
---@class ui_pause_vehicleConfigurationOccupants
---@field dependencies table<integer, string> Extensions loaded before this one: gameplay_seatOccupants, core_multiseat, core_playerPersonas, core_vehicle_configTarget, core_vehicle_manager.
---@field onVehicleReplaced function Alias of onVehicleSpawned: reapplies the override and notifies the UI if the replaced vehicle is the session's.
---@field onVehicleResetted function Alias of onVehicleSpawned: same behavior after a vehicle reset.
ui_pause_vehicleConfigurationOccupants = {}

--- Starts a configuration session on the targeted vehicle. Removes the override from the old vehicle if it changed, stores the new one and applies the occupants override.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:118
---@param enabled boolean|nil false to disable occupants during configuration; any other value (including nil) enables them.
---@return table  The result of getState().
function ui_pause_vehicleConfigurationOccupants.beginSession(enabled) end

--- Ends the session: removes the occupants override on the session vehicle and resets the local state (sessionVehicleId, active tab).
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:129
function ui_pause_vehicleConfigurationOccupants.endSession() end

--- Places an 89 kg dummy on each free seat of the targeted vehicle.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:202
---@return integer  Number of dummies added (0 if no vehicle).
function ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies() end

--- Returns the state displayed by the tab: vehicle id, seats, players, multi-seat mode, installed part paths (partPath), and enabledWhileConfiguring. If no valid vehicle is targeted, returns {vehicleId=nil, seats={}, players={}}.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:102
---@return table  {vehicleId, seats, players, multiseatActive, vehiclePartPaths, enabledWhileConfiguring}. players: sorted list of {id, label, color '#RRGGBB', icon}.
function ui_pause_vehicleConfigurationOccupants.getState() end

--- Hook called when the extension is unloaded; calls endSession.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:263
function ui_pause_vehicleConfigurationOccupants.onExtensionUnloaded() end

--- Hook called when the list of local participants (multi-seat) changes; notifies the UI if a session is in progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:232
function ui_pause_vehicleConfigurationOccupants.onLocalParticipantsChanged() end

--- Hook called when an occupant sits down; notifies the UI if it is the session vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:224
---@param _ any Ignored (inferred from code).
---@param vehId integer Id of the vehicle concerned.
function ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId) end

--- Hook called when an occupant leaves a seat; notifies the UI if it is the session vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:228
---@param _ any Ignored (inferred from code).
---@param vehId integer Id of the vehicle concerned.
function ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId) end

--- Hook called when the configuration target changes: removes the override from the old vehicle, switches to the new one and notifies the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:252
function ui_pause_vehicleConfigurationOccupants.onVehicleConfigTargetChanged() end

--- Hook called when a vehicle is destroyed; if it is the session's, forgets the session and notifies the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:246
---@param vehId integer Vehicle id.
function ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId) end

--- Hook called when a vehicle spawns; if it is the session's, reapplies the override and notifies the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:236
---@param vehId integer Vehicle id.
function ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId) end

--- Removes all dummies from the targeted vehicle.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:216
---@return integer  Number removed, as returned by gameplay_seatOccupants.clearDummyOccupants (0 if no vehicle).
function ui_pause_vehicleConfigurationOccupants.removeAllDummies() end

--- Enables or disables occupants during configuration and reapplies the override.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:137
---@param enabled boolean|nil false to disable, otherwise enabled.
---@return boolean  The value retained.
function ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled) end

--- Indicates whether the Occupants tab is displayed; as long as it is, occupants stay active even if enabledWhileConfiguring is false.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:143
---@param active boolean true if the tab is open.
function ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active) end

--- Sets a seat's occupant: empty, dummy or player. Frees the seat if needed before reoccupying it, then notifies the UI.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:148
---@param seatId string Seat identifier (seat.seatId).
---@param occupant string 'empty', 'dummy' or 'player:<index>'.
---@return table  {success=boolean, reason=string|nil}. Reasons: seatMissing, invalidOccupant, enterFailed, occupied, or the reason returned by setDummyOccupant.
function ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant) end

--- Empties all seats of the targeted vehicle and notifies the UI.
---Source: lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua:194
---@return boolean  false if no vehicle is targeted, otherwise true.
function ui_pause_vehicleConfigurationOccupants.unseatAll() end

