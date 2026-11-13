---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/parcelManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_parcelManager` : `extensions.load("career_modules_delivery_parcelManager")`, puis la globale `career_modules_delivery_parcelManager`
---@class career_modules_delivery_parcelManager
---@field addParcelRewards any
---@field dependencies table
career_modules_delivery_parcelManager = {}

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:40
---@param cargo any
---@param silent any
function career_modules_delivery_parcelManager.addCargo(cargo, silent) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:578
---@param cargo any
function career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:79
---@param cargoId any
---@param targetLocation any
function career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:134
---@param currentLocation any
function career_modules_delivery_parcelManager.applyTransientMoves(currentLocation) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:47
---@param cargoId any
---@param newLocation any
function career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:670
function career_modules_delivery_parcelManager.cleanUpCargo() end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:125
function career_modules_delivery_parcelManager.clearAllTransientMoves() end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:210
function career_modules_delivery_parcelManager.clearTransientFlags() end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:108
---@param cargoId any
function career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:341
---@param facId any
function career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:257
---@param filter any
---@param ... any
function career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:328
---@param facId any
function career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:312
---@param facId any
---@param timeExpire any
---@param timeGenerated any
function career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:268
---@param loc any
function career_modules_delivery_parcelManager.getAllCargoForLocation(loc) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:282
---@param loc any
function career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:296
---@param loc any
---@param timeExpire any
---@param timeGenerated any
function career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:354
---@param includeTransient any
function career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:423
---@param cargoId any
function career_modules_delivery_parcelManager.getCargoById(cargoId) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:396
---@param loc any
function career_modules_delivery_parcelManager.getLocationLabelLong(loc) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:374
---@param loc any
function career_modules_delivery_parcelManager.getLocationLabelShort(loc) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:436
---@param cargo any
function career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:97
function career_modules_delivery_parcelManager.getTransientMoveCargo() end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:197
---@param targetLocation any
function career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:95
function career_modules_delivery_parcelManager.hasUncommittedTransientMoves() end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:14
function career_modules_delivery_parcelManager.onCareerActivated() end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:214
---@param objId1 any
---@param objId2 any
function career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:652
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:249
---@param a any
---@param b any
function career_modules_delivery_parcelManager.sameLocation(a, b) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:245
---@param cargo any
---@param otherLoc any
function career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc) end

---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:223
function career_modules_delivery_parcelManager.undoTransientCargo() end

