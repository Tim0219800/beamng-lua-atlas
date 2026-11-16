---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/walk.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Player "walking" mode: leaving the vehicle spawns a special "unicycle" vehicle (the character) that the player controls on foot; getting back into a nearby vehicle deactivates it. Manages, per player (including multiseat/split screen), the unicycle, its face (face part) and its color, detects the nearest vehicle within 2 m (distance to the edges of its oriented box), shows the "walkingmode" message and exposes a vehicle blacklist. A modder uses it to teleport/place the player, force walking mode or forbid it.
--- Access: extension `gameplay_walk`: `extensions.load("gameplay_walk")`, then the global `gameplay_walk`
---@class gameplay_walk
gameplay_walk = {}

--- Excludes a vehicle from the candidates for entry in walking mode.
---Source: lua/ge/extensions/gameplay/walk.lua:561
---@param vehId integer Vehicle id.
function gameplay_walk.addVehicleToBlacklist(vehId) end

--- Like canToggleWalkingMode, but also requires the requested state to differ from the active state.
---Source: lua/ge/extensions/gameplay/walk.lua:306
---@param enabled boolean Requested state.
---@param force boolean|nil Ignores restrictions.
---@param player integer|nil Player index.
---@return boolean
function gameplay_walk.canSetWalkingMode(enabled, force, player) end

--- Returns whether the player can switch modes: force, or parking speed + toggling enabled + action not blocked + no replay playing.
---Source: lua/ge/extensions/gameplay/walk.lua:298
---@param force boolean|nil Ignores all restrictions.
---@param player integer|nil Player index.
---@return boolean
function gameplay_walk.canToggleWalkingMode(force, player) end

--- Clears the blacklist.
---Source: lua/ge/extensions/gameplay/walk.lua:573
function gameplay_walk.clearBlacklist() end

--- Allows or forbids manual switching between vehicle and walking.
---Source: lua/ge/extensions/gameplay/walk.lua:553
---@param enabled boolean true to allow.
function gameplay_walk.enableToggling(enabled) end

--- Returns the blacklist table (id -> true), not a copy.
---Source: lua/ge/extensions/gameplay/walk.lua:577
---@return table<integer, boolean>
function gameplay_walk.getBlacklist() end

--- Returns the unicycle the player is controlling right now, whether or not it is the one stored in unicycleIds.
---Source: lua/ge/extensions/gameplay/walk.lua:114
---@param player integer|nil Player index.
---@return userdata|nil  Unicycle vehicle object, nil otherwise.
function gameplay_walk.getCurrentUnicycle(player) end

--- Computes a position near a vehicle's driver door (left or right side depending on the driving side), oriented toward the vehicle's center.
---Source: lua/ge/extensions/gameplay/walk.lua:215
---@param veh userdata Vehicle object.
---@return vec3  Position.
---@return vec3  Forward direction (z = 0).
---@return vec3  Up vector (0,0,1).
function gameplay_walk.getDoorsidePosRot(veh) end

--- Character face. Priority: unicycle part (parts selector), playerCharacterFace setting (per persona in split screen), last known face, random face.
---Source: lua/ge/extensions/gameplay/walk.lua:135
---@param player integer|nil Player index.
---@return string  Name of the skin_character_face part.
function gameplay_walk.getFacePart(player) end

--- Makes the player enter a vehicle (be:enterVehicle), storing their current unicycle.
---Source: lua/ge/extensions/gameplay/walk.lua:252
---@param vehicle userdata Vehicle to enter.
---@param player integer|nil Player index.
function gameplay_walk.getInVehicle(vehicle, player) end

--- Character paint. Priority: persona paint (multiseat), unicycle paint (config menu), last known paint, saved playerCharacterColor color.
---Source: lua/ge/extensions/gameplay/walk.lua:150
---@param player integer|nil Player index.
---@return table  Vehicle paint.
function gameplay_walk.getPaint(player) end

--- Unicycle position and camera orientation of the on-foot player.
---Source: lua/ge/extensions/gameplay/walk.lua:530
---@param player integer|nil Player index.
---@return vec3|nil  Position.
---@return quat|nil  Camera rotation.
function gameplay_walk.getPosRot(player) end

--- Unicycle position as three numbers (no allocation).
---Source: lua/ge/extensions/gameplay/walk.lua:538
---@param player integer|nil Player index.
---@return number|nil  x, y, z (nil if the player is not on foot).
function gameplay_walk.getPosXYZ(player) end

--- On-foot player's camera orientation as four numbers.
---Source: lua/ge/extensions/gameplay/walk.lua:546
---@param player integer|nil Player index.
---@return number|nil  x, y, z, w (nil if the player is not on foot).
function gameplay_walk.getRotXYZW(player) end

--- Id of the unicycle stored for this player (even if inactive, e.g. while they are driving).
---Source: lua/ge/extensions/gameplay/walk.lua:357
---@param player integer|nil Player index.
---@return integer|nil
function gameplay_walk.getStoredUnicycleId(player) end

--- Nearest vehicle (within 2 m) that the on-foot player can enter.
---Source: lua/ge/extensions/gameplay/walk.lua:510
---@param player integer|nil Player index.
---@return userdata|nil
function gameplay_walk.getVehicleInFront(player) end

