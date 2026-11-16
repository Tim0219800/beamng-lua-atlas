---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main AI traffic system in freeroam. It spawns a group of vehicles (via core_multiSpawn), inserts them into the traffic table (gameplay/traffic/vehicle objects with roles), manages a pool of active/inactive vehicles (core_vehicleActivePooling), and respawns them in front of the focus point (player or camera) on the road network. It also manages the global traffic variables (aggression, speed limit, AI mode...), a system of "reserved" vehicles for special providers (police, taxi...), state saving/restoring and visual debug. States: 'off', 'spawning', 'loading', 'on'.
--- Access: extension `gameplay_traffic`: `extensions.load("gameplay_traffic")`, then the global `gameplay_traffic`
---@class gameplay_traffic
---@field debugMode boolean Visual debug mode and log (draws a line and text per vehicle in onPreRender). Modified by setDebugMode / setTrafficVars({aiDebug='traffic'}).
---@field dependencies string[] Extensions loaded before this module.
---@field showMessages boolean Allows automatic display of UI messages (true by default).
gameplay_traffic = {}

--- Enables traffic mode and adds vehicles to the table. If vehList is not a table, takes all non-parked vehicles (compatibility).
---Source: lua/ge/extensions/gameplay/traffic.lua:966
---@param vehList integer[]|nil Identifiers to add.
function gameplay_traffic.activate(vehList) end

--- Removes all vehicles from the traffic table.
---Source: lua/ge/extensions/gameplay/traffic.lua:992
---@param stopAi boolean|nil Stop the vehicles' AI.
function gameplay_traffic.deactivate(stopAi) end

--- Removes all traffic vehicles (AI or marked isTraffic) from the scene and from the table.
---Source: lua/ge/extensions/gameplay/traffic.lua:956
function gameplay_traffic.deleteVehicles() end

--- Ensures a provider has count reserved vehicles (in fact spawns at most 4 at a time). Emits onTrafficReservedVehiclesReady when already sufficient.
---Source: lua/ge/extensions/gameplay/traffic.lua:99
---@param providerName string Provider name.
---@param count integer Desired number.
---@return boolean  false if nothing to do or failure, true if already ready or spawn started.
function gameplay_traffic.ensureReservedVehicles(providerName, count) end

--- Forcibly teleports a traffic vehicle to a safe spawn point found around pos. Ignored if enableRespawn is false or if ignoreForceTeleport is true; an unused reserve is simply made dormant.
---Source: lua/ge/extensions/gameplay/traffic.lua:508
---@param id integer Vehicle identifier.
---@param pos vec3|nil Search center; default camera position.
---@param dir vec3|nil Direction; default camera forward direction.
---@param minDist number|nil Minimum distance (default 100 m).
---@param maxDist number|nil Maximum distance (default 500 m).
---@param targetDist number|nil Target visible distance.
function gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist) end

--- Alias of scatterTraffic.
---Source: lua/ge/extensions/gameplay/traffic.lua:540
---@param vehIds integer[]|nil Vehicles.
---@param minDist number|nil Minimum distance.
---@param maxDist number|nil Maximum distance.
function gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist) end

--- Stops the traffic, police and parking systems and returns their serialized data (used for example at the start of a mission).
---Source: lua/ge/extensions/gameplay/traffic.lua:1219
---@param options table|nil onSerialize options (despawnVehicles, exceptVehicleId, debugVehicleStashing).
---@return table  Traffic data.
---@return table  Police data.
---@return table  Parking data.
function gameplay_traffic.freezeState(options) end

--- Returns the focus table {mode, pos, dirVec, speed, vehId, auto}.
---Source: lua/ge/extensions/gameplay/traffic.lua:383
---@return table  Current focus.
function gameplay_traffic.getFocus() end

--- Computes the ideal number of vehicles to create.
---Source: lua/ge/extensions/gameplay/traffic.lua:276
---@param amount integer|nil Requested amount; nil or negative = settings (CPU if 0).
---@param enforceLimit boolean|nil Subtracts the already present active non-parked vehicles (plus one for the player).
---@return integer  Amount.
function gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit) end

