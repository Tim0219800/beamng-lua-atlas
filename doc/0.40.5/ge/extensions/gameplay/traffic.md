# `gameplay_traffic`

*File: `lua/ge/extensions/gameplay/traffic.lua` · VM: Game Engine (GE) · 1761 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_traffic`: `extensions.load("gameplay_traffic")`, then the global `gameplay_traffic`

Main AI traffic system in freeroam. It spawns a group of vehicles (via core_multiSpawn), inserts them into the traffic table (gameplay/traffic/vehicle objects with roles), manages a pool of active/inactive vehicles (core_vehicleActivePooling), and respawns them in front of the focus point (player or camera) on the road network. It also manages the global traffic variables (aggression, speed limit, AI mode...), a system of "reserved" vehicles for special providers (police, taxi...), state saving/restoring and visual debug. States: 'off', 'spawning', 'loading', 'on'.

## Example

```lua
gameplay_traffic.setupTraffic(10, {activeAmount = 8})
-- ...
gameplay_traffic.setTrafficVars({baseAggression = 0.6, speedLimit = 20})
for id, veh in pairs(gameplay_traffic.getTraffic()) do print(id, veh.roleName) end
```

## Notes

- Default variables (getTrafficVars): spawnValue 1, spawnDirBias 0.2, activeAmount infinite, baseAggression 0.35, speedLimit -1 (disabled, in m/s), aiMode 'traffic', aiAware 'auto', aiDebug 'off', enableRespawn true, enableDynamicValues true, enableRandomEvents false.
- Exported aliases: forceTeleportAll = scatterTraffic; getNumOfTraffic = getTrafficAmount; getTrafficAiVehIds = getTrafficList; getTraffic = getTrafficData.
- "Reserved" model: a vehicle with reserved = providerName belongs to a provider's reserve and stays dormant (inactive, no respawn) until it is "claimed" (used) via useReservedVehicle. A claimed vehicle is protected from automatic pooling.
- Only one traffic vehicle is processed per frame for respawn (index auxiliaryData.queuedVehicle). Traffic conditions sampling (network density, direction) is done every 5 s of simulated time.
- The focus (setFocus) has three modes: 'camera' (default), 'vehicle' and 'custom'; with auto = true it switches depending on the player vehicle or the free camera.
- The hooks onTrafficStarted and onTrafficStopped are both emitted by onUpdate (when the first AI vehicle appears or the last one disappears) and handled by this same module (M.onTrafficStarted sets the state to 'on', M.onTrafficStopped clears the tables).
- An 8 s watchdog (spawnWatchdogTimeout) ends the traffic loading if no vehicle reports progress, so as not to block the waiting screen.
- Modules loaded by dependency: gameplay_parking, gameplay_police, gameplay_taxi, gameplay_traffic_trafficUtils, core_vehicleActivePooling.

**Dependencies (loaded first):** `gameplay_parking`, `gameplay_police`, `gameplay_taxi`, `gameplay_traffic_trafficUtils`, `core_vehicleActivePooling`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_traffic.activate(vehList)` | Enables traffic mode and adds vehicles to the table. If vehList is not a table, takes all non-parked vehicles (compatibility). | 966 |
| `gameplay_traffic.deactivate(stopAi)` | Removes all vehicles from the traffic table. | 992 |
| `gameplay_traffic.deleteVehicles()` | Removes all traffic vehicles (AI or marked isTraffic) from the scene and from the table. | 956 |
| `gameplay_traffic.ensureReservedVehicles(providerName, count)` | Ensures a provider has count reserved vehicles (in fact spawns at most 4 at a time). Emits onTrafficReservedVehiclesReady when already sufficient. | 99 |
| `gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist)` | Forcibly teleports a traffic vehicle to a safe spawn point found around pos. Ignored if enableRespawn is false or if ignoreForceTeleport is true; an unused reserve is simply made dormant. | 508 |
| `gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist)` | Alias of scatterTraffic. | 540 |
| `gameplay_traffic.freezeState(options)` | Stops the traffic, police and parking systems and returns their serialized data (used for example at the start of a mission). | 1219 |
| `gameplay_traffic.getFocus()` | Returns the focus table {mode, pos, dirVec, speed, vehId, auto}. | 383 |
| `gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit)` | Computes the ideal number of vehicles to create. | 276 |
| `gameplay_traffic.getNumOfTraffic(activeOnly)` | Alias of getTrafficAmount. | 301 |
| `gameplay_traffic.getState()` | System state: 'off', 'spawning', 'loading' or 'on'. | 297 |
| `gameplay_traffic.getTraffic()` | Alias of getTrafficData. | 309 |
| `gameplay_traffic.getTrafficAiVehIds()` | Alias of getTrafficList. | 305 |
| `gameplay_traffic.getTrafficAmount(activeOnly)` | Number of AI traffic vehicles (alias getNumOfTraffic). | 301 |
| `gameplay_traffic.getTrafficData()` | Full traffic table: identifier -> traffic vehicle object (alias getTraffic). Also contains the player vehicle. | 309 |
| `gameplay_traffic.getTrafficList()` | List of AI traffic vehicle identifiers (alias getTrafficAiVehIds). | 305 |
| `gameplay_traffic.getTrafficVars()` | Returns the traffic variables table (direct reference). | 347 |
| `gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool)` | Inserts an existing vehicle into the traffic table (creates the traffic vehicle object, adds it to the pool, sets the AI mode, handles the 'reserved:' marking via spawnMeta). Emits onTrafficVehicleAdded. | 778 |
| `gameplay_traffic.onClientEndMission()` | Hook: stops traffic, clears the reserved spawns, resets variables and focus. *(internal)* *(hook)* | 1566 |
| `gameplay_traffic.onClientStartMission()` | Hook: updates the passengers' visibility of simple_traffic vehicles. *(internal)* *(hook)* | 1554 |
| `gameplay_traffic.onDeserialized(data, options)` | Restores the traffic state; with respawnVehicles, recreates the stored vehicles and remaps their identifiers (role, pursuit, collisions). *(internal)* *(hook)* | 1639 |
| `gameplay_traffic.onExtensionLoaded()` | Hook: updates the passengers' visibility of simple_traffic vehicles. *(internal)* *(hook)* | 1558 |
| `gameplay_traffic.onPreRender(dt)` | Render hook: in debug mode, draws for each active vehicle a line to the focus and a text (id, distance, speed in km/h). *(internal)* *(hook)* | 1493 |
| `gameplay_traffic.onSerialize(options)` | Serializes the traffic state (state, vehicles, variables), then stops the traffic. With despawnVehicles, also stores the vehicles' spawn data and removes them. *(internal)* *(hook)* | 1591 |
| `gameplay_traffic.onSettingsChanged()` | Hook: updates the passengers' visibility (enableSeatOccupants setting). *(internal)* *(hook)* | 1562 |
| `gameplay_traffic.onTrafficStarted()` | Hook: sets the state to 'on', prepares the pool and inserts the player vehicles. Emitted by onUpdate after the first AI vehicle is inserted. *(internal)* *(hook)* | 1516 |
| `gameplay_traffic.onTrafficStopped()` | Hook: deletes the pool and clears the traffic tables ('off' state). *(internal)* *(hook)* | 1547 |
| `gameplay_traffic.onUiWaitingState()` | Hook called when the waiting screen is displayed: runs setupTrafficHelper with the parameters prepared by setupTrafficWaitForUi. *(internal)* *(hook)* | 1574 |
| `gameplay_traffic.onUpdate(dtReal, dtSim)` | Hook called every frame: starts the spawn in 'loading' state, monitors the watchdog, triggers onTrafficStarted/onTrafficStopped, updates the focus, the pool and the traffic logic (one vehicle processed per frame). *(internal)* *(hook)* | 1417 |
| `gameplay_traffic.onVehicleActiveChanged(vehId, active)` | Hook called when a vehicle is activated/deactivated: hides a deactivated vehicle and teleports a reactivated vehicle if its position is not safe. *(internal)* *(hook)* | 936 |
| `gameplay_traffic.onVehicleDestroyed(id)` | Hook: removes the destroyed vehicle from traffic and from the ongoing spawn. *(internal)* *(hook)* | 923 |
| `gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName)` | Hook called when a multiSpawn group is created: activates the vehicles of the 'autoTraffic' group, applies fancy license plates, handles the reserves and emits onTrafficOrParkingReady when everything is ready. *(internal)* *(hook)* | 1346 |
| `gameplay_traffic.onVehicleMapmgrUpdate(id)` | Hook called when a vehicle's mapmgr is ready; ends the loading when all expected vehicles have reported. *(internal)* *(hook)* | 1335 |
| `gameplay_traffic.onVehicleResetted(id)` | Hook: handles the reset of a traffic vehicle. *(internal)* *(hook)* | 905 |
| `gameplay_traffic.onVehicleSpawned(id)` | Hook: when a traffic vehicle spawns or is replaced, reapplies its model data and its automatic role. *(internal)* *(hook)* | 890 |
| `gameplay_traffic.onVehicleSwitched(oldId, newId)` | Hook: checks that the new player vehicle is in the traffic table. *(internal)* *(hook)* | 901 |
| `gameplay_traffic.protectNonReservedVehicle(id, providerName)` | Protects a non-reserved vehicle from automatic pooling while a provider is using it (same protections as a taken reserve). | 259 |
| `gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData)` | Replaces in place the model/config of an unused reserve (spawn.setVehicleObject), sets it to the 'empty' role and dormant. | 226 |
| `gameplay_traffic.refreshVehicles()` | Calls onRefresh on each traffic vehicle (resets its data). | 688 |
| `gameplay_traffic.registerSpecialVehicleProvider(provider)` | Registers (or replaces) a special vehicle provider (police, taxi...). Fields read: name (required), priority, minTotalAmount, guaranteed, getDesiredCount(amount, options), buildGroup(count, options), buildReservedGroup, reserved. | 76 |
| `gameplay_traffic.removeReservedVehicles(providerName)` | Removes all reserved vehicles of a provider and cancels an ongoing spawn. | 147 |
| `gameplay_traffic.removeTraffic(id, stopAi)` | Removes a vehicle from traffic: resets the role's action, shows the vehicle again, makes it playable and takes it out of the pool. Emits onTrafficVehicleRemoved. | 840 |
| `gameplay_traffic.respawnVehicle(id, pos, rot, strict)` | Moves a vehicle to a new position and rotation (for traffic) and calls onRespawn on its traffic object. Non-strict mode: spawn.safeTeleport (slower, avoids static geometry). | 488 |
| `gameplay_traffic.returnReservedVehicle(ids, immediate)` | Returns in-service reserves to the dormant pool. They keep driving until their next teleport out of sight, where they deactivate; with immediate, they become dormant right away. | 215 |
| `gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist)` | Teleports a group of vehicles away from the current location (alias forceTeleportAll). | 540 |
| `gameplay_traffic.setActiveAmount(amount)` | Sets the maximum number of active (visible) vehicles. | 773 |
| `gameplay_traffic.setDebugMode(value)` | Enables or disables traffic debug mode (via setTrafficVars aiDebug). | 768 |
| `gameplay_traffic.setFocus(mode, data)` | Sets the focus point used to decide which vehicles stay active or get teleported (traffic and parking). | 351 |
| `gameplay_traffic.setTrafficVars(data, reset)` | Modifies the traffic variables and propagates them to the vehicles (AI mode, AI parameters, spawnValue, spawnDirBias, debug, activeAmount). Switching to an aiMode other than 'traffic' sets the roles to 'empty' (restored when returning to 'traffic'). | 713 |
| `gameplay_traffic.setupCustomTraffic(amount, params)` | Spawns a group created with custom parameters. | 1184 |
| `gameplay_traffic.setupTraffic(amount, options)` | Prepares traffic: removes the current traffic (unless keepCurrent), determines the number of vehicles (setting or CPU if -1), builds or loads the group (level file, custom or generated group), inserts the special providers' vehicles (up to 40% of the total) and the reserves, then switches to the 'loading' state; the actual spawn then happens in onUpdate. | 1008 |
| `gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions)` | Prepares traffic and parked vehicles at the same time (parking first). The hook onTrafficOrParkingReady signals completion. | 1150 |
| `gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options)` | Used by the pause menu: displays the waiting icon (app:waiting) and prepares traffic; the spawn starts in onUiWaitingState. | 1168 |
| `gameplay_traffic.spawnTraffic(amount, groupData, options)` | Spawns a group of vehicles via core_multiSpawn.spawnGroup (name 'autoTraffic'). Sets the state to 'spawning'. Low-level public interface; setupTraffic is preferred. | 998 |
| `gameplay_traffic.toggle(keepInMemory)` | Enables or disables traffic in freeroam (ignored outside freeroam or if the toggleTraffic action is blocked). If turned off, runs setupTraffic; if turned on, either removes the vehicles or, with keepInMemory, deactivates them (activeAmount = 0) for instant reactivation. | 1193 |
| `gameplay_traffic.trackAIAllVeh(mode)` | Called when the player sets an AI mode for all vehicles: applies this mode as the traffic aiMode. | 1330 |
| `gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options)` | Restores the systems from the freezeState data then scatters the traffic (scatterTraffic). | 1226 |
| `gameplay_traffic.unprotectNonReservedVehicle(id)` | Removes this protection: the vehicle becomes normal traffic again. | 264 |
| `gameplay_traffic.unregisterSpecialVehicleProvider(name)` | Removes a provider by name. | 90 |
| `gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter)` | Brings into service up to count dormant reserves of a provider and activates them (forced into the pool). The vehicles become "claimed". | 195 |

