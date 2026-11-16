# `career_modules_vehicleDeletionService`

*File: `lua/ge/extensions/career/modules/vehicleDeletionService.lua` · VM: Game Engine (GE) · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_vehicleDeletionService`: `extensions.load("career_modules_vehicleDeletionService")`, then the global `career_modules_vehicleDeletionService`

Deferred vehicle deletion service in career: a "marked" vehicle is deleted (with a callback call) when it is more than 100 m from the camera and behind it, so that it disappears without the player seeing it. Inventory vehicles are removed via career_modules_inventory.removeVehicleObject, others via obj:delete(). The onUpdate hook is wired only while at least one vehicle is marked.

## Notes

- Potential bug: onUpdate calls obj:getPositionXYZ() without checking that getObjectByID returned an object; a vehicle deleted elsewhere without going through onVehicleDestroyed would cause an error.
- onExtensionLoaded returns false if the career is not active, which prevents the module from loading.
- At each mission start (onAnyMissionChanged, started state), all marked vehicles are deleted immediately (without callback).

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_vehicleDeletionService.clearFlags(vehId)` | Removes a vehicle's marking (and unwires onUpdate if nothing remains). | 78 |
| `career_modules_vehicleDeletionService.deleteFlaggedVehicles()` | Immediately deletes all marked vehicles. | 65 |
| `career_modules_vehicleDeletionService.flagForDeletion(vehId, callback)` | Marks a vehicle for deferred deletion and activates the onUpdate loop. | 71 |
| `career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission)` | Hook emitted on each mission state change: on "started" in career, deletes the marked vehicles. *(internal)* *(hook)* | 88 |
| `career_modules_vehicleDeletionService.onClientStartMission()` | Level start hook: clears the list of marked vehicles. *(internal)* *(hook)* | 83 |
| `career_modules_vehicleDeletionService.onExtensionLoaded()` | Load hook: returns false if the career is not active. *(internal)* *(hook)* | 12 |
| `career_modules_vehicleDeletionService.onVehicleDestroyed(vehId)` | Hook emitted when a vehicle is destroyed: removes its marking. *(internal)* *(hook)* | 97 |

### Parameter details

#### `career_modules_vehicleDeletionService.clearFlags(vehId)`

Removes a vehicle's marking (and unwires onUpdate if nothing remains).

- `vehId` (*integer*) : Vehicle id.

#### `career_modules_vehicleDeletionService.flagForDeletion(vehId, callback)`

Marks a vehicle for deferred deletion and activates the onUpdate loop.

- `vehId` (*integer*) : Vehicle id.
- `callback` (*function|nil*) : Called just before deletion (default nop).

#### `career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission)`

Hook emitted on each mission state change: on "started" in career, deletes the marked vehicles.

- `state` (*string*) : Mission state.
- `mission` (*table|nil*) : Mission concerned.

#### `career_modules_vehicleDeletionService.onExtensionLoaded()`

Load hook: returns false if the career is not active.

- **returns**: boolean|nil false to refuse loading.

#### `career_modules_vehicleDeletionService.onVehicleDestroyed(vehId)`

Hook emitted when a vehicle is destroyed: removes its marking.

- `vehId` (*integer*) : Vehicle id.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'career_career'}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `obj:` `delete`, `getPositionXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/vehicleDeletionService.lua`.*
