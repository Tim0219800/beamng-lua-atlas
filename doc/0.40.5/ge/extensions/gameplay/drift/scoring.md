# `gameplay_drift_scoring`

*File: `lua/ge/extensions/gameplay/drift/scoring.lua` · VM: Game Engine (GE) · 823 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_scoring`: `extensions.load("gameplay_drift_scoring")`, then the global `gameplay_drift_scoring`

Computes the drift score of each tracked vehicle (one score state per vehId). During a drift, adds continuous points to a cached score (distance traveled x angle, speed and wall proximity multipliers, plus a tier bonus), raises a combo (creep-up) through one-sided drifting, drift transitions, cascade zones and close wall passes, and determines the current tier and the performance factor (1 to 4, smoothed). At the end of a drift or chain, the cached score multiplied by the combo is added to the permanent score (wrapUp) then onDriftCompletedScored is emitted.

## Example

```lua
local s = gameplay_drift_scoring.getScore()
print(s.score, s.cachedScore, s.combo, s.potentialScore)
-- validate the current score (e.g. end of event):
gameplay_drift_scoring.wrapUp()
```

## Notes

- Model: potential score = floor(cachedScore * combo). Continuous points are angleMulti * speedMulti * wallMulti * distanceTraveled * continuousDriftPoints (0.6), plus the tier's continuousScore * dtSim; they are multiplied by the stallingSystem factor if it is loaded (Gymkhana mode).
- Multipliers: angle from 1 (minAngle) to 10 (maxAngle); speed from 1 to 4 (22 to 200 airSpeed); wall 1 + up to 3 for each front/rear distance.
- Combo: starts at 1, +0.1 per 100 of creep-up; slow creep-up ("low" value) beyond the soft cap of 10; hard cap 25. Sources: one-sided drift (angle >= 25°, 10 per 0.1 s, 100 increments max), stunt zone (140), drift transition (100 to 500 depending on speed 30/60/90/120/150, halved beyond the soft cap, minimum speed 25 and 2 s cooldown).
- Tiers (minScore of the cached score -> id, continuous bonus/s): 0 drift 10, 250 greatDrift 20, 750 awesomeDrift 30, 2000 superiorDrift 40, 5000 epicDrift 50, 9000 apexDrift 60, 15000 legendaryDrift 75. Names translated via missions.drift.tiers.<id>.
- Performance factor: ratio of the frame's continuous score (without tier) to the score of a reference drift (angle 80°, speed 70, rear wall 1.8 m); its "stepped" version (1 to 4) has 0.3 s of hysteresis on tier 4, then is smoothed.
- Base points of stunt zones: driftThrough 300, donut 100, hitPole 300, nearPole 300 (basePoints); default points driftThrough 1500, donut 500, hitPole 1000, nearPole 1000.
- Score additions are ignored if general drift is frozen, or if the vehicle is individually frozen (setVehicleFrozen). Score updates are skipped when paused or if dtSim <= 0.
- Functions without vehId use player 0's vehicle and otherwise any score state; only getScore(vehId) never falls back to another vehicle (it returns an empty score).
- Emitted events: onDriftNewCombo({newCombo, comboChange}, vehId), onNewDriftTierReached(tier, vehId), onDriftScoreChanged(driftScore, vehId), onDriftCachedScoreReset(vehId), onDriftScoreWrappedUp(score, vehId), onDriftCompletedScored({addedScore, combo, careerRewards, tier, vehId}), onTightDriftScored / onHitPoleScored / onNearPoleScored / onDonutDriftScored(score, vehId).
- getCareerRewardsForDriftScore computes beamXP but always returns an empty table: careerRewards is {} (or nil if score < 300). careerRewards.minScore and scoreMulForXp are therefore unused in practice.
- calculatePerformanceFactor can exit without smoothing (return) during the tier 4 hysteresis.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId)` | Adds points to the cached score (before combo). Ignored if drift is frozen or if the vehicle is frozen. With useStallingSystem, applies the gameplay_drift_stallingSystem factor and rounds down to the integer. | 280 |
| `gameplay_drift_scoring.getCurrentDriftTier(vehId)` | Returns the table of the vehicle's current drift tier (the first one if there is no state). | 740 |
| `gameplay_drift_scoring.getDriftDebugInfo()` | Returns {default=true, canBeChanged=true} for the drift debug window. | 724 |
| `gameplay_drift_scoring.getDriftPerformanceFactor(vehId)` | Returns the continuous performance factor of the last frame (1 = very good reference drift). | 709 |
| `gameplay_drift_scoring.getDriftTiers()` | Returns the list of drift tiers (names translated at the first onUpdate). | 728 |
| `gameplay_drift_scoring.getGC()` | Returns the amount of garbage measured by the profiler. | 732 |
| `gameplay_drift_scoring.getPotentialScore(vehId)` | Returns the potential score (floor(cachedScore * combo)). | 704 |
| `gameplay_drift_scoring.getScore(vehId)` | Returns the score table of the requested vehicle, or player 0's if vehId is nil. If the vehicle has no state, returns an empty score. | 693 |
| `gameplay_drift_scoring.getScoreAddedThisFrame(vehId)` | Returns the continuous points added during the last frame (tier bonus included). | 719 |
| `gameplay_drift_scoring.getScoreOptions()` | Returns the score settings table (zone points, multipliers, combo options, career rewards). Modifiable at runtime. | 736 |
| `gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId)` | Returns the stepped performance factor (1 to 4), smoothed over time. | 714 |
| `gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType)` | Returns the base points of a stunt zone type. | 745 |
| `gameplay_drift_scoring.isVehicleFrozen(vehId)` | Returns whether this vehicle's scoring is individually frozen. | 753 |
| `gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId)` | Hook: stunt zone accomplished; raises the combo (creep-up 140, or 20 beyond the soft cap). *(internal)* *(hook)* | 568 |
| `gameplay_drift_scoring.onClientEndMission()` | Hook: clears all score states and freezes. *(internal)* *(hook)* | 239 |
| `gameplay_drift_scoring.onDeserialized(data)` | Hook: restores the debug checkboxes. *(internal)* *(hook)* | 778 |
| `gameplay_drift_scoring.onDonutDriftAccomplished(data)` | Hook: donut completed; adds the zone's points to the cache, then hook onDonutDriftScored. *(internal)* *(hook)* | 596 |
| `gameplay_drift_scoring.onDriftChainStarted(vehId)` | Hook: start of a drift chain; emits onNewDriftTierReached with the first tier. *(internal)* *(hook)* | 761 |
| `gameplay_drift_scoring.onDriftCompleted(data)` | Hook: end of a drift chain; validates the score (wrapUp) then emits onDriftCompletedScored with the added score, the combo, the tier and the vehicle. *(internal)* *(hook)* | 631 |
| `gameplay_drift_scoring.onDriftCrash(vehId)` | Hook: crash; loses the cached score and the combo (cache reset, hook onDriftCachedScoreReset). *(internal)* *(hook)* | 685 |
| `gameplay_drift_scoring.onDriftFreeroamCruisingStarted()` | Hook: start of cruising in free roam; resets the permanent score of all vehicles to zero. *(internal)* *(hook)* | 765 |
| `gameplay_drift_scoring.onDriftPlVehReset(vehId)` | Hook: vehicle put back in place; resets this vehicle's score state. *(internal)* *(hook)* | 757 |
| `gameplay_drift_scoring.onDriftSpinout(vehId)` | Hook: spinout; loses the cached score and the combo. *(internal)* *(hook)* | 689 |
| `gameplay_drift_scoring.onDriftThroughAccomplished(data)` | Hook: drift through a zone; score = linearScale(angle, 0..90, 0..zone points) added to the cache with stalling, then hook onTightDriftScored. *(internal)* *(hook)* | 575 |
| `gameplay_drift_scoring.onDriftTransition(vehId)` | Hook: drift transition (side change); raises the combo according to speed if it exceeds 25 and 2 s have elapsed since the last drift start. *(internal)* *(hook)* | 667 |
| `gameplay_drift_scoring.onHitPoleAccomplished(data)` | Hook: pole hit; score = linearScale(angle + speed, 0..250, 0..points) added to the cache, then hook onHitPoleScored. *(internal)* *(hook)* | 582 |
| `gameplay_drift_scoring.onNearPoleAccomplished(data)` | Hook: pole nearly hit; score = angle * closeness / 90 * points added to the cache, then hook onNearPoleScored. *(internal)* *(hook)* | 589 |
| `gameplay_drift_scoring.onSerialize()` | Hook: saves the debug checkboxes before a Lua reload. *(internal)* *(hook)* | 771 |
| `gameplay_drift_scoring.onUpdate(dtReal, _dtSim)` | Called every frame: creates the score states of tracked vehicles, updates tier, performance factor, creep-up and continuous score for each. On the first call, translates the tiers and computes the reference score. *(internal)* *(hook)* | 533 |
| `gameplay_drift_scoring.onVehicleDestroyed(vehId)` | Hook: removes the score state and freeze of the destroyed vehicle. *(internal)* *(hook)* | 234 |
| `gameplay_drift_scoring.reset(vehId)` | Resets a vehicle's score state (or all vehicles' if vehId is nil) and clears the debug history. Called by gameplay_drift_general.reset. | 222 |
| `gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen)` | Freezes or unfreezes scoring for an individual vehicle (its score additions are then ignored). | 749 |
| `gameplay_drift_scoring.wrapUp(vehId)` | Validates the cached score: adds floor(cachedScore * combo) to the permanent score, then resets the cache and the combo to zero (hook onDriftCachedScoreReset). Does nothing if the result is < 1. | 602 |
| `gameplay_drift_scoring.wrapUpWithText(vehId)` | Like wrapUp, but also emits onDriftScoreWrappedUp(addedScore, vehId) so that the UI displays the validated score. | 614 |