--- Alias of getTrafficAmount.
---Source: lua/ge/extensions/gameplay/traffic.lua:301
---@param activeOnly boolean|nil Count only the active ones.
---@return integer  Amount.
function gameplay_traffic.getNumOfTraffic(activeOnly) end

--- System state: 'off', 'spawning', 'loading' or 'on'.
---Source: lua/ge/extensions/gameplay/traffic.lua:297
---@return string  State.
function gameplay_traffic.getState() end

--- Alias of getTrafficData.
---Source: lua/ge/extensions/gameplay/traffic.lua:309
---@return table<integer, table>  Traffic vehicles.
function gameplay_traffic.getTraffic() end

--- Alias of getTrafficList.
---Source: lua/ge/extensions/gameplay/traffic.lua:305
---@return integer[]  Identifiers.
function gameplay_traffic.getTrafficAiVehIds() end

--- Number of AI traffic vehicles (alias getNumOfTraffic).
---Source: lua/ge/extensions/gameplay/traffic.lua:301
---@param activeOnly boolean|nil Count only the active ones (bounded by activeAmount).
---@return integer  Amount.
function gameplay_traffic.getTrafficAmount(activeOnly) end

--- Full traffic table: identifier -> traffic vehicle object (alias getTraffic). Also contains the player vehicle.
---Source: lua/ge/extensions/gameplay/traffic.lua:309
---@return table<integer, table>  Traffic vehicles.
function gameplay_traffic.getTrafficData() end

--- List of AI traffic vehicle identifiers (alias getTrafficAiVehIds).
---Source: lua/ge/extensions/gameplay/traffic.lua:305
---@return integer[]  Identifiers (internal table, do not modify).
function gameplay_traffic.getTrafficList() end

--- Returns the traffic variables table (direct reference).
---Source: lua/ge/extensions/gameplay/traffic.lua:347
---@return table  Variables (see notes).
function gameplay_traffic.getTrafficVars() end

--- Inserts an existing vehicle into the traffic table (creates the traffic vehicle object, adds it to the pool, sets the AI mode, handles the 'reserved:' marking via spawnMeta). Emits onTrafficVehicleAdded.
---Source: lua/ge/extensions/gameplay/traffic.lua:778
---@param id integer Vehicle identifier.
---@param ignoreAi boolean|nil Applies neither AI nor respawn (used for the player vehicle).
---@param ignoreVehPool boolean|nil Do not add it to the deactivation pool.
function gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool) end

--- Hook: stops traffic, clears the reserved spawns, resets variables and focus.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1566
function gameplay_traffic.onClientEndMission() end

--- Hook: updates the passengers' visibility of simple_traffic vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1554
function gameplay_traffic.onClientStartMission() end

