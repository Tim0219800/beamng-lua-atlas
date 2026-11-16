# `gameplay_drift_drift`

*File: `lua/ge/extensions/gameplay/drift/drift.lua` · VM: Game Engine (GE) · 1206 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_drift`: `extensions.load("gameplay_drift_drift")`, then the global `gameplay_drift_drift`

Drift detection engine. For each tracked vehicle (one state per vehId, player 0's vehicle is tracked automatically), computes every frame the drift angle, oversteer, speed, distance to walls (front/rear raycasts), crashes and spinouts, and decides whether the vehicle is drifting. Manages the driftActiveData (drift in progress) and driftChainActiveData (drift chain) structures and emits the hooks onDriftChainStarted, onDriftStatusChanged, onDriftTransition, onDriftActiveDataFinished, onDriftCompleted, onDriftCrash and onDriftSpinout that scoring, display, quickMessages, statistics, etc. consume. This is the module to read to know whether the player is drifting and at what angle.

## Example

```lua
if gameplay_drift_drift.getIsDrifting() then
  local d = gameplay_drift_drift.getDriftActiveData()
  print(d.currDegAngle, gameplay_drift_drift.getAirSpeed())
end
```

## Notes

- Drift condition (isDrifting): oversteer detected, no reverse "cheesing" (angle > 120° with smoothed acceleration > -0.07), minAngle (7°) < angle < maxAngle (165°), average speed of the reference points > minAirSpeed (4 km/h), not in walking mode, vehicle on the ground, no failure cooldown (1.65 s), no reset timer (0.1 s), no crash in progress.
- Units: angles in degrees; getAirSpeed and kphAirSpeed in km/h (vel * 3.6); getVehVel returns the normalized DIRECTION of the velocity (velDir), not the speed; distances in meters.
- A drift chain ends (onDriftCompleted hook) when the confirmation time runs out with no drift and the cached score is > 0; this time ranges from 1.2 s (combo <= 5) to 2.25 s (combo >= 20). Cascade zones reset this time to the maximum.
- The get* functions without vehId use player 0's vehicle if it is tracked, otherwise any tracked vehicle; with an unknown vehId they return nil/false/0.
- Crash: onVehicleCrashStarted marks the vehicle as crashed only if its cached score is > 0; the onDriftCrash hook is emitted 0.3 s later. Spinout: speed < 1.5 km/h with angle > 110° after a drift with cached score > 0.
- Walls are detected with castRayStatic over wallDetectionLength = 3 m, from the front and rear of the vehicle, with blue noise to sweep the width; the values are closestWallDistanceFront/Rear in driftActiveData.
- driftActiveData: {driftDuration, driftDistance, closestWallDistanceFront/Rear, currDegAngle, direction ("left"/"right"), totalDriftAngle, totalDriftTime, angleVelocity, startPos, lastPos, score, totalAngles, totalSpeeds, totalPerformanceFactors, totalSteps, ...}. driftChainActiveData: {totalDriftDistance, totalDriftTime, rightDrifts, leftDrifts, chainedDrifts, currentCircleDrift = {totalAngle}}.
- No detection during the firstDrive tutorial, when walking, when paused, when dtSim <= 0, nor in multiseat outside the inSplitscreen context.
- simulateADrift(data) (audio debug) forces angle, speed, wall distance and simulated crash; passing nil stops the simulation.
- The driftDuration field of driftActiveData is never updated (stays 0): use totalDriftTime or getCurrentDriftDuration.
- getVehCorners returns a new table of 4 shared vec3 (reused every frame, do not modify them).

**Dependencies (loaded first):** `gameplay_walk`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_drift.addTrackedVehicle(vehId, opts)` | Adds a vehicle to the drift tracking (creates its state) and returns that state. With opts.playerId, associates the vehicle with a player and removes any other vehicle tracked for that same player. | 873 |
| `gameplay_drift_drift.doesPlHaveVeh(vehId)` | Indicates whether the tracked vehicle has valid map data. | 1000 |
| `gameplay_drift_drift.getAirSpeed(vehId)` | Returns the vehicle speed in km/h (velocity norm * 3.6). | 920 |
| `gameplay_drift_drift.getAngleDiff(vehId)` | Returns the change in angle of the velocity direction since the previous frame (degrees), computed during a drift. | 962 |
| `gameplay_drift_drift.getCurrDegAngleSigned(vehId)` | Returns the current drift angle in degrees, signed (the sign gives the side). | 950 |
| `gameplay_drift_drift.getCurrDriftCompletedTime(vehId)` | Returns the remaining fraction (0..1) of the drift chain's confirmation time (1 = the drift just happened, 0 = confirmed). | 956 |
| `gameplay_drift_drift.getCurrentDriftDuration(vehId)` | Returns the duration of the current drift (totalDriftTime), 0 if not drifting. | 972 |
| `gameplay_drift_drift.getDistSinceLastFrame(vehId)` | Returns the distance traveled since the previous frame, in meters. | 967 |
| `gameplay_drift_drift.getDriftActiveData(vehId)` | Returns the data of the current drift (nil if there is none). | 900 |
| `gameplay_drift_drift.getDriftChainActiveData(vehId)` | Returns the data of the current drift chain (nil if none). | 905 |
| `gameplay_drift_drift.getDriftChainChainedDrifts(vehId)` | Returns the number of drifts chained in the current chain. | 910 |
| `gameplay_drift_drift.getDriftDebugInfo()` | Returns {default=true, canBeChanged=true} for the drift debug window. | 1017 |
| `gameplay_drift_drift.getDriftOptions()` | Returns the table of detection settings: minAngle 7, maxAngle 165, allowDonut, allowTightDrifts, raycastHeight 0.5, wallDetectionLength 3, baseDriftCompleteTime 1.2, failPointsCooldown 1.65, minAirSpeed 4, maxWasDriftingTime 4, crashDamageThreshold 150, etc. Live table, modifiable. | 1005 |
| `gameplay_drift_drift.getGC()` | Returns the amount of garbage measured by the profiler. | 1013 |
| `gameplay_drift_drift.getIsCrashing(vehId)` | Indicates whether the vehicle is crashing (gameplay_util_crashDetection). | 995 |
| `gameplay_drift_drift.getIsDrifting(vehId)` | Indicates whether the vehicle is drifting. | 915 |
| `gameplay_drift_drift.getIsInTheAir(vehId)` | Indicates whether the vehicle is not on its wheels. | 990 |
| `gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId)` | Indicates whether the average speed of the reference points exceeds minAirSpeed (4 km/h). | 985 |
| `gameplay_drift_drift.getIsOverSteering(vehId)` | Indicates whether the vehicle is oversteering (front and center go the same way as the rear). | 980 |
| `gameplay_drift_drift.getPlVeh()` | Returns the main tracked vehicle object. | 935 |
| `gameplay_drift_drift.getPlayerIdForVehicle(vehId)` | Returns the player id associated with a tracked vehicle. | 859 |
| `gameplay_drift_drift.getTrackedVehicles()` | Returns the table of drift states, keyed by vehId (live table). | 896 |
| `gameplay_drift_drift.getVehCorners()` | Returns the 4 corners of the bounding box used for the raycasts (front right, rear right, rear left, front left), at raycastHeight. | 1009 |
| `gameplay_drift_drift.getVehData(vehId)` | Returns the vehicle's map.objects data (pos, vel, dirVec, ...). | 940 |
| `gameplay_drift_drift.getVehId()` | Returns the id of the main tracked vehicle (player 0 if possible). | 930 |
| `gameplay_drift_drift.getVehPos(vehId)` | Returns the vehicle position tracked by the module. | 925 |
| `gameplay_drift_drift.getVehVel(vehId)` | Returns the normalized direction of the vehicle's velocity (velDir), not its magnitude. | 945 |
| `gameplay_drift_drift.onAnyStuntZoneAccomplished()` | Hook: a cascade zone is completed; resets the drift chain's confirmation time to the maximum. *(internal)* *(hook)* | 1080 |
| `gameplay_drift_drift.onClientEndMission()` | Hook: level end; empties the list of tracked vehicles. *(internal)* *(hook)* | 1076 |
| `gameplay_drift_drift.onDeserialized(data)` | Hook: restores the debug checkbox. *(internal)* *(hook)* | 1151 |
| `gameplay_drift_drift.onDriftChallengeFinished()` | Hook: end of a drift challenge; emits onDriftCompleted for the chains in progress and onDriftActiveDataFinished for the drifts in progress. *(internal)* *(hook)* | 1103 |
| `gameplay_drift_drift.onDriftContextChanged(context, oldContext)` | Hook: on a context change, adds the vehicles to the crash tracking (except in inAnotherMissionType, where they are removed from it). *(internal)* *(hook)* | 1087 |
| `gameplay_drift_drift.onDriftPlVehReset(vehId)` | Hook: vehicle put back in place; resets its state and activates a 0.1 s reset timer during which it does not drift. *(internal)* *(hook)* | 1130 |
| `gameplay_drift_drift.onSerialize()` | Hook: saves the debug checkbox before Lua reload. *(internal)* *(hook)* | 1145 |
| `gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw)` | Called every frame: automatically tracks player 0's vehicle if nothing is tracked, then updates the detection for each tracked vehicle. Skipped during firstDrive, walking, pause or dtSim <= 0. *(internal)* *(hook)* | 807 |
| `gameplay_drift_drift.onVehicleCrashStarted(crashStartData)` | Hook: crash start detected by gameplay_util_crashDetection; marks the vehicle as crashed if its cached score is > 0 (outside pause, freeze, walking). *(internal)* *(hook)* | 1117 |
| `gameplay_drift_drift.onVehicleDestroyed(vehId)` | Hook: removes the destroyed vehicle from the tracking. *(internal)* *(hook)* | 1072 |
| `gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player)` | Hook: a player's vehicle change; removes the old vehicle if it belonged to this player and tracks the new one (reset timer 0.1 s). *(internal)* *(hook)* | 1056 |
| `gameplay_drift_drift.removeTrackedVehicle(vehId)` | Removes a vehicle from the drift tracking and from the crash tracking (gameplay_util_crashDetection). | 864 |
| `gameplay_drift_drift.reset(vehId)` | Resets a vehicle's drift state (or all if vehId is nil): removes the drift/chain in progress, resets the crash data. | 1045 |
| `gameplay_drift_drift.setAllowDonut(value)` | Enables/disables taking donuts into account (driftOptions.allowDonut), read by the cascade zones. | 1021 |
| `gameplay_drift_drift.setAllowTightDrift(value)` | Enables/disables tight drifts (driftOptions.allowTightDrifts). | 1025 |
| `gameplay_drift_drift.setBalanceMode(_balanceMode, vehId)` | Enables "balance" mode: while it is active the confirmation time stays frozen at 1 and the drift chain is not concluded. | 1038 |
| `gameplay_drift_drift.setVehId(newVehId)` | Tracks only this vehicle: removes all the other tracked vehicles then adds it. | 1029 |
| `gameplay_drift_drift.simulateADrift(data)` | Enables a drift simulation for audio debug; nil stops it. | 855 |

