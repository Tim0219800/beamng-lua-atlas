# `career_modules_inspectVehicle`

*File: `lua/ge/extensions/career/modules/inspectVehicle.lua` · VM: Game Engine (GE) · 539 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_inspectVehicle`: `extensions.load("career_modules_inspectVehicle")`, then the global `career_modules_inspectVehicle`

Handles the inspection of a vehicle for sale (dealership or private seller) in career mode before purchase. startInspection spawns the frozen vehicle on a parking spot, either by teleporting the player or by giving them a GPS route to follow within a time limit; once arrived, a "tether" (distance leash) limits how far they can move away. The module defines the test drive rules (testDriveInfo: duration 60 s, zone, route, abandonment fee), opens the purchase menu, starts the test via career_modules_testDrive, publishes a point of interest (POI) and cleans up at the end (purchase, abandonment, too far, vehicle moved, delivery mode or mission started).

## Notes

- Constants: seller departure distance 25 m (leaveSaleDist), arrival at the inspection within 20 m with line of sight (castRayStatic), vehicle moved more than 10 m from its spot = sale canceled, purchase menu tether 3 m, 60 s test.
- Time to reach the inspection: GPS path length / 5 (m/s), rounded up to the next minute; at the end, the sale is canceled (sellerTimedOut).
- The inspected vehicle is frozen (setFreeze) with the ignition off; it is reset with partCondition.initConditions according to its mileage (vehicleInfo.Mileage).
- leaveSaleCallback despawn modes: 'despawn' (removes the vehicle), 'flagForDeletion' (marks for deletion by career_modules_vehicleDeletionService), 'dontDespawn' (default: keeps it, frozen if freezePreviousVeh).
- Bug: repairVehicle uses the variable `vehId`, which is not defined anywhere in the function (nil): payRepairIfNeededGenericVeh receives nil. The code is marked "only used during the tutorial".
- Bug: leaveSaleCallback tests `dontShowLeaveSaleMessage`, a global variable that is never defined (nil): the leave message is always shown.
- The 'inspectVehicle' POI markers are added to the POI list via onGetRawPoiListForLevel and the activity prompt offers "see purchase information".

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions)` | Buys the inspected vehicle via career_modules_vehicleShopping then leaves the sale, keeping it. | 293 |
| `career_modules_inspectVehicle.getDidTestDrive()` | Indicates whether the player did the test drive during this inspection. | 471 |
| `career_modules_inspectVehicle.getInspectVehiclePoi()` | Builds the POI of the inspected vehicle (inspectVehicleMarker marker on the starting spot; big map marker if the player must go there). | 403 |
| `career_modules_inspectVehicle.getSpawnedVehicleInfo()` | Info of the vehicle currently being inspected. | 388 |
| `career_modules_inspectVehicle.isTestDriveDamageDetected()` | Indicates whether damage was detected during the test. | 368 |
| `career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage)` | Ends the current sale (leash exceeded, abandonment, purchase…): closes the menus, abandons the test if active, files a test drive damage claim if applicable, handles the vehicle according to despawnPreviousVehMode, then resets the state. Ignored without an inspected vehicle or if a departure is already in progress. *(internal)* | 157 |
| `career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData)` | Activity prompt hook: for an element of type inspectVehicle, adds a card with the vehicle name, the seller and a button that opens the purchase menu with a tether. *(internal)* *(hook)* | 443 |
| `career_modules_inspectVehicle.onAnyMissionChanged(status, id)` | Hook: when a mission starts in career, leaves the sale and removes the vehicle. *(internal)* *(hook)* | 372 |
| `career_modules_inspectVehicle.onDeliveryModeStarted()` | Hook: the start of delivery mode ends the inspection and removes the vehicle. *(internal)* *(hook)* | 379 |
| `career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements)` | POI collection hook: adds the inspection POI to the list. *(internal)* *(hook)* | 436 |
| `career_modules_inspectVehicle.onPurchaseMenuClosed()` | Hook: the purchase menu is closed; removes the menu's spherical tether. *(internal)* *(hook)* | 475 |
| `career_modules_inspectVehicle.onTestDriveAbandoned()` | Hook: test abandoned; leaves the sale (vehicle marked for deletion). *(internal)* *(hook)* | 482 |
| `career_modules_inspectVehicle.onTestDriveDamageDetected()` | Hook: damage was detected during the test. *(internal)* *(hook)* | 364 |
| `career_modules_inspectVehicle.onTestDriveEndedAfterFade()` | Hook: test finished after fade; re-arms the tethers and reopens the purchase menu. *(internal)* *(hook)* | 486 |
| `career_modules_inspectVehicle.onTestDriveStarted()` | Test start hook: notes that a test took place and removes the tethers. *(internal)* *(hook)* | 356 |
| `career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: detects the movement of the vehicle for sale, counts down the time allowed to arrive and detects the player's arrival. *(internal)* *(hook)* | 333 |
| `career_modules_inspectVehicle.onVehicleDestroyed(vehId)` | Hook: if the inspected vehicle is destroyed, resets the inspection. *(internal)* *(hook)* | 349 |
| `career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player)` | Hook: if the player gets into the inspected vehicle outside a test, freezes it again. *(internal)* *(hook)* | 502 |
| `career_modules_inspectVehicle.repairVehicle()` | Only used in the tutorial: screen fade then payment of the repair of a generic vehicle (see the bug in the notes: vehId not defined). *(internal)* | 393 |
| `career_modules_inspectVehicle.showVehicle(vehicleInfo)` | Spawns the vehicle for sale (shopId) without activating it (ignition off, frozen, part conditions initialized) and stores its info (shopId, vehId, name, value). | 98 |
| `career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job)` | Starts the inspection: closes a previous inspection, spawns the vehicle, chooses the parking spot (the private seller's, or the dealership's best spot), moves any obstructing vehicles, places the vehicle, then teleports the player (quickTravel) or draws them a GPS path with a time limit. Defines the test drive rules. | 222 |
| `career_modules_inspectVehicle.startTestDrive()` | Closes the menus and starts the test drive of the inspected vehicle with the testDriveInfo rules. | 383 |

### Parameter details

#### `career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions)`

Buys the inspected vehicle via career_modules_vehicleShopping then leaves the sale, keeping it.

- `buyVehicleOptions` (*table*) : Purchase options passed to vehicleShopping.buySpawnedVehicle.

#### `career_modules_inspectVehicle.getDidTestDrive()`

Indicates whether the player did the test drive during this inspection.

- **returns**: boolean|nil true if a test took place.

#### `career_modules_inspectVehicle.getInspectVehiclePoi()`

Builds the POI of the inspected vehicle (inspectVehicleMarker marker on the starting spot; big map marker if the player must go there).

- **returns**: table|nil POI or nil if career is inactive / no test defined.

#### `career_modules_inspectVehicle.getSpawnedVehicleInfo()`

Info of the vehicle currently being inspected.

- **returns**: table|nil {shopId, vehId, name, value} or nil.

#### `career_modules_inspectVehicle.isTestDriveDamageDetected()`

Indicates whether damage was detected during the test.

- **returns**: boolean true if so.

#### `career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage)`

Ends the current sale (leash exceeded, abandonment, purchase…): closes the menus, abandons the test if active, files a test drive damage claim if applicable, handles the vehicle according to despawnPreviousVehMode, then resets the state. Ignored without an inspected vehicle or if a departure is already in progress.

- `despawnPreviousVehMode` (*string|nil*) : 'despawn', 'flagForDeletion' or 'dontDespawn' (default).
- `freezePreviousVeh` (*boolean|nil*) : Freeze the vehicle if it is kept; true by default.
- `checkDamage` (*boolean|nil*) : Check for damage after a test; true by default.
- `defaultLeaveMessage` (*string|nil*) : Message shown if no test is active; "leftSale" by default.

#### `career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData)`

Activity prompt hook: for an element of type inspectVehicle, adds a card with the vehicle name, the seller and a button that opens the purchase menu with a tether.

- `elemData` (*table*) : Nearby elements.
- `activityData` (*table*) : Activity data to complete.

#### `career_modules_inspectVehicle.onAnyMissionChanged(status, id)`

Hook: when a mission starts in career, leaves the sale and removes the vehicle.

- `status` (*string*) : Mission state ('started'…).
- `id` (*string*) : Mission identifier.

#### `career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements)`

POI collection hook: adds the inspection POI to the list.

- `levelIdentifier` (*string*) : Current level.
- `elements` (*table*) : POI list to complete.

#### `career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: detects the movement of the vehicle for sale, counts down the time allowed to arrive and detects the player's arrival.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `career_modules_inspectVehicle.onVehicleDestroyed(vehId)`