--- Restores the traffic state; with respawnVehicles, recreates the stored vehicles and remaps their identifiers (role, pursuit, collisions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1639
---@param data table Data from onSerialize.
---@param options table|nil respawnVehicles, debugVehicleStashing.
function gameplay_traffic.onDeserialized(data, options) end

--- Hook: updates the passengers' visibility of simple_traffic vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1558
function gameplay_traffic.onExtensionLoaded() end

--- Render hook: in debug mode, draws for each active vehicle a line to the focus and a text (id, distance, speed in km/h).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1493
---@param dt number Frame time.
function gameplay_traffic.onPreRender(dt) end

--- Serializes the traffic state (state, vehicles, variables), then stops the traffic. With despawnVehicles, also stores the vehicles' spawn data and removes them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1591
---@param options table|nil despawnVehicles, exceptVehicleId, debugVehicleStashing.
---@return table  Data {state, traffic, vars, vehicleSpawnData, vehicleSpawnOrder}.
function gameplay_traffic.onSerialize(options) end

--- Hook: updates the passengers' visibility (enableSeatOccupants setting).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1562
function gameplay_traffic.onSettingsChanged() end

--- Hook: sets the state to 'on', prepares the pool and inserts the player vehicles. Emitted by onUpdate after the first AI vehicle is inserted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1516
function gameplay_traffic.onTrafficStarted() end

--- Hook: deletes the pool and clears the traffic tables ('off' state).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1547
function gameplay_traffic.onTrafficStopped() end

--- Hook called when the waiting screen is displayed: runs setupTrafficHelper with the parameters prepared by setupTrafficWaitForUi.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1574
function gameplay_traffic.onUiWaitingState() end

--- Hook called every frame: starts the spawn in 'loading' state, monitors the watchdog, triggers onTrafficStarted/onTrafficStopped, updates the focus, the pool and the traffic logic (one vehicle processed per frame).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1417
---@param dtReal number Real time (s).
---@param dtSim number Simulated time (s).
function gameplay_traffic.onUpdate(dtReal, dtSim) end

--- Hook called when a vehicle is activated/deactivated: hides a deactivated vehicle and teleports a reactivated vehicle if its position is not safe.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:936
---@param vehId integer Vehicle identifier.
---@param active boolean New state.
function gameplay_traffic.onVehicleActiveChanged(vehId, active) end

--- Hook: removes the destroyed vehicle from traffic and from the ongoing spawn.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:923
---@param id integer Vehicle identifier.
function gameplay_traffic.onVehicleDestroyed(id) end

--- Hook called when a multiSpawn group is created: activates the vehicles of the 'autoTraffic' group, applies fancy license plates, handles the reserves and emits onTrafficOrParkingReady when everything is ready.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1346
---@param vehList integer[] Vehicles of the group.
---@param groupId any Group identifier.
---@param groupName string Group name.
function gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName) end

--- Hook called when a vehicle's mapmgr is ready; ends the loading when all expected vehicles have reported.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:1335
---@param id integer Vehicle identifier.
function gameplay_traffic.onVehicleMapmgrUpdate(id) end

--- Hook: handles the reset of a traffic vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:905
---@param id integer Vehicle identifier.
function gameplay_traffic.onVehicleResetted(id) end

--- Hook: when a traffic vehicle spawns or is replaced, reapplies its model data and its automatic role.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:890
---@param id integer Vehicle identifier.
function gameplay_traffic.onVehicleSpawned(id) end

--- Hook: checks that the new player vehicle is in the traffic table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic.lua:901
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
function gameplay_traffic.onVehicleSwitched(oldId, newId) end

--- Protects a non-reserved vehicle from automatic pooling while a provider is using it (same protections as a taken reserve).
---Source: lua/ge/extensions/gameplay/traffic.lua:259
---@param id integer Vehicle identifier.
---@param providerName string Provider name.
function gameplay_traffic.protectNonReservedVehicle(id, providerName) end

--- Replaces in place the model/config of an unused reserve (spawn.setVehicleObject), sets it to the 'empty' role and dormant.
---Source: lua/ge/extensions/gameplay/traffic.lua:226
---@param providerName string Provider name.
---@param id integer Vehicle identifier.
---@param spawnData table {model, config}; config can be a name or a .pc path.
---@return boolean  true if recycled.
function gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData) end

--- Calls onRefresh on each traffic vehicle (resets its data).
---Source: lua/ge/extensions/gameplay/traffic.lua:688
function gameplay_traffic.refreshVehicles() end

--- Registers (or replaces) a special vehicle provider (police, taxi...). Fields read: name (required), priority, minTotalAmount, guaranteed, getDesiredCount(amount, options), buildGroup(count, options), buildReservedGroup, reserved.
---Source: lua/ge/extensions/gameplay/traffic.lua:76
---@param provider table Provider description.
function gameplay_traffic.registerSpecialVehicleProvider(provider) end

--- Removes all reserved vehicles of a provider and cancels an ongoing spawn.
---Source: lua/ge/extensions/gameplay/traffic.lua:147
---@param providerName string Provider name.
---@return integer  Number of vehicles removed.
function gameplay_traffic.removeReservedVehicles(providerName) end

