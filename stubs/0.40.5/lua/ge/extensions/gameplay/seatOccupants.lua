---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/seatOccupants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle seat and occupant system. It records which player (or dummy occupant) occupies which seat of each vehicle (occupancy[vehId][seatId]) and the "presence" of each player (vehicle, optional seat, permission mode). It applies the occupants' weight to the vehicle, shows or hides occupant meshes (depending on the camera and the enableSeatOccupants setting), handles the seat camera, the blocking of driving controls for a passenger (action maps mask) and exiting the vehicle. Vehicles without a seat configuration (occupantSystem / occupantSlotsById in the JBeam data) do not go through this system. Useful to modders for putting a player in a specific seat, adding weighted dummy passengers or finding out who is driving.
--- Access: extension `gameplay_seatOccupants`: `extensions.load("gameplay_seatOccupants")`, then the global `gameplay_seatOccupants`
---@class gameplay_seatOccupants
---@field debugDisableOccupantSystem boolean Debug: disables the whole seat system and reverts to the old behavior (false by default).
---@field debugDisableOccupantWeight boolean Debug: disables adding the occupants' weight (false by default).
---@field dependencies string[] Extensions loaded beforehand (core_camera, core_vehicle_manager, core_input_actionFilter, core_gamestate, core_multiseat, ui_vehicleSelector_vehicleSpecifications).
---@field enablePresenceDebugMessages boolean Displays a message on each presence change (false by default).
---@field enableSeatEjection boolean If true, enterSeat ejects (walking mode) the player already seated in this seat (false by default).
gameplay_seatOccupants = {}

--- Indicates whether the player can enter the vehicle (vehicle switching or walking allowed).
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:365
---@param vehId integer Vehicle identifier.
---@param player integer|nil Player index (0 by default).
---@return boolean  true if entering is possible.
function gameplay_seatOccupants.canEnterVehicle(vehId, player) end

--- Adds 10 kg to each occupant (clamped to 119) and displays a message with the weight.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1497
---@param vehId integer|nil Vehicle; default the player 0 vehicle.
---@return number|nil  Displayed weight, nil if no occupant.
function gameplay_seatOccupants.cheeseburger(vehId) end

--- Removes the dummy occupant from a seat.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1422
---@param vehId integer Vehicle identifier.
---@param seatId string Seat.
---@return boolean  true if removed.
---@return string|nil  'notDummy' if there is nothing to remove.
function gameplay_seatOccupants.clearDummyOccupant(vehId, seatId) end

--- Removes all dummy occupants from a vehicle, or from all vehicles if vehId is nil.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1434
---@param vehId integer|nil Targeted vehicle.
---@return integer  Number of occupants removed.
function gameplay_seatOccupants.clearDummyOccupants(vehId) end

--- Frees seats. Without a second argument: all occupants of the vehicle. With a number: removes that player from all vehicles.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:875
---@param vehId integer|nil Vehicle identifier.
---@param seatIdOrPlayer string|integer|nil Nil for the whole vehicle, a number for a player; a seat name is handled by the rest of the function _anon(inferred from code).
function gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer) end

--- Entry point of a seat's "enterSeat" trigger: finds the seat from the trigger then calls requestEnterSeat. In debug mode, enters 'unrestricted' without a seat.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1597
---@param vehId integer Vehicle identifier.
---@param triggerId any Seat trigger identifier.
---@param player integer|nil Player (0 by default).
---@return boolean|nil  true if seated.
function gameplay_seatOccupants.enterSeat(vehId, triggerId, player) end

--- Lowest player index allowed to drive the vehicle ('driver' or 'unrestricted' mode).
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1388
---@param vehId integer Vehicle identifier.
---@return integer|nil  Driver index, nil if there are only passengers.
function gameplay_seatOccupants.getDriverPlayer(vehId) end

--- Declared version of the occupant system in the vehicle data.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:80
---@param vehId integer Vehicle identifier.
---@return any|nil  Version, or nil if absent.
function gameplay_seatOccupants.getOccupantSystemVersion(vehId) end

--- Copy of a player's presence in a vehicle.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:287
---@param player integer|nil Player index (0 by default).
---@return table|nil  {vehicleId, seatId?, permissionMode, permissionOverride?} or nil.
function gameplay_seatOccupants.getPlayerPresence(player) end