### Parameter details

#### `gameplay_traffic.activate(vehList)`

Enables traffic mode and adds vehicles to the table. If vehList is not a table, takes all non-parked vehicles (compatibility).

- `vehList` (*integer[]|nil*) : Identifiers to add.

#### `gameplay_traffic.deactivate(stopAi)`

Removes all vehicles from the traffic table.

- `stopAi` (*boolean|nil*) : Stop the vehicles' AI.

#### `gameplay_traffic.ensureReservedVehicles(providerName, count)`

Ensures a provider has count reserved vehicles (in fact spawns at most 4 at a time). Emits onTrafficReservedVehiclesReady when already sufficient.

- `providerName` (*string*) : Provider name.
- `count` (*integer*) : Desired number.
- **returns**: boolean false if nothing to do or failure, true if already ready or spawn started.

#### `gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist)`

Forcibly teleports a traffic vehicle to a safe spawn point found around pos. Ignored if enableRespawn is false or if ignoreForceTeleport is true; an unused reserve is simply made dormant.

- `id` (*integer*) : Vehicle identifier.
- `pos` (*vec3|nil*) : Search center; default camera position.
- `dir` (*vec3|nil*) : Direction; default camera forward direction.
- `minDist` (*number|nil*) : Minimum distance (default 100 m).
- `maxDist` (*number|nil*) : Maximum distance (default 500 m).
- `targetDist` (*number|nil*) : Target visible distance.

