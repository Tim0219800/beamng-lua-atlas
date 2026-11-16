---@meta
-- tim19Atlas stub generated from lua/ge/spawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle creation and placement on the Game Engine side. It creates a BeamNGVehicle object (spawnVehicle), picks a spawn point (pickSpawnPoint), and above all places or teleports a vehicle without collisions (safeTeleport, safeReset): the module builds the vehicle's oriented box, drops it onto the ground by raycast, then offsets it in a spiral until it finds a free spot (other vehicles, statics, traffic). It also handles teleporting to the last road (recovery) and placing a trailer on a coupler.
--- Access: global `spawn`
---@class spawn
spawn = {}

--- Computes the world matrix of a second vehicle so that its coupler coincides with that of the first: transform0 x coupler0 offset x rotOffset x inverse(coupler1 offset).
---Source: lua/ge/spawn.lua:1058
---@param transform0 MatrixF World matrix of the first vehicle (e.g. veh:getRefNodeMatrix()).
---@param coupler0_offset vec3 Coupler position on the first vehicle, relative to its reference node.
---@param coupler1_offset vec3 Coupler position on the second vehicle, relative to its reference node.
---@param rotOffset MatrixF|nil Additional rotation applied between the two couplers.
---@return MatrixF  Placement matrix of the second vehicle.
function spawn.calculateRelativeVehiclePlacement(transform0, coupler0_offset, coupler1_offset, rotOffset) end

--- Empties the cache of vehicles placed during the current frame, if any. Called by the engine so that the cache lasts only one frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/spawn.lua:33
function spawn.clearCache() end

--- Looks for a valid spawn point: first the level's default point (setSpawnpoint), then a randomly picked object from the groups CameraSpawnPoints, PlayerSpawnPoints, PlayerDropPoints, then DefaultPlayerSpawnSphere (old mods), otherwise creates a default SpawnSphere in MissionCleanup. See the notes on the default point test.
---Source: lua/ge/spawn.lua:880
---@param spawnName string 'player' or 'camera': type of SpawnSphere to create if nothing is found.
---@return table|nil  Scene object of the spawn point (SpawnSphere, marker...), nil on error.
function spawn.pickSpawnPoint(spawnName) end

--- Positions a trailer on the towing vehicle by making the couplers coincide, resets it (requestReset(RESET_PHYSICS), resetBrokenFlexMesh) and enables automatic coupling if the tag's option is 'autoCouple'. If both couplers are on the same side (front/front or rear/rear), the trailer is flipped by 180 degrees.
---Source: lua/ge/spawn.lua:1088
---@param vehId integer Id of the towing vehicle.
---@param couplerOffsetVeh vec3 Position of the tow vehicle's coupler relative to its reference node.
---@param trailerId integer Id of the trailer.
---@param couplerOffsetTrailer vec3 Position of the trailer's coupler.
---@param couplerTag string Coupler tag; looked up in core_vehicles.couplerTagsOptions for automatic coupling.
---@param rotOffset MatrixF|nil Additional rotation to apply.
function spawn.placeTrailer(vehId, couplerOffsetVeh, trailerId, couplerOffsetTrailer, couplerTag, rotOffset) end

--- Recommended replacement for be:resetVehicle(0): teleports the vehicle to its original position and rotation (veh:getOriginalPosition/Rotation) while looking for a free spot, with vehicle reset.
---Source: lua/ge/spawn.lua:696
---@param veh table Vehicle object.
---@param checkOnlyStatics_ boolean|nil Test only static objects.
---@param visibilityPoint_ vec3|nil Point from which the spot found must not be visible.
---@param removeTraffic_ boolean|nil Move traffic away from the area.
function spawn.safeReset(veh, checkOnlyStatics_, visibilityPoint_, removeTraffic_) end

--- Teleports a vehicle while avoiding collisions: (if resetVehicle) places it at pos/rot and repairs its soft mesh, then looks for the nearest free spot (ground placement by raycast, spiral of offsets). Applies the final pose to the node group, resets the velocity to zero and stores the final pose.
---Source: lua/ge/spawn.lua:659
---@param veh table Vehicle object (BeamNGVehicle).
---@param pos vec3 Desired position (reference node, or center of the box if centeredPosition).
---@param rot quat|nil Desired rotation (quat(0,0,0,-1) by default), internally multiplied by a 180-degree rotation around z.
---@param checkOnlyStatics_ boolean|nil If true, tests only statics (and does not move traffic).
---@param visibilityPoint_ vec3|nil Camera position: the spot found must be out of its view if possible.
---@param removeTraffic_ boolean|nil Move traffic vehicles (gameplay_traffic) away from the area. Keeps the previous value if nil (true initially).
---@param centeredPosition boolean|nil true if pos designates the center of the vehicle's box.
---@param resetVehicle boolean|nil true by default: uses the initial node positions (repaired vehicle). false: moves the vehicle as it is (box of the main node group).
---@param player any Passed to setSafePosition (inferred from code: not used in the placement functions read).
---@param unlimitedSafeSpawnRange boolean|nil Removes the distance limit when searching for a spot.
function spawn.safeTeleport(veh, pos, rot, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle, player, unlimitedSafeSpawnRange) end

