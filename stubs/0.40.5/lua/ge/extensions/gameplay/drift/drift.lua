---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/drift.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drift detection engine. For each tracked vehicle (one state per vehId, player 0's vehicle is tracked automatically), computes every frame the drift angle, oversteer, speed, distance to walls (front/rear raycasts), crashes and spinouts, and decides whether the vehicle is drifting. Manages the driftActiveData (drift in progress) and driftChainActiveData (drift chain) structures and emits the hooks onDriftChainStarted, onDriftStatusChanged, onDriftTransition, onDriftActiveDataFinished, onDriftCompleted, onDriftCrash and onDriftSpinout that scoring, display, quickMessages, statistics, etc. consume. This is the module to read to know whether the player is drifting and at what angle.
--- Access: extension `gameplay_drift_drift`: `extensions.load("gameplay_drift_drift")`, then the global `gameplay_drift_drift`
---@class gameplay_drift_drift
---@field dependencies string[] gameplay_walk, loaded beforehand.
gameplay_drift_drift = {}

--- Adds a vehicle to the drift tracking (creates its state) and returns that state. With opts.playerId, associates the vehicle with a player and removes any other vehicle tracked for that same player.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:873
---@param vehId integer Vehicle id (ignored if nil or < 0).
---@param opts table|nil {playerId = integer}.
---@return table|nil  Drift state of the vehicle.
function gameplay_drift_drift.addTrackedVehicle(vehId, opts) end

--- Indicates whether the tracked vehicle has valid map data.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1000
---@param vehId integer|nil Vehicle id.
---@return boolean|nil  true if vehData exists.
function gameplay_drift_drift.doesPlHaveVeh(vehId) end

--- Returns the vehicle speed in km/h (velocity norm * 3.6).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:920
---@param vehId integer|nil Vehicle id.
---@return number|nil  Speed in km/h.
function gameplay_drift_drift.getAirSpeed(vehId) end

--- Returns the change in angle of the velocity direction since the previous frame (degrees), computed during a drift.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:962
---@param vehId integer|nil Vehicle id.
---@return number|nil  Change in degrees.
function gameplay_drift_drift.getAngleDiff(vehId) end

--- Returns the current drift angle in degrees, signed (the sign gives the side).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:950
---@param vehId integer|nil Vehicle id.
---@return number  Angle in degrees.
function gameplay_drift_drift.getCurrDegAngleSigned(vehId) end

--- Returns the remaining fraction (0..1) of the drift chain's confirmation time (1 = the drift just happened, 0 = confirmed).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:956
---@param vehId integer|nil Vehicle id.
---@return number  Fraction of the remaining time.
function gameplay_drift_drift.getCurrDriftCompletedTime(vehId) end

--- Returns the duration of the current drift (totalDriftTime), 0 if not drifting.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:972
---@param vehId integer|nil Vehicle id.
---@return number  Duration in seconds.
function gameplay_drift_drift.getCurrentDriftDuration(vehId) end

--- Returns the distance traveled since the previous frame, in meters.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:967
---@param vehId integer|nil Vehicle id.
---@return number  Distance in m.
function gameplay_drift_drift.getDistSinceLastFrame(vehId) end

--- Returns the data of the current drift (nil if there is none).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:900
---@param vehId integer|nil Vehicle id.
---@return table|nil  driftActiveData.
function gameplay_drift_drift.getDriftActiveData(vehId) end

--- Returns the data of the current drift chain (nil if none).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:905
---@param vehId integer|nil Vehicle id.
---@return table|nil  driftChainActiveData.
function gameplay_drift_drift.getDriftChainActiveData(vehId) end

--- Returns the number of drifts chained in the current chain.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:910
---@param vehId integer|nil Vehicle id.
---@return integer  Number of drifts, 0 if no chain.
function gameplay_drift_drift.getDriftChainChainedDrifts(vehId) end

--- Returns {default=true, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1017
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_drift.getDriftDebugInfo() end

--- Returns the table of detection settings: minAngle 7, maxAngle 165, allowDonut, allowTightDrifts, raycastHeight 0.5, wallDetectionLength 3, baseDriftCompleteTime 1.2, failPointsCooldown 1.65, minAirSpeed 4, maxWasDriftingTime 4, crashDamageThreshold 150, etc. Live table, modifiable.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1005
---@return table  driftOptions.
function gameplay_drift_drift.getDriftOptions() end

--- Returns the amount of garbage measured by the profiler.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1013
---@return number|nil  nil as long as general debug has never been active.
function gameplay_drift_drift.getGC() end

--- Indicates whether the vehicle is crashing (gameplay_util_crashDetection).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:995
---@param vehId integer|nil Vehicle id.
---@return boolean  Crash state.
function gameplay_drift_drift.getIsCrashing(vehId) end

--- Indicates whether the vehicle is drifting.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:915
---@param vehId integer|nil Vehicle id.
---@return boolean  Drift state.
function gameplay_drift_drift.getIsDrifting(vehId) end

--- Indicates whether the vehicle is not on its wheels.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:990
---@param vehId integer|nil Vehicle id.
---@return boolean  true in the air.
function gameplay_drift_drift.getIsInTheAir(vehId) end

--- Indicates whether the average speed of the reference points exceeds minAirSpeed (4 km/h).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:985
---@param vehId integer|nil Vehicle id.
---@return boolean  true if fast enough.
function gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId) end

--- Indicates whether the vehicle is oversteering (front and center go the same way as the rear).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:980
---@param vehId integer|nil Vehicle id.
---@return boolean  Oversteer state.
function gameplay_drift_drift.getIsOverSteering(vehId) end

--- Returns the main tracked vehicle object.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:935
---@return userdata|nil  Scene vehicle object.
function gameplay_drift_drift.getPlVeh() end

--- Returns the player id associated with a tracked vehicle.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:859
---@param vehId integer Vehicle id.
---@return integer  playerId, 0 if unknown.
function gameplay_drift_drift.getPlayerIdForVehicle(vehId) end

--- Returns the table of drift states, keyed by vehId (live table).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:896
---@return table<integer, table>  Drift states.
function gameplay_drift_drift.getTrackedVehicles() end

--- Returns the 4 corners of the bounding box used for the raycasts (front right, rear right, rear left, front left), at raycastHeight.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1009
---@return vec3[]  {corner_FR, corner_BR, corner_BL, corner_FL}
function gameplay_drift_drift.getVehCorners() end

--- Returns the vehicle's map.objects data (pos, vel, dirVec, ...).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:940
---@param vehId integer|nil Vehicle id.
---@return table|nil  map.objects entry.
function gameplay_drift_drift.getVehData(vehId) end

--- Returns the id of the main tracked vehicle (player 0 if possible).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:930
---@return integer|nil  Vehicle id.
function gameplay_drift_drift.getVehId() end

--- Returns the vehicle position tracked by the module.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:925
---@param vehId integer|nil Vehicle id.
---@return vec3|nil  Position (shared vec3, do not modify).
function gameplay_drift_drift.getVehPos(vehId) end

--- Returns the normalized direction of the vehicle's velocity (velDir), not its magnitude.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:945
---@param vehId integer|nil Vehicle id.
---@return vec3|nil  Unit direction of the velocity.
function gameplay_drift_drift.getVehVel(vehId) end

--- Hook: a cascade zone is completed; resets the drift chain's confirmation time to the maximum.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1080
function gameplay_drift_drift.onAnyStuntZoneAccomplished() end

--- Hook: level end; empties the list of tracked vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1076
function gameplay_drift_drift.onClientEndMission() end

--- Hook: restores the debug checkbox.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1151
---@param data table onSerialize table.
function gameplay_drift_drift.onDeserialized(data) end

--- Hook: end of a drift challenge; emits onDriftCompleted for the chains in progress and onDriftActiveDataFinished for the drifts in progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1103
function gameplay_drift_drift.onDriftChallengeFinished() end

--- Hook: on a context change, adds the vehicles to the crash tracking (except in inAnotherMissionType, where they are removed from it).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1087
---@param context string New context.
---@param oldContext string|nil Old context.
function gameplay_drift_drift.onDriftContextChanged(context, oldContext) end

--- Hook: vehicle put back in place; resets its state and activates a 0.1 s reset timer during which it does not drift.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1130
---@param vehId integer|nil Vehicle; nil for all.
function gameplay_drift_drift.onDriftPlVehReset(vehId) end

--- Hook: saves the debug checkbox before Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1145
---@return table  {debugToggleSmothnessGraph}
function gameplay_drift_drift.onSerialize() end

--- Called every frame: automatically tracks player 0's vehicle if nothing is tracked, then updates the detection for each tracked vehicle. Skipped during firstDrive, walking, pause or dtSim <= 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:807
---@param dtReal number Real time delta (unused).
---@param _dtSim number Simulated time delta.
---@param dtRaw number Raw time delta (unused).
function gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw) end