#### `gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist)`

Alias of scatterTraffic.

- `vehIds` (*integer[]|nil*) : Vehicles.
- `minDist` (*number|nil*) : Minimum distance.
- `maxDist` (*number|nil*) : Maximum distance.

#### `gameplay_traffic.freezeState(options)`

Stops the traffic, police and parking systems and returns their serialized data (used for example at the start of a mission).

- `options` (*table|nil*) : onSerialize options (despawnVehicles, exceptVehicleId, debugVehicleStashing).
- **returns**: table Traffic data.
- **returns**: table Police data.
- **returns**: table Parking data.

#### `gameplay_traffic.getFocus()`

Returns the focus table {mode, pos, dirVec, speed, vehId, auto}.

- **returns**: table Current focus.

#### `gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit)`

Computes the ideal number of vehicles to create.

- `amount` (*integer|nil*) : Requested amount; nil or negative = settings (CPU if 0).
- `enforceLimit` (*boolean|nil*) : Subtracts the already present active non-parked vehicles (plus one for the player).
- **returns**: integer Amount.

#### `gameplay_traffic.getNumOfTraffic(activeOnly)`

Alias of getTrafficAmount.

- `activeOnly` (*boolean|nil*) : Count only the active ones.
- **returns**: integer Amount.

#### `gameplay_traffic.getState()`

