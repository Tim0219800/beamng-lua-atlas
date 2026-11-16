# `core_vehicleActivePooling`

*File: `lua/ge/extensions/core/vehicleActivePooling.lua` · VM: Game Engine (GE) · 512 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicleActivePooling`: `extensions.load("core_vehicleActivePooling")`, then the global `core_vehicleActivePooling`

GE extension `core_vehicleActivePooling`: manages vehicle "pools" of which only a part is active (visible and simulated) at a time, to limit the load (traffic, parked vehicles...). A pool (class VehPool) keeps two lists (activeVehs, inactiveVehs), a maxActiveAmount limit, a distance mode (activation based on distance to the camera) and a mesh fade. A vehicle's active state is that of the object (`obj:setActive(0|1)`).

## Example

```lua
local pool = core_vehicleActivePooling.createPool({name = 'myTraffic', maxActiveAmount = 8})
pool:insertVeh(vehId)            -- adds a vehicle (active if the limit allows it)
pool.useDistanceMode = true      -- activates/deactivates based on distance to the camera
pool.activeDistance = 250
pool:cycle()                     -- deactivates the 1st active, activates the 1st inactive
```

## Notes

- Pool fields: id, name, activeVehs (array of ids), inactiveVehs (array of ids), allVehs ([id] = 1 active / 0 inactive), fadeQueue ([id] = 1 fading in / 0 fading out), total, maxActiveAmount (math.huge by default), useSceneVehiclesCap (count all active vehicles of the scene instead of those of the pool), useDistanceMode (takes precedence over the other methods), updateActiveStatePostFade (change the active state after the fade), activeDistance (300 m), fadeDuration (0.25 s).
- Active state changes go through obj:setActive, which triggers the onVehicleActiveChanged hook, which calls VehPool:_setVeh to keep the lists up to date.
- Inconsistency: the module function deletePool(id) merely removes the pool from the table (no deletion of inactive vehicles, no onVehiclePoolRemoved hook), whereas VehPool:deletePool() deletes the inactive vehicles (except keepVehicles) and emits onVehiclePoolRemoved.
- VehPool:getSceneActiveAmount(vehTypes) reads a vehTypes argument (list of types) that the automatic list does not report; nil = default types of getAllVehiclesByType, parked vehicles (isParked) excluded.
- The signatures of several methods in the automatic list omit the first argument vehId (e.g. fadeVeh(vehId, dt)); the actual signatures are given below.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicleActivePooling.createPool(data)` | Creates a pool, registers it and emits onVehiclePoolAdded(id). | 394 |
| `core_vehicleActivePooling.deleteAllPools()` | Calls VehPool:deletePool() on each pool (deletes their inactive vehicles) then empties the table. | 428 |
| `core_vehicleActivePooling.deletePool(id)` | Removes the pool from the pool table (without deleting vehicles or emitting a hook; see notes). | 401 |
| `core_vehicleActivePooling.getAllPools()` | Returns the table of all pools (not a copy). | 424 |
| `core_vehicleActivePooling.getPool(name)` | Finds a pool by its name. | 405 |
| `core_vehicleActivePooling.getPoolById(id)` | Finds a pool by its id. | 420 |
| `core_vehicleActivePooling.getPoolOfVeh(vehId)` | Finds the pool containing a vehicle. | 412 |
| `core_vehicleActivePooling.onClientEndMission()` | Hook: end of the level; deletes all pools (deleteAllPools). *(internal)* *(hook)* | 447 |
| `core_vehicleActivePooling.onDeserialized(data)` | Hook: recreates the pools from the serialized data. *(internal)* *(hook)* | 490 |
| `core_vehicleActivePooling.onSerialize()` | Hook: serializes all pools before a Lua reload. *(internal)* *(hook)* | 481 |
| `core_vehicleActivePooling.onUpdate(dt, dtSim)` | Hook called every frame: applies the distance mode (activateByDistanceTo) and advances the fadeQueue fades with dtSim / fadeDuration. *(internal)* *(hook)* | 451 |
| `core_vehicleActivePooling.onVehicleActiveChanged(vehId, active)` | Hook: a vehicle's active state changes; updates the lists of all pools that contain it. *(internal)* *(hook)* | 435 |
| `core_vehicleActivePooling.onVehicleDestroyed(vehId)` | Hook: a vehicle is destroyed; removes it from all pools. *(internal)* *(hook)* | 441 |

### Parameter details

#### `core_vehicleActivePooling.createPool(data)`

Creates a pool, registers it and emits onVehiclePoolAdded(id).

- `data` (*table|nil*) : {id?, name?, activeVehs?, inactiveVehs?, maxActiveAmount?}; name defaults to 'pool<id>'
- **returns**: VehPool the created pool

#### `core_vehicleActivePooling.deletePool(id)`

Removes the pool from the pool table (without deleting vehicles or emitting a hook; see notes).

- `id` (*integer*) : pool identifier

#### `core_vehicleActivePooling.getAllPools()`

Returns the table of all pools (not a copy).

- **returns**: table<integer, VehPool> [id] = pool

#### `core_vehicleActivePooling.getPool(name)`

Finds a pool by its name.

- `name` (*string|nil*) : pool name
- **returns**: VehPool|nil pool found

#### `core_vehicleActivePooling.getPoolById(id)`

Finds a pool by its id.

