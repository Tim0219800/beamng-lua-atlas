---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/inspectVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handles the inspection of a vehicle for sale (dealership or private seller) in career mode before purchase. startInspection spawns the frozen vehicle on a parking spot, either by teleporting the player or by giving them a GPS route to follow within a time limit; once arrived, a "tether" (distance leash) limits how far they can move away. The module defines the test drive rules (testDriveInfo: duration 60 s, zone, route, abandonment fee), opens the purchase menu, starts the test via career_modules_testDrive, publishes a point of interest (POI) and cleans up at the end (purchase, abandonment, too far, vehicle moved, delivery mode or mission started).
--- Access: extension `career_modules_inspectVehicle`: `extensions.load("career_modules_inspectVehicle")`, then the global `career_modules_inspectVehicle`
---@class career_modules_inspectVehicle
---@field dependencies table Empty table: no dependency.
career_modules_inspectVehicle = {}

--- Buys the inspected vehicle via career_modules_vehicleShopping then leaves the sale, keeping it.
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:293
---@param buyVehicleOptions table Purchase options passed to vehicleShopping.buySpawnedVehicle.
function career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions) end

--- Indicates whether the player did the test drive during this inspection.
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:471
---@return boolean|nil  true if a test took place.
function career_modules_inspectVehicle.getDidTestDrive() end

--- Builds the POI of the inspected vehicle (inspectVehicleMarker marker on the starting spot; big map marker if the player must go there).
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:403
---@return table|nil  POI or nil if career is inactive / no test defined.
function career_modules_inspectVehicle.getInspectVehiclePoi() end

--- Info of the vehicle currently being inspected.
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:388
---@return table|nil  {shopId, vehId, name, value} or nil.
function career_modules_inspectVehicle.getSpawnedVehicleInfo() end

--- Indicates whether damage was detected during the test.
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:368
---@return boolean  true if so.
function career_modules_inspectVehicle.isTestDriveDamageDetected() end

--- Ends the current sale (leash exceeded, abandonment, purchase…): closes the menus, abandons the test if active, files a test drive damage claim if applicable, handles the vehicle according to despawnPreviousVehMode, then resets the state. Ignored without an inspected vehicle or if a departure is already in progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:157
---@param despawnPreviousVehMode string|nil 'despawn', 'flagForDeletion' or 'dontDespawn' (default).
---@param freezePreviousVeh boolean|nil Freeze the vehicle if it is kept; true by default.
---@param checkDamage boolean|nil Check for damage after a test; true by default.
---@param defaultLeaveMessage string|nil Message shown if no test is active; "leftSale" by default.
function career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage) end

--- Activity prompt hook: for an element of type inspectVehicle, adds a card with the vehicle name, the seller and a button that opens the purchase menu with a tether.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:443
---@param elemData table Nearby elements.
---@param activityData table Activity data to complete.
function career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData) end

--- Hook: when a mission starts in career, leaves the sale and removes the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:372
---@param status string Mission state ('started'…).
---@param id string Mission identifier.
function career_modules_inspectVehicle.onAnyMissionChanged(status, id) end

--- Hook: the start of delivery mode ends the inspection and removes the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:379
function career_modules_inspectVehicle.onDeliveryModeStarted() end

--- POI collection hook: adds the inspection POI to the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:436
---@param levelIdentifier string Current level.
---@param elements table POI list to complete.
function career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook: the purchase menu is closed; removes the menu's spherical tether.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:475
function career_modules_inspectVehicle.onPurchaseMenuClosed() end

--- Hook: test abandoned; leaves the sale (vehicle marked for deletion).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:482
function career_modules_inspectVehicle.onTestDriveAbandoned() end

--- Hook: damage was detected during the test.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:364
function career_modules_inspectVehicle.onTestDriveDamageDetected() end

--- Hook: test finished after fade; re-arms the tethers and reopens the purchase menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:486
function career_modules_inspectVehicle.onTestDriveEndedAfterFade() end

--- Test start hook: notes that a test took place and removes the tethers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:356
function career_modules_inspectVehicle.onTestDriveStarted() end

--- Per-frame hook: detects the movement of the vehicle for sale, counts down the time allowed to arrive and detects the player's arrival.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:333
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: if the inspected vehicle is destroyed, resets the inspection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:349
---@param vehId integer Removed vehicle.
function career_modules_inspectVehicle.onVehicleDestroyed(vehId) end

--- Hook: if the player gets into the inspected vehicle outside a test, freezes it again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:502
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer Player concerned.
function career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player) end

--- Only used in the tutorial: screen fade then payment of the repair of a generic vehicle (see the bug in the notes: vehId not defined).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:393
function career_modules_inspectVehicle.repairVehicle() end

--- Spawns the vehicle for sale (shopId) without activating it (ignition off, frozen, part conditions initialized) and stores its info (shopId, vehId, name, value).
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:98
---@param vehicleInfo table|nil Listing info (shopId, Brand, Name, Value…).
---@return userdata|nil  Vehicle object, nil on failure.
function career_modules_inspectVehicle.showVehicle(vehicleInfo) end

--- Starts the inspection: closes a previous inspection, spawns the vehicle, chooses the parking spot (the private seller's, or the dealership's best spot), moves any obstructing vehicles, places the vehicle, then teleports the player (quickTravel) or draws them a GPS path with a time limit. Defines the test drive rules.
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:222
---@param vehicleInfo table Listing (shopId, sellerId, parkingSpotName for a private seller…).
---@param teleportToVehicle boolean true to teleport the player to the vehicle's spot.
---@param job table|nil Existing coroutine job; otherwise a job is created.
---@return boolean|nil  With a job provided: true if started, false if the spawn fails; without a job: nil (asynchronous).
function career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job) end

--- Closes the menus and starts the test drive of the inspected vehicle with the testDriveInfo rules.
---Source: lua/ge/extensions/career/modules/inspectVehicle.lua:383
function career_modules_inspectVehicle.startTestDrive() end