--- Returns whether the nearest vehicle (or the player's) is slow enough to allow switching to walking mode.
---Source: lua/ge/extensions/gameplay/walk.lua:181
---@param player integer|nil Player index.
---@return boolean  false only if the speed exceeded 6 km/h without dropping back below 5 km/h.
function gameplay_walk.isAtParkingSpeed(player) end

--- Indicates whether switching is allowed.
---Source: lua/ge/extensions/gameplay/walk.lua:557
---@return boolean
function gameplay_walk.isTogglingEnabled() end

--- Tests whether a vehicle is in the blacklist.
---Source: lua/ge/extensions/gameplay/walk.lua:569
---@param vehId integer Vehicle id.
---@return boolean|nil  true or nil.
function gameplay_walk.isVehicleBlacklisted(vehId) end

--- Returns whether the player is currently controlling a unicycle.
---Source: lua/ge/extensions/gameplay/walk.lua:177
---@param player integer|nil Player index (0 by default).
---@return boolean
function gameplay_walk.isWalking(player) end

--- Hook called when a player's camera changes: hides the unicycle in the player's view when they use the unicycle camera, or when the big map transition moves away from them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:598
---@param player integer Player index.
---@param camName string Camera mode name.
---@param vid integer|nil Id of the tracked vehicle.
function gameplay_walk.onCameraChanged(player, camName, vid) end

--- Hook called at the end of a level: forgets unicycles, faces and paints.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:586
---@param levelPath string Level path.
function gameplay_walk.onClientEndMission(levelPath) end

--- Hook called at the start of a level: clears the blacklist, re-enables toggling.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:581
---@param levelPath string Level path.
function gameplay_walk.onClientStartMission(levelPath) end

--- Restores the serialized state and recomputes which players are on foot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:518
---@param data table onSerialize table.
function gameplay_walk.onDeserialize(data) end

--- Save hook before extensions reload: toggling, blacklist, unicycles, faces, paints.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:514
---@return table  {togglingEnabled, vehicleBlacklist, unicycleIds, faceParts, paints}
function gameplay_walk.onSerialize() end

--- Hook called when split screen changes: reconfigures the unicycle colors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:593
---@param enabled boolean Split screen active.
---@param playerCount integer Number of players.
---@param layout any Layout.
---@param mode any Mode.
function gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode) end

--- Hook called every frame: for each player, looks for the nearby vehicle, updates the parking speed and shows/removes the "walkingmode" message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:502
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_walk.onUpdate(dtReal, dtSim) end

--- Hook called when a vehicle's color changes: if it is a player's unicycle (outside multiseat), saves the paint in the playerCharacterColor setting.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:628
---@param vehId integer Vehicle id.
---@param index integer Paint index (only 1 is taken into account).
---@param paint table Paint.
function gameplay_walk.onVehicleColorChanged(vehId, index, paint) end

--- Hook called when a vehicle is destroyed: forgets the corresponding unicycle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:654
---@param vehId integer Vehicle id.
function gameplay_walk.onVehicleDestroyed(vehId) end

--- Hook called when a vehicle is replaced: forgets the corresponding unicycle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:650
---@param vehId integer Vehicle id.
function gameplay_walk.onVehicleReplaced(vehId) end

--- Hook called when a player switches vehicle: deactivates the previously stored unicycle and updates the active state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/walk.lua:617
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer|nil Player index.
function gameplay_walk.onVehicleSwitched(oldId, newId, player) end

--- Removes a vehicle from the blacklist.
---Source: lua/ge/extensions/gameplay/walk.lua:565
---@param vehId integer Vehicle id.
function gameplay_walk.removeVehicleFromBlacklist(vehId) end

--- Changes the face. If the player is on foot, their unicycle is reconfigured; otherwise the stored unicycle is deleted and will be recreated later.
---Source: lua/ge/extensions/gameplay/walk.lua:163
---@param player integer|nil Player index.
---@param facePart string Face part name.
function gameplay_walk.setFacePart(player, facePart) end

--- Orients the camera/on-foot character via the unicycle camera data. Has no effect if the player is not active in walking mode.
---Source: lua/ge/extensions/gameplay/walk.lua:287
---@param front vec3 Forward direction.
---@param up vec3 Up direction.
---@param player integer|nil Player index.
function gameplay_walk.setRot(front, up, player) end

--- Enables or disables walking mode. On enabling, spawns or reactivates the unicycle at pos (otherwise near the door or at the seat left) and places the player in it. On disabling, enters the nearby vehicle, or simply deactivates the unicycle.
---Source: lua/ge/extensions/gameplay/walk.lua:311
---@param enabled boolean true to walk.
---@param pos vec3|nil Spawn position (optional).
---@param rot quat|nil Starting orientation (optional).
---@param force boolean|nil Ignores toggle restrictions.
---@param player integer|nil Player index.
---@return boolean  true if the requested state is reached (false if blocked).
---@return integer|nil  Current unicycle id.
function gameplay_walk.setWalkingMode(enabled, pos, rot, force, player) end

--- Toggles walking mode (called by the input action). Does nothing if the player is walking with no vehicle nearby; in multiplayer, goes through multiplayer_vehicleSync.
---Source: lua/ge/extensions/gameplay/walk.lua:361
---@param player integer|nil Player index (ignored if negative).
function gameplay_walk.toggleWalkingMode(player) end

