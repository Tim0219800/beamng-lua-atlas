# `gameplay_freeformDelivery_vehicleSleep`

*File: `lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_vehicleSleep`: `extensions.load("gameplay_freeformDelivery_vehicleSleep")`, then the global `gameplay_freeformDelivery_vehicleSleep`

Freeform delivery submodule that puts to sleep (setActive(0)) the delivery vehicles far from the camera and the player's vehicle, and wakes them when approached, to save simulation time. Only vehicles with a valid sleepDistance in their definition are managed.

## Notes

- sleepDistance must be a number > 0, otherwise it is ignored with a log error.
- Default wakeDistance = max(sleepDistance - 50, sleepDistance * 0.8); if it is absent, invalid or greater than sleepDistance, the default value is used (hysteresis).
- A vehicle falls asleep when the camera AND the player's vehicle are farther than sleepDistance; it wakes as soon as one of the two is closer than wakeDistance.
- cleanup wakes all tracked vehicles.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_vehicleSleep.cleanup()` | Reactivates all tracked vehicles and clears the tracking. *(internal)* | 128 |
| `gameplay_freeformDelivery_vehicleSleep.getDebugData()` | Returns an array sorted by id with, for each tracked vehicle, the sleep state and the distances (useful for debug display). | 112 |
| `gameplay_freeformDelivery_vehicleSleep.setup(delivery)` | Normalizes sleepDistance/wakeDistance in delivery.vehicles and registers the relevant vehicles (active at the start, setActive(1)). *(internal)* | 47 |
| `gameplay_freeformDelivery_vehicleSleep.update()` | Called every frame: measures the camera/player distances of each tracked vehicle and toggles its active/asleep state. *(internal)* | 74 |

### Parameter details

#### `gameplay_freeformDelivery_vehicleSleep.getDebugData()`

Returns an array sorted by id with, for each tracked vehicle, the sleep state and the distances (useful for debug display).

- **returns**: table[] Entries {id, sleeping, sleepDistance, wakeDistance, cameraDistance, playerVehicleDistance}.

#### `gameplay_freeformDelivery_vehicleSleep.setup(delivery)`

Normalizes sleepDistance/wakeDistance in delivery.vehicles and registers the relevant vehicles (active at the start, setActive(1)).

- `delivery` (*table*) : Delivery data with the vehicles array.

## Calls into the engine (C++)

- `Sim.` `upcast`
- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua`.*