### Parameter details

#### `gameplay_drift_drift.addTrackedVehicle(vehId, opts)`

Adds a vehicle to the drift tracking (creates its state) and returns that state. With opts.playerId, associates the vehicle with a player and removes any other vehicle tracked for that same player.

- `vehId` (*integer*) : Vehicle id (ignored if nil or < 0).
- `opts` (*table|nil*) : {playerId = integer}.
- **returns**: table|nil Drift state of the vehicle.

#### `gameplay_drift_drift.doesPlHaveVeh(vehId)`

Indicates whether the tracked vehicle has valid map data.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: boolean|nil true if vehData exists.

#### `gameplay_drift_drift.getAirSpeed(vehId)`

Returns the vehicle speed in km/h (velocity norm * 3.6).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number|nil Speed in km/h.

#### `gameplay_drift_drift.getAngleDiff(vehId)`

Returns the change in angle of the velocity direction since the previous frame (degrees), computed during a drift.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number|nil Change in degrees.

#### `gameplay_drift_drift.getCurrDegAngleSigned(vehId)`

Returns the current drift angle in degrees, signed (the sign gives the side).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Angle in degrees.

#### `gameplay_drift_drift.getCurrDriftCompletedTime(vehId)`

Returns the remaining fraction (0..1) of the drift chain's confirmation time (1 = the drift just happened, 0 = confirmed).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Fraction of the remaining time.