- `id` (*integer|nil*) : identifier
- **returns**: VehPool|nil pool found

#### `core_vehicleActivePooling.getPoolOfVeh(vehId)`

Finds the pool containing a vehicle.

- `vehId` (*integer*) : vehicle identifier
- **returns**: VehPool|nil pool
- **returns**: boolean|nil true if the vehicle is active in it

#### `core_vehicleActivePooling.onDeserialized(data)`

Hook: recreates the pools from the serialized data.

- `data` (*table[]*) : data from onSerialize

#### `core_vehicleActivePooling.onSerialize()`

Hook: serializes all pools before a Lua reload.

- **returns**: table[] pool data

#### `core_vehicleActivePooling.onUpdate(dt, dtSim)`

Hook called every frame: applies the distance mode (activateByDistanceTo) and advances the fadeQueue fades with dtSim / fadeDuration.

- `dt` (*number*) : real elapsed time (s)
- `dtSim` (*number*) : simulation elapsed time (s)

#### `core_vehicleActivePooling.onVehicleActiveChanged(vehId, active)`

Hook: a vehicle's active state changes; updates the lists of all pools that contain it.

- `vehId` (*integer*) : vehicle
- `active` (*boolean*) : new state

#### `core_vehicleActivePooling.onVehicleDestroyed(vehId)`

Hook: a vehicle is destroyed; removes it from all pools.

- `vehId` (*integer*) : vehicle

## Fields

| Field | Type | Description |
|---|---|---|
| `logErrors` | boolean | false by default; if true, warnings (vehicle already active, limit reached...) are logged. |

## Class `VehPool`

Vehicle pool created by createPool. Methods are called with `:` (pool:insertVeh(id)).

| Method | Description | Line |
|---|---|---|
| `VehPool:__tostring()` | Text '[id] active: {...}, inactive: {...}'. | 34 |
| `VehPool:_setVeh(vehId, activate)` | Internal: updates the lists when a vehicle's active state has changed (called by onVehicleActiveChanged). Do not call. | 305 |
| `VehPool:activateByDistanceTo(pos, dist, buffer)` | Deactivates active vehicles farther than dist + buffer and activates inactive ones closer than dist (the buffer avoids rapid toggling). | 368 |
| `VehPool:checkActiveLimit()` | Returns true if the active vehicle limit is reached (counts the pool's active vehicles, or the scene's if useSceneVehiclesCap). | 121 |
| `VehPool:clearPool()` | Empties all the pool's lists without touching the vehicles. | 133 |
| `VehPool:crossCycle(otherPool, vehId1, vehId2)` | Deactivates a vehicle of this pool and activates a vehicle of another pool. | 167 |
| `VehPool:cycle(vehId1, vehId2)` | Deactivates an active vehicle and activates an inactive one from the same pool (the limit is ignored during the operation). | 153 |
| `VehPool:deletePool(keepVehicles)` | Deletes the pool; unless keepVehicles, also deletes the inactive vehicles. Emits onVehiclePoolRemoved(id). | 141 |
| `VehPool:fadeInVeh(vehId)` | Schedules a fade toward opaque. If the vehicle is inactive and updateActiveStatePostFade is true, activates it first. | 192 |
| `VehPool:fadeOutVeh(vehId)` | Schedules a fade toward transparent (active vehicle required). With updateActiveStatePostFade, it is deactivated at the end of the fade. | 212 |
| `VehPool:fadeVeh(vehId, dt)` | Directly increases or decreases the alpha of the vehicle's meshes by `dt` (clamped 0..1). Use it every frame for a progressive fade. | 181 |
| `VehPool:getSceneActiveAmount(vehTypes)` | Total number of active vehicles in the scene (all pools combined), parked vehicles excluded unless 'PropParked' is requested. | 108 |
| `VehPool:getVehs()` | List of all pool ids (active first). | 388 |
| `VehPool:insertVeh(vehId, forceInsert)` | Adds a vehicle to the pool; it is active if the object is active and the limit allows it, otherwise inactive (and deactivated via obj:setActive). | 234 |
| `VehPool:new(data)` | Constructor (prefer createPool). Initializes lists, limits and default values, and guarantees a unique id. | 38 |
| `VehPool:onDeserialized(data)` | Copies the fields of data into the pool. | 100 |
| `VehPool:onSerialize()` | Returns the pool data to save. | 81 |
| `VehPool:removeVeh(vehId)` | Removes a vehicle from the pool (without deleting it). | 259 |
| `VehPool:setAllVehs(activate)` | Activates (within the maxActiveAmount limit) or deactivates all vehicles of the pool. | 282 |
| `VehPool:setMaxActiveAmount(amount)` | Sets the active vehicle limit and deactivates the excess if any. | 348 |
| `VehPool:setVeh(vehId, activate, forceInsert)` | Activates or deactivates a vehicle of the pool while respecting the limit. | 326 |
| `VehPool:tryInsertActiveVeh(vehId, forceInsert)` | Checks whether one more active vehicle is allowed; with forceInsert, increases maxActiveAmount by 1 instead of refusing. | 220 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehiclePoolAdded`
- `onVehiclePoolRemoved`

## Calls into the engine (C++)

- `be:` `getObjectActive`
- `obj:` `delete`, `getActive`, `getMeshAlpha`, `getPositionXYZ`, `setActive`, `setMeshAlpha`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicleActivePooling.lua`.*
