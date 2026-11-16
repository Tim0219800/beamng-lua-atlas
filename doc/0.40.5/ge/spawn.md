# `spawn`

*File: `lua/ge/spawn.lua` · VM: Game Engine (GE) · 1155 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `spawn`

Vehicle creation and placement on the Game Engine side. It creates a BeamNGVehicle object (spawnVehicle), picks a spawn point (pickSpawnPoint), and above all places or teleports a vehicle without collisions (safeTeleport, safeReset): the module builds the vehicle's oriented box, drops it onto the ground by raycast, then offsets it in a spiral until it finds a free spot (other vehicles, statics, traffic). It also handles teleporting to the last road (recovery) and placing a trailer on a coupler.

## Example

```lua
-- teleport the player vehicle to a position while avoiding collisions
local veh = getPlayerVehicle(0)
spawn.safeTeleport(veh, vec3(100, 200, 50), quatFromDir(vec3(0,1,0), vec3(0,0,1)))
-- put a vehicle back at its original position
spawn.safeReset(veh)
```

## Notes

- Rotation convention: spawnVehicle/setVehicleObject and safeTeleport multiply the rotation by quat(0,0,1,0) (180 degrees around z) because BeamNG vehicles point toward -y. Pass the "visual" rotation (front = vehicle direction); safeReset compensates with the same quat. The code itself notes 'the order might still be wrong in some places'.
- safeTeleport returns nothing (no boolean): the result can only be read through takeLastSafeTeleportPose(vid), which contains the pose actually applied. On failure the pose stays nil.
- The placement state is global to the module (visibilityPoint, checkOnlyStatics, removeTraffic, box caches): the options passed to safeTeleport/spawnVehicle are kept until placement ends and then reset (removeTraffic goes back to true).
- Vehicles positioned during the current frame are stored in a cache (vehiclesPositionedThisFrame) so that the following ones avoid their new box; clearCache() empties it, called by the engine on the next frame.
- If no free spot is found with safeSpawn active, spawnVehicle deletes the vehicle (veh:delete()) and shows a toast 'ui.spawn.noPositionFound'; pass options.removeWhenNoPositionFound = false to keep it at its initial position.
- Probable bug in spawnVehicle: the test 'if not datablock' uses a lowercase variable that is never defined (the variable is named dataBlock); the condition is therefore always true, the datablock 'default_vehicle' is always assigned and the 'Failed to find dataBlock' error branch is unreachable.
- Probable bug in pickSpawnPoint: setSpawnpoint.loadDefaultSpawnpoint() returns '' (empty string, truthy in Lua) when there is no default point; 'if defaultSpawnPoint' is therefore always true, scenetree.findObject('') is attempted and a 'No SpawnPointName in mission file' warning is logged on every call before moving on to the spawn groups.
- teleportToLastRoadCallback: the final fallback assumes findClosestRoad found an edge; if the graph is empty the function has already exited earlier, but if dist < 50 with n1Id nil, accessing n1.pos would crash (unlikely case because dist is then large).
- spawnPlayer: the old path (spawnPlayerOld, variable $beamngVehicle) is kept for compatibility and logs a warning; the normal path is core_levels.maybeSpawnDefaultVehicle().
- spawnTrailerBehindVehicle is local to the file (not exported) even though it is useful.

## Functions

