# `gameplay_freeformDelivery_odometer`

*File: `lua/ge/extensions/gameplay/freeformDelivery/odometer.lua` · VM: Game Engine (GE) · 251 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_odometer`: `extensions.load("gameplay_freeformDelivery_odometer")`, then the global `gameplay_freeformDelivery_odometer`

Freeform delivery submodule that tracks the odometer of vehicles marked trackOdometer in the delivery definition. It reads the value via core_vehicleBridge (getRootPartOdometer), computes the distance traveled since the start, displays a message in the task list and fails the delivery if the distance exceeds maxOdometer.

## Notes

- Odometer values are in meters; the display follows the uiUnitLength setting (m or ft, 1 m = 3.2808399 ft).
- A negative value (-1) means the odometer could not be read.
- Reading is asynchronous (requestValue); isSetupComplete() becomes true when all initial readings have come back.
- At setup, if vehicleDef.partsInitialized is false, the command partCondition.initConditions(nil, 0, nil, 0) is sent to the vehicle, then partsInitialized becomes true.
- Exceeding maxOdometer calls gameplay_freeformDelivery_freeformDelivery.finish(true, reason) if the delivery is active.

**Dependencies (loaded first):** `core_vehicleBridge`, `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_setup`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_odometer.cleanup()` | Clears the tracking and removes the odometer message from the task list (DiscardTasklistItem). *(internal)* | 242 |
| `gameplay_freeformDelivery_odometer.getOdometerData(vehId)` | Returns the tracking data of a vehicle. | 181 |
| `gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId)` | Like getOdometerData but searching by the vehicle's ID in the delivery definition. | 186 |
| `gameplay_freeformDelivery_odometer.isSetupComplete()` | Returns whether all initial odometer requests have received a response. | 130 |
| `gameplay_freeformDelivery_odometer.setup(delivery)` | Resets the tracking then, for each vehicle of delivery.vehicles with trackOdometer, requests the starting odometer from the vehicle. maxOdometer (optional) comes from the vehicle definition. *(internal)* | 92 |
| `gameplay_freeformDelivery_odometer.update(dtReal)` | Called every frame; every 1/8 s, requests the odometer of each tracked vehicle again and fails the delivery if the distance traveled exceeds maxOdometer. *(internal)* | 135 |
| `gameplay_freeformDelivery_odometer.updateTasklistMessage()` | Updates (or removes) the odometer message in the task list for the player's vehicle. Only sends SetTasklistTask if the text has changed. | 197 |

### Parameter details

#### `gameplay_freeformDelivery_odometer.getOdometerData(vehId)`

Returns the tracking data of a vehicle.

- `vehId` (*integer*) : Object ID of the vehicle in the game.
- **returns**: table|nil {deliveryVehicleId, startingOdometer, currentOdometer, maxOdometer, requestPending} or nil.

#### `gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId)`

Like getOdometerData but searching by the vehicle's ID in the delivery definition.

- `deliveryVehicleId` (*string*) : Vehicle ID in the delivery (inferred from code).
- **returns**: table|nil Tracking data or nil.

#### `gameplay_freeformDelivery_odometer.isSetupComplete()`

Returns whether all initial odometer requests have received a response.

- **returns**: boolean true when no request is pending.

#### `gameplay_freeformDelivery_odometer.setup(delivery)`

Resets the tracking then, for each vehicle of delivery.vehicles with trackOdometer, requests the starting odometer from the vehicle. maxOdometer (optional) comes from the vehicle definition.

- `delivery` (*table*) : Delivery data with the vehicles array.

#### `gameplay_freeformDelivery_odometer.update(dtReal)`

Called every frame; every 1/8 s, requests the odometer of each tracked vehicle again and fails the delivery if the distance traveled exceeds maxOdometer.

- `dtReal` (*number*) : Real-time delta in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicleBridge, gameplay_freeformDelivery_utils, gameplay_freeformDelivery_setup. |

**UI events (guihooks.trigger):** `DiscardTasklistItem`, `SetTasklistTask`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/odometer.lua`.*