#### `gameplay_drift_drift.getCurrentDriftDuration(vehId)`

Returns the duration of the current drift (totalDriftTime), 0 if not drifting.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Duration in seconds.

#### `gameplay_drift_drift.getDistSinceLastFrame(vehId)`

Returns the distance traveled since the previous frame, in meters.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: number Distance in m.

#### `gameplay_drift_drift.getDriftActiveData(vehId)`

Returns the data of the current drift (nil if there is none).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: table|nil driftActiveData.

#### `gameplay_drift_drift.getDriftChainActiveData(vehId)`

Returns the data of the current drift chain (nil if none).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: table|nil driftChainActiveData.

#### `gameplay_drift_drift.getDriftChainChainedDrifts(vehId)`

Returns the number of drifts chained in the current chain.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: integer Number of drifts, 0 if no chain.

#### `gameplay_drift_drift.getDriftDebugInfo()`

Returns {default=true, canBeChanged=true} for the drift debug window.

- **returns**: table {default = true, canBeChanged = true}

#### `gameplay_drift_drift.getDriftOptions()`

Returns the table of detection settings: minAngle 7, maxAngle 165, allowDonut, allowTightDrifts, raycastHeight 0.5, wallDetectionLength 3, baseDriftCompleteTime 1.2, failPointsCooldown 1.65, minAirSpeed 4, maxWasDriftingTime 4, crashDamageThreshold 150, etc. Live table, modifiable.

