# `career_modules_delivery_generator`

*File: `lua/ge/extensions/career/modules/delivery/generator.lua` · VM: Game Engine (GE) · 1534 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_generator`: `extensions.load("career_modules_delivery_generator")`, then the global `career_modules_delivery_generator`

Career delivery content generator. On load (setup) it reads the parcel templates (*.deliveryParcels.json), vehicle templates (*.deliveryVehicles.json) and material templates (*.deliveryMaterials.json) in gameplay/delivery/, prepares the facilities (freeroam_facilities of type deliveryProvider: parking spots, provided/received logistic types, material storages, generators, progress), then produces parcels and vehicle/trailer offers and evolves the material stocks according to the generators' intervals. Also provides the computation of distances and initial rewards, and the material operations (splitting, moving, storing).

## Example

```lua
local fac = career_modules_delivery_generator.getFacilityById("someFacilityId")
local ps = career_modules_delivery_generator.getParkingSpotByPath(psPath)
local d = career_modules_delivery_generator.getDistanceBetweenFacilities(originLoc, destLoc) -- meters by road
```

## Notes

- Generator types: parcelProvider, parcelReceiver (parcels), vehOfferProvider, trailerOfferProvider (vehicle/trailer offers), materialProvider, materialReceiver (material stock).
- A location is a table {type='facilityParkingspot', facId, psPath}; 'multi' contains several possible destinations.
- The generators only run when a request calls triggerAllGenerators (for example the getAllCargo* functions of the parcelManager); a flag limits the call to once per frame (reset to false by onUpdate).
- Minimum delivery distance: 150 m (minDeliveryDistance), measured over the road network (map.getPath) plus the distances to the nearest roads; 1 if a position has no road.
- Parcel reward: money = (sqrt(slots)/4 + (km)^(1+sqrt(slots)/100) * (5 + weight^0.9)), multiplied by the organization's delivery bonus; XP = base (2, +1 at 16, 32, 64 slots) + rounded km.
- Bug: in triggerParcelGenerator, for parcelProvider with multiDestination, psPath is filled by `s:getPath()` where `s` is not defined: would raise a Lua error if this mode is used (it should be ap.psPath).
- Bug: setupMaterialStorage fixes a negative stock with `storage.storedVlume = 0` (typo); the negative value is therefore not corrected.
- In triggerVehicleOfferGenerator, if no destination facility is found, the function exits entirely (return) instead of moving on to the next offer.
- If a vehicleProvider-type generator is tested in createGeneratorTemplateCache, the block is empty; only the parcel code fills validTemplates.
- finalizeMaterialDistances does nothing in this version: all the computation is in a commented block.
- The commented field M.getLogisticTypesLookup does not exist; the line that references it in the automatic page comes from a code comment.

**Dependencies (loaded first):** `freeroam_facilities`, `gameplay_sites_sitesManager`, `util_configListGenerator`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath)` | Creates a material cargo (merge=true, offer without expiration, 'multi' destinations: facilities that receive this material) from a facility's stock, and schedules its transient move to the vehicle's container. | 816 |
| `career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change)` | Adds or removes volume to a material's stock in a facility, clamped to [0, capacity] with a logged warning on overflow. | 957 |
| `career_modules_delivery_generator.distanceBetween(posA, posB)` | Road distance between two positions: sum of the segments of the map path (map.getPath) plus the distance to the nearest road of each position. | 75 |
| `career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination)` | Computes the XP of a material delivery according to distance and number of slots, writes it into rewards.logistics and rewards['logistics-materials'], as well as the organization reputation and the money bonus. | 983 |
| `career_modules_delivery_generator.finalizeMaterialDistances(fac)` | Intended to compute the nearest providers/receivers of a facility; the body is entirely commented out, so it has no effect. | 713 |
| `career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item)` | Computes (only once) a parcel's origin distance, its modifiers (dParcelMods.generateModifiers) and its rewards: money, logistics XP, skill XP (logistics-materials or logistics-delivery, +10 for tutorial parcels) and organization reputation (with a delivery bonus according to its level). | 142 |
| `career_modules_delivery_generator.finalizeVehicleOffer(offer)` | Completes a vehicle offer: picks a random vehicle according to its filter (model, config, mileage, name) if absent, then computes distance and rewards (baseReward + rewardPerKm, logistics XP, vehicle/trailer type XP, reputation). | 470 |
| `career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2)` | Road distance (cached per origin/destination pair) between two locations. If loc2 is 'multi', returns the (upper) median of the distances to each destination. | 105 |
| `career_modules_delivery_generator.getFacilities()` | List of delivery facilities, sorted by translated name. | 1517 |
| `career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId)` | Facilities associated with an organization. | 1520 |
| `career_modules_delivery_generator.getFacilityById(id)` | Looks up a facility by id. | 1518 |
| `career_modules_delivery_generator.getLocationCoordinates(loc)` | World position of a location: parking spot for 'facilityParkingspot', vehicle position for 'vehicle'. Other types: prints a message and returns nil. | 90 |
| `career_modules_delivery_generator.getMaterialsTemplatesById(id)` | Returns a material's template (*.deliveryMaterials.json): type (fluid/dryBulk), density, money, name… | 687 |
| `career_modules_delivery_generator.getParcelTemplateById(templateId)` | Returns the parcel template loaded from the *.deliveryParcels.json files. | 224 |
| `career_modules_delivery_generator.getParkingSpotByPath(path)` | Returns the parking spot (site object) matching an identification path. | 1519 |
| `career_modules_delivery_generator.isMixable(type)` | Indicates whether a cargo type can be mixed in the same container (parcel: yes, fluid and dryBulk: no). | 1084 |
| `career_modules_delivery_generator.moveMaterialToDestination(cargo, destination)` | Moves a material cargo to a facility. If the stock cannot take it all, splits: the part that fits is moved, the rest stays in the vehicle. | 920 |
| `career_modules_delivery_generator.onCareerActivated()` | Hook called on career activation: stores the references to the other delivery extensions and util_stepHandler. *(internal)* *(hook)* | 10 |
| `career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: re-arms triggerAllGenerators for the next frame. *(internal)* *(hook)* | 1033 |
| `career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey)` | Randomly picks an access point among those that handle a given logistic type; logs an error and prints the list if none fits. | 56 |
| `career_modules_delivery_generator.setup(loadData)` | Initializes the whole delivery system: loads the material, parcel and vehicle templates, prepares the facilities (setupFacilities), then either reloads the saved parcels and offers (discarding the temporary material cargos 'addMaterialAsParcelToContainer'), or generates an initial stock by simulating past generations (240 s of parcels, 1000 s of vehicle offers). | 1458 |
| `career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes)` | Splits a material cargo: creates copies of given sizes and reduces the original accordingly (weight and money recomputed). | 894 |
| `career_modules_delivery_generator.triggerAllGenerators()` | Triggers all generators whose deadline has been reached (nextGenerationTimestamp), at most once per frame. | 1020 |
| `career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset)` | Runs one generation for a generator: parcels (parcelProvider/parcelReceiver), vehicle or trailer offers, or evolution of the material stock. | 1004 |

### Parameter details

#### `career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath)`

Creates a material cargo (merge=true, offer without expiration, 'multi' destinations: facilities that receive this material) from a facility's stock, and schedules its transient move to the vehicle's container.

- `con` (*table*) : Cargo container (with location).
- `storage` (*table*) : Facility material storage (materialType, id…).
- `amount` (*number*) : Quantity (slots).
- `sourceFacId` (*string*) : Origin facility.
- `sourcePsPath` (*string*) : Fallback spot if no supplier access point is found.

#### `career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change)`

Adds or removes volume to a material's stock in a facility, clamped to [0, capacity] with a logged warning on overflow.

- `facId` (*string*) : Facility identifier.
- `materialType` (*string*) : Material identifier.
- `change` (*number*) : Volume change (negative to remove).

#### `career_modules_delivery_generator.distanceBetween(posA, posB)`

Road distance between two positions: sum of the segments of the map path (map.getPath) plus the distance to the nearest road of each position.

- `posA` (*vec3*) : Start position.
- `posB` (*vec3*) : End position.
- **returns**: number Distance in meters (1 if one of the positions has no road).

#### `career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination)`

Computes the XP of a material delivery according to distance and number of slots, writes it into rewards.logistics and rewards['logistics-materials'], as well as the organization reputation and the money bonus.

- `item` (*table*) : Material cargo.
- `destination` (*table*) : Drop-off location.

#### `career_modules_delivery_generator.finalizeMaterialDistances(fac)`

Intended to compute the nearest providers/receivers of a facility; the body is entirely commented out, so it has no effect.

- `fac` (*table*) : Facility.

#### `career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item)`

Computes (only once) a parcel's origin distance, its modifiers (dParcelMods.generateModifiers) and its rewards: money, logistics XP, skill XP (logistics-materials or logistics-delivery, +10 for tutorial parcels) and organization reputation (with a delivery bonus according to its level).

- `item` (*table*) : Cargo (slots, weight, origin, destination, templateId, organization…).

#### `career_modules_delivery_generator.finalizeVehicleOffer(offer)`

Completes a vehicle offer: picks a random vehicle according to its filter (model, config, mileage, name) if absent, then computes distance and rewards (baseReward + rewardPerKm, logistics XP, vehicle/trailer type XP, reputation).

- `offer` (*table*) : Offer (vehicle.filterId, locations, data.type, organization…).

#### `career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2)`

Road distance (cached per origin/destination pair) between two locations. If loc2 is 'multi', returns the (upper) median of the distances to each destination.

- `loc1` (*table*) : Start location ('facilityParkingspot').
- `loc2` (*table*) : End location ('facilityParkingspot' or 'multi').
- **returns**: number|nil Distance in meters (nil for another location type).

#### `career_modules_delivery_generator.getFacilities()`

List of delivery facilities, sorted by translated name.

- **returns**: table List of facilities.

#### `career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId)`

Facilities associated with an organization.

- `orgId` (*string*) : Organization identifier.
- **returns**: table List of {name, id}.

#### `career_modules_delivery_generator.getFacilityById(id)`

Looks up a facility by id.

- `id` (*string*) : Facility identifier.
- **returns**: table|nil Facility.

#### `career_modules_delivery_generator.getLocationCoordinates(loc)`

World position of a location: parking spot for 'facilityParkingspot', vehicle position for 'vehicle'. Other types: prints a message and returns nil.

- `loc` (*table*) : Location.
- **returns**: vec3|nil Position.

#### `career_modules_delivery_generator.getMaterialsTemplatesById(id)`

Returns a material's template (*.deliveryMaterials.json): type (fluid/dryBulk), density, money, name…

- `id` (*string*) : Material identifier.
- **returns**: table|nil Template.

#### `career_modules_delivery_generator.getParcelTemplateById(templateId)`

Returns the parcel template loaded from the *.deliveryParcels.json files.

- `templateId` (*string|integer*) : Template identifier.
- **returns**: table|nil Template (names, slots, weight, modChance, offerDuration, isTutorialParcel…).

#### `career_modules_delivery_generator.getParkingSpotByPath(path)`

Returns the parking spot (site object) matching an identification path.

- `path` (*string*) : psPath (ps:getPath()).
- **returns**: table|nil Parking spot (pos, rot, name, customFields…).

#### `career_modules_delivery_generator.isMixable(type)`

Indicates whether a cargo type can be mixed in the same container (parcel: yes, fluid and dryBulk: no).

- `type` (*string*) : 'parcel', 'fluid' or 'dryBulk'.
- **returns**: boolean|nil nil for an unknown type.

#### `career_modules_delivery_generator.moveMaterialToDestination(cargo, destination)`

Moves a material cargo to a facility. If the stock cannot take it all, splits: the part that fits is moved, the rest stays in the vehicle.

- `cargo` (*table*) : Material cargo.
- `destination` (*table*) : Destination location (facId).
- **returns**: table Cargo handled (the dropped copy in case of a split).
- **returns**: table|nil Remaining cargo (nil if everything is dropped).

#### `career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: re-arms triggerAllGenerators for the next frame.

