# `career_modules_delivery_parcelManager`

*File: `lua/ge/extensions/career/modules/delivery/parcelManager.lua` · VM: Game Engine (GE) · 709 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_parcelManager`: `extensions.load("career_modules_delivery_parcelManager")`, then the global `career_modules_delivery_parcelManager`

Central manager of the cargos (parcels and materials) of delivery in career mode. It holds the allCargo list (each cargo has an id, a location, an origin, a destination, slots, a weight, modifiers, rewards…), moves cargos between locations (facility, vehicle, player avatar), handles "transient moves" (transientMoves) that are then validated in bulk, provides lookup queries, computes rewards with a breakdown (lateness, loaner, branch level, parking precision), sends lateness messages and cleans up outdated cargos.

## Notes

- A location is a table: {type='facilityParkingspot', facId, psPath}, {type='vehicle', vehId}, {type='playerAvatar'}, {type='multi', destinations={...}} or {type='delete'} (marks for deletion).
- sameLocation(a, b) only compares the keys present in a: argument order matters (b may have extra keys) and it crashes if b is nil.
- M.addParcelRewards is exported but is always nil (the local variable addParcelRewards does not exist in the file).
- clearTransientFlags and undoTransientCargo are leftovers: they only log an error.
- The getAllCargo* functions call triggerAllGenerators() of the generator module before filtering: they can therefore generate new offers as a side effect.
- The time used (offerExpiresAt, loadedAtTimeStamp) comes from career_modules_delivery_general.time(), not from the real clock.
- Lateness multipliers (timed modifier): on time = x1 (+10% money, +50% reputation), partially late = 0.2 to 0.8 linear, late = x0.2 (reputation -1.5x).
- In getRewardsWithBreakdown, the logistics precision bonus is computed on originalRewards['logistics'] whereas the skill bonus uses the key logistics-materials or logistics-delivery.
- Material merge (cargo.merge): the moved cargo is set to location {type='delete'} and its slots is added to the other; the money reward is then set to cargo.slots.

**Dependencies (loaded first):** `freeroam_facilities`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_parcelManager.addCargo(cargo, silent)` | Adds a cargo to the global list and emits the onCargoGenerated(cargo) hook unless silent. | 40 |
| `career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo)` | Computes originalRewards/breakdown/adjustedRewards of each cargo, groups by groupId and loading time, formats each group via cargoScreen.formatCargoGroup and sorts by smallest id. | 578 |
| `career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation)` | Records a pending move for the cargo (cargo._transientMove). Refused with a logged error if it already has one. | 79 |
| `career_modules_delivery_parcelManager.applyTransientMoves(currentLocation)` | Applies the transient moves whose cargo is at the location currentLocation (or all if currentLocation is nil), updates the loaner organizations of the target vehicles, merges mergeable cargos of the same material at the same location, and keeps the other moves for later. | 134 |
| `career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation)` | Immediately moves the cargo to newLocation. Adjusts the facility's material stock (removes from the old location, adds to the new one), timestamps loadedAtTimeStamp on the first load into a vehicle, and sets cargo.data.delivered = true if the new location is the destination. | 47 |
| `career_modules_delivery_parcelManager.cleanUpCargo()` | Deletes the cargos with location 'delete' and those that stayed at their origin, expired for more than 120 s and without a transient move. Resets the cleanup timer to zero. | 670 |
| `career_modules_delivery_parcelManager.clearAllTransientMoves()` | Cancels all transient moves and resets the "unvalidated" flag to false. | 125 |
| `career_modules_delivery_parcelManager.clearTransientFlags()` | Obsolete: only logs a "no longer needed" error. *(internal)* | 210 |
| `career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId)` | Cancels a cargo's transient move (no effect if none). | 108 |
| `career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId)` | Non-expired cargos still at their origin, located in the facility facId. | 341 |
| `career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...)` | Returns the cargos for which filter(cargo, ...) is true, after triggering all generators. | 257 |
| `career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId)` | Non-expired cargos still at their origin and whose destination is the facility facId. | 328 |
| `career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated)` | Same filter but over all the spots of a facility (facId). | 312 |
| `career_modules_delivery_parcelManager.getAllCargoForLocation(loc)` | All the cargos currently at this location (triggers the generators if the location is a facility spot). | 268 |
| `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc)` | Like getAllCargoForLocation but only the cargos whose offer has not expired (offerExpiresAt > delivery time). | 282 |
| `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated)` | Cargos at this location, not expired, not already at their destination and generated no later than timeGenerated. | 296 |
| `career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient)` | Cargos currently in a vehicle, and optionally those with a pending transient move. | 354 |
| `career_modules_delivery_parcelManager.getCargoById(cargoId)` | Looks up a cargo by id. | 423 |
| `career_modules_delivery_parcelManager.getLocationLabelLong(loc)` | Long label: for a facility spot, "Facility - spot name" if the spot has a custom field name; otherwise same as the short label. | 396 |
| `career_modules_delivery_parcelManager.getLocationLabelShort(loc)` | Short label of a location: translated facility name, "Current Vehicle (id)" / "Other Vehicle (id)", "Player Avatar", "N possible locations" (or the label of the single destination), "Unknown". The vehicle/avatar texts are not translated. | 374 |
| `career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo)` | Computes the rewards of a delivered cargo with a breakdown: effect of the timed modifier (on time, delayed, late), share of the vehicle loaner organizations, multiplier of the logistics branch level, parking precision bonus or penalty. Can unlock the ON_SCHEDULE achievement. | 436 |
| `career_modules_delivery_parcelManager.getTransientMoveCargo()` | Lists the cargos that have a pending transient move. | 97 |
| `career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation)` | Lists the cargos whose transient move targets the given location. | 197 |
| `career_modules_delivery_parcelManager.hasUncommittedTransientMoves()` | Indicates whether transient moves have been added but not yet applied. | 95 |
| `career_modules_delivery_parcelManager.onCareerActivated()` | Hook called on career activation: stores the other delivery extensions. *(internal)* *(hook)* | 14 |
| `career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2)` | Hook called when a trailer is coupled: recomputes the loaner organizations of the cargos located in vehicles. *(internal)* *(hook)* | 214 |
| `career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: sends the "delayed" and "late" UI messages for timed cargos in vehicles, updates the tasklist every second, restarts the tasklist and the cleanup if locations changed, and cleans up every 10 s. Inactive outside delivery mode. *(internal)* *(hook)* | 652 |
| `career_modules_delivery_parcelManager.sameLocation(a, b)` | Tests the equality of two locations by comparing each key of a with the same key of b (asymmetric comparison). | 249 |
| `career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc)` | Compares a cargo's current position with a location via sameLocation. | 245 |
| `career_modules_delivery_parcelManager.undoTransientCargo()` | Obsolete: only logs an error (cancellation code commented out, marked TODO). | 223 |

### Parameter details

#### `career_modules_delivery_parcelManager.addCargo(cargo, silent)`

Adds a cargo to the global list and emits the onCargoGenerated(cargo) hook unless silent.

- `cargo` (*table*) : Complete cargo (id, location, origin, destination, slots…).
- `silent` (*boolean|nil*) : true to not emit onCargoGenerated.

#### `career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo)`

Computes originalRewards/breakdown/adjustedRewards of each cargo, groups by groupId and loading time, formats each group via cargoScreen.formatCargoGroup and sorts by smallest id.

- `cargo` (*table*) : List of cargos at the same current location.
- **returns**: table|nil List of groups formatted for the UI (nil if the list is empty).

#### `career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation)`

Records a pending move for the cargo (cargo._transientMove). Refused with a logged error if it already has one.

- `cargoId` (*integer*) : Cargo identifier.
- `targetLocation` (*table*) : Target location.

#### `career_modules_delivery_parcelManager.applyTransientMoves(currentLocation)`

Applies the transient moves whose cargo is at the location currentLocation (or all if currentLocation is nil), updates the loaner organizations of the target vehicles, merges mergeable cargos of the same material at the same location, and keeps the other moves for later.

- `currentLocation` (*table|nil*) : Current location; nil to apply everything.
- **returns**: table Cargos moved.
- **returns**: table Cargos whose move remains pending.

#### `career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation)`

Immediately moves the cargo to newLocation. Adjusts the facility's material stock (removes from the old location, adds to the new one), timestamps loadedAtTimeStamp on the first load into a vehicle, and sets cargo.data.delivered = true if the new location is the destination.

- `cargoId` (*integer*) : Cargo identifier.
- `newLocation` (*table*) : New location (an error is logged if nil or empty).

#### `career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId)`

Cancels a cargo's transient move (no effect if none).

- `cargoId` (*integer*) : Cargo identifier.

#### `career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId)`

Non-expired cargos still at their origin, located in the facility facId.

- `facId` (*string*) : Origin facility.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...)`