--- Computes where the player exits the vehicle: a point beside the body, on the seat side (exitNode/exitSide of the slot, otherwise side inferred from the position), offset 0.7 m beyond the body.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1520
---@param player integer|nil Player (0 by default).
---@param vehId integer|nil Vehicle; default the player's vehicle.
---@return vec3|nil  Exit position.
---@return vec3|nil  Seat position.
function gameplay_seatOccupants.getSeatExitData(player, vehId) end

--- Lists the seats of a vehicle with their state.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1322
---@param vehId integer Vehicle identifier.
---@return table[]  Items {seatId, isDriver, occupied, occupantType ('player'|'dummy'), player, weight, color, permissionMode, displayName, defaultPermissionMode, cameraName, actionMaps, seatExitNode, seatExitSide, partPath, seatPartPath}.
function gameplay_seatOccupants.getSeats(vehId) end

--- List of player presences in a vehicle, sorted by player.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1371
---@param vehId integer Vehicle identifier.
---@return table[]  Items {player, seatId, permissionMode, unseated}.
function gameplay_seatOccupants.getVehiclePresences(vehId) end

--- Hook before a vehicle is replaced: remembers whether it had no seat system.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1809
---@param vehId integer Vehicle identifier.
function gameplay_seatOccupants.onBeforeVehicleReplaced(vehId) end

--- Hook before the walking mode toggle: if the player switches to walking, lifts the driving block.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1878
---@param enabled boolean true if switching to walking.
---@param _ any Not used.
---@param player integer|nil Player index.
function gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player) end

--- Hook: a player's camera changes; updates occupant visibility (e.g. hide the head in first-person view).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1756
---@param player integer|nil Player index.
---@param camName string Camera name.
---@param vid integer|nil Camera vehicle.
function gameplay_seatOccupants.onCameraChanged(player, camName, vid) end

--- Hook: clears occupant overrides and occupies player 0's current vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1865
function gameplay_seatOccupants.onClientStartMission() end

--- Hook: restores the state after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1971
---@param data table Data from onSerialize.
function gameplay_seatOccupants.onDeserialized(data) end

--- Hook: restores the serialized state if it exists, otherwise occupies the existing players.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1939
---@param data table|nil Serialized data.
function gameplay_seatOccupants.onExtensionLoaded(data) end

--- Hook: removes the overrides, restores the cameras and frees the action maps mask.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1952
function gameplay_seatOccupants.onExtensionUnloaded() end

--- Hook: recalculates presences and visuals when the local participants change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1870
function gameplay_seatOccupants.onLocalParticipantsChanged() end

--- Hook: serializes presences and occupied seats before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1962
---@return table  {version, playerPresence, seatClaims, occupancy}.
function gameplay_seatOccupants.onSerialize() end

--- Hook: reapplies the occupant visuals (enableSeatOccupants setting).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1746
function gameplay_seatOccupants.onSettingsChanged() end

--- Hook: recalculates presences and visuals after a split-screen change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1750
function gameplay_seatOccupants.onSplitScreenChanged() end

--- Hook: frees all occupancy and presence data of the destroyed vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1833
---@param vehId integer Vehicle identifier.
function gameplay_seatOccupants.onVehicleDestroyed(vehId) end

--- Hook after replacement: reapplies the state and reassigns unseated players.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1813
---@param vehId integer Vehicle identifier.
function gameplay_seatOccupants.onVehicleReplaced(vehId) end

--- Hook: reapplies weight and visuals after a reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1826
---@param vehId integer Vehicle identifier.
function gameplay_seatOccupants.onVehicleResetted(vehId) end

--- Hook: reapplies weight and visuals for a vehicle that has just appeared.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1793
---@param vehId integer Vehicle identifier.
function gameplay_seatOccupants.onVehicleSpawned(vehId) end

--- Hook: the player changes vehicle; updates their occupancy.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1612
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer|nil Player index.
function gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player) end

--- Hook to customize the label and icon of the "enterSeat" action of a seat trigger ("Sit here", driver or passenger seat).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1067
---@param data table Modified table (actionName, vehicleId, player, title, icon).
function gameplay_seatOccupants.onVehicleTriggerActionLabel(data) end

--- Reasserts the visibility of occupant meshes after a change made without going through the sync hooks (used by gameplay_traffic).
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:646
---@param vehId integer Vehicle identifier.
function gameplay_seatOccupants.refreshOccupantMeshes(vehId) end