--- Configures and then spawns an already created BeamNGVehicle object: model, parts config, paints (3 palettes), position/rotation (with 180-degree rotation), adds it to MissionGroup and to the SpawnedVehicles group (canSave = false), then looks for a free spot unless options.safeSpawn == false.
---Source: lua/ge/spawn.lua:575
---@param veh table Object created by createObject('BeamNGVehicle').
---@param options table model (string), config (string or table), paint/paint2/paint3 ({baseColor = {r,g,b,a}, ...}), pos (vec3), rot (quat), centeredPosition, safeSpawn (true by default), unlimitedSafeSpawnRange, removeWhenNoPositionFound (true by default).
---@return boolean|nil  true if the vehicle is placed; nil if veh is missing, if MissionGroup does not exist, or if no spot is found (vehicle deleted).
function spawn.setVehicleObject(veh, options) end

--- Creates (if needed) the game camera 'gameCamera' (Observer datablock), adds it to MissionCleanup and sets it as the camera of the 'main' view.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/spawn.lua:946
function spawn.spawnCamera() end

--- Spawns the player vehicle when the level loads: via core_levels.maybeSpawnDefaultVehicle(), or via the old code (variable $beamngVehicle) with a warning. If preventPlayerSpawning is true, does nothing once.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/spawn.lua:1037
function spawn.spawnPlayer() end

--- Creates a BeamNGVehicle object, gives it a unique name (options.vehicleName or 'clone', 'clone0'...), applies the options (autoEnterVehicle, autoEnterVehiclePlayer) then delegates to setVehicleObject. The vehicle appears rotated by 180 degrees around z.
---Source: lua/ge/spawn.lua:821
---@param model string Name of the JBeam model (e.g. 'pickup').
---@param partConfig string|table Path of the .pc file or parts config table.
---@param pos vec3 Position.
---@param rot quat Rotation.
---@param options table|nil vehicleName, autoEnterVehicle (true by default), autoEnterVehiclePlayer, visibilityPoint, removeTraffic, paint/paint2/paint3, centeredPosition, safeSpawn, unlimitedSafeSpawnRange, removeWhenNoPositionFound. The table is modified (vehicleName, model, config, pos, rot, cling are written into it).
---@return table|nil  Vehicle object, or nil if creation or placement fails.
function spawn.spawnVehicle(model, partConfig, pos, rot, options) end

--- Returns and clears the last pose applied by safeTeleport for this vehicle (used by multiplayer capture).
---Source: lua/ge/spawn.lua:690
---@param vid integer Vehicle id.
---@return table|nil  {x, y, z, rx, ry, rz, rw} (reference node and quaternion), or nil if there is no pose.
function spawn.takeLastSafeTeleportPose(vid) end

--- Recovery: teleports the vehicle to the last known road position. Requests the recovery points (recovery.recoveryPoints) from the vehicle VM, then the callback teleportToLastRoadCallback places the vehicle on the road on the legal side. Multiplayer can intercept the call.
---Source: lua/ge/spawn.lua:810
---@param veh table|nil Vehicle (player 0 by default).
---@param options table|nil destinationPos (vec3: orients the vehicle toward this destination), resetVehicle (boolean), unlimitedSafeSpawnRange (boolean).
function spawn.teleportToLastRoad(veh, options) end

--- Callback of teleportToLastRoad, run on the GE side with the vehicle's recovery points. Walks through the points from newest to oldest, keeps the first one close to a road (distance <= average radius), projects it onto the edge, chooses the legal side (map.getRoadRules rules) and the direction, then calls safeTeleport. With no valid point, looks for the nearest road (< 50 m), otherwise keeps the current position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/spawn.lua:701
---@param data table|nil Queue of recovery points {head, tail, [i] = {pos = vec3, ...}}.
---@param options table Same options as teleportToLastRoad.
---@param vehId integer|nil Vehicle id (player 0 by default).
function spawn.teleportToLastRoadCallback(data, options, vehId) end

