# `career_modules_delivery_vehicleOfferManager`

*File: `lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua` · VM: Game Engine (GE) · 405 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_vehicleOfferManager`: `extensions.load("career_modules_delivery_vehicleOfferManager")`, then the global `career_modules_delivery_vehicleOfferManager`

Manages vehicle and trailer delivery offers in career mode (the allOffers list): adding, lookup (by location, by facility, non-expired), vehicle category labels (junkerVeh, smallVeh, largeVeh, fleetVeh, exoticVeh, empty/loaded small, medium, large trailers) with their unlock flag, and spawning an offer vehicle in the world via a util_stepHandler sequence. Also used to build the label of a vehicle task for the UI.

## Notes

- Offer spawn: fade to black, vehicle spawn (model/config of offer.vehicle), placement on the spot offer.spawnLocation.psPath, mileage initialization (partCondition.initConditions), ignition off (setIgnitionLevel 0), ping then reading of the main part's odometer (offer.startingOdometer, -1 if not found), task creation via vehicleTasks.addVehicleTask, starting delivery mode, fade back in.
- offer.spawned = true is set at the very start of spawnOffer: the offer immediately disappears from the 'unexpired' lists.
- The filters getAllOfferUnexpired and getAllOfferAtFacilityUnexpired do not look at the facility's visibility/unlocking (commented code).
- The psPath parameter of getAllOfferAtFacilityUnexpired is ignored.
- sameLocation(a, b) is asymmetric: only the keys of a are compared (as in parcelManager).
- All filtering calls first trigger triggerAllGenerators(): new offers can be generated as a side effect.
- The vehicleTags table associates emptyLargeTrailer (singular, no final 's') whereas the others are plural: keep this in mind if you use the key.

**Dependencies (loaded first):** `util_stepHandler`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_vehicleOfferManager.addOffer(offer)` | Adds an offer to the global list. | 206 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath)` | Non-expired, non-spawned offers whose origin is the facility facId. | 250 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...)` | Returns the offers for which filter(offer, ...) is true, after triggering the generators. | 222 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc)` | Offers whose origin is the given location. | 233 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired()` | Non-expired offers not yet spawned (spawned false). | 237 |
| `career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI()` | Returns the two modifiers displayed by default for a vehicle offer: 'route' (follow the route) and 'damage', with translated icon, label and description. | 141 |
| `career_modules_delivery_vehicleOfferManager.getOfferById(id)` | Looks up an offer by id. | 268 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag)` | Translated plural label of the category (or "noCategory" if unknown). | 135 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag)` | Translated singular label of the category (or "noCategory" if unknown). | 130 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple()` | Unlock state of all vehicle categories. | 121 |
| `career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag)` | Indicates whether the category's unlock flag is active in career_modules_unlockFlags. An unknown category is considered unlocked. | 110 |
| `career_modules_delivery_vehicleOfferManager.makeTaskLabel(task)` | Builds the translated label of an offer task: vehicleDropOff according to lookupType (repair, private home, return after repair, truck, default "bringTo"), trailerDropOff ("towTo"), or "dropOffAt" if the task has a destination; otherwise "unknown". | 21 |
| `career_modules_delivery_vehicleOfferManager.onCareerActivated()` | Hook called on career activation: stores the other delivery extensions and util_stepHandler. *(internal)* *(hook)* | 8 |
| `career_modules_delivery_vehicleOfferManager.sameLocation(a, b)` | Tests the equality of two locations by comparing each key of a with that of b. | 214 |
| `career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc)` | Compares an offer's origin with a location via sameLocation. | 210 |
| `career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback)` | Spawns an offer's vehicle (see notes), registers it as a vehicle task and starts delivery mode. Logs an error and stops if the offer is not found. | 277 |

### Parameter details

#### `career_modules_delivery_vehicleOfferManager.addOffer(offer)`

Adds an offer to the global list.

- `offer` (*table*) : Offer (id, origin, offerExpiresAt, vehicle, task, rewards…).

#### `career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath)`

Non-expired, non-spawned offers whose origin is the facility facId.

- `facId` (*string*) : Facility identifier.
- `psPath` (*string|nil*) : Ignored.
- **returns**: table List of offers.

#### `career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...)`

Returns the offers for which filter(offer, ...) is true, after triggering the generators.

- `filter` (*function*) : function(offer, ...) -> boolean.
- `...` (*any*) : Extra arguments for filter.
- **returns**: table List of offers.

#### `career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc)`

Offers whose origin is the given location.

- `loc` (*table*) : Location.
- **returns**: table List of offers.

#### `career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired()`

Non-expired offers not yet spawned (spawned false).

- **returns**: table List of offers.

#### `career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI()`

Returns the two modifiers displayed by default for a vehicle offer: 'route' (follow the route) and 'damage', with translated icon, label and description.

- **returns**: table List of {type, icon, active, label, description}.

#### `career_modules_delivery_vehicleOfferManager.getOfferById(id)`

Looks up an offer by id.

- `id` (*integer*) : Offer identifier.
- **returns**: table|nil Offer or nil.

#### `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag)`

Translated plural label of the category (or "noCategory" if unknown).

- `tag` (*string*) : Category.
- **returns**: string Label.

#### `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag)`

Translated singular label of the category (or "noCategory" if unknown).

- `tag` (*string*) : Category.
- **returns**: string Label.

#### `career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple()`

Unlock state of all vehicle categories.

- **returns**: table<string, boolean> tag -> unlocked.

#### `career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag)`

Indicates whether the category's unlock flag is active in career_modules_unlockFlags. An unknown category is considered unlocked.

- `tag` (*string*) : Vehicle category (e.g. 'smallVeh', 'loadedLargeTrailers').
- **returns**: boolean true if unlocked.
- **returns**: table|nil Flag definition (absent for an unknown category).

#### `career_modules_delivery_vehicleOfferManager.makeTaskLabel(task)`

Builds the translated label of an offer task: vehicleDropOff according to lookupType (repair, private home, return after repair, truck, default "bringTo"), trailerDropOff ("towTo"), or "dropOffAt" if the task has a destination; otherwise "unknown".

- `task` (*table*) : Offer task (type, lookupType, destination).
- **returns**: string Translated label.

#### `career_modules_delivery_vehicleOfferManager.sameLocation(a, b)`

Tests the equality of two locations by comparing each key of a with that of b.

- `a` (*table*) : Reference location.
- `b` (*table*) : Compared location.
- **returns**: boolean true if equal.

#### `career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc)`

Compares an offer's origin with a location via sameLocation.

- `offer` (*table*) : Offer.
- `otherLoc` (*table*) : Location.
- **returns**: boolean true if identical.

#### `career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback)`

Spawns an offer's vehicle (see notes), registers it as a vehicle task and starts delivery mode. Logs an error and stops if the offer is not found.

- `offerId` (*integer*) : Offer identifier.
- `fadeToBlack` (*boolean|nil*) : Fade to black around the spawn; true by default.
- `callback` (*function|nil*) : Called at the end of the step sequence.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: util_stepHandler. |

**UI events (guihooks.trigger):** `updateCargoData`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua`.*