--- Hook: crash start detected by gameplay_util_crashDetection; marks the vehicle as crashed if its cached score is > 0 (outside pause, freeze, walking).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1117
---@param crashStartData table Contains vehId.
function gameplay_drift_drift.onVehicleCrashStarted(crashStartData) end

--- Hook: removes the destroyed vehicle from the tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1072
---@param vehId integer Destroyed vehicle.
function gameplay_drift_drift.onVehicleDestroyed(vehId) end

--- Hook: a player's vehicle change; removes the old vehicle if it belonged to this player and tracks the new one (reset timer 0.1 s).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1056
---@param oldId integer Old vehicle (-1 if none).
---@param newVehId integer New vehicle.
---@param player integer|nil Player index (0 by default).
function gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player) end

--- Removes a vehicle from the drift tracking and from the crash tracking (gameplay_util_crashDetection).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:864
---@param vehId integer Vehicle id.
function gameplay_drift_drift.removeTrackedVehicle(vehId) end

--- Resets a vehicle's drift state (or all if vehId is nil): removes the drift/chain in progress, resets the crash data.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1045
---@param vehId integer|nil Vehicle; nil for all.
function gameplay_drift_drift.reset(vehId) end

--- Enables/disables taking donuts into account (driftOptions.allowDonut), read by the cascade zones.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1021
---@param value boolean true to allow.
function gameplay_drift_drift.setAllowDonut(value) end

--- Enables/disables tight drifts (driftOptions.allowTightDrifts).
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1025
---@param value boolean true to allow.
function gameplay_drift_drift.setAllowTightDrift(value) end

--- Enables "balance" mode: while it is active the confirmation time stays frozen at 1 and the drift chain is not concluded.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1038
---@param _balanceMode boolean true to enable.
---@param vehId integer|nil Vehicle id.
function gameplay_drift_drift.setBalanceMode(_balanceMode, vehId) end

--- Tracks only this vehicle: removes all the other tracked vehicles then adds it.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:1029
---@param newVehId integer Id of the vehicle to track.
function gameplay_drift_drift.setVehId(newVehId) end

--- Enables a drift simulation for audio debug; nil stops it.
---Source: lua/ge/extensions/gameplay/drift/drift.lua:855
---@param data table|nil {currDegAngle, airSpeed, wallDistance, isCrashing}.
function gameplay_drift_drift.simulateADrift(data) end