System state: 'off', 'spawning', 'loading' or 'on'.

- **returns**: string State.

#### `gameplay_traffic.getTraffic()`

Alias of getTrafficData.

- **returns**: table<integer, table> Traffic vehicles.

#### `gameplay_traffic.getTrafficAiVehIds()`

Alias of getTrafficList.

- **returns**: integer[] Identifiers.

#### `gameplay_traffic.getTrafficAmount(activeOnly)`

Number of AI traffic vehicles (alias getNumOfTraffic).

- `activeOnly` (*boolean|nil*) : Count only the active ones (bounded by activeAmount).
- **returns**: integer Amount.

#### `gameplay_traffic.getTrafficData()`

Full traffic table: identifier -> traffic vehicle object (alias getTraffic). Also contains the player vehicle.

- **returns**: table<integer, table> Traffic vehicles.

#### `gameplay_traffic.getTrafficList()`

List of AI traffic vehicle identifiers (alias getTrafficAiVehIds).

- **returns**: integer[] Identifiers (internal table, do not modify).

#### `gameplay_traffic.getTrafficVars()`

Returns the traffic variables table (direct reference).

- **returns**: table Variables (see notes).

#### `gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool)`

Inserts an existing vehicle into the traffic table (creates the traffic vehicle object, adds it to the pool, sets the AI mode, handles the 'reserved:' marking via spawnMeta). Emits onTrafficVehicleAdded.

