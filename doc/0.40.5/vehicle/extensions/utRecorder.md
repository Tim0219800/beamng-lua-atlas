# `utRecorder`

*File: `lua/vehicle/extensions/utRecorder.lua` · VM: Vehicle · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `utRecorder`: `extensions.load (vehicle VM)("utRecorder")`, then the global `utRecorder`

Sends the vehicle data to the game engine (GE) Lua every frame so that it is recorded with the rest (test tool). The message is queued by obj:queueGameEngineLua and calls extensions.test_utRecorder.onVehicleData(vehId, dataTable) on the GE side.

## Notes

- Table sent (indexed array, serialized with serialize): [1] input.throttle, [2] input.brake, [3] input.steering, [4] norm of the velocity obj:getVelocity() (m/s), [5] electrics.values.airspeed, [6] electrics.values.wheelspeed, [7] input.parkingbrake, [8] {x,y,z} position, [9] {x,y,z} forward direction.
- nil values (e.g. missing airspeed) create holes in the array and the serialization may be affected.
- On the GE side the target extension is called test_utRecorder: it must be loaded, otherwise the call fails.
- Sent every frame with no rate limiting.

## Functions

| Function | Description | Line |
|---|---|---|
| `utRecorder.updateGFX(dt)` | Called every graphics frame (extensions.hook('updateGFX')). Builds the vehicle data table and sends it to extensions.test_utRecorder.onVehicleData on the GE side. *(internal)* | 9 |

### Parameter details

#### `utRecorder.updateGFX(dt)`

Called every graphics frame (extensions.hook('updateGFX')). Builds the vehicle data table and sends it to extensions.test_utRecorder.onVehicleData on the GE side.

- `dt` (*number*) : Time step (unused).

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getId`, `getPosition`, `getVelocity`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/utRecorder.lua`.*