--- Removes a vehicle from traffic: resets the role's action, shows the vehicle again, makes it playable and takes it out of the pool. Emits onTrafficVehicleRemoved.
---Source: lua/ge/extensions/gameplay/traffic.lua:840
---@param id integer Vehicle identifier.
---@param stopAi boolean|nil Set the vehicle's AI to 'stop' mode.
function gameplay_traffic.removeTraffic(id, stopAi) end

--- Moves a vehicle to a new position and rotation (for traffic) and calls onRespawn on its traffic object. Non-strict mode: spawn.safeTeleport (slower, avoids static geometry).
---Source: lua/ge/extensions/gameplay/traffic.lua:488
---@param id integer Vehicle identifier.
---@param pos vec3 Position.
---@param rot quat Rotation.
---@param strict boolean|nil Direct placement (setPositionRotation + autoplace) with a 180° rotation added.
function gameplay_traffic.respawnVehicle(id, pos, rot, strict) end

--- Returns in-service reserves to the dormant pool. They keep driving until their next teleport out of sight, where they deactivate; with immediate, they become dormant right away.
---Source: lua/ge/extensions/gameplay/traffic.lua:215
---@param ids integer|integer[] Identifier(s).
---@param immediate boolean|nil Deactivate immediately.
function gameplay_traffic.returnReservedVehicle(ids, immediate) end

--- Teleports a group of vehicles away from the current location (alias forceTeleportAll).
---Source: lua/ge/extensions/gameplay/traffic.lua:540
---@param vehIds integer[]|nil Vehicles; default all AI traffic vehicles.
---@param minDist number|nil Minimum distance.
---@param maxDist number|nil Maximum distance.
function gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist) end

--- Sets the maximum number of active (visible) vehicles.
---Source: lua/ge/extensions/gameplay/traffic.lua:773
---@param amount integer|nil Number; nil = unlimited.
function gameplay_traffic.setActiveAmount(amount) end

--- Enables or disables traffic debug mode (via setTrafficVars aiDebug).
---Source: lua/ge/extensions/gameplay/traffic.lua:768
---@param value boolean true to enable.
function gameplay_traffic.setDebugMode(value) end

--- Sets the focus point used to decide which vehicles stay active or get teleported (traffic and parking).
---Source: lua/ge/extensions/gameplay/traffic.lua:351
---@param mode string|nil 'camera', 'vehicle' or 'custom'; nil = camera with automatic switching.
---@param data table|nil vehId (vehicle mode); pos, dir, speed (custom mode); auto (boolean).
function gameplay_traffic.setFocus(mode, data) end

--- Modifies the traffic variables and propagates them to the vehicles (AI mode, AI parameters, spawnValue, spawnDirBias, debug, activeAmount). Switching to an aiMode other than 'traffic' sets the roles to 'empty' (restored when returning to 'traffic').
---Source: lua/ge/extensions/gameplay/traffic.lua:713
---@param data table Variables to merge.
---@param reset boolean|nil Reset to default values first.
function gameplay_traffic.setTrafficVars(data, reset) end

--- Spawns a group created with custom parameters.
---Source: lua/ge/extensions/gameplay/traffic.lua:1184
---@param amount integer|nil Amount (settings if nil or negative).
---@param params table|nil core_multiSpawn.createGroup parameters.
function gameplay_traffic.setupCustomTraffic(amount, params) end

--- Prepares traffic: removes the current traffic (unless keepCurrent), determines the number of vehicles (setting or CPU if -1), builds or loads the group (level file, custom or generated group), inserts the special providers' vehicles (up to 40% of the total) and the reserves, then switches to the 'loading' state; the actual spawn then happens in onUpdate.
---Source: lua/ge/extensions/gameplay/traffic.lua:1008
---@param amount integer|nil Number of vehicles; -1 or nil = automatic according to the settings (trafficAmount, trafficExtraVehicles/trafficExtraAmount).
---@param options table|nil activeAmount, keepCurrent, vehGroup, autoAdjustAmount, autoLoadFromFile, simpleVehs, allMods, allConfigs, pos, rot.
---@return boolean  true if a spawn was started, false if there is nothing to create.
function gameplay_traffic.setupTraffic(amount, options) end