### Parameter details

#### `gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId)`

Adds points to the cached score (before combo). Ignored if drift is frozen or if the vehicle is frozen. With useStallingSystem, applies the gameplay_drift_stallingSystem factor and rounds down to the integer.

- `valueToAdd` (*number*) : Points to add.
- `useStallingSystem` (*boolean|nil*) : true to apply the stalling factor (default false).
- `vehId` (*integer|nil*) : Vehicle id (player 0 by default).
- **returns**: number Points actually added (0 if ignored).

#### `gameplay_drift_scoring.getCurrentDriftTier(vehId)`

Returns the table of the vehicle's current drift tier (the first one if there is no state).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: table {minScore, continuousScore, id, order, name}

#### `gameplay_drift_scoring.getDriftDebugInfo()`

Returns {default=true, canBeChanged=true} for the drift debug window.

- **returns**: table {default = true, canBeChanged = true}

#### `gameplay_drift_scoring.getDriftPerformanceFactor(vehId)`

Returns the continuous performance factor of the last frame (1 = very good reference drift).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Factor, 0 outside a drift.

#### `gameplay_drift_scoring.getDriftTiers()`

Returns the list of drift tiers (names translated at the first onUpdate).

- **returns**: table[] List of {minScore, continuousScore, id, order, name}.

