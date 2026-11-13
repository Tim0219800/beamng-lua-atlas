---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/generator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_generator` : `extensions.load("career_modules_delivery_generator")`, puis la globale `career_modules_delivery_generator`
---@class career_modules_delivery_generator
---@field dependencies table
career_modules_delivery_generator = {}

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:816
---@param con any
---@param storage any
---@param amount any
---@param sourceFacId any
---@param sourcePsPath any
function career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:957
---@param facId any
---@param materialType any
---@param change any
function career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:75
---@param posA any
---@param posB any
function career_modules_delivery_generator.distanceBetween(posA, posB) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:983
---@param item any
---@param destination any
function career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:713
---@param fac any
function career_modules_delivery_generator.finalizeMaterialDistances(fac) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:142
---@param item any
function career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:470
---@param offer any
function career_modules_delivery_generator.finalizeVehicleOffer(offer) end

--- M.getLogisticTypesLookup = function() return logisticTypesLookup end
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:105
---@param loc1 any
---@param loc2 any
function career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1517
function career_modules_delivery_generator.getFacilities() end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1520
---@param orgId any
function career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1518
---@param id any
function career_modules_delivery_generator.getFacilityById(id) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:90
---@param loc any
function career_modules_delivery_generator.getLocationCoordinates(loc) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:687
---@param id any
function career_modules_delivery_generator.getMaterialsTemplatesById(id) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:224
---@param templateId any
function career_modules_delivery_generator.getParcelTemplateById(templateId) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1519
---@param path any
function career_modules_delivery_generator.getParkingSpotByPath(path) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1084
---@param type any
function career_modules_delivery_generator.isMixable(type) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:920
---@param cargo any
---@param destination any
function career_modules_delivery_generator.moveMaterialToDestination(cargo, destination) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:10
function career_modules_delivery_generator.onCareerActivated() end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1033
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:56
---@param accessPointsByName any
---@param logisticType any
---@param typeLookupKey any
function career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1458
---@param loadData any
function career_modules_delivery_generator.setup(loadData) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:894
---@param cargo any
---@param otherPartSizes any
function career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes) end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1020
function career_modules_delivery_generator.triggerAllGenerators() end

---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1004
---@param fac any
---@param generator any
---@param timeOffset any
function career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset) end