--- Prepares traffic and parked vehicles at the same time (parking first). The hook onTrafficOrParkingReady signals completion.
---Source: lua/ge/extensions/gameplay/traffic.lua:1150
---@param trafficAmount integer|nil Traffic amount.
---@param trafficOptions table|nil setupTraffic options.
---@param parkingAmount integer|nil Parked vehicle amount.
---@param parkingOptions table|nil gameplay_parking.setupVehicles options.
---@param extraOptions table|nil Not used.
---@return boolean  Traffic prepared.
---@return boolean  Parking prepared.
function gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions) end

--- Used by the pause menu: displays the waiting icon (app:waiting) and prepares traffic; the spawn starts in onUiWaitingState.
---Source: lua/ge/extensions/gameplay/traffic.lua:1168
---@param useTraffic boolean Enable traffic.
---@param useParked boolean Enable parked vehicles (ignored if traffic is enabled but the trafficParkedVehicles setting is false).
---@param options table|nil setupTraffic options.
function gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options) end

--- Spawns a group of vehicles via core_multiSpawn.spawnGroup (name 'autoTraffic'). Sets the state to 'spawning'. Low-level public interface; setupTraffic is preferred.
---Source: lua/ge/extensions/gameplay/traffic.lua:998
---@param amount integer|nil Number of vehicles; default: settings value minus the existing vehicles (at least 1).
---@param groupData table|nil Vehicle group; default core_multiSpawn.createGroup(amount).
---@param options table|nil mode ('traffic' by default), gap (20 m), pos, dir.
---@return any  Result of core_multiSpawn.spawnGroup.
function gameplay_traffic.spawnTraffic(amount, groupData, options) end

--- Enables or disables traffic in freeroam (ignored outside freeroam or if the toggleTraffic action is blocked). If turned off, runs setupTraffic; if turned on, either removes the vehicles or, with keepInMemory, deactivates them (activeAmount = 0) for instant reactivation.
---Source: lua/ge/extensions/gameplay/traffic.lua:1193
---@param keepInMemory boolean|nil Keep the vehicles in memory (uses RAM).
function gameplay_traffic.toggle(keepInMemory) end

--- Called when the player sets an AI mode for all vehicles: applies this mode as the traffic aiMode.
---Source: lua/ge/extensions/gameplay/traffic.lua:1330
---@param mode string|nil AI mode; default 'traffic'.
function gameplay_traffic.trackAIAllVeh(mode) end

--- Restores the systems from the freezeState data then scatters the traffic (scatterTraffic).
---Source: lua/ge/extensions/gameplay/traffic.lua:1226
---@param trafficData table|nil Traffic data.
---@param policeData table|nil Police data.
---@param parkingData table|nil Parking data.
---@param options table|nil Options (respawnVehicles, debugVehicleStashing).
function gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options) end

--- Removes this protection: the vehicle becomes normal traffic again.
---Source: lua/ge/extensions/gameplay/traffic.lua:264
---@param id integer Vehicle identifier.
function gameplay_traffic.unprotectNonReservedVehicle(id) end

--- Removes a provider by name.
---Source: lua/ge/extensions/gameplay/traffic.lua:90
---@param name string Provider name.
function gameplay_traffic.unregisterSpecialVehicleProvider(name) end

--- Brings into service up to count dormant reserves of a provider and activates them (forced into the pool). The vehicles become "claimed".
---Source: lua/ge/extensions/gameplay/traffic.lua:195
---@param providerName string Provider name.
---@param count integer|nil Number (default 1).
---@param onClaim function|nil Callback (id, veh) for each vehicle taken.
---@param filter function|nil Filter (id, veh) -> boolean.
---@return integer[]  Identifiers taken.
function gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter) end