Returns the cargos for which filter(cargo, ...) is true, after triggering all generators.

- `filter` (*function*) : function(cargo, ...) -> boolean.
- `...` (*any*) : Extra arguments passed to filter.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId)`

Non-expired cargos still at their origin and whose destination is the facility facId.

- `facId` (*string*) : Destination facility.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated)`

Same filter but over all the spots of a facility (facId).

- `facId` (*string*) : Facility identifier.
- `timeExpire` (*number|nil*) : Expiration threshold.
- `timeGenerated` (*number|nil*) : Maximum generation timestamp.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getAllCargoForLocation(loc)`

All the cargos currently at this location (triggers the generators if the location is a facility spot).

- `loc` (*table*) : Location.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc)`

Like getAllCargoForLocation but only the cargos whose offer has not expired (offerExpiresAt > delivery time).

- `loc` (*table*) : Location.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated)`

Cargos at this location, not expired, not already at their destination and generated no later than timeGenerated.

- `loc` (*table*) : Location.
- `timeExpire` (*number|nil*) : Expiration threshold; default: current time.
- `timeGenerated` (*number|nil*) : Maximum generation timestamp; default: infinity.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient)`

Cargos currently in a vehicle, and optionally those with a pending transient move.

- `includeTransient` (*boolean|nil*) : Include the cargos with _transientMove.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getCargoById(cargoId)`

Looks up a cargo by id.

- `cargoId` (*integer*) : Identifier.
- **returns**: table|nil Cargo or nil.

#### `career_modules_delivery_parcelManager.getLocationLabelLong(loc)`

Long label: for a facility spot, "Facility - spot name" if the spot has a custom field name; otherwise same as the short label.

- `loc` (*table*) : Location.
- **returns**: string Label.

#### `career_modules_delivery_parcelManager.getLocationLabelShort(loc)`

Short label of a location: translated facility name, "Current Vehicle (id)" / "Other Vehicle (id)", "Player Avatar", "N possible locations" (or the label of the single destination), "Unknown". The vehicle/avatar texts are not translated.

- `loc` (*table*) : Location.
- **returns**: string Label.

#### `career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo)`

Computes the rewards of a delivered cargo with a breakdown: effect of the timed modifier (on time, delayed, late), share of the vehicle loaner organizations, multiplier of the logistics branch level, parking precision bonus or penalty. Can unlock the ON_SCHEDULE achievement.

- `cargo` (*table*) : Cargo (rewards, modifiers, loadedAtTimeStamp, organization, destination, location…).
- **returns**: table originalRewards: copy of the base rewards.
- **returns**: table breakdown: list of items {label, rewards, simpleBreakdownType}.
- **returns**: table adjustedRewards: final rewards (base + sum of the items).

#### `career_modules_delivery_parcelManager.getTransientMoveCargo()`

Lists the cargos that have a pending transient move.

- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation)`