Hook: if the inspected vehicle is destroyed, resets the inspection.

- `vehId` (*integer*) : Removed vehicle.

#### `career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player)`

Hook: if the player gets into the inspected vehicle outside a test, freezes it again.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer*) : Player concerned.

#### `career_modules_inspectVehicle.showVehicle(vehicleInfo)`

Spawns the vehicle for sale (shopId) without activating it (ignition off, frozen, part conditions initialized) and stores its info (shopId, vehId, name, value).

- `vehicleInfo` (*table|nil*) : Listing info (shopId, Brand, Name, Value…).
- **returns**: userdata|nil Vehicle object, nil on failure.

#### `career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job)`

Starts the inspection: closes a previous inspection, spawns the vehicle, chooses the parking spot (the private seller's, or the dealership's best spot), moves any obstructing vehicles, places the vehicle, then teleports the player (quickTravel) or draws them a GPS path with a time limit. Defines the test drive rules.

- `vehicleInfo` (*table*) : Listing (shopId, sellerId, parkingSpotName for a private seller…).
- `teleportToVehicle` (*boolean*) : true to teleport the player to the vehicle's spot.
- `job` (*table|nil*) : Existing coroutine job; otherwise a job is created.
- **returns**: boolean|nil With a job provided: true if started, false if the spawn fails; without a job: nil (asynchronous).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table | Empty table: no dependency. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/inspectVehicle.lua`.*