| Function | Description | Line |
|---|---|---|
| `spawn.calculateRelativeVehiclePlacement(transform0, coupler0_offset, coupler1_offset, rotOffset)` | Computes the world matrix of a second vehicle so that its coupler coincides with that of the first: transform0 x coupler0 offset x rotOffset x inverse(coupler1 offset). | 1058 |
| `spawn.clearCache()` | Empties the cache of vehicles placed during the current frame, if any. Called by the engine so that the cache lasts only one frame. *(internal)* | 33 |
| `spawn.pickSpawnPoint(spawnName)` | Looks for a valid spawn point: first the level's default point (setSpawnpoint), then a randomly picked object from the groups CameraSpawnPoints, PlayerSpawnPoints, PlayerDropPoints, then DefaultPlayerSpawnSphere (old mods), otherwise creates a default SpawnSphere in MissionCleanup. See the notes on the default point test. | 880 |
| `spawn.placeTrailer(vehId, couplerOffsetVeh, trailerId, couplerOffsetTrailer, couplerTag, rotOffset)` | Positions a trailer on the towing vehicle by making the couplers coincide, resets it (requestReset(RESET_PHYSICS), resetBrokenFlexMesh) and enables automatic coupling if the tag's option is 'autoCouple'. If both couplers are on the same side (front/front or rear/rear), the trailer is flipped by 180 degrees. | 1088 |
| `spawn.safeReset(veh, checkOnlyStatics_, visibilityPoint_, removeTraffic_)` | Recommended replacement for be:resetVehicle(0): teleports the vehicle to its original position and rotation (veh:getOriginalPosition/Rotation) while looking for a free spot, with vehicle reset. | 696 |
| `spawn.safeTeleport(veh, pos, rot, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle, player, unlimitedSafeSpawnRange)` | Teleports a vehicle while avoiding collisions: (if resetVehicle) places it at pos/rot and repairs its soft mesh, then looks for the nearest free spot (ground placement by raycast, spiral of offsets). Applies the final pose to the node group, resets the velocity to zero and stores the final pose. | 659 |
| `spawn.setVehicleObject(veh, options)` | Configures and then spawns an already created BeamNGVehicle object: model, parts config, paints (3 palettes), position/rotation (with 180-degree rotation), adds it to MissionGroup and to the SpawnedVehicles group (canSave = false), then looks for a free spot unless options.safeSpawn == false. | 575 |
| `spawn.spawnCamera()` | Creates (if needed) the game camera 'gameCamera' (Observer datablock), adds it to MissionCleanup and sets it as the camera of the 'main' view. *(internal)* | 946 |
| `spawn.spawnPlayer()` | Spawns the player vehicle when the level loads: via core_levels.maybeSpawnDefaultVehicle(), or via the old code (variable $beamngVehicle) with a warning. If preventPlayerSpawning is true, does nothing once. *(internal)* | 1037 |
| `spawn.spawnVehicle(model, partConfig, pos, rot, options)` | Creates a BeamNGVehicle object, gives it a unique name (options.vehicleName or 'clone', 'clone0'...), applies the options (autoEnterVehicle, autoEnterVehiclePlayer) then delegates to setVehicleObject. The vehicle appears rotated by 180 degrees around z. | 821 |
| `spawn.takeLastSafeTeleportPose(vid)` | Returns and clears the last pose applied by safeTeleport for this vehicle (used by multiplayer capture). | 690 |
| `spawn.teleportToLastRoad(veh, options)` | Recovery: teleports the vehicle to the last known road position. Requests the recovery points (recovery.recoveryPoints) from the vehicle VM, then the callback teleportToLastRoadCallback places the vehicle on the road on the legal side. Multiplayer can intercept the call. | 810 |
| `spawn.teleportToLastRoadCallback(data, options, vehId)` | Callback of teleportToLastRoad, run on the GE side with the vehicle's recovery points. Walks through the points from newest to oldest, keeps the first one close to a road (distance <= average radius), projects it onto the edge, chooses the legal side (map.getRoadRules rules) and the direction, then calls safeTeleport. With no valid point, looks for the nearest road (< 50 m), otherwise keeps the current position. *(internal)* | 701 |

### Parameter details

#### `spawn.calculateRelativeVehiclePlacement(transform0, coupler0_offset, coupler1_offset, rotOffset)`

Computes the world matrix of a second vehicle so that its coupler coincides with that of the first: transform0 x coupler0 offset x rotOffset x inverse(coupler1 offset).

- `transform0` (*MatrixF*) : World matrix of the first vehicle (e.g. veh:getRefNodeMatrix()).
- `coupler0_offset` (*vec3*) : Coupler position on the first vehicle, relative to its reference node.
- `coupler1_offset` (*vec3*) : Coupler position on the second vehicle, relative to its reference node.
- `rotOffset` (*MatrixF|nil*) : Additional rotation applied between the two couplers.
- **returns**: MatrixF Placement matrix of the second vehicle.

#### `spawn.pickSpawnPoint(spawnName)`

Looks for a valid spawn point: first the level's default point (setSpawnpoint), then a randomly picked object from the groups CameraSpawnPoints, PlayerSpawnPoints, PlayerDropPoints, then DefaultPlayerSpawnSphere (old mods), otherwise creates a default SpawnSphere in MissionCleanup. See the notes on the default point test.

- `spawnName` (*string*) : 'player' or 'camera': type of SpawnSphere to create if nothing is found.
- **returns**: table|nil Scene object of the spawn point (SpawnSphere, marker...), nil on error.

#### `spawn.placeTrailer(vehId, couplerOffsetVeh, trailerId, couplerOffsetTrailer, couplerTag, rotOffset)`

Positions a trailer on the towing vehicle by making the couplers coincide, resets it (requestReset(RESET_PHYSICS), resetBrokenFlexMesh) and enables automatic coupling if the tag's option is 'autoCouple'. If both couplers are on the same side (front/front or rear/rear), the trailer is flipped by 180 degrees.

- `vehId` (*integer*) : Id of the towing vehicle.
- `couplerOffsetVeh` (*vec3*) : Position of the tow vehicle's coupler relative to its reference node.
- `trailerId` (*integer*) : Id of the trailer.
- `couplerOffsetTrailer` (*vec3*) : Position of the trailer's coupler.
- `couplerTag` (*string*) : Coupler tag; looked up in core_vehicles.couplerTagsOptions for automatic coupling.
- `rotOffset` (*MatrixF|nil*) : Additional rotation to apply.

#### `spawn.safeReset(veh, checkOnlyStatics_, visibilityPoint_, removeTraffic_)`

Recommended replacement for be:resetVehicle(0): teleports the vehicle to its original position and rotation (veh:getOriginalPosition/Rotation) while looking for a free spot, with vehicle reset.

