---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/precisionParking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_precisionParking` : `extensions.load("career_modules_delivery_precisionParking")`, puis la globale `career_modules_delivery_precisionParking`
---@class career_modules_delivery_precisionParking
---@field dependencies table
career_modules_delivery_precisionParking = {}

--- Main function to calculate and apply precision parking for cargo delivery
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:400
---@param cargo any
---@param targetLocation any
function career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation) end

--- Main function to calculate and apply precision parking for vehicle delivery
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:380
---@param taskData any
function career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData) end

--- Calculate precision parking score for a vehicle (based on parkingPointsNode.lua)
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:64
---@param vehId any
---@param targetParkingSpot any
function career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot) end

--- Debug function to test precision parking
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:426
---@param vehId any
---@param targetParkingSpot any
function career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot) end

--- Get precision parking bonus for rewards
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:171
---@param precisionData any
function career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData) end

--- Get precision parking configuration (for UI/debugging)
---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:415
function career_modules_delivery_precisionParking.getPrecisionParkingConfig() end

---Source : lua/ge/extensions/career/modules/delivery/precisionParking.lua:9
function career_modules_delivery_precisionParking.onCareerActivated() end