- **returns**: table driftOptions.

#### `gameplay_drift_drift.getGC()`

Returns the amount of garbage measured by the profiler.

- **returns**: number|nil nil as long as general debug has never been active.

#### `gameplay_drift_drift.getIsCrashing(vehId)`

Indicates whether the vehicle is crashing (gameplay_util_crashDetection).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: boolean Crash state.

#### `gameplay_drift_drift.getIsDrifting(vehId)`

Indicates whether the vehicle is drifting.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: boolean Drift state.

#### `gameplay_drift_drift.getIsInTheAir(vehId)`

Indicates whether the vehicle is not on its wheels.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: boolean true in the air.

#### `gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId)`

Indicates whether the average speed of the reference points exceeds minAirSpeed (4 km/h).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: boolean true if fast enough.

#### `gameplay_drift_drift.getIsOverSteering(vehId)`

Indicates whether the vehicle is oversteering (front and center go the same way as the rear).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: boolean Oversteer state.

#### `gameplay_drift_drift.getPlVeh()`

Returns the main tracked vehicle object.

- **returns**: userdata|nil Scene vehicle object.

#### `gameplay_drift_drift.getPlayerIdForVehicle(vehId)`

Returns the player id associated with a tracked vehicle.

- `vehId` (*integer*) : Vehicle id.
- **returns**: integer playerId, 0 if unknown.

#### `gameplay_drift_drift.getTrackedVehicles()`

Returns the table of drift states, keyed by vehId (live table).

- **returns**: table<integer, table> Drift states.

#### `gameplay_drift_drift.getVehCorners()`

Returns the 4 corners of the bounding box used for the raycasts (front right, rear right, rear left, front left), at raycastHeight.

- **returns**: vec3[] {corner_FR, corner_BR, corner_BL, corner_FL}

#### `gameplay_drift_drift.getVehData(vehId)`

Returns the vehicle's map.objects data (pos, vel, dirVec, ...).

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: table|nil map.objects entry.

#### `gameplay_drift_drift.getVehId()`

Returns the id of the main tracked vehicle (player 0 if possible).

- **returns**: integer|nil Vehicle id.

#### `gameplay_drift_drift.getVehPos(vehId)`

Returns the vehicle position tracked by the module.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: vec3|nil Position (shared vec3, do not modify).

#### `gameplay_drift_drift.getVehVel(vehId)`

Returns the normalized direction of the vehicle's velocity (velDir), not its magnitude.