- `dtReal` (*number*) : Real time delta (s), unused.
- `dtSim` (*number*) : Simulation time delta (s), unused.
- `dtRaw` (*number*) : Raw time delta (s), unused.

#### `career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey)`

Randomly picks an access point among those that handle a given logistic type; logs an error and prints the list if none fits.

- `accessPointsByName` (*table<string, table>*) : Access points of a facility.
- `logisticType` (*string*) : Logistic type searched for.
- `typeLookupKey` (*string*) : 'logisticTypesProvidedLookup' or 'logisticTypesReceivedLookup'.
- **returns**: table|nil Access point (ps, psPath, facId…).

#### `career_modules_delivery_generator.setup(loadData)`

Initializes the whole delivery system: loads the material, parcel and vehicle templates, prepares the facilities (setupFacilities), then either reloads the saved parcels and offers (discarding the temporary material cargos 'addMaterialAsParcelToContainer'), or generates an initial stock by simulating past generations (240 s of parcels, 1000 s of vehicle offers).

- `loadData` (*table*) : Save data: facilities (progress, materialStorages, logisticGenerators), parcels, vehicleOffers, general.maxGroupId.

#### `career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes)`

Splits a material cargo: creates copies of given sizes and reduces the original accordingly (weight and money recomputed).

- `cargo` (*table*) : Material cargo.
- `otherPartSizes` (*table<integer, number>|nil*) : Sizes (slots) of the parts to split off.
- **returns**: table List: original cargo then the split-off copies.

#### `career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset)`

Runs one generation for a generator: parcels (parcelProvider/parcelReceiver), vehicle or trailer offers, or evolution of the material stock.

- `fac` (*table*) : Facility.
- `generator` (*table*) : Generator (type, min, max, interval, logisticTypes…).
- `timeOffset` (*number|nil*) : Time offset (negative to simulate a past generation); 0 by default.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: freeroam_facilities, gameplay_sites_sitesManager, util_configListGenerator. |

## Calls into the engine (C++)

- `FS:` `findFiles`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/generator.lua`.*