- `veh` (*table*) : Vehicle object.
- `checkOnlyStatics_` (*boolean|nil*) : Test only static objects.
- `visibilityPoint_` (*vec3|nil*) : Point from which the spot found must not be visible.
- `removeTraffic_` (*boolean|nil*) : Move traffic away from the area.

#### `spawn.safeTeleport(veh, pos, rot, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle, player, unlimitedSafeSpawnRange)`

Teleports a vehicle while avoiding collisions: (if resetVehicle) places it at pos/rot and repairs its soft mesh, then looks for the nearest free spot (ground placement by raycast, spiral of offsets). Applies the final pose to the node group, resets the velocity to zero and stores the final pose.

- `veh` (*table*) : Vehicle object (BeamNGVehicle).
- `pos` (*vec3*) : Desired position (reference node, or center of the box if centeredPosition).
- `rot` (*quat|nil*) : Desired rotation (quat(0,0,0,-1) by default), internally multiplied by a 180-degree rotation around z.
- `checkOnlyStatics_` (*boolean|nil*) : If true, tests only statics (and does not move traffic).
- `visibilityPoint_` (*vec3|nil*) : Camera position: the spot found must be out of its view if possible.
- `removeTraffic_` (*boolean|nil*) : Move traffic vehicles (gameplay_traffic) away from the area. Keeps the previous value if nil (true initially).
- `centeredPosition` (*boolean|nil*) : true if pos designates the center of the vehicle's box.
- `resetVehicle` (*boolean|nil*) : true by default: uses the initial node positions (repaired vehicle). false: moves the vehicle as it is (box of the main node group).
- `player` (*any*) : Passed to setSafePosition (inferred from code: not used in the placement functions read).
- `unlimitedSafeSpawnRange` (*boolean|nil*) : Removes the distance limit when searching for a spot.

#### `spawn.setVehicleObject(veh, options)`

Configures and then spawns an already created BeamNGVehicle object: model, parts config, paints (3 palettes), position/rotation (with 180-degree rotation), adds it to MissionGroup and to the SpawnedVehicles group (canSave = false), then looks for a free spot unless options.safeSpawn == false.

- `veh` (*table*) : Object created by createObject('BeamNGVehicle').
- `options` (*table*) : model (string), config (string or table), paint/paint2/paint3 ({baseColor = {r,g,b,a}, ...}), pos (vec3), rot (quat), centeredPosition, safeSpawn (true by default), unlimitedSafeSpawnRange, removeWhenNoPositionFound (true by default).
- **returns**: boolean|nil true if the vehicle is placed; nil if veh is missing, if MissionGroup does not exist, or if no spot is found (vehicle deleted).

#### `spawn.spawnVehicle(model, partConfig, pos, rot, options)`

Creates a BeamNGVehicle object, gives it a unique name (options.vehicleName or 'clone', 'clone0'...), applies the options (autoEnterVehicle, autoEnterVehiclePlayer) then delegates to setVehicleObject. The vehicle appears rotated by 180 degrees around z.

- `model` (*string*) : Name of the JBeam model (e.g. 'pickup').
- `partConfig` (*string|table*) : Path of the .pc file or parts config table.
- `pos` (*vec3*) : Position.
- `rot` (*quat*) : Rotation.
- `options` (*table|nil*) : vehicleName, autoEnterVehicle (true by default), autoEnterVehiclePlayer, visibilityPoint, removeTraffic, paint/paint2/paint3, centeredPosition, safeSpawn, unlimitedSafeSpawnRange, removeWhenNoPositionFound. The table is modified (vehicleName, model, config, pos, rot, cling are written into it).
- **returns**: table|nil Vehicle object, or nil if creation or placement fails.

#### `spawn.takeLastSafeTeleportPose(vid)`

Returns and clears the last pose applied by safeTeleport for this vehicle (used by multiplayer capture).

- `vid` (*integer*) : Vehicle id.
- **returns**: table|nil {x, y, z, rx, ry, rz, rw} (reference node and quaternion), or nil if there is no pose.

#### `spawn.teleportToLastRoad(veh, options)`

Recovery: teleports the vehicle to the last known road position. Requests the recovery points (recovery.recoveryPoints) from the vehicle VM, then the callback teleportToLastRoadCallback places the vehicle on the road on the legal side. Multiplayer can intercept the call.

- `veh` (*table|nil*) : Vehicle (player 0 by default).
- `options` (*table|nil*) : destinationPos (vec3: orients the vehicle toward this destination), resetVehicle (boolean), unlimitedSafeSpawnRange (boolean).

#### `spawn.teleportToLastRoadCallback(data, options, vehId)`

Callback of teleportToLastRoad, run on the GE side with the vehicle's recovery points. Walks through the points from newest to oldest, keeps the first one close to a road (distance <= average radius), projects it onto the edge, chooses the legal side (map.getRoadRules rules) and the direction, then calls safeTeleport. With no valid point, looks for the nearest road (< 50 m), otherwise keeps the current position.

- `data` (*table|nil*) : Queue of recovery points {head, tail, [i] = {pos = vec3, ...}}.
- `options` (*table*) : Same options as teleportToLastRoad.
- `vehId` (*integer|nil*) : Vehicle id (player 0 by default).

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/spawn.lua`.*