- `id` (*integer*) : Vehicle identifier.
- `ignoreAi` (*boolean|nil*) : Applies neither AI nor respawn (used for the player vehicle).
- `ignoreVehPool` (*boolean|nil*) : Do not add it to the deactivation pool.

#### `gameplay_traffic.onDeserialized(data, options)`

Restores the traffic state; with respawnVehicles, recreates the stored vehicles and remaps their identifiers (role, pursuit, collisions).

- `data` (*table*) : Data from onSerialize.
- `options` (*table|nil*) : respawnVehicles, debugVehicleStashing.

#### `gameplay_traffic.onPreRender(dt)`

Render hook: in debug mode, draws for each active vehicle a line to the focus and a text (id, distance, speed in km/h).

- `dt` (*number*) : Frame time.

#### `gameplay_traffic.onSerialize(options)`

Serializes the traffic state (state, vehicles, variables), then stops the traffic. With despawnVehicles, also stores the vehicles' spawn data and removes them.

- `options` (*table|nil*) : despawnVehicles, exceptVehicleId, debugVehicleStashing.
- **returns**: table Data {state, traffic, vars, vehicleSpawnData, vehicleSpawnOrder}.

#### `gameplay_traffic.onUpdate(dtReal, dtSim)`

Hook called every frame: starts the spawn in 'loading' state, monitors the watchdog, triggers onTrafficStarted/onTrafficStopped, updates the focus, the pool and the traffic logic (one vehicle processed per frame).

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulated time (s).

#### `gameplay_traffic.onVehicleActiveChanged(vehId, active)`

Hook called when a vehicle is activated/deactivated: hides a deactivated vehicle and teleports a reactivated vehicle if its position is not safe.

- `vehId` (*integer*) : Vehicle identifier.
- `active` (*boolean*) : New state.

#### `gameplay_traffic.onVehicleDestroyed(id)`

Hook: removes the destroyed vehicle from traffic and from the ongoing spawn.

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName)`

Hook called when a multiSpawn group is created: activates the vehicles of the 'autoTraffic' group, applies fancy license plates, handles the reserves and emits onTrafficOrParkingReady when everything is ready.

- `vehList` (*integer[]*) : Vehicles of the group.
- `groupId` (*any*) : Group identifier.
- `groupName` (*string*) : Group name.

#### `gameplay_traffic.onVehicleMapmgrUpdate(id)`

Hook called when a vehicle's mapmgr is ready; ends the loading when all expected vehicles have reported.

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_traffic.onVehicleResetted(id)`

Hook: handles the reset of a traffic vehicle.

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_traffic.onVehicleSpawned(id)`

Hook: when a traffic vehicle spawns or is replaced, reapplies its model data and its automatic role.

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_traffic.onVehicleSwitched(oldId, newId)`

Hook: checks that the new player vehicle is in the traffic table.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.

#### `gameplay_traffic.protectNonReservedVehicle(id, providerName)`

Protects a non-reserved vehicle from automatic pooling while a provider is using it (same protections as a taken reserve).

- `id` (*integer*) : Vehicle identifier.
- `providerName` (*string*) : Provider name.

#### `gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData)`

Replaces in place the model/config of an unused reserve (spawn.setVehicleObject), sets it to the 'empty' role and dormant.

- `providerName` (*string*) : Provider name.
- `id` (*integer*) : Vehicle identifier.
- `spawnData` (*table*) : {model, config}; config can be a name or a .pc path.
- **returns**: boolean true if recycled.

#### `gameplay_traffic.registerSpecialVehicleProvider(provider)`

Registers (or replaces) a special vehicle provider (police, taxi...). Fields read: name (required), priority, minTotalAmount, guaranteed, getDesiredCount(amount, options), buildGroup(count, options), buildReservedGroup, reserved.

- `provider` (*table*) : Provider description.

#### `gameplay_traffic.removeReservedVehicles(providerName)`