Lists the cargos whose transient move targets the given location.

- `targetLocation` (*table*) : Target location.
- **returns**: table List of cargos.

#### `career_modules_delivery_parcelManager.hasUncommittedTransientMoves()`

Indicates whether transient moves have been added but not yet applied.

- **returns**: boolean true if pending.

#### `career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2)`

Hook called when a trailer is coupled: recomputes the loaner organizations of the cargos located in vehicles.

- `objId1` (*integer*) : First vehicle.
- `objId2` (*integer*) : Second vehicle.

#### `career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: sends the "delayed" and "late" UI messages for timed cargos in vehicles, updates the tasklist every second, restarts the tasklist and the cleanup if locations changed, and cleans up every 10 s. Inactive outside delivery mode.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `career_modules_delivery_parcelManager.sameLocation(a, b)`

Tests the equality of two locations by comparing each key of a with the same key of b (asymmetric comparison).

- `a` (*table*) : Reference location.
- `b` (*table*) : Compared location (must not be nil).
- **returns**: boolean true if all keys of a equal those of b.

#### `career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc)`

Compares a cargo's current position with a location via sameLocation.

- `cargo` (*table*) : Cargo.
- `otherLoc` (*table*) : Location to compare.
- **returns**: boolean true if identical.

## Fields

| Field | Type | Description |
|---|---|---|
| `addParcelRewards` | nil | Exported but always nil (reference not defined in the file). ⚠ reference `addParcelRewards` not defined in the file (probably nil) |
| `dependencies` | table<integer, string> | Extensions loaded before: freeroam_facilities. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCargoGenerated` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `Message`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/parcelManager.lua`.*
