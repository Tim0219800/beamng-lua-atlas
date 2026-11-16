---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/parking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parked vehicles and parking tracking system. On one hand it spawns parked cars on the spots of the level's sites file (city.sites.json via gameplay_city) and teleports them to new spots in front of the player when they move away, relying on an activation pool (core_vehicleActivePooling). On the other hand it tracks a driven vehicle (enableTracking) to detect that it enters, exits or parks correctly in a spot and emits onVehicleParkingStatus. A modder uses it to populate an area with parked cars or for parking missions.
--- Access: extension `gameplay_parking`: `extensions.load("gameplay_parking")`, then the global `gameplay_parking`
---@class gameplay_parking
---@field debugLevel integer Debug level: > 0 teleport and filtering logs; >= 1 draws the spots around the tracked vehicle; >= 2 draws the corners; >= 3 draws the search point and the circles.
---@field dependencies string[] {'core_vehicleActivePooling'}, extension loaded beforehand.
gameplay_parking = {}

--- Activates a group of vehicles as parked cars (inserts them), then emits onParkingVehiclesActivated. Disables the system if there are no sites, no vehicles or none inserted. Alias: processVehicles.
---Source: lua/ge/extensions/gameplay/parking.lua:660
---@param vehIds integer[] Vehicle ids.
function gameplay_parking.activate(vehIds) end

--- Indicates whether a spot is usable for a parked vehicle: existing, within the focus distance window, free (no vehicle, not banned, no vehicle on it), outside the trafficClearRadius radii, suitable size (neither too small nor too large: ratio >= 0.5).
---Source: lua/ge/extensions/gameplay/parking.lua:155
---@param vehId integer Vehicle to park.
---@param parkingSpot table Spot to test.
---@param minDist number|nil Minimum distance to the focus (m, default 0).
---@param maxDist number|nil Maximum distance to the focus (m, default 1e12).
---@return boolean  true if the spot is suitable.
function gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist) end

--- Disables the system: clears the lists, deletes the pool and emits onParkingVehiclesDeactivated.
---Source: lua/ge/extensions/gameplay/parking.lua:682
function gameplay_parking.deactivate() end

--- Deletes the last parked cars from the world (all by default).
---Source: lua/ge/extensions/gameplay/parking.lua:647
---@param amount integer|nil Number to delete, starting from the end of the list.
function gameplay_parking.deleteVehicles(amount) end

--- Stops the parking tracking of a vehicle.
---Source: lua/ge/extensions/gameplay/parking.lua:394
---@param vehId integer|nil Vehicle (default player 0).
function gameplay_parking.disableTracking(vehId) end

--- Enables parking tracking for a driven vehicle (also enables the system). Creates the tracking data: inside, preParked, parked, event, maxDist 80 m, parkingTimer, isOversized...
---Source: lua/ge/extensions/gameplay/parking.lua:374
---@param vehId integer|nil Vehicle (default player 0).
---@param autoDisable boolean|nil If true, tracking stops at the first parking validation.
function gameplay_parking.enableTracking(vehId, autoDisable) end

--- Filters in place a list coming from findParkingSpots: removes banned spots, then depending on filters: standardSize (width <= 3, length <= 8), checkVehicles (no vehicle on it), useProbability (spot probability × baseProbability × day/night coefficient according to the time and the dayTime/nightTime tags). Default: {useProbability = true}.
---Source: lua/ge/extensions/gameplay/parking.lua:226
---@param psList table[] List {ps, squaredDistance}.
---@param filters table|nil useProbability, standardSize, checkVehicles.
---@return table[]  The same filtered list.
function gameplay_parking.filterParkingSpots(psList, filters) end

--- Finds the spots in a ring around a position, sorted from nearest to farthest.
---Source: lua/ge/extensions/gameplay/parking.lua:197
---@param pos vec3|nil Center (default camera position).
---@param minRadius number|nil Minimum radius (default 0).
---@param maxRadius number|nil Maximum radius (default 200 m).
---@return table[]  List {ps = spot, squaredDistance = number}.
function gameplay_parking.findParkingSpots(pos, minRadius, maxRadius) end

--- Forces a parked car to teleport to a new random free spot nearby. Without a valid spot, sends it off the map via gameplay_traffic.forceTeleport. Has no effect if enableRespawn is false or if the car has ignoreForceTeleport.
---Source: lua/ge/extensions/gameplay/parking.lua:335
---@param vehId integer Parked car.
---@param pos vec3|nil Reference position (default camera).
---@param minDist number|nil Minimum distance.
---@param maxDist number|nil Maximum distance.
function gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist) end

