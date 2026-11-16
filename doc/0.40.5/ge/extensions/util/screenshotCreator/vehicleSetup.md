# `util_screenshotCreator_vehicleSetup`

*File: `lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua` · VM: Game Engine (GE) · 157 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_vehicleSetup`: `extensions.load("util_screenshotCreator_vehicleSetup")`, then the global `util_screenshotCreator_vehicleSetup`

Physical setup of the vehicle before a thumbnail: replaces it at the starting point (first SpawnSphere of the level, otherwise a fallback position), applies the configured thumbnail rotation (thumbnailConfig.getRotation), aligns it to the ground and waits for it to settle. Also provides ground measurements under a bounding box (used by procedural framing) and turning on the low beams.

## Notes

- placeVehicleForThumbnail and waitForVehicleToSettle use coroutine.yield: call them from a coroutine (that of job.lua).
- The vehicle is aligned by the rear-right corner of its box on the SpawnSphere; for the inflated_mat and large_bridge models the box is centered on the spawn point.
- The vehicle's world box (getSpawnWorldOOBB) follows a teleport only after physics steps; the alignment therefore uses the local box initialNodePosBB and the pose that was just set.
- If a thumbnail rotation is applied, the original position and orientation are stored per vehicle for getResetTransform; they are forgotten when the vehicle has respawned (onVehicleSpawned).
- Settle delay: the config's pauseDelay if > 0, otherwise options.settleDelay, otherwise 2 s.

**Dependencies (loaded first):** `util_screenshotCreator_thumbnailConfig`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_vehicleSetup.getFloorHeight(bb)` | Finds the ground height under a bounding box by casting the ray from the top of the box (useful for accessories with buried nodes, such as bollards). Falls back to the bottom of the box if no ground is hit. | 46 |
| `util_screenshotCreator_vehicleSetup.getGroundHeight(position)` | Casts a static ray downward (0.5 m above, 2 m below) from the given position and returns the ground height, or the height of the position if the ground is not found or is inconsistent. | 29 |
| `util_screenshotCreator_vehicleSetup.getResetTransform(vehicle)` | Returns the position and rotation to use to put the vehicle back: the stored original ones if a thumbnail rotation had been applied, otherwise its current pose. | 96 |
| `util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform()` | Returns the position and rotation of the first SpawnSphere object in the scene, the starting point of thumbnails. | 89 |
| `util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId)` | Hook called when a vehicle spawns: forgets the thumbnail rotation stored for this vehicle. *(internal)* *(hook)* | 149 |
| `util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation)` | Resets the vehicle (vehicle:reset), teleports it to the starting point with the config's thumbnail rotation, then aligns it to the ground (two coroutine.yield). | 102 |
| `util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled)` | If enabled is true, sends electrics.setLightsState(1) (low beams) to the vehicle. Does nothing otherwise. | 143 |
| `util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options)` | Waits (yielding every frame) for the vehicle's settle time. | 135 |

### Parameter details

#### `util_screenshotCreator_vehicleSetup.getFloorHeight(bb)`

Finds the ground height under a bounding box by casting the ray from the top of the box (useful for accessories with buried nodes, such as bollards). Falls back to the bottom of the box if no ground is hit.

- `bb` (*table*) : OOBB with getPoint(i) and getCenter().
- **returns**: number Ground Z height in meters.

#### `util_screenshotCreator_vehicleSetup.getGroundHeight(position)`

Casts a static ray downward (0.5 m above, 2 m below) from the given position and returns the ground height, or the height of the position if the ground is not found or is inconsistent.

- `position` (*vec3*) : World position.
- **returns**: number Ground Z height in meters.

#### `util_screenshotCreator_vehicleSetup.getResetTransform(vehicle)`

Returns the position and rotation to use to put the vehicle back: the stored original ones if a thumbnail rotation had been applied, otherwise its current pose.

- `vehicle` (*table*) : Vehicle object.
- **returns**: vec3 Position.
- **returns**: quat Rotation.

#### `util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform()`

Returns the position and rotation of the first SpawnSphere object in the scene, the starting point of thumbnails.

- **returns**: vec3|nil Position, nil if there is no SpawnSphere.
- **returns**: quat|nil Rotation.

#### `util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId)`

Hook called when a vehicle spawns: forgets the thumbnail rotation stored for this vehicle.

- `vehicleId` (*integer*) : Vehicle identifier.

#### `util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation)`

Resets the vehicle (vehicle:reset), teleports it to the starting point with the config's thumbnail rotation, then aligns it to the ground (two coroutine.yield).

- `vehicle` (*table*) : Vehicle object.
- `configName` (*string*) : Configuration name (for the thumbnail rotation).
- `fallbackPosition` (*vec3|nil*) : Position used if there is no SpawnSphere.
- `fallbackRotation` (*quat|nil*) : Rotation used if there is no SpawnSphere.

#### `util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled)`

If enabled is true, sends electrics.setLightsState(1) (low beams) to the vehicle. Does nothing otherwise.

- `vehicle` (*table*) : Vehicle object.
- `enabled` (*boolean*) : Turn on the lights.

#### `util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options)`

Waits (yielding every frame) for the vehicle's settle time.

- `modelName` (*string*) : Model name.
- `configName` (*string*) : Configuration name.
- `options` (*table|nil*) : {settleDelay = seconds} (default 2).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extension loaded before: util_screenshotCreator_thumbnailConfig. |

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua`.*
