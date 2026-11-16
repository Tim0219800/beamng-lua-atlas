# `gameplay_crashTest_crashTestScoring`

*File: `lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua` · VM: Game Engine (GE) · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crashTest_crashTestScoring`: `extensions.load("gameplay_crashTest_crashTestScoring")`, then the global `gameplay_crashTest_crashTestScoring`

Score computation for the crash test scenario. For each successful step, computes sub-scores (time before impact, impact speed, damage, impact zone, target redirection into the zone) and stores them per step. The scales are in scoreParameters (1000 points max per criterion, minimum time 500, speed tolerance 3 km/h). Uses gameplay_util_damageAssessment for damage severity.

## Notes

- Time score: max if time <= target; decreases linearly down to 500 at +30% of the target; 500 beyond.
- Speed score: speeds (km/h) are converted to m/s then by translateVelocity (player's unit), the difference is scaled from 1000 to 0 over 3 km/h.
- Damage severity: Minor = 1, Moderate = 2, A lot = 3. Conditions: 'At least' or 'No more than'; difference of 0 -> 1000, 1 level -> 500, 2 levels -> 200, otherwise 0.
- Probable bug: calculateIndividualDamageScore returns nil if damageCondition is neither 'At least' nor 'No more than' (the addition in calculateDamageScore would crash).
- calculateDamageScore divides by #vehIds: division by zero (nan) if damageTargets does not match any known value.
- getTotalScoreData adds the 'totalScore' key directly into the scoringDataPerStep array, which then mixes indices and a key; a second call ignores the key (ipairs) but the returned table is shared.
- calculateStepScore inserts the data into the list but returns nothing, despite its comment ("only called if the step is successful").
- The functions calculateTimeScore, calculateSpeedScore and calculateDamageScore are local (not exported).

**Dependencies (loaded first):** `gameplay_util_damageAssessment`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData)` | Impact zone accuracy score: share of the total damage located in the targeted zone, scaled to 1000. Also returns the zone actually most hit and the accuracy as a percentage. | 55 |
| `gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId)` | Compares a vehicle's damage severity (getDamageAssessment(vehId).damageSeverity) to the target and returns 1000, 500, 200 or 0 depending on the level difference. | 64 |
| `gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData)` | Computes all the sub-scores of a successful step and adds the result to the per-step score list. Except for the objective 'Crash target vehicle into target area', computes time scores (if timeToImpact exists) and speed scores; depending on the case adds the damage, impact zone or target zone scores (1000). | 117 |
| `gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex)` | Returns a step's score data. | 148 |
| `gameplay_crashTest_crashTestScoring.getTotalScoreData()` | Adds up all the scores of all the steps and stores the total in the 'totalScore' key of the returned table. | 137 |
| `gameplay_crashTest_crashTestScoring.reset()` | Clears all recorded scores. | 152 |

### Parameter details

#### `gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData)`

Impact zone accuracy score: share of the total damage located in the targeted zone, scaled to 1000. Also returns the zone actually most hit and the accuracy as a percentage.

- `damageLocationGoal` (*string*) : Required impact zone (key of damagedLocations).
- `damageLocationData` (*table*) : Impact data: totalDamage, damageStateDiff (damagedLocations, mostDamagedLocation), mostDamagedLocation.
- **returns**: table {score, scoreName, maxScore, requiredImpactLocation, actualImpactLocation}.

#### `gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId)`

Compares a vehicle's damage severity (getDamageAssessment(vehId).damageSeverity) to the target and returns 1000, 500, 200 or 0 depending on the level difference.

- `damageGoal` (*string*) : 'Minor', 'Moderate' or 'A lot'.
- `damageCondition` (*string*) : 'At least' or 'No more than'.
- `vehId` (*integer*) : Identifier of the evaluated vehicle.
- **returns**: integer|nil Score; nil if the condition is unknown.

#### `gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData)`

Computes all the sub-scores of a successful step and adds the result to the per-step score list. Except for the objective 'Crash target vehicle into target area', computes time scores (if timeToImpact exists) and speed scores; depending on the case adds the damage, impact zone or target zone scores (1000).

- `stepData` (*table*) : Step definition (objective, timeToImpact, impactSpeed, plVehId, jbeamTargets, damageAmount, impactLocation...).
- `stepCrashData` (*table<integer, table>*) : Crash data by vehicle id (stepElapsedTime, crashStartData, crashEndData).

#### `gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex)`

Returns a step's score data.

- `stepIndex` (*integer*) : Step index (starting at 1).
- **returns**: table|nil Step sub-scores.

#### `gameplay_crashTest_crashTestScoring.getTotalScoreData()`

Adds up all the scores of all the steps and stores the total in the 'totalScore' key of the returned table.

- **returns**: table List of per-step scores, with the totalScore key.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: {"gameplay_util_damageAssessment"}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua`.*
