---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/precisionParking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Evaluates the player vehicle's parking precision at a delivery's destination (parcel, materials or vehicle) and applies reward bonuses or penalties. The score (2 to 20) combines the angular alignment, the lateral offset and the longitudinal offset of the bounding box center relative to the parking spot; it gives a perfect/great/good/bad/horrible level. The bonuses affect money, logistics XP, skill XP and the organization's reputation.
--- Access: extension `career_modules_delivery_precisionParking`: `extensions.load("career_modules_delivery_precisionParking")`, then the global `career_modules_delivery_precisionParking`
---@class career_modules_delivery_precisionParking
---@field dependencies table<integer, string> Extensions loaded before: util_stepHandler.
career_modules_delivery_precisionParking = {}

--- For a parcel or materials: evaluates the player vehicle at the spot targetLocation.psPath and applies the bonus to cargo.rewards (money, logistics-materials or logistics-delivery, organization reputation); stores the detail in cargo.precisionParking.
---Source: lua/ge/extensions/career/modules/delivery/precisionParking.lua:400
---@param cargo table Parcel to deliver (rewards, organization, materialType).
---@param targetLocation table Destination containing psPath, the parking spot path.
---@return table  The parcel, modified if the score could be computed.
function career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation) end

--- For a vehicle delivery: computes the precision at taskData.dropOffPsPath and adds the bonus to taskData.adjustedRewards, with the detail in taskData.breakdown.precisionParking. Returns taskData unchanged if data is missing.
---Source: lua/ge/extensions/career/modules/delivery/precisionParking.lua:380
---@param taskData table Delivery task with dropOffPsPath, vehId, originalRewards, adjustedRewards, breakdown and offer.organization.
---@return table  Modified taskData.
function career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData) end

--- Computes a vehicle's parking score relative to a spot (position, rotation, optional width and length), following the logic of parkingPointsNode.lua.
---Source: lua/ge/extensions/career/modules/delivery/precisionParking.lua:64
---@param vehId integer Vehicle identifier.
---@param targetParkingSpot table Parking spot with pos (vec3), rot (quat) and optionally width, length.
---@return table|nil  Table with precisionLevel, totalScore, angle, adjustedAngle, sideDist, forwardDist, sub-scores and tolerances; nil if the vehicle cannot be found.
function career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot) end

--- Debug function: returns a vehicle's precision score for a spot (the log is commented out in the code).
---Source: lua/ge/extensions/career/modules/delivery/precisionParking.lua:426
---@param vehId integer Vehicle identifier.
---@param targetParkingSpot table Parking spot (pos, rot, width, length).
---@return table|nil  Precision data.
function career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot) end

--- Converts a precision result into a bonus: fixed amounts and percentages for money (positive or negative), logistics XP, skill XP (good/great/perfect) and reputation (great/perfect bonus, horrible penalty). With no data, returns a zero bonus of level 'none'.
---Source: lua/ge/extensions/career/modules/delivery/precisionParking.lua:171
---@param precisionData table|nil Result of calculateVehiclePrecisionScore.
---@return table  Table with precisionLevel, totalScore, measurements and fields moneyFlat/Percent, logisticsFlat/Percent, skillFlat/Percent, reputationFlat/Percent.
function career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData) end

--- Returns the configuration table (score thresholds and reward amounts/percentages) for the UI or debugging.
---Source: lua/ge/extensions/career/modules/delivery/precisionParking.lua:415
---@return table  Table PRECISION_PARKING_CONFIG (reference, not copied).
function career_modules_delivery_precisionParking.getPrecisionParkingConfig() end

--- Hook called on career activation: stores the references to parcelManager, general, generator and vehicleTasks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/precisionParking.lua:9
function career_modules_delivery_precisionParking.onCareerActivated() end