#### `gameplay_drift_scoring.getGC()`

Returns the amount of garbage measured by the profiler.

- **returns**: number|nil nil as long as general debug has never been active.

#### `gameplay_drift_scoring.getPotentialScore(vehId)`

Returns the potential score (floor(cachedScore * combo)).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Potential score, 0 if no state.

#### `gameplay_drift_scoring.getScore(vehId)`

Returns the score table of the requested vehicle, or player 0's if vehId is nil. If the vehicle has no state, returns an empty score.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: table {score, combo, cachedScore, potentialScore, comboCreepup}. Warning: this is the live table, not a copy.

#### `gameplay_drift_scoring.getScoreAddedThisFrame(vehId)`

Returns the continuous points added during the last frame (tier bonus included).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Frame points.

#### `gameplay_drift_scoring.getScoreOptions()`

Returns the score settings table (zone points, multipliers, combo options, career rewards). Modifiable at runtime.

- **returns**: table scoreOptions (live table).

#### `gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId)`

Returns the stepped performance factor (1 to 4), smoothed over time.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Smoothed factor, 0 outside a drift.

#### `gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType)`

Returns the base points of a stunt zone type.

- `stuntZoneType` (*string*) : "driftThrough", "donut", "hitPole" or "nearPole".
- **returns**: number basePoints of this type.

#### `gameplay_drift_scoring.isVehicleFrozen(vehId)`

Returns whether this vehicle's scoring is individually frozen.

- `vehId` (*integer*) : Vehicle id.
- **returns**: boolean true if frozen.

#### `gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId)`

Hook: stunt zone accomplished; raises the combo (creep-up 140, or 20 beyond the soft cap).

- `vehId` (*integer*) : Vehicle.

#### `gameplay_drift_scoring.onDeserialized(data)`

Hook: restores the debug checkboxes.

- `data` (*table*) : onSerialize table.

#### `gameplay_drift_scoring.onDonutDriftAccomplished(data)`

Hook: donut completed; adds the zone's points to the cache, then hook onDonutDriftScored.

- `data` (*table*) : {vehId, zoneData = {points}}.

#### `gameplay_drift_scoring.onDriftChainStarted(vehId)`

Hook: start of a drift chain; emits onNewDriftTierReached with the first tier.

