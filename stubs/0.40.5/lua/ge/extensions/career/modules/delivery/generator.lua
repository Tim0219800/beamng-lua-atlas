---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/generator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career delivery content generator. On load (setup) it reads the parcel templates (*.deliveryParcels.json), vehicle templates (*.deliveryVehicles.json) and material templates (*.deliveryMaterials.json) in gameplay/delivery/, prepares the facilities (freeroam_facilities of type deliveryProvider: parking spots, provided/received logistic types, material storages, generators, progress), then produces parcels and vehicle/trailer offers and evolves the material stocks according to the generators' intervals. Also provides the computation of distances and initial rewards, and the material operations (splitting, moving, storing).
--- Access: extension `career_modules_delivery_generator`: `extensions.load("career_modules_delivery_generator")`, then the global `career_modules_delivery_generator`
---@class career_modules_delivery_generator
---@field dependencies table<integer, string> Extensions loaded before: freeroam_facilities, gameplay_sites_sitesManager, util_configListGenerator.
career_modules_delivery_generator = {}

--- Creates a material cargo (merge=true, offer without expiration, 'multi' destinations: facilities that receive this material) from a facility's stock, and schedules its transient move to the vehicle's container.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:816
---@param con table Cargo container (with location).
---@param storage table Facility material storage (materialType, id…).
---@param amount number Quantity (slots).
---@param sourceFacId string Origin facility.
---@param sourcePsPath string Fallback spot if no supplier access point is found.
function career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath) end

--- Adds or removes volume to a material's stock in a facility, clamped to [0, capacity] with a logged warning on overflow.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:957
---@param facId string Facility identifier.
---@param materialType string Material identifier.
---@param change number Volume change (negative to remove).
function career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change) end

--- Road distance between two positions: sum of the segments of the map path (map.getPath) plus the distance to the nearest road of each position.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:75
---@param posA vec3 Start position.
---@param posB vec3 End position.
---@return number  Distance in meters (1 if one of the positions has no road).
function career_modules_delivery_generator.distanceBetween(posA, posB) end

--- Computes the XP of a material delivery according to distance and number of slots, writes it into rewards.logistics and rewards['logistics-materials'], as well as the organization reputation and the money bonus.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:983
---@param item table Material cargo.
---@param destination table Drop-off location.
function career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination) end

--- Intended to compute the nearest providers/receivers of a facility; the body is entirely commented out, so it has no effect.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:713
---@param fac table Facility.
function career_modules_delivery_generator.finalizeMaterialDistances(fac) end

--- Computes (only once) a parcel's origin distance, its modifiers (dParcelMods.generateModifiers) and its rewards: money, logistics XP, skill XP (logistics-materials or logistics-delivery, +10 for tutorial parcels) and organization reputation (with a delivery bonus according to its level).
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:142
---@param item table Cargo (slots, weight, origin, destination, templateId, organization…).
function career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item) end

--- Completes a vehicle offer: picks a random vehicle according to its filter (model, config, mileage, name) if absent, then computes distance and rewards (baseReward + rewardPerKm, logistics XP, vehicle/trailer type XP, reputation).
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:470
---@param offer table Offer (vehicle.filterId, locations, data.type, organization…).
function career_modules_delivery_generator.finalizeVehicleOffer(offer) end

--- Road distance (cached per origin/destination pair) between two locations. If loc2 is 'multi', returns the (upper) median of the distances to each destination.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:105
---@param loc1 table Start location ('facilityParkingspot').
---@param loc2 table End location ('facilityParkingspot' or 'multi').
---@return number|nil  Distance in meters (nil for another location type).
function career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2) end

--- List of delivery facilities, sorted by translated name.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1517
---@return table  List of facilities.
function career_modules_delivery_generator.getFacilities() end

--- Facilities associated with an organization.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1520
---@param orgId string Organization identifier.
---@return table  List of {name, id}.
function career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId) end

--- Looks up a facility by id.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1518
---@param id string Facility identifier.
---@return table|nil  Facility.
function career_modules_delivery_generator.getFacilityById(id) end

