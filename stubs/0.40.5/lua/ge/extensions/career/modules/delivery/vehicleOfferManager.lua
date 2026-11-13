---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_vehicleOfferManager` : `extensions.load("career_modules_delivery_vehicleOfferManager")`, puis la globale `career_modules_delivery_vehicleOfferManager`
---@class career_modules_delivery_vehicleOfferManager
---@field dependencies table
career_modules_delivery_vehicleOfferManager = {}

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:206
---@param offer any
function career_modules_delivery_vehicleOfferManager.addOffer(offer) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:250
---@param facId any
---@param psPath any
function career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:222
---@param filter any
---@param ... any
function career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:233
---@param loc any
function career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:237
function career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:141
function career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:268
---@param id any
function career_modules_delivery_vehicleOfferManager.getOfferById(id) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:135
---@param tag any
function career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:130
---@param tag any
function career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:121
function career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:110
---@param tag any
function career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:21
---@param task any
function career_modules_delivery_vehicleOfferManager.makeTaskLabel(task) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:8
function career_modules_delivery_vehicleOfferManager.onCareerActivated() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:214
---@param a any
---@param b any
function career_modules_delivery_vehicleOfferManager.sameLocation(a, b) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:210
---@param offer any
---@param otherLoc any
function career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:277
---@param offerId any
---@param fadeToBlack any
---@param callback any
function career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback) end

