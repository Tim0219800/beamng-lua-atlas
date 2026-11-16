# `core_couplerCameraModifier`

*File: `lua/ge/extensions/core/couplerCameraModifier.lua` · VM: Game Engine (GE) · 234 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_couplerCameraModifier`: `extensions.load("core_couplerCameraModifier")`, then the global `core_couplerCameraModifier`

When player 0's vehicle is hitched to a trailer (distance between the two vehicles between 1 and 15 m, one of the two of type "Trailer"), this extension locks their orbit cameras, sets their distance to (d1+d2)/1.5+1 and recenters the player's camera on the middle of the hitch every frame. On separation, on reload or if the gap becomes too large, the orbit cameras are restored. Active only if the 'couplerCameraModifier' setting is true (otherwise onExtensionLoaded returns false).

## Notes

- Uses core_camera: getCameraDataById, setDefaultDistance, setDistance, setTargetMode, setRef; the mode used is "orbit" (fields orbit.refNodes.ref/left/back, orbit.offset, orbit.lockCamera, orbit.distance, 5 m by default).
- Only player 0 is considered (be:getPlayerVehicleID(0)).
- Inconsistency: checkForTrailer calls obj1:getPosition() and obj2:getPosition() before testing obj1/obj2 ~= nil (error if an id is not found).
- onExtensionLoaded returns false if the setting is disabled (return value not used elsewhere in this file).

**Dependencies (loaded first):** `core_trailerRespawn`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_couplerCameraModifier.checkForTrailer(objId1_, objId2_)` | Tells whether two vehicles form a nearby hitch with a trailer: different ids, at least one of type "Trailer" (core_trailerRespawn.getConfigType) and distance between 1 and 15 m. | 19 |
| `core_couplerCameraModifier.onCouplerAttached(objId1_, objId2_)` | Hook: two vehicles hitch together; if one is player 0's vehicle and checkForTrailer is true, starts tracking. *(internal)* *(hook)* | 107 |
| `core_couplerCameraModifier.onCouplerDetached(objId1_, objId2_)` | Hook: called for any detachment in the world; stops tracking only if it concerns the tracked pair. *(internal)* *(hook)* | 118 |
| `core_couplerCameraModifier.onDeserialized(data)` | Hook: restores objId1, objId2, detached. *(internal)* *(hook)* | 215 |
| `core_couplerCameraModifier.onExtensionLoaded()` | Hook: if the couplerCameraModifier setting is active, takes over an already existing hitch of player 0's vehicle. *(internal)* *(hook)* | 102 |
| `core_couplerCameraModifier.onExtensionUnloaded()` | Hook: restores the original orbit cameras (restoreOriginalCamera). *(internal)* *(hook)* | 52 |
| `core_couplerCameraModifier.onSerialize()` | Hook: saves objId1, objId2, detached. *(internal)* *(hook)* | 207 |
| `core_couplerCameraModifier.onUpdate()` | Per-frame hook: computes the average position of the two orbit cameras and applies setTargetMode(vid, 'notCenter') + setRef(vid, middle, left, rear) to the player's vehicle; restores if the cameras are farther apart than the sum of the orbit distances. *(internal)* *(hook)* | 125 |
| `core_couplerCameraModifier.onVehicleSpawned(vehId)` | Hook: if one of the tracked vehicles is replaced, stops tracking. *(internal)* *(hook)* | 201 |
| `core_couplerCameraModifier.onVehicleSwitched(oldId, newId, player)` | Hook: the player changes vehicle; looks for a hitch for the new one. *(internal)* *(hook)* | 197 |

### Parameter details

#### `core_couplerCameraModifier.checkForTrailer(objId1_, objId2_)`

Tells whether two vehicles form a nearby hitch with a trailer: different ids, at least one of type "Trailer" (core_trailerRespawn.getConfigType) and distance between 1 and 15 m.

- `objId1_` (*integer*) : id of the first vehicle
- `objId2_` (*integer*) : id of the second vehicle
- **returns**: boolean true if it is a hitch with a trailer

#### `core_couplerCameraModifier.onCouplerAttached(objId1_, objId2_)`

Hook: two vehicles hitch together; if one is player 0's vehicle and checkForTrailer is true, starts tracking.

- `objId1_` (*integer*) : vehicle 1 id
- `objId2_` (*integer*) : vehicle 2 id

#### `core_couplerCameraModifier.onCouplerDetached(objId1_, objId2_)`

Hook: called for any detachment in the world; stops tracking only if it concerns the tracked pair.

- `objId1_` (*integer*) : vehicle 1 id
- `objId2_` (*integer*) : vehicle 2 id

#### `core_couplerCameraModifier.onDeserialized(data)`

Hook: restores objId1, objId2, detached.

- `data` (*table|nil*) : table returned by onSerialize

#### `core_couplerCameraModifier.onSerialize()`

Hook: saves objId1, objId2, detached.

- **returns**: table data to serialize

#### `core_couplerCameraModifier.onVehicleSpawned(vehId)`

Hook: if one of the tracked vehicles is replaced, stops tracking.

- `vehId` (*integer*) : vehicle id

#### `core_couplerCameraModifier.onVehicleSwitched(oldId, newId, player)`

Hook: the player changes vehicle; looks for a hitch for the new one.

- `oldId` (*integer*) : old id
- `newId` (*integer*) : new id
- `player` (*integer*) : player number (unused)

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"core_trailerRespawn"}: loaded before (provides getConfigType). |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/couplerCameraModifier.lua`.*