--- World position of a location: parking spot for 'facilityParkingspot', vehicle position for 'vehicle'. Other types: prints a message and returns nil.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:90
---@param loc table Location.
---@return vec3|nil  Position.
function career_modules_delivery_generator.getLocationCoordinates(loc) end

--- Returns a material's template (*.deliveryMaterials.json): type (fluid/dryBulk), density, money, name…
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:687
---@param id string Material identifier.
---@return table|nil  Template.
function career_modules_delivery_generator.getMaterialsTemplatesById(id) end

--- Returns the parcel template loaded from the *.deliveryParcels.json files.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:224
---@param templateId string|integer Template identifier.
---@return table|nil  Template (names, slots, weight, modChance, offerDuration, isTutorialParcel…).
function career_modules_delivery_generator.getParcelTemplateById(templateId) end

--- Returns the parking spot (site object) matching an identification path.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1519
---@param path string psPath (ps:getPath()).
---@return table|nil  Parking spot (pos, rot, name, customFields…).
function career_modules_delivery_generator.getParkingSpotByPath(path) end

--- Indicates whether a cargo type can be mixed in the same container (parcel: yes, fluid and dryBulk: no).
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1084
---@param type string 'parcel', 'fluid' or 'dryBulk'.
---@return boolean|nil  nil for an unknown type.
function career_modules_delivery_generator.isMixable(type) end

--- Moves a material cargo to a facility. If the stock cannot take it all, splits: the part that fits is moved, the rest stays in the vehicle.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:920
---@param cargo table Material cargo.
---@param destination table Destination location (facId).
---@return table  Cargo handled (the dropped copy in case of a split).
---@return table|nil  Remaining cargo (nil if everything is dropped).
function career_modules_delivery_generator.moveMaterialToDestination(cargo, destination) end

--- Hook called on career activation: stores the references to the other delivery extensions and util_stepHandler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:10
function career_modules_delivery_generator.onCareerActivated() end

--- Per-frame hook: re-arms triggerAllGenerators for the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1033
---@param dtReal number Real time delta (s), unused.
---@param dtSim number Simulation time delta (s), unused.
---@param dtRaw number Raw time delta (s), unused.
function career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw) end

--- Randomly picks an access point among those that handle a given logistic type; logs an error and prints the list if none fits.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:56
---@param accessPointsByName table<string, table> Access points of a facility.
---@param logisticType string Logistic type searched for.
---@param typeLookupKey string 'logisticTypesProvidedLookup' or 'logisticTypesReceivedLookup'.
---@return table|nil  Access point (ps, psPath, facId…).
function career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey) end

--- Initializes the whole delivery system: loads the material, parcel and vehicle templates, prepares the facilities (setupFacilities), then either reloads the saved parcels and offers (discarding the temporary material cargos 'addMaterialAsParcelToContainer'), or generates an initial stock by simulating past generations (240 s of parcels, 1000 s of vehicle offers).
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1458
---@param loadData table Save data: facilities (progress, materialStorages, logisticGenerators), parcels, vehicleOffers, general.maxGroupId.
function career_modules_delivery_generator.setup(loadData) end

--- Splits a material cargo: creates copies of given sizes and reduces the original accordingly (weight and money recomputed).
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:894
---@param cargo table Material cargo.
---@param otherPartSizes table<integer, number>|nil Sizes (slots) of the parts to split off.
---@return table  List: original cargo then the split-off copies.
function career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes) end

--- Triggers all generators whose deadline has been reached (nextGenerationTimestamp), at most once per frame.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1020
function career_modules_delivery_generator.triggerAllGenerators() end

--- Runs one generation for a generator: parcels (parcelProvider/parcelReceiver), vehicle or trailer offers, or evolution of the material stock.
---Source: lua/ge/extensions/career/modules/delivery/generator.lua:1004
---@param fac table Facility.
---@param generator table Generator (type, min, max, interval, logisticTypes…).
---@param timeOffset number|nil Time offset (negative to simulate a past generation); 0 by default.
function career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset) end

