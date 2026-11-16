# `career_modules_loanerVehicles`

*File: `lua/ge/extensions/career/modules/loanerVehicles.lua` · VM: Game Engine (GE) · 440 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_loanerVehicles`: `extensions.load("career_modules_loanerVehicles")`, then the global `career_modules_loanerVehicles`

Vehicles loaned (loaners) by the career delivery organizations. It builds the offers displayed in the UI (formatLoanerOfferForUi), handles the selection then the spawning of loaned vehicles via a util_stepHandler sequence (fade, spawn, placement on a parking spot, adding to the inventory with owned = false, fade back in), returning the vehicles and a monitoring: a "work" vehicle left more than 100 m away for 300 s is returned automatically.

## Notes

- Settings: walkAwayRadius 100 m, comeBackRadius 95 m, walkAwayTimeLimit 300 s, warning at 60 s remaining.
- A loaner vehicle is added to the inventory with owningOrganization (facility.associatedOrganization) and loanType (offer.loanType, "work").
- Returning a damaged work vehicle (inventoryVehNeedsRepair) costs the organization's returnLoanerDamaged reputation (-20) and shows a toast.
- Offer unavailable if: no free slot, already a non-trailer loaner from this organization (limit 1, including those waiting to spawn), insufficient reputation, or insufficient delivery level (delivery branch). An offer already ticked stays enabled.
- Proposed mileage: the offer's mileage according to the reputation level, plus about 5.8 * (1 ± 10%) per second elapsed since the save was created (i.e. 500 km per day according to the code comment).
- Bug: M.spawnAndLoanVehicle = spawnAndLoanVehicle references an undefined variable: the field is nil.
- spawnAllOffers: the last step only processes the first offer of markedForSpawningLoaners (next) to orient the camera, then empties the list.
- onUpdate uses `break` after each action: only one vehicle is processed per frame.

**Dependencies (loaded first):** `util_stepHandler`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_loanerVehicles.formatLoanerOfferForUi(facility)` | Prepares for the UI a facility's loan offers: availability (enabled), reason for unavailability, unlock info, mileage, capacity, thumbnail. | 288 |
| `career_modules_loanerVehicles.formatSpawnedLoanersForUi()` | Prepares for the UI the list of loaners already in the inventory: organization share (loanerCut), name, mileage, vehicle/trailer type, fluid capacity. | 254 |
| `career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId)` | Lists (deep copies with thumbnail) the inventory vehicles loaned by the given organization. | 139 |
| `career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId)` | Returns the organizations that own the vehicle and, if it is coupled, the non-trailer towing vehicle. | 210 |
| `career_modules_loanerVehicles.markForSpawning(offer)` | Toggles the selection of an offer: adds it to the list of loaners to spawn, or removes it if it was already there. | 18 |
| `career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw)` | Frame hook: monitors work vehicles moving away (warning, then automatic return after the delay). *(internal)* *(hook)* | 151 |
| `career_modules_loanerVehicles.onVehicleAdded(id)` | Hook called when a vehicle is added to the inventory: unblocks the waiting step of the spawn sequence. *(internal)* *(hook)* | 33 |
| `career_modules_loanerVehicles.returnVehicle(inventoryId, callback)` | Returns a loaned vehicle: updates the part conditions if it is present in the world, applies the reputation penalty if the work vehicle is damaged, then removes it from the inventory and calls callback. | 114 |
| `career_modules_loanerVehicles.spawnAllOffers()` | Spawns all the selected offers with a fade: spawn, initialization of the part conditions (mileage), placement on the best parking spot (trailers or not), adding to the inventory. Does nothing if nothing is selected. | 37 |
| `career_modules_loanerVehicles.unmarkAllForSpawning()` | Empties the list of selected offers. | 27 |

### Parameter details

#### `career_modules_loanerVehicles.formatLoanerOfferForUi(facility)`

Prepares for the UI a facility's loan offers: availability (enabled), reason for unavailability, unlock info, mileage, capacity, thumbnail.

- `facility` (*table*) : Delivery facility (associatedOrganization, loanerTrailerSpots, loanerNonTrailerSpots, id).
- **returns**: table[]|nil Offers, nil if the organization is unknown.

#### `career_modules_loanerVehicles.formatSpawnedLoanersForUi()`

Prepares for the UI the list of loaners already in the inventory: organization share (loanerCut), name, mileage, vehicle/trailer type, fluid capacity.

- **returns**: table[] UI entries (isSpawnedLoaner = true).

#### `career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId)`

Lists (deep copies with thumbnail) the inventory vehicles loaned by the given organization.

- `organizationId` (*string*) : Organization id.
- **returns**: table[] Vehicle info.

#### `career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId)`

Returns the organizations that own the vehicle and, if it is coupled, the non-trailer towing vehicle.

- `vehId` (*integer*) : Vehicle object id.
- **returns**: table<string, boolean> Set of organization ids.

#### `career_modules_loanerVehicles.markForSpawning(offer)`

Toggles the selection of an offer: adds it to the list of loaners to spawn, or removes it if it was already there.

- `offer` (*table*) : Offer (id, model, config, sourceFacility, loanType, vehMileage).

#### `career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw)`

Frame hook: monitors work vehicles moving away (warning, then automatic return after the delay).

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulation time (s).
- `dtRaw` (*number*) : Raw time (s).

#### `career_modules_loanerVehicles.onVehicleAdded(id)`

Hook called when a vehicle is added to the inventory: unblocks the waiting step of the spawn sequence.

- `id` (*integer*) : Vehicle id.

#### `career_modules_loanerVehicles.returnVehicle(inventoryId, callback)`

Returns a loaned vehicle: updates the part conditions if it is present in the world, applies the reputation penalty if the work vehicle is damaged, then removes it from the inventory and calls callback.

- `inventoryId` (*integer*) : Inventory id of the vehicle.
- `callback` (*function|nil*) : Called once the vehicle is removed.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: util_stepHandler. |
| `spawnAndLoanVehicle` | nil | Always nil: variable that does not exist in the file (bug). ⚠ reference `spawnAndLoanVehicle` not defined in the file (probably nil) |

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `be:` `getObjectPositionXYZ`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/loanerVehicles.lua`.*
