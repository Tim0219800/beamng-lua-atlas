---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/scoring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes the drift score of each tracked vehicle (one score state per vehId). During a drift, adds continuous points to a cached score (distance traveled x angle, speed and wall proximity multipliers, plus a tier bonus), raises a combo (creep-up) through one-sided drifting, drift transitions, cascade zones and close wall passes, and determines the current tier and the performance factor (1 to 4, smoothed). At the end of a drift or chain, the cached score multiplied by the combo is added to the permanent score (wrapUp) then onDriftCompletedScored is emitted.
--- Access: extension `gameplay_drift_scoring`: `extensions.load("gameplay_drift_scoring")`, then the global `gameplay_drift_scoring`
---@class gameplay_drift_scoring
gameplay_drift_scoring = {}

--- Adds points to the cached score (before combo). Ignored if drift is frozen or if the vehicle is frozen. With useStallingSystem, applies the gameplay_drift_stallingSystem factor and rounds down to the integer.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:280
---@param valueToAdd number Points to add.
---@param useStallingSystem boolean|nil true to apply the stalling factor (default false).
---@param vehId integer|nil Vehicle id (player 0 by default).
---@return number  Points actually added (0 if ignored).
function gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId) end

--- Returns the table of the vehicle's current drift tier (the first one if there is no state).
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:740
---@param vehId integer|nil Vehicle id.
---@return table  {minScore, continuousScore, id, order, name}
function gameplay_drift_scoring.getCurrentDriftTier(vehId) end

--- Returns {default=true, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:724
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_scoring.getDriftDebugInfo() end

--- Returns the continuous performance factor of the last frame (1 = very good reference drift).
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:709
---@param vehId integer|nil Vehicle id.
---@return number  Factor, 0 outside a drift.
function gameplay_drift_scoring.getDriftPerformanceFactor(vehId) end

--- Returns the list of drift tiers (names translated at the first onUpdate).
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:728
---@return table[]  List of {minScore, continuousScore, id, order, name}.
function gameplay_drift_scoring.getDriftTiers() end

--- Returns the amount of garbage measured by the profiler.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:732
---@return number|nil  nil as long as general debug has never been active.
function gameplay_drift_scoring.getGC() end

--- Returns the potential score (floor(cachedScore * combo)).
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:704
---@param vehId integer|nil Vehicle id.
---@return number  Potential score, 0 if no state.
function gameplay_drift_scoring.getPotentialScore(vehId) end

--- Returns the score table of the requested vehicle, or player 0's if vehId is nil. If the vehicle has no state, returns an empty score.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:693
---@param vehId integer|nil Vehicle id.
---@return table  {score, combo, cachedScore, potentialScore, comboCreepup}. Warning: this is the live table, not a copy.
function gameplay_drift_scoring.getScore(vehId) end

--- Returns the continuous points added during the last frame (tier bonus included).
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:719
---@param vehId integer|nil Vehicle id.
---@return number  Frame points.
function gameplay_drift_scoring.getScoreAddedThisFrame(vehId) end

--- Returns the score settings table (zone points, multipliers, combo options, career rewards). Modifiable at runtime.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:736
---@return table  scoreOptions (live table).
function gameplay_drift_scoring.getScoreOptions() end

--- Returns the stepped performance factor (1 to 4), smoothed over time.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:714
---@param vehId integer|nil Vehicle id.
---@return number  Smoothed factor, 0 outside a drift.
function gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId) end

--- Returns the base points of a stunt zone type.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:745
---@param stuntZoneType string "driftThrough", "donut", "hitPole" or "nearPole".
---@return number  basePoints of this type.
function gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType) end

--- Returns whether this vehicle's scoring is individually frozen.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:753
---@param vehId integer Vehicle id.
---@return boolean  true if frozen.
function gameplay_drift_scoring.isVehicleFrozen(vehId) end

--- Hook: stunt zone accomplished; raises the combo (creep-up 140, or 20 beyond the soft cap).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:568
---@param vehId integer Vehicle.
function gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId) end

--- Hook: clears all score states and freezes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:239
function gameplay_drift_scoring.onClientEndMission() end

--- Hook: restores the debug checkboxes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:778
---@param data table onSerialize table.
function gameplay_drift_scoring.onDeserialized(data) end