Removes all reserved vehicles of a provider and cancels an ongoing spawn.

- `providerName` (*string*) : Provider name.
- **returns**: integer Number of vehicles removed.

#### `gameplay_traffic.removeTraffic(id, stopAi)`

Removes a vehicle from traffic: resets the role's action, shows the vehicle again, makes it playable and takes it out of the pool. Emits onTrafficVehicleRemoved.

- `id` (*integer*) : Vehicle identifier.
- `stopAi` (*boolean|nil*) : Set the vehicle's AI to 'stop' mode.

#### `gameplay_traffic.respawnVehicle(id, pos, rot, strict)`

Moves a vehicle to a new position and rotation (for traffic) and calls onRespawn on its traffic object. Non-strict mode: spawn.safeTeleport (slower, avoids static geometry).

- `id` (*integer*) : Vehicle identifier.
- `pos` (*vec3*) : Position.
- `rot` (*quat*) : Rotation.
- `strict` (*boolean|nil*) : Direct placement (setPositionRotation + autoplace) with a 180° rotation added.

#### `gameplay_traffic.returnReservedVehicle(ids, immediate)`

Returns in-service reserves to the dormant pool. They keep driving until their next teleport out of sight, where they deactivate; with immediate, they become dormant right away.

- `ids` (*integer|integer[]*) : Identifier(s).
- `immediate` (*boolean|nil*) : Deactivate immediately.

#### `gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist)`

Teleports a group of vehicles away from the current location (alias forceTeleportAll).

- `vehIds` (*integer[]|nil*) : Vehicles; default all AI traffic vehicles.
- `minDist` (*number|nil*) : Minimum distance.
- `maxDist` (*number|nil*) : Maximum distance.

#### `gameplay_traffic.setActiveAmount(amount)`

Sets the maximum number of active (visible) vehicles.

- `amount` (*integer|nil*) : Number; nil = unlimited.

#### `gameplay_traffic.setDebugMode(value)`

Enables or disables traffic debug mode (via setTrafficVars aiDebug).

- `value` (*boolean*) : true to enable.

#### `gameplay_traffic.setFocus(mode, data)`

Sets the focus point used to decide which vehicles stay active or get teleported (traffic and parking).

- `mode` (*string|nil*) : 'camera', 'vehicle' or 'custom'; nil = camera with automatic switching.
- `data` (*table|nil*) : vehId (vehicle mode); pos, dir, speed (custom mode); auto (boolean).

#### `gameplay_traffic.setTrafficVars(data, reset)`

Modifies the traffic variables and propagates them to the vehicles (AI mode, AI parameters, spawnValue, spawnDirBias, debug, activeAmount). Switching to an aiMode other than 'traffic' sets the roles to 'empty' (restored when returning to 'traffic').

- `data` (*table*) : Variables to merge.
- `reset` (*boolean|nil*) : Reset to default values first.

#### `gameplay_traffic.setupCustomTraffic(amount, params)`

Spawns a group created with custom parameters.

- `amount` (*integer|nil*) : Amount (settings if nil or negative).
- `params` (*table|nil*) : core_multiSpawn.createGroup parameters.

#### `gameplay_traffic.setupTraffic(amount, options)`

Prepares traffic: removes the current traffic (unless keepCurrent), determines the number of vehicles (setting or CPU if -1), builds or loads the group (level file, custom or generated group), inserts the special providers' vehicles (up to 40% of the total) and the reserves, then switches to the 'loading' state; the actual spawn then happens in onUpdate.

- `amount` (*integer|nil*) : Number of vehicles; -1 or nil = automatic according to the settings (trafficAmount, trafficExtraVehicles/trafficExtraAmount).
- `options` (*table|nil*) : activeAmount, keepCurrent, vehGroup, autoAdjustAmount, autoLoadFromFile, simpleVehs, allMods, allConfigs, pos, rot.
- **returns**: boolean true if a spawn was started, false if there is nothing to create.

#### `gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions)`

Prepares traffic and parked vehicles at the same time (parking first). The hook onTrafficOrParkingReady signals completion.

- `trafficAmount` (*integer|nil*) : Traffic amount.
- `trafficOptions` (*table|nil*) : setupTraffic options.
- `parkingAmount` (*integer|nil*) : Parked vehicle amount.
- `parkingOptions` (*table|nil*) : gameplay_parking.setupVehicles options.
- `extraOptions` (*table|nil*) : Not used.
- **returns**: boolean Traffic prepared.
- **returns**: boolean Parking prepared.

