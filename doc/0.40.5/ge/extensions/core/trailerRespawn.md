# `core_trailerRespawn`

*File: `lua/ge/extensions/core/trailerRespawn.lua` · VM: Game Engine (GE) · 275 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_trailerRespawn`: `extensions.load("core_trailerRespawn")`, then the global `core_trailerRespawn`

GE extension `core_trailerRespawn`: remembers which vehicles tow which trailer (registry `trailerReg`) from coupling events, and repositions the trailer behind the towing vehicle when the latter is reset or reactivated. Depends on core_vehicles (vehsCouplerOffset, vehsCouplerTags, couplerTagsOptions) and on spawn.placeTrailer. Useful to query the composition of a road train (getVehicleTrain, getVehicleTrainHead).

## Notes

- trailerReg[towVehicleId] = {trailerId, trailerNode, node}: a vehicle can only tow one trailer in this registry. Couplings with a 'Prop' type vehicle are ignored; coupling loops are refused.
- A vehicle's type ('Trailer', 'Prop', ...) comes from the aggregates.Type field of its config, otherwise from the model's Type (getConfigType).
- setEnabled(false) replaces M.onCouplerAttached and M.onCouplerDetached with `nop`: the registry is then no longer updated (the engine calls the hooks through the M table, so the change is taken into account). onVehicleResetted/onVehicleActiveChanged keep acting on the existing registry. Inconsistency: the setEnabled parameter shadows the module's local variable `enabled`, which is therefore never updated by setEnabled; getEnabled() returns the value restored by resetData/onDeserialized (true initially), not the last requested state.
- onVehicleResetted is marked in the code 'TODO: Remove this when trailer respawn is disabled': core_vehicles contains a commented-out version of the same mechanism.
- In multiplayer (multiplayer_vehicleSync), repositioning on reset is disabled and the trailers' active state is delegated to multiplayer_vehicleSync.requestTrailerActiveFollow.

**Dependencies (loaded first):** `core_vehicleBridge`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_trailerRespawn.coupleTrailer(vehId)` | If the coupler tag is of type 'autoCouple' (core_vehicles.couplerTagsOptions), runs beamstate.activateAutoCoupling(tag) on the tow vehicle. | 187 |
| `core_trailerRespawn.getAttachedNonTrailer(vehId)` | Walks up the couplings to find the non-trailer vehicle that tows the chain containing vehId. | 103 |
| `core_trailerRespawn.getConfigType(objId)` | Returns a vehicle's type ('Car', 'Trailer', 'Prop'...), from its config (aggregates.Type) or, failing that, its model's Type. | 88 |
| `core_trailerRespawn.getEnabled()` | Returns the module's `enabled` variable (see notes: not updated by setEnabled). | 251 |
| `core_trailerRespawn.getPreviousAttachedVehicleId(vehId)` | Returns the vehicle that tows vehId (the one whose registered trailer is vehId). | 47 |
| `core_trailerRespawn.getTrailerData()` | Returns the internal registry trailerReg (not a copy). | 31 |
| `core_trailerRespawn.getVehicleTrain(vehId, res, forward)` | Returns all vehicles connected to vehId, forward and backward. | 64 |
| `core_trailerRespawn.getVehicleTrainHead(vehId)` | Walks up the coupling chain to the first vehicle (head of the train). | 55 |
| `core_trailerRespawn.isVehicleCoupledToTrailer(vehId, trailerId)` | Indicates whether trailerId is part of the chain towed by vehId. | 243 |
| `core_trailerRespawn.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook: a coupling closes. Records the tow/trailer direction in trailerReg (the non-trailer tows), ignores Props and loops, then emits onTrailerAttached(objId1, objId2). *(internal)* *(hook)* | 130 |
| `core_trailerRespawn.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)` | Hook: a coupling opens. Only removes the record if breakForce is 0 (voluntary detachment), with a one-frame delay (job) so as not to prevent the trailer's reset. *(internal)* *(hook)* | 148 |
| `core_trailerRespawn.onDeserialized(data)` | Hook: restores the registry and reapplies setEnabled. *(internal)* *(hook)* | 19 |
| `core_trailerRespawn.onSerialize()` | Hook: saves the registry and the enabled state before a Lua reload. *(internal)* *(hook)* | 12 |
| `core_trailerRespawn.onVehicleActiveChanged(vehId, active)` | Hook: a vehicle is activated/deactivated. Aligns the active state of its trailer and, on activation, repositions it behind the vehicle. *(internal)* *(hook)* | 158 |
| `core_trailerRespawn.onVehicleDestroyed(vehId)` | Hook: a vehicle is destroyed; clears its coupling records. *(internal)* *(hook)* | 212 |
| `core_trailerRespawn.onVehicleResetted(vehId)` | Hook: a vehicle is reset; repositions its trailer behind it (disabled in multiplayer). *(internal)* *(hook)* | 203 |
| `core_trailerRespawn.onVehicleSpawned(vehId)` | Hook: a vehicle spawns; clears its old coupling records. *(internal)* *(hook)* | 198 |
| `core_trailerRespawn.placeTrailer(vehId)` | Repositions the registered trailer of vehId behind it (spawn.placeTrailer, from coupler offsets). | 178 |
| `core_trailerRespawn.resetData()` | Clears the trailer registry and re-enables the system. | 25 |
| `core_trailerRespawn.setEnabled(enabled)` | Enables or disables coupling recording (replaces onCouplerAttached/onCouplerDetached with the empty function nop if false). | 233 |

### Parameter details

#### `core_trailerRespawn.coupleTrailer(vehId)`

If the coupler tag is of type 'autoCouple' (core_vehicles.couplerTagsOptions), runs beamstate.activateAutoCoupling(tag) on the tow vehicle.

- `vehId` (*integer*) : tow vehicle

#### `core_trailerRespawn.getAttachedNonTrailer(vehId)`

Walks up the couplings to find the non-trailer vehicle that tows the chain containing vehId.

- `vehId` (*integer*) : starting vehicle
- **returns**: integer|false identifier of the first non-trailer vehicle, false if the chain only contains trailers

#### `core_trailerRespawn.getConfigType(objId)`

Returns a vehicle's type ('Car', 'Trailer', 'Prop'...), from its config (aggregates.Type) or, failing that, its model's Type.

- `objId` (*integer*) : vehicle identifier
- **returns**: string type

#### `core_trailerRespawn.getEnabled()`

Returns the module's `enabled` variable (see notes: not updated by setEnabled).

- **returns**: boolean true as long as resetData/onDeserialized have not changed it

#### `core_trailerRespawn.getPreviousAttachedVehicleId(vehId)`

Returns the vehicle that tows vehId (the one whose registered trailer is vehId).

- `vehId` (*integer*) : trailer identifier
- **returns**: integer|nil tow vehicle identifier, nil if there is none

#### `core_trailerRespawn.getTrailerData()`

Returns the internal registry trailerReg (not a copy).

- **returns**: table<integer, {trailerId: integer, trailerNode: integer, node: integer}> [towVehicleId] = coupling info

#### `core_trailerRespawn.getVehicleTrain(vehId, res, forward)`

Returns all vehicles connected to vehId, forward and backward.

- `vehId` (*integer*) : starting vehicle
- `res` (*table|nil*) : accumulator table (internal use, leave nil)
- `forward` (*boolean|nil*) : true: only toward the tow vehicle; false: only toward the trailers; nil: both
- **returns**: table<integer, boolean> set [vehId] = true

#### `core_trailerRespawn.getVehicleTrainHead(vehId)`

Walks up the coupling chain to the first vehicle (head of the train).

- `vehId` (*integer*) : starting vehicle
- **returns**: integer train head identifier (vehId itself if it is not towed)

#### `core_trailerRespawn.isVehicleCoupledToTrailer(vehId, trailerId)`

Indicates whether trailerId is part of the chain towed by vehId.

- `vehId` (*integer*) : tow vehicle
- `trailerId` (*integer*) : trailer searched for
- **returns**: boolean true if connected (directly or through a chain)

#### `core_trailerRespawn.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)`

Hook: a coupling closes. Records the tow/trailer direction in trailerReg (the non-trailer tows), ignores Props and loops, then emits onTrailerAttached(objId1, objId2).

- `objId1` (*integer*) : first vehicle
- `objId2` (*integer*) : second vehicle
- `nodeId` (*integer*) : node of the first
- `obj2nodeId` (*integer*) : node of the second

#### `core_trailerRespawn.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)`

Hook: a coupling opens. Only removes the record if breakForce is 0 (voluntary detachment), with a one-frame delay (job) so as not to prevent the trailer's reset.

- `objId1` (*integer*) : first vehicle
- `objId2` (*integer*) : second vehicle
- `nodeId` (*integer*) : node of the first
- `obj2nodeId` (*integer*) : node of the second
- `breakForce` (*number|nil*) : break force; ignored if nil or > 0

#### `core_trailerRespawn.onDeserialized(data)`

Hook: restores the registry and reapplies setEnabled.

- `data` (*table*) : data from onSerialize

#### `core_trailerRespawn.onSerialize()`

Hook: saves the registry and the enabled state before a Lua reload.

- **returns**: table {trailerReg, enabled}

#### `core_trailerRespawn.onVehicleActiveChanged(vehId, active)`

Hook: a vehicle is activated/deactivated. Aligns the active state of its trailer and, on activation, repositions it behind the vehicle.

- `vehId` (*integer*) : vehicle
- `active` (*boolean*) : new state

#### `core_trailerRespawn.onVehicleDestroyed(vehId)`

Hook: a vehicle is destroyed; clears its coupling records.

- `vehId` (*integer*) : vehicle

#### `core_trailerRespawn.onVehicleResetted(vehId)`

Hook: a vehicle is reset; repositions its trailer behind it (disabled in multiplayer).

- `vehId` (*integer*) : vehicle

#### `core_trailerRespawn.onVehicleSpawned(vehId)`

Hook: a vehicle spawns; clears its old coupling records.

- `vehId` (*integer*) : vehicle

#### `core_trailerRespawn.placeTrailer(vehId)`

Repositions the registered trailer of vehId behind it (spawn.placeTrailer, from coupler offsets).

- `vehId` (*integer*) : tow vehicle

#### `core_trailerRespawn.setEnabled(enabled)`

Enables or disables coupling recording (replaces onCouplerAttached/onCouplerDetached with the empty function nop if false).

- `enabled` (*boolean*) : desired state

## Fields

| Field | Type | Description |
|---|---|---|
| `debugEnabled` | boolean | false by default; the debug display of coupling nodes (debugUpdate) is not hooked up (M.onPreRender is commented out). |
| `dependencies` | string[] | {'core_vehicleBridge'} |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTrailerAttached` — listened to by 2 module(s)

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/trailerRespawn.lua`.*