--- Hook: donut completed; adds the zone's points to the cache, then hook onDonutDriftScored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:596
---@param data table {vehId, zoneData = {points}}.
function gameplay_drift_scoring.onDonutDriftAccomplished(data) end

--- Hook: start of a drift chain; emits onNewDriftTierReached with the first tier.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:761
---@param vehId integer Vehicle.
function gameplay_drift_scoring.onDriftChainStarted(vehId) end

--- Hook: end of a drift chain; validates the score (wrapUp) then emits onDriftCompletedScored with the added score, the combo, the tier and the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:631
---@param data table|nil Contains vehId.
function gameplay_drift_scoring.onDriftCompleted(data) end

--- Hook: crash; loses the cached score and the combo (cache reset, hook onDriftCachedScoreReset).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:685
---@param vehId integer Vehicle.
function gameplay_drift_scoring.onDriftCrash(vehId) end

--- Hook: start of cruising in free roam; resets the permanent score of all vehicles to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:765
function gameplay_drift_scoring.onDriftFreeroamCruisingStarted() end

--- Hook: vehicle put back in place; resets this vehicle's score state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:757
---@param vehId integer Vehicle.
function gameplay_drift_scoring.onDriftPlVehReset(vehId) end

--- Hook: spinout; loses the cached score and the combo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:689
---@param vehId integer Vehicle.
function gameplay_drift_scoring.onDriftSpinout(vehId) end

--- Hook: drift through a zone; score = linearScale(angle, 0..90, 0..zone points) added to the cache with stalling, then hook onTightDriftScored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:575
---@param data table {vehId, currDegAngle, zoneData = {points}}.
function gameplay_drift_scoring.onDriftThroughAccomplished(data) end

--- Hook: drift transition (side change); raises the combo according to speed if it exceeds 25 and 2 s have elapsed since the last drift start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:667
---@param vehId integer Vehicle.
function gameplay_drift_scoring.onDriftTransition(vehId) end

--- Hook: pole hit; score = linearScale(angle + speed, 0..250, 0..points) added to the cache, then hook onHitPoleScored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:582
---@param data table {vehId, currDegAngle, currAirSpeed, zoneData = {points}}.
function gameplay_drift_scoring.onHitPoleAccomplished(data) end

--- Hook: pole nearly hit; score = angle * closeness / 90 * points added to the cache, then hook onNearPoleScored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:589
---@param data table {vehId, currDegAngle, closeness, zoneData = {points}}.
function gameplay_drift_scoring.onNearPoleAccomplished(data) end

--- Hook: saves the debug checkboxes before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:771
---@return table  {scoreExperiment, debugToggleSmothnessGraph}
function gameplay_drift_scoring.onSerialize() end

--- Called every frame: creates the score states of tracked vehicles, updates tier, performance factor, creep-up and continuous score for each. On the first call, translates the tiers and computes the reference score.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:533
---@param dtReal number Real delta time (debug).
---@param _dtSim number Simulated delta time, used for calculations.
function gameplay_drift_scoring.onUpdate(dtReal, _dtSim) end

--- Hook: removes the score state and freeze of the destroyed vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:234
---@param vehId integer Destroyed vehicle.
function gameplay_drift_scoring.onVehicleDestroyed(vehId) end

--- Resets a vehicle's score state (or all vehicles' if vehId is nil) and clears the debug history. Called by gameplay_drift_general.reset.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:222
---@param vehId integer|nil Vehicle to reset; nil for all.
function gameplay_drift_scoring.reset(vehId) end

--- Freezes or unfreezes scoring for an individual vehicle (its score additions are then ignored).
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:749
---@param vehId integer Vehicle id.
---@param isFrozen boolean true to freeze.
function gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen) end

--- Validates the cached score: adds floor(cachedScore * combo) to the permanent score, then resets the cache and the combo to zero (hook onDriftCachedScoreReset). Does nothing if the result is < 1.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:602
---@param vehId integer|nil Vehicle id.
---@return number|boolean  Points added, or false if there is nothing to validate.
function gameplay_drift_scoring.wrapUp(vehId) end

--- Like wrapUp, but also emits onDriftScoreWrappedUp(addedScore, vehId) so that the UI displays the validated score.
---Source: lua/ge/extensions/gameplay/drift/scoring.lua:614
---@param vehId integer|nil Vehicle id.
---@return number|boolean  Points added, or false.
function gameplay_drift_scoring.wrapUpWithText(vehId) end