#### `gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options)`

Used by the pause menu: displays the waiting icon (app:waiting) and prepares traffic; the spawn starts in onUiWaitingState.

- `useTraffic` (*boolean*) : Enable traffic.
- `useParked` (*boolean*) : Enable parked vehicles (ignored if traffic is enabled but the trafficParkedVehicles setting is false).
- `options` (*table|nil*) : setupTraffic options.

#### `gameplay_traffic.spawnTraffic(amount, groupData, options)`

Spawns a group of vehicles via core_multiSpawn.spawnGroup (name 'autoTraffic'). Sets the state to 'spawning'. Low-level public interface; setupTraffic is preferred.

- `amount` (*integer|nil*) : Number of vehicles; default: settings value minus the existing vehicles (at least 1).
- `groupData` (*table|nil*) : Vehicle group; default core_multiSpawn.createGroup(amount).
- `options` (*table|nil*) : mode ('traffic' by default), gap (20 m), pos, dir.
- **returns**: any Result of core_multiSpawn.spawnGroup.

#### `gameplay_traffic.toggle(keepInMemory)`

Enables or disables traffic in freeroam (ignored outside freeroam or if the toggleTraffic action is blocked). If turned off, runs setupTraffic; if turned on, either removes the vehicles or, with keepInMemory, deactivates them (activeAmount = 0) for instant reactivation.

- `keepInMemory` (*boolean|nil*) : Keep the vehicles in memory (uses RAM).

#### `gameplay_traffic.trackAIAllVeh(mode)`

Called when the player sets an AI mode for all vehicles: applies this mode as the traffic aiMode.

- `mode` (*string|nil*) : AI mode; default 'traffic'.

#### `gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options)`

Restores the systems from the freezeState data then scatters the traffic (scatterTraffic).

- `trafficData` (*table|nil*) : Traffic data.
- `policeData` (*table|nil*) : Police data.
- `parkingData` (*table|nil*) : Parking data.
- `options` (*table|nil*) : Options (respawnVehicles, debugVehicleStashing).

#### `gameplay_traffic.unprotectNonReservedVehicle(id)`

Removes this protection: the vehicle becomes normal traffic again.

- `id` (*integer*) : Vehicle identifier.

#### `gameplay_traffic.unregisterSpecialVehicleProvider(name)`

Removes a provider by name.

- `name` (*string*) : Provider name.

#### `gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter)`

Brings into service up to count dormant reserves of a provider and activates them (forced into the pool). The vehicles become "claimed".

- `providerName` (*string*) : Provider name.
- `count` (*integer|nil*) : Number (default 1).
- `onClaim` (*function|nil*) : Callback (id, veh) for each vehicle taken.
- `filter` (*function|nil*) : Filter (id, veh) -> boolean.
- **returns**: integer[] Identifiers taken.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugMode` | boolean | Visual debug mode and log (draws a line and text per vehicle in onPreRender). Modified by setDebugMode / setTrafficVars({aiDebug='traffic'}). |
| `dependencies` | string[] | Extensions loaded before this module. |
| `showMessages` | boolean | Allows automatic display of UI messages (true by default). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTrafficAmountChanged` — listened to by 2 module(s)
- `onTrafficOrParkingReady` — listened to by 2 module(s)
- `onTrafficReservedVehiclesReady`
- `onTrafficSpecialVehiclesProviders` — listened to by 2 module(s)
- `onTrafficStarted` — listened to by 7 module(s)
- `onTrafficStopped` — listened to by 6 module(s)
- `onTrafficVehicleAdded` — listened to by 2 module(s)
- `onTrafficVehicleRemoved` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `QuickAccessMenu`, `app:waiting`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getEnabled`, `getObjectActive`, `getObjectPositionXYZ`, `getObjectVelocityXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `obj:` `autoplace`, `delete`, `getDirectionVector`, `getDirectionVectorUp`, `getDynDataFieldbyName`, `getField`, `getMetallicPaintData`, `getPosition`, `isPlayerControlled`, `queueLuaCommand`, `resetBrokenFlexMesh`, `setDynDataFieldbyName`, `setMeshAlpha`, `setPositionRotation`

**Loads extensions:** `core_multiSpawn`, `core_vehicleActivePooling`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic.lua`.*