--- Id of the spot where a vehicle is correctly parked. With active tracking, returns parkingSpotId if preParked; without tracking, searches for the nearest spot (15 m) that contains the vehicle with the precision vars.precision.
---Source: lua/ge/extensions/gameplay/parking.lua:403
---@param vehId integer|nil Vehicle (default player 0).
---@return integer|nil  Spot id, or nil.
function gameplay_parking.getCurrentParkingSpot(vehId) end

--- Number of parked cars managed; with activeOnly, capped by activeAmount. Alias: getParkingAmount.
---Source: lua/ge/extensions/gameplay/parking.lua:462
---@param activeOnly boolean|nil true to count at most activeAmount.
---@return integer  Number.
function gameplay_parking.getParkedCarsAmount(activeOnly) end

--- Data per parked car: parkingSpotId, activeRadius, randomPaint, searchFlag...
---Source: lua/ge/extensions/gameplay/parking.lua:470
---@return table<integer, table>  Data (direct reference).
function gameplay_parking.getParkedCarsData() end

--- List of the ids of the managed parked cars.
---Source: lua/ge/extensions/gameplay/parking.lua:466
---@return integer[]  Ids (direct reference).
function gameplay_parking.getParkedCarsList() end

--- Alias of getParkedCarsAmount.
---Source: lua/ge/extensions/gameplay/parking.lua:462
---@param activeOnly boolean|nil See getParkedCarsAmount.
---@return integer  Number.
function gameplay_parking.getParkingAmount(activeOnly) end

--- Returns the collection of parking spots (sites.parkingSpots: sorted, objects...), loading the sites if necessary.
---Source: lua/ge/extensions/gameplay/parking.lua:74
---@return table|nil  Collection of spots, nil without sites.
function gameplay_parking.getParkingSpots() end

--- Current parking variables.
---Source: lua/ge/extensions/gameplay/parking.lua:458
---@return table  Variables (direct reference).
function gameplay_parking.getParkingVars() end

--- Returns a sorted list of valid spots with a random bias in favor of those closest to the origin position. Widens the radius until there are enough spots or maxDist is reached.
---Source: lua/ge/extensions/gameplay/parking.lua:295
---@param originPos vec3|nil Origin (default camera).
---@param minDist number|nil Minimum distance (default 0).
---@param maxDist number|nil Maximum distance (default 10000).
---@param targetCount integer|nil Number of spots wanted; nil or <= 0 = maxDist radius and automatic minimum.
---@param filters table|nil Filters of filterParkingSpots.
---@return table[]  List {ps, squaredDistance} (empty if nothing found).
function gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters) end

--- Indicates whether the system is active.
---Source: lua/ge/extensions/gameplay/parking.lua:70
---@return boolean  true if active.
function gameplay_parking.getState() end

--- Tracking data of all tracked vehicles, by id.
---Source: lua/ge/extensions/gameplay/parking.lua:399
---@return table<integer, table>  Data (inside, parked, event, parkingSpotId, lastParkingSpotId...).
function gameplay_parking.getTrackingData() end

--- Adds a vehicle to the managed parked cars: creates the 'autoParking' pool if needed, makes it unusable by the player, associates it with its current spot if any and enables mapmgr tracking. Ignored if obj.ignoreParking.
---Source: lua/ge/extensions/gameplay/parking.lua:604
---@param vehId integer Vehicle.
function gameplay_parking.insertVehicle(vehId) end

--- Places a parked vehicle on a spot: chooses the direction (forwards/backwards tags, otherwise using neatness), adds a random offset and rotation unless the perfect tag, turns the ignition off, frees the old spot, may change the paint, and updates the mapmgr tracking.
---Source: lua/ge/extensions/gameplay/parking.lua:95
---@param vehId integer Vehicle to move.
---@param parkingSpot table Parking spot object.
---@param lowPrecision boolean|nil Passed to moveResetVehicleTo (used when the vehicle is not ready).
function gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision) end

--- Level end hook: calls resetAll.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:1004
function gameplay_parking.onClientEndMission() end

--- Level start hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:1001
function gameplay_parking.onClientStartMission() end

--- Hook after Lua reload: respawns the stored cars if options.respawnVehicles, reactivates the parked cars, restores the tracking, the variables and the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:1049
---@param data table Result of onSerialize.
---@param options table|nil respawnVehicles, debugVehicleStashing.
function gameplay_parking.onDeserialized(data, options) end