- `vehId` (*integer*) : Vehicle.

#### `gameplay_drift_scoring.onDriftCompleted(data)`

Hook: end of a drift chain; validates the score (wrapUp) then emits onDriftCompletedScored with the added score, the combo, the tier and the vehicle.

- `data` (*table|nil*) : Contains vehId.

#### `gameplay_drift_scoring.onDriftCrash(vehId)`

Hook: crash; loses the cached score and the combo (cache reset, hook onDriftCachedScoreReset).

- `vehId` (*integer*) : Vehicle.

#### `gameplay_drift_scoring.onDriftPlVehReset(vehId)`

Hook: vehicle put back in place; resets this vehicle's score state.

- `vehId` (*integer*) : Vehicle.

#### `gameplay_drift_scoring.onDriftSpinout(vehId)`

Hook: spinout; loses the cached score and the combo.

- `vehId` (*integer*) : Vehicle.

#### `gameplay_drift_scoring.onDriftThroughAccomplished(data)`

Hook: drift through a zone; score = linearScale(angle, 0..90, 0..zone points) added to the cache with stalling, then hook onTightDriftScored.

- `data` (*table*) : {vehId, currDegAngle, zoneData = {points}}.

#### `gameplay_drift_scoring.onDriftTransition(vehId)`

Hook: drift transition (side change); raises the combo according to speed if it exceeds 25 and 2 s have elapsed since the last drift start.

- `vehId` (*integer*) : Vehicle.

#### `gameplay_drift_scoring.onHitPoleAccomplished(data)`

Hook: pole hit; score = linearScale(angle + speed, 0..250, 0..points) added to the cache, then hook onHitPoleScored.

- `data` (*table*) : {vehId, currDegAngle, currAirSpeed, zoneData = {points}}.

#### `gameplay_drift_scoring.onNearPoleAccomplished(data)`

Hook: pole nearly hit; score = angle * closeness / 90 * points added to the cache, then hook onNearPoleScored.

- `data` (*table*) : {vehId, currDegAngle, closeness, zoneData = {points}}.

#### `gameplay_drift_scoring.onSerialize()`

Hook: saves the debug checkboxes before a Lua reload.

- **returns**: table {scoreExperiment, debugToggleSmothnessGraph}

#### `gameplay_drift_scoring.onUpdate(dtReal, _dtSim)`

Called every frame: creates the score states of tracked vehicles, updates tier, performance factor, creep-up and continuous score for each. On the first call, translates the tiers and computes the reference score.

- `dtReal` (*number*) : Real delta time (debug).
- `_dtSim` (*number*) : Simulated delta time, used for calculations.

#### `gameplay_drift_scoring.onVehicleDestroyed(vehId)`

Hook: removes the score state and freeze of the destroyed vehicle.

- `vehId` (*integer*) : Destroyed vehicle.

#### `gameplay_drift_scoring.reset(vehId)`

Resets a vehicle's score state (or all vehicles' if vehId is nil) and clears the debug history. Called by gameplay_drift_general.reset.

- `vehId` (*integer|nil*) : Vehicle to reset; nil for all.

#### `gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen)`

Freezes or unfreezes scoring for an individual vehicle (its score additions are then ignored).

- `vehId` (*integer*) : Vehicle id.
- `isFrozen` (*boolean*) : true to freeze.

#### `gameplay_drift_scoring.wrapUp(vehId)`

Validates the cached score: adds floor(cachedScore * combo) to the permanent score, then resets the cache and the combo to zero (hook onDriftCachedScoreReset). Does nothing if the result is < 1.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number|boolean Points added, or false if there is nothing to validate.

#### `gameplay_drift_scoring.wrapUpWithText(vehId)`

Like wrapUp, but also emits onDriftScoreWrappedUp(addedScore, vehId) so that the UI displays the validated score.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number|boolean Points added, or false.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDonutDriftScored` — listened to by 1 module(s)
- `onDriftCachedScoreReset` — listened to by 1 module(s)
- `onDriftCompletedScored` — listened to by 5 module(s)
- `onDriftNewCombo` — listened to by 1 module(s)
- `onDriftScoreChanged` — listened to by 1 module(s)
- `onDriftScoreWrappedUp` — listened to by 1 module(s)
- `onHitPoleScored` — listened to by 1 module(s)
- `onNearPoleScored` — listened to by 1 module(s)
- `onNewDriftTierReached` — listened to by 2 module(s)
- `onTightDriftScored` — listened to by 1 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/scoring.lua`.*
