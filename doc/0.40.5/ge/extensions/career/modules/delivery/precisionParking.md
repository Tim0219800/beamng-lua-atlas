# `career_modules_delivery_precisionParking`

*File: `lua/ge/extensions/career/modules/delivery/precisionParking.lua` · VM: Game Engine (GE) · 436 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_precisionParking`: `extensions.load("career_modules_delivery_precisionParking")`, then the global `career_modules_delivery_precisionParking`

Evaluates the player vehicle's parking precision at a delivery's destination (parcel, materials or vehicle) and applies reward bonuses or penalties. The score (2 to 20) combines the angular alignment, the lateral offset and the longitudinal offset of the bounding box center relative to the parking spot; it gives a perfect/great/good/bad/horrible level. The bonuses affect money, logistics XP, skill XP and the organization's reputation.

## Notes

- Score thresholds: perfect >= 20, great >= 15, good >= 10, bad >= 5, otherwise horrible. Score = min(20, (angleScore+sideScore+forwardScore)*6 + 2) rounded, each sub-score being in [0,1].
- Angles in degrees, distances in meters. Parking at 180° counts as 0° (adjusted angle = 180 - angle if > 90). Default spot 2.5 m x 5.0 m if width/length are absent.
- The tolerances are adaptive: maxSide = max(0.3, (spotWidth - vehicleWidth)*0.3), maxForward = max(0.4, (spotLength - vehicleLength)*0.3); the minimums are 30% of the maximums (floors 0.1 and 0.15). The angle goes from 7.5 deg (0 points) to 1.6 deg (full score).
- The 'skill' bonus is added to the same reward key as the 'logistics' bonus ('logistics-vehicleDelivery', 'logistics-materials' or 'logistics-delivery'): both add up on a single entry.
- calculateCargoPrecisionScore (internal) ignores its cargo parameter and always uses the player vehicle (be:getPlayerVehicleID(0)).
- The amounts are modified in place: calling the main function twice on the same parcel would apply the bonus twice.

**Dependencies (loaded first):** `util_stepHandler`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation)` | For a parcel or materials: evaluates the player vehicle at the spot targetLocation.psPath and applies the bonus to cargo.rewards (money, logistics-materials or logistics-delivery, organization reputation); stores the detail in cargo.precisionParking. | 400 |
| `career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData)` | For a vehicle delivery: computes the precision at taskData.dropOffPsPath and adds the bonus to taskData.adjustedRewards, with the detail in taskData.breakdown.precisionParking. Returns taskData unchanged if data is missing. | 380 |
| `career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot)` | Computes a vehicle's parking score relative to a spot (position, rotation, optional width and length), following the logic of parkingPointsNode.lua. | 64 |
| `career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot)` | Debug function: returns a vehicle's precision score for a spot (the log is commented out in the code). | 426 |
| `career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData)` | Converts a precision result into a bonus: fixed amounts and percentages for money (positive or negative), logistics XP, skill XP (good/great/perfect) and reputation (great/perfect bonus, horrible penalty). With no data, returns a zero bonus of level 'none'. | 171 |
| `career_modules_delivery_precisionParking.getPrecisionParkingConfig()` | Returns the configuration table (score thresholds and reward amounts/percentages) for the UI or debugging. | 415 |
| `career_modules_delivery_precisionParking.onCareerActivated()` | Hook called on career activation: stores the references to parcelManager, general, generator and vehicleTasks. *(internal)* *(hook)* | 9 |

### Parameter details

#### `career_modules_delivery_precisionParking.calculateCargoPrecisionParking(cargo, targetLocation)`

For a parcel or materials: evaluates the player vehicle at the spot targetLocation.psPath and applies the bonus to cargo.rewards (money, logistics-materials or logistics-delivery, organization reputation); stores the detail in cargo.precisionParking.

- `cargo` (*table*) : Parcel to deliver (rewards, organization, materialType).
- `targetLocation` (*table*) : Destination containing psPath, the parking spot path.
- **returns**: table The parcel, modified if the score could be computed.

#### `career_modules_delivery_precisionParking.calculateVehiclePrecisionParking(taskData)`

For a vehicle delivery: computes the precision at taskData.dropOffPsPath and adds the bonus to taskData.adjustedRewards, with the detail in taskData.breakdown.precisionParking. Returns taskData unchanged if data is missing.

- `taskData` (*table*) : Delivery task with dropOffPsPath, vehId, originalRewards, adjustedRewards, breakdown and offer.organization.
- **returns**: table Modified taskData.

#### `career_modules_delivery_precisionParking.calculateVehiclePrecisionScore(vehId, targetParkingSpot)`

Computes a vehicle's parking score relative to a spot (position, rotation, optional width and length), following the logic of parkingPointsNode.lua.

- `vehId` (*integer*) : Vehicle identifier.
- `targetParkingSpot` (*table*) : Parking spot with pos (vec3), rot (quat) and optionally width, length.
- **returns**: table|nil Table with precisionLevel, totalScore, angle, adjustedAngle, sideDist, forwardDist, sub-scores and tolerances; nil if the vehicle cannot be found.

#### `career_modules_delivery_precisionParking.debugPrecisionParking(vehId, targetParkingSpot)`

Debug function: returns a vehicle's precision score for a spot (the log is commented out in the code).

- `vehId` (*integer*) : Vehicle identifier.
- `targetParkingSpot` (*table*) : Parking spot (pos, rot, width, length).
- **returns**: table|nil Precision data.

#### `career_modules_delivery_precisionParking.getPrecisionParkingBonus(precisionData)`

Converts a precision result into a bonus: fixed amounts and percentages for money (positive or negative), logistics XP, skill XP (good/great/perfect) and reputation (great/perfect bonus, horrible penalty). With no data, returns a zero bonus of level 'none'.

- `precisionData` (*table|nil*) : Result of calculateVehiclePrecisionScore.
- **returns**: table Table with precisionLevel, totalScore, measurements and fields moneyFlat/Percent, logisticsFlat/Percent, skillFlat/Percent, reputationFlat/Percent.

#### `career_modules_delivery_precisionParking.getPrecisionParkingConfig()`

Returns the configuration table (score thresholds and reward amounts/percentages) for the UI or debugging.

- **returns**: table Table PRECISION_PARKING_CONFIG (reference, not copied).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: util_stepHandler. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/precisionParking.lua`.*