--- Hook before Lua reload: returns the state (active, parked cars, tracking, variables). With options.despawnVehicles, also captures the cars' spawn data (except options.exceptVehicleId) then deletes them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:1008
---@param options table|nil despawnVehicles, exceptVehicleId, debugVehicleStashing.
---@return table  Data to restore.
function gameplay_parking.onSerialize(options) end

--- Called every frame. Updates the parking tracking (enter/exit/valid/invalid events), periodically searches for spots in front of the player and recycles one parked car per frame to a new spot out of the player's range.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:822
---@param dt number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_parking.onUpdate(dt, dtSim) end

--- Activation pool hook: marks a deactivated parked car for teleport; on its reactivation, teleports it if another vehicle (100 m from a player, 20 m otherwise) is nearby.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:800
---@param vehId integer Vehicle.
---@param active boolean New activity state.
function gameplay_parking.onVehicleActiveChanged(vehId, active) end

--- Hook: removes the vehicle from the parked car and tracking lists, and frees its spot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:787
---@param vehId integer Destroyed vehicle.
function gameplay_parking.onVehicleDestroyed(vehId) end

--- core_multiSpawn hook: activates the group when it is named 'autoParking'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:772
---@param vehList integer[] Vehicles spawned.
---@param groupId any Group id (unused).
---@param groupName string Group name.
function gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName) end

--- Hook: when the player vehicle is reset/teleported, forces a search for spots near the player (near respawn mode).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/parking.lua:778
---@param vehId integer Vehicle reset.
function gameplay_parking.onVehicleResetted(vehId) end

--- Alias of activate.
---Source: lua/ge/extensions/gameplay/parking.lua:660
---@param vehIds integer[] Vehicle ids.
function gameplay_parking.processVehicles(vehIds) end

--- Removes a vehicle from the managed parked cars (does not delete it from the world).
---Source: lua/ge/extensions/gameplay/parking.lua:640
---@param vehId integer Vehicle.
function gameplay_parking.removeVehicle(vehId) end

--- Resets everything: disables, forgets the sites, clears lists and tracking, deletes the pool and restores the default variables.
---Source: lua/ge/extensions/gameplay/parking.lua:758
function gameplay_parking.resetAll() end

--- Teleports all parked cars (or those provided) to random spots; falls back to forceTeleport when no spot is suitable.
---Source: lua/ge/extensions/gameplay/parking.lua:362
---@param vehIds integer[]|nil Cars (default all parked cars).
---@param minDist number|nil Minimum distance.
---@param maxDist number|nil Maximum distance.
function gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist) end

--- Sets the maximum number of active (visible) parked cars; nil = unlimited.
---Source: lua/ge/extensions/gameplay/parking.lua:453
---@param amount number|nil Maximum number.
function gameplay_parking.setActiveAmount(amount) end

--- Merges parking variables (resets first if reset). A radiusCoef resets the active radii; an activeAmount updates the vehicle pool.
---Source: lua/ge/extensions/gameplay/parking.lua:434
---@param data table precision, neatness, radiusCoef, baseProbability, activeAmount, enableRespawn.
---@param reset boolean|nil true to return to the default values before merging.
function gameplay_parking.setParkingVars(data, reset) end

--- Sets the site data (parking spots) used, replacing those of the level. Accepts a file path, or a valid sites table (with parkingSpots); otherwise resets to nil.
---Source: lua/ge/extensions/gameplay/parking.lua:45
---@param data string|table|nil Path of a .sites.json file or sites table.
function gameplay_parking.setSites(data) end

--- Enables or disables the parking system. On activation, loads the default sites if needed and initializes the focus point (gameplay_traffic.getFocus()).
---Source: lua/ge/extensions/gameplay/parking.lua:58
---@param val boolean true to enable.
function gameplay_parking.setState(val) end

--- Spawns parked vehicles on random spots (vehicle group of type propparked, or options.vehGroup). First deletes the current parked cars unless keepCurrent. When the group has spawned, onVehicleGroupSpawned calls activate.
---Source: lua/ge/extensions/gameplay/parking.lua:693
---@param amount integer|nil Number; -1 or nil = trafficParkingAmount setting (0 = auto between 4 and 16).
---@param options table|nil keepCurrent, vehGroup, pos, bypassChecks.
---@return boolean  false if the number is zero, if the group is empty or if there are no spots (without bypassChecks).
function gameplay_parking.setupVehicles(amount, options) end