--- Picks a free seat (taking the walking position into account if any) and seats the player there. With no free seat, falls back to unseated presence if the default mode is 'unrestricted', otherwise shows "vehicle full".
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1202
---@param vehId integer Vehicle identifier.
---@param player integer|nil Player.
---@param walkingPos vec3|nil Position of the player on foot, used to pick the nearest seat.
---@return boolean|nil  nil if the vehicle does not use the seat system.
function gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos) end

--- Asks a player to sit in a given seat, entering the vehicle if needed (on foot or by switching vehicle). If the player is already in this seat, they exit (switch to walking mode). Shows a message if the seat is taken, if the player cannot leave their seat, or if the vehicle is not accessible.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1138
---@param vehId integer Vehicle identifier.
---@param seatId string Targeted seat.
---@param player integer|nil Player (0 by default).
---@param permissionOverride string|nil Forced permission mode.
---@return boolean|nil  true if the player ends up in this seat (or exits); nil if vehId or seatId is missing.
function gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride) end

--- Places a player in the vehicle without a seat ("unseated" presence), with an optional permission mode.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1217
---@param player integer|nil Player.
---@param vehId integer Vehicle identifier.
---@param permissionMode string|nil 'driver', 'passenger' or 'unrestricted'.
---@return boolean  true if the unseated presence is established.
---@return string|nil  'invalidVehicle' or 'invalidPermissionMode' on failure.
function gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode) end

--- Removes 10 kg from each occupant (clamped to 49) and displays a message with the weight.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1501
---@param vehId integer|nil Vehicle; default the player 0 vehicle.
---@return number|nil  Displayed weight, nil if no occupant.
function gameplay_seatOccupants.salad(vehId) end

--- Places a dummy occupant (randomly colored mesh) with a weight in a free seat.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1400
---@param vehId integer Vehicle identifier.
---@param seatId string Seat.
---@param weight number|nil Weight; default 89, minimum 0.
---@return boolean  true if placed.
---@return string|nil  'invalidVehicle', 'invalidSeat', 'occupied' or 'reserved'.
function gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight) end

--- Places a player in a seat (no animation or vehicle change). Frees their other seats, records the presence, applies the weight, updates the controls and the camera.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:842
---@param vehId integer Vehicle identifier.
---@param seatId string|nil Seat; default the driver seat.
---@param player integer|nil Player (0 by default).
---@param weight number|nil Occupant weight (default 89).
---@param permissionOverride string|nil Forced permission mode.
---@return boolean  false if invalid vehicle, invalid seat or unavailable seat.
function gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride) end

--- Changes the permission mode of a player already present in a vehicle.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:478
---@param player integer|nil Player index (0 by default).
---@param permissionMode string 'driver', 'passenger' or 'unrestricted'.
---@return boolean  true if applied.
---@return string|nil  Failure cause: 'invalidPermissionMode' or 'noPresence'.
function gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode) end

--- Forces the display (true) or hiding (false) of a vehicle's occupants, regardless of the global setting; nil removes the override.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1718
---@param vehId integer Vehicle identifier.
---@param enabled boolean|nil Override.
---@return boolean  false if the vehicle does not exist.
function gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled) end

--- Shows the "vehicle full" UI message to the player.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:379
---@param player integer|nil Player index.
function gameplay_seatOccupants.showVehicleFullMessage(player) end

--- Moves to the next free seat (direction > 0) or the previous one (direction < 0) of the current vehicle, with the driver at the head of the list.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1254
---@param player integer|nil Player.
---@param direction integer|nil Direction; 1 by default.
---@return boolean  true if a seat was taken.
function gameplay_seatOccupants.switchSeat(player, direction) end

--- Toggles between "seated" and "unseated" in the current vehicle.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:1300
---@param player integer|nil Player.
---@return boolean  Success.
function gameplay_seatOccupants.toggleUnseated(player) end

--- Indicates whether the vehicle uses the seat system (occupantSystem.enabled, otherwise presence of occupant slots in the vehicle data). Always false if debugDisableOccupantSystem.
---Source: lua/ge/extensions/gameplay/seatOccupants.lua:85
---@param vehId integer Vehicle identifier.
---@return boolean  true if the vehicle has managed seats.
function gameplay_seatOccupants.usesSeatSystem(vehId) end