- `vehId` (*integer|nil*) : Vehicle id.
- **returns**: vec3|nil Unit direction of the velocity.

#### `gameplay_drift_drift.onDeserialized(data)`

Hook: restores the debug checkbox.

- `data` (*table*) : onSerialize table.

#### `gameplay_drift_drift.onDriftContextChanged(context, oldContext)`

Hook: on a context change, adds the vehicles to the crash tracking (except in inAnotherMissionType, where they are removed from it).

- `context` (*string*) : New context.
- `oldContext` (*string|nil*) : Old context.

#### `gameplay_drift_drift.onDriftPlVehReset(vehId)`

Hook: vehicle put back in place; resets its state and activates a 0.1 s reset timer during which it does not drift.

- `vehId` (*integer|nil*) : Vehicle; nil for all.

#### `gameplay_drift_drift.onSerialize()`

Hook: saves the debug checkbox before Lua reload.

- **returns**: table {debugToggleSmothnessGraph}

#### `gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw)`

Called every frame: automatically tracks player 0's vehicle if nothing is tracked, then updates the detection for each tracked vehicle. Skipped during firstDrive, walking, pause or dtSim <= 0.

- `dtReal` (*number*) : Real time delta (unused).
- `_dtSim` (*number*) : Simulated time delta.
- `dtRaw` (*number*) : Raw time delta (unused).

#### `gameplay_drift_drift.onVehicleCrashStarted(crashStartData)`

Hook: crash start detected by gameplay_util_crashDetection; marks the vehicle as crashed if its cached score is > 0 (outside pause, freeze, walking).

- `crashStartData` (*table*) : Contains vehId.

#### `gameplay_drift_drift.onVehicleDestroyed(vehId)`

Hook: removes the destroyed vehicle from the tracking.

- `vehId` (*integer*) : Destroyed vehicle.

#### `gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player)`

Hook: a player's vehicle change; removes the old vehicle if it belonged to this player and tracks the new one (reset timer 0.1 s).

- `oldId` (*integer*) : Old vehicle (-1 if none).
- `newVehId` (*integer*) : New vehicle.
- `player` (*integer|nil*) : Player index (0 by default).

#### `gameplay_drift_drift.removeTrackedVehicle(vehId)`

Removes a vehicle from the drift tracking and from the crash tracking (gameplay_util_crashDetection).

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_drift_drift.reset(vehId)`

Resets a vehicle's drift state (or all if vehId is nil): removes the drift/chain in progress, resets the crash data.

- `vehId` (*integer|nil*) : Vehicle; nil for all.

#### `gameplay_drift_drift.setAllowDonut(value)`

Enables/disables taking donuts into account (driftOptions.allowDonut), read by the cascade zones.

- `value` (*boolean*) : true to allow.

#### `gameplay_drift_drift.setAllowTightDrift(value)`

Enables/disables tight drifts (driftOptions.allowTightDrifts).

- `value` (*boolean*) : true to allow.

#### `gameplay_drift_drift.setBalanceMode(_balanceMode, vehId)`

Enables "balance" mode: while it is active the confirmation time stays frozen at 1 and the drift chain is not concluded.

- `_balanceMode` (*boolean*) : true to enable.
- `vehId` (*integer|nil*) : Vehicle id.

#### `gameplay_drift_drift.setVehId(newVehId)`

Tracks only this vehicle: removes all the other tracked vehicles then adds it.

- `newVehId` (*integer*) : Id of the vehicle to track.

#### `gameplay_drift_drift.simulateADrift(data)`

Enables a drift simulation for audio debug; nil stops it.

- `data` (*table|nil*) : {currDegAngle, airSpeed, wallDistance, isCrashing}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_walk, loaded beforehand. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDriftActiveDataFinished` — listened to by 2 module(s)
- `onDriftChainStarted` — listened to by 1 module(s)
- `onDriftCompleted` — listened to by 3 module(s)
- `onDriftCrash` — listened to by 7 module(s)
- `onDriftSpinout` — listened to by 6 module(s)
- `onDriftStatusChanged` — listened to by 2 module(s)
- `onDriftTransition` — listened to by 1 module(s)

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/drift.lua`.*
