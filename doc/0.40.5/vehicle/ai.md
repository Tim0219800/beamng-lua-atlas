# `ai`

*File: `lua/vehicle/ai.lua` · VM: Vehicle · 6281 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `ai`

Driving artificial intelligence of a vehicle (vehicle VM, global `ai`). It drives the vehicle along a road graph (mapmgr) or a trajectory script, acting on throttle/brake/steering via electrics. A modder uses it to drive the vehicle: choose a mode (ai.setMode), a target (setTarget, driveUsingPath), a speed (setSpeed + setSpeedMode), an aggression level. The public state (mode, debugMode, speedMode, routeSpeed, extAggression, extAvoidCars, driveInLaneFlag, cutOffDrivability, manualTargetName, pullOver) is the table M itself, returned by getState() and sent to the UI via guihooks AIStateChange. The driving loop M.updateGFX is active only when the mode is not 'disabled'.

## Example

```lua
-- from the vehicle console (vehicle VM)
ai.setMode('manual')
ai.setSpeedMode('limit'); ai.setSpeed(20) -- 20 m/s max
ai.setAggression(0.5)
ai.setTarget('wp_12')
-- or, all at once:
ai.driveUsingPath{wpTargetList = {'wp1', 'wp10'}, driveInLane = 'on', avoidCars = 'on', routeSpeed = 35, routeSpeedMode = 'limit', aggression = 0.3}
-- from the game (GE): be:getObjectByID(id):queueLuaCommand('ai.setMode("traffic")')
```

## Notes

- Modes recognized by the driving loop (M.mode): 'disabled' (AI off, default), 'manual' (follows the target/path set by setTarget/setPath/driveUsingPath), 'random' (wanders on the road network), 'span' (covers the whole map, see spanMap), 'traffic' (traffic: speedMode 'legal', driveInLane 'on', traction model 1, speed profile 'Back'), 'slotTraffic' (follows the target given by setSlotTrafficTarget, car avoidance disabled by default), 'flee' (flees the player vehicle), 'chase' (chases the player), 'follow' (follows the player), 'stop' (brakes then returns to 'disabled' by itself when speed < 0.08 m/s), 'script' (scriptai playback/recording). Any other value is accepted by setMode but has no dedicated branch.
- setMode calls the GE: onAiModeChange(objectId, mode) when the mode changes. When leaving 'disabled', the gearbox is set to 'arcade' mode (the previous mode is saved then restored on return to 'disabled' or at the end of 'stop').
- speedMode values: 'set' (aims for routeSpeed), 'limit' (caps at routeSpeed), 'legal' (legal road limits), 'off'. Any other value resets speedMode to nil. routeSpeed is in m/s.
- debugMode (setVehicleDebugMode): 'off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all' (values tested by aiDebugDraw; 'all' is also used by setScriptDebugMode).
- aggression: 0.3 corresponds to normal everyday driving, 1 to the limit of grip (according to the driveUsingPath comment). Default value extAggression = 0.3.
- extAvoidCars: 'on', 'off' or other (default 'auto'). In 'auto' avoidance is 'off' in 'manual' and 'slotTraffic' modes, 'on' otherwise.
- Inconsistencies in the code: M.debugDraw is set to `nop`, which must be defined globally by the engine (aiDebugDraw replaces it when debug is active). M.updateGFX is initialized to `nop` then replaced by the internal function updateGFX. M.targetObjectID is not initialized at the top of the file (nil at start) and setTargetObjectID compares M.targetObjectID to `objectId` (not to `id`), which looks like an error (the intended toggle seems to be id vs M.targetObjectID).
- ai.stopFollowing and ai.scriptStop are the same function (scriptStop).
- In setScriptDebugMode, mode nil or 'off' sets M.debugMode to 'all' before disabling the drawing: probably a bug (should be 'off').
- Most setters call stateChanged(), which sends AIStateChange to the UI only if a player is seated in the vehicle.
- UI/GE: guihooks 'AIStateChange' (state M) and 'AIStatusChange' ({status, category}, e.g. 'route done'/'route'); GE calls onAiModeChange(id, mode) and onAiRouteDone(id).

## Functions

| Function | Description | Line |
|---|---|---|
| `ai.driveInLane(v)` | Enables or disables driving on the legal side of the road (also affects pathfinding). | 5785 |
| `ai.driveUsingPath(arg)` | Main interface for making the AI follow a route: sets the AI to 'manual' mode and configures path, speeds, laps, lane driving, aggression and avoidance. At least path, wpTargetList or script is required; any argument of the wrong type makes the call silently ignored. With script, the car is first teleported to the script's start point. | 5950 |
| `ai.dumpCurrentRoute()` | Dumps the current route to the console, for debugging. | 6149 |
| `ai.dumpParameters()` | Dumps the parameters and the internal aggression to the console. | 359 |
| `ai.getEdgeLaneConfig(fromNode, toNode)` | Returns the lane configuration of an edge in the fromNode -> toNode direction, as a string of '+' (lane in the travel direction) and '-' (opposite direction). If the edge has no lane data, they are inferred from the node radii (3.61 m per lane; direction according to mapmgr.rules.rightHandDrive). | 1155 |
| `ai.getParameters()` | Returns the table of current parameters (direct reference, not copied). | 6153 |
| `ai.getState()` | Returns the public state table M (direct reference). | 253 |
| `ai.isDriving()` | Indicates whether the driving loop (or scriptai) is active. | 6211 |
| `ai.laneChange(plan, dist, signedDisp)` | Laterally offsets the nodes of the current plan to change lanes, progressively over a given distance, respecting the road width. | 1068 |
| `ai.onDeserialized(v)` | Hook called by the vehicle serialization system after a reload (Ctrl+R): restores the state via setState. *(internal)* *(hook)* | 6144 |
| `ai.reset()` | Called on vehicle reset (I key): clears the manual target, resets the internal states (traffic, crash, horn), smoothers, and reapplies the current mode without changing it. Stops data recording if active. *(internal)* | 5898 |
| `ai.restoreSavedGearboxMode()` | Restores the gearbox mode stored by saveGearboxMode via controller.mainController.setGearboxMode. | 158 |
| `ai.roadNaturalContinuation(wp1, wp2)` | Computes, among the edges leaving wp2, the one that most naturally continues the edge wp1->wp2 (direction and lane flow). | 1178 |
| `ai.saveGearboxMode()` | Stores the current gearbox mode (electrics.values.gearboxMode) to restore it later; no effect if already stored. For debugging. | 154 |
| `ai.scriptState()` | Returns the state of the current script according to scriptai.scriptState. | 6194 |
| `ai.scriptStop(...)` | Stops script playback: mode 'disabled' then scriptai.scriptStop. | 6187 |
| `ai.setAggression(v)` | Sets the driving aggression (M.extAggression) and applies it immediately, then notifies the UI. nil keeps the current value. | 284 |
| `ai.setAggressionMode(aggrmode)` | Enables or disables the adaptive aggression mode. | 290 |
| `ai.setAvoidCars(v)` | Enables/disables avoidance of other vehicles. | 5775 |
| `ai.setCutOffDrivability(drivability)` | Only changes the drivability threshold (cutOffDrivability) without changing mode. | 6139 |
| `ai.setEnableFastPhysicsforTraffic(v)` | Allows simplified physics (own collision and mode 2 aerodynamics) for traffic vehicles. Applied at the next setMode('traffic'). | 2040 |
| `ai.setMode(mode)` | Changes the AI's main mode and (re)initializes the route, the road map (mapmgr.requestMap except slotTraffic) and the speed smoothing. Has no effect if the vehicle has no wheels. With mode=nil, simply reapplies the current mode. In 'disabled' cuts the controls and the updateGFX loop. | 5806 |
| `ai.setParameters(data)` | Merges (tableMerge) fine settings into the AI's parameter table. Known keys and defaults: turnForceCoef 2, awarenessForceCoef 0.25, edgeDist 0, trafficWaitTime 2, enableElectrics true, driveStyle 'default', staticFrictionCoefMult 0.95, lookAheadKv 0.6, minStTargetDist 4.5, applyWidthMarginOffset true, planErrorSmoothing true, springForceIntegratorDispLim 0.1, understeerThrottleControl/oversteerThrottleControl/throttleTcs 'on' (anything other than 'off' = active), abBrakeControl 'on', underSteerBrakeControl 'on', throttleKp 0.5, targetSpeedSmootherRate 10, str 1, stt 0.5. | 355 |
| `ai.setPath(path)` | Sets an explicit path (sequence of waypoint names to follow in order) for 'manual' mode. | 5945 |
| `ai.setPullOver(val)` | Sets M.pullOver (request to pull over to the side, read by the traffic logic). | 4285 |
| `ai.setRacing(v)` | Enables/disables the AI's internal racing option. | 2031 |
| `ai.setRecoverOnCrash(val)` | Allows the AI to try to recover when it stays stuck for about 5 s without moving despite having a target. | 5884 |
| `ai.setScriptDebugMode(mode)` | Enables debug drawing of script following (scriptai.debugMode = mode). With nil or 'off', disables drawing (see notes). | 6199 |
| `ai.setSlotTrafficTarget(x, y, z, speed)` | Provides a position and speed target for 'slotTraffic' mode (switches to this mode if needed). The target's age is reset to 0 on each call. | 5877 |
| `ai.setSpeed(speed)` | Sets the route speed (routeSpeed); any non-numeric value resets it to nil. | 263 |
| `ai.setSpeedMode(speedMode)` | Defines how routeSpeed is interpreted. | 267 |
| `ai.setSpeedProfileMode(mode)` | Chooses the speed profile generation method. | 1913 |
| `ai.setState(newState)` | Applies a full state (M-like table: mode, extAggression, extAvoidCars, driveInLaneFlag, debugMode, targetObjectID, etc.) by merging into M, reapplies the mode and notifies the GE (onAiModeChange) if the mode changes. Has no effect if the vehicle has no wheels. | 5917 |
| `ai.setStopPoint(plan, dist, args)` | Defines the plan's stop segment: the AI stops at the given distance along the plan. Without dist, cancels the stop (stopSeg = math.huge). | 1096 |
| `ai.setTarget(wp)` | Sets a single waypoint as the target ('manual' mode); the name is validated on the next step of the loop. | 5939 |
| `ai.setTargetObjectID(id)` | Manually chooses the target vehicle (player) for flee/chase/follow modes. Passing -1 goes back to automatic selection. See notes: the internal comparison seems wrong. | 365 |
| `ai.setTractionModel(model_index)` | Chooses the grip constraint of the speed profile (only useful in 'Back' or 'ForwBack' profile). | 1944 |
| `ai.setVehicleDebugMode(newMode)` | Merges the given table into the state M (typically {debugMode = '...'}), notifies aiDebugDraw and enables or disables debug drawing depending on whether debugMode is 'off' or not. | 5796 |
| `ai.spanMap(cutOffDrivability)` | Sets the AI to 'span' mode: covers the whole road network, driving over every road. | 6133 |
| `ai.startFollowing(...)` | Makes the AI follow a recorded script. If the script (or script.path) contains points with speed v, goes through driveUsingPath{script=...}; otherwise uses scriptai in 'script' mode. | 6172 |
| `ai.startRecording(recordSpeed)` | Switches to 'script' mode and starts recording a trajectory via scriptai. | 6157 |
| `ai.startStopDataLog(name)` | Toggles driving data recording: the first call starts, the next one stops and writes a CSV file. | 217 |
| `ai.stateChanged()` | Sends the state to the UI (guihooks AIStateChange) if a player is seated in this vehicle. | 257 |
| `ai.stopFollowing(...)` | Alias of scriptStop: stops script following, mode 'disabled'. | 6187 |
| `ai.stopRecording()` | Stops recording (mode goes back to 'disabled') and returns the recorded script. | 6164 |
| `ai.toggleTrafficMode()` | Toggles between 'traffic' mode (with crash recovery enabled) and 'disabled'. | 5888 |

### Parameter details

#### `ai.driveInLane(v)`

Enables or disables driving on the legal side of the road (also affects pathfinding).

- `v` (*string*) : 'on' to enable; any other value disables.

#### `ai.driveUsingPath(arg)`

Main interface for making the AI follow a route: sets the AI to 'manual' mode and configures path, speeds, laps, lane driving, aggression and avoidance. At least path, wpTargetList or script is required; any argument of the wrong type makes the call silently ignored. With script, the car is first teleported to the script's start point.

- `arg` (*table*) : Options table: path (string[], waypoint path), wpTargetList (string[], successive targets linked by shortest path), script (table of {x,y,z,[r],[vl],[v],[dir],[up]}: r width, vl speed limit, v speed imposed at this point in m/s), wpSpeeds (table waypoint_name -> speed m/s), noOfLaps (number, laps if loop, default 1), routeSpeed (number m/s), routeSpeedMode ('limit' or 'set'), driveInLane ('on', otherwise inactive), aggression (0.3 to 1, default 0.3), avoidCars ('on'/'off', default 'off'), and fine settings taken over in setParameters: driveStyle, staticFrictionCoefMult, lookAheadKv (min 0.1), understeerThrottleControl, oversteerThrottleControl, throttleTcs, abBrakeControl, underSteerBrakeControl, throttleKp, targetSpeedSmootherRate, turnForceCoef, springForceIntegratorDispLim.

#### `ai.getEdgeLaneConfig(fromNode, toNode)`

Returns the lane configuration of an edge in the fromNode -> toNode direction, as a string of '+' (lane in the travel direction) and '-' (opposite direction). If the edge has no lane data, they are inferred from the node radii (3.61 m per lane; direction according to mapmgr.rules.rightHandDrive).

- `fromNode` (*string*) : Name of the start node.
- `toNode` (*string*) : Name of the end node.
- **returns**: string E.g. '--++'; Lua error if the edge does not exist in the graph.

#### `ai.getParameters()`

Returns the table of current parameters (direct reference, not copied).

- **returns**: table AI parameters.

#### `ai.getState()`

Returns the public state table M (direct reference).

- **returns**: table M.

#### `ai.isDriving()`

Indicates whether the driving loop (or scriptai) is active.

- **returns**: boolean true if the AI is driving.

#### `ai.laneChange(plan, dist, signedDisp)`

Laterally offsets the nodes of the current plan to change lanes, progressively over a given distance, respecting the road width.

- `plan` (*table|nil*) : Plan to modify; nil = current route plan (no effect if there is none).
- `dist` (*number*) : Distance (m) over which the offset is applied.
- `signedDisp` (*number*) : Lateral offset in m, signed (the sign gives the side).

#### `ai.onDeserialized(v)`

Hook called by the vehicle serialization system after a reload (Ctrl+R): restores the state via setState.

- `v` (*table*) : Saved state (same format as M).

#### `ai.roadNaturalContinuation(wp1, wp2)`

Computes, among the edges leaving wp2, the one that most naturally continues the edge wp1->wp2 (direction and lane flow).

- `wp1` (*string*) : Previous node.
- `wp2` (*string*) : Current node.
- **returns**: any Chosen next node (inferred from code; not fully re-read).

#### `ai.scriptState()`

Returns the state of the current script according to scriptai.scriptState.

- **returns**: any State returned by scriptai.scriptState.

#### `ai.scriptStop(...)`

Stops script playback: mode 'disabled' then scriptai.scriptStop.

- `...` (*any*) : Passed to scriptai.scriptStop.

#### `ai.setAggression(v)`

Sets the driving aggression (M.extAggression) and applies it immediately, then notifies the UI. nil keeps the current value.

- `v` (*number|nil*) : About 0.3 (normal) to 1 (limit of grip).

#### `ai.setAggressionMode(aggrmode)`

Enables or disables the adaptive aggression mode.

- `aggrmode` (*string|nil*) : 'rubberBand' for rubber banding (used automatically in flee/chase/follow); any other value disables it and reapplies the external aggression.

#### `ai.setAvoidCars(v)`

Enables/disables avoidance of other vehicles.

- `v` (*string*) : 'on' or 'off' (forced); any other value (e.g. 'auto'): falls back to 'off' in manual/slotTraffic modes, 'on' otherwise.

#### `ai.setCutOffDrivability(drivability)`

Only changes the drivability threshold (cutOffDrivability) without changing mode.

- `drivability` (*number|nil*) : Threshold (nil = 0).

#### `ai.setEnableFastPhysicsforTraffic(v)`

Allows simplified physics (own collision and mode 2 aerodynamics) for traffic vehicles. Applied at the next setMode('traffic').

- `v` (*boolean*) : true enables; other = false.

#### `ai.setMode(mode)`

Changes the AI's main mode and (re)initializes the route, the road map (mapmgr.requestMap except slotTraffic) and the speed smoothing. Has no effect if the vehicle has no wheels. With mode=nil, simply reapplies the current mode. In 'disabled' cuts the controls and the updateGFX loop.

- `mode` (*string|nil*) : 'disabled', 'manual', 'random', 'span', 'traffic', 'slotTraffic', 'flee', 'chase', 'follow', 'stop', 'script'; nil to keep the current mode.

#### `ai.setParameters(data)`

Merges (tableMerge) fine settings into the AI's parameter table. Known keys and defaults: turnForceCoef 2, awarenessForceCoef 0.25, edgeDist 0, trafficWaitTime 2, enableElectrics true, driveStyle 'default', staticFrictionCoefMult 0.95, lookAheadKv 0.6, minStTargetDist 4.5, applyWidthMarginOffset true, planErrorSmoothing true, springForceIntegratorDispLim 0.1, understeerThrottleControl/oversteerThrottleControl/throttleTcs 'on' (anything other than 'off' = active), abBrakeControl 'on', underSteerBrakeControl 'on', throttleKp 0.5, targetSpeedSmootherRate 10, str 1, stt 0.5.

- `data` (*table*) : Keys/values to overwrite in the parameters.

#### `ai.setPath(path)`

Sets an explicit path (sequence of waypoint names to follow in order) for 'manual' mode.

- `path` (*string[]*) : Consecutive waypoint names forming a path.

#### `ai.setPullOver(val)`

Sets M.pullOver (request to pull over to the side, read by the traffic logic).

- `val` (*boolean*) : true to pull over.

#### `ai.setRacing(v)`

Enables/disables the AI's internal racing option.

- `v` (*boolean*) : true enables; any other value = false.

#### `ai.setRecoverOnCrash(val)`

Allows the AI to try to recover when it stays stuck for about 5 s without moving despite having a target.

- `val` (*boolean*) : true to enable.

#### `ai.setScriptDebugMode(mode)`

Enables debug drawing of script following (scriptai.debugMode = mode). With nil or 'off', disables drawing (see notes).

- `mode` (*string|nil*) : scriptai debug mode; nil or 'off' to turn off.

#### `ai.setSlotTrafficTarget(x, y, z, speed)`

Provides a position and speed target for 'slotTraffic' mode (switches to this mode if needed). The target's age is reset to 0 on each call.

- `x` (*number|nil*) : World X position (nil = 0).
- `y` (*number|nil*) : World Y position (nil = 0).
- `z` (*number|nil*) : World Z position (nil = 0).
- `speed` (*number|nil*) : Target speed in m/s (min 0).

#### `ai.setSpeed(speed)`

Sets the route speed (routeSpeed); any non-numeric value resets it to nil.

- `speed` (*number|nil*) : Speed in m/s.

#### `ai.setSpeedMode(speedMode)`

Defines how routeSpeed is interpreted.

- `speedMode` (*string|nil*) : 'set' (aims for the speed), 'limit' (cap), 'legal' (legal limits), 'off'. Any other value = nil.

#### `ai.setSpeedProfileMode(mode)`

Chooses the speed profile generation method.

- `mode` (*string|nil*) : 'Back' (backward method), 'ForwBack' (forward + backward); other = nil (default method).

#### `ai.setState(newState)`

Applies a full state (M-like table: mode, extAggression, extAvoidCars, driveInLaneFlag, debugMode, targetObjectID, etc.) by merging into M, reapplies the mode and notifies the GE (onAiModeChange) if the mode changes. Has no effect if the vehicle has no wheels.

- `newState` (*table*) : Partial or full state.

#### `ai.setStopPoint(plan, dist, args)`

Defines the plan's stop segment: the AI stops at the given distance along the plan. Without dist, cancels the stop (stopSeg = math.huge).

- `plan` (*table|nil*) : Plan; nil = current plan.
- `dist` (*number|nil*) : Stop distance in m, nil to cancel.
- `args` (*table|nil*) : Option avoidJunction=true: pushes the stop point back in steps of 20 m so as not to stop inside an intersection.

#### `ai.setTarget(wp)`

Sets a single waypoint as the target ('manual' mode); the name is validated on the next step of the loop.

- `wp` (*string*) : Name of the road map waypoint.

#### `ai.setTargetObjectID(id)`

Manually chooses the target vehicle (player) for flee/chase/follow modes. Passing -1 goes back to automatic selection. See notes: the internal comparison seems wrong.

- `id` (*integer*) : ID of the target vehicle, or -1 for none.

#### `ai.setTractionModel(model_index)`

Chooses the grip constraint of the speed profile (only useful in 'Back' or 'ForwBack' profile).

- `model_index` (*integer*) : 1 = linear model (acc_eval_1); any other value = elliptic model (acc_eval_2, default).

#### `ai.setVehicleDebugMode(newMode)`

Merges the given table into the state M (typically {debugMode = '...'}), notifies aiDebugDraw and enables or disables debug drawing depending on whether debugMode is 'off' or not.

- `newMode` (*table*) : E.g. {debugMode = 'route'}; values: 'off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all'.

#### `ai.spanMap(cutOffDrivability)`

Sets the AI to 'span' mode: covers the whole road network, driving over every road.

- `cutOffDrivability` (*number|nil*) : Roads with lower drivability are ignored (nil = 0).

#### `ai.startFollowing(...)`

Makes the AI follow a recorded script. If the script (or script.path) contains points with speed v, goes through driveUsingPath{script=...}; otherwise uses scriptai in 'script' mode.

- `...` (*any*) : First argument: script (table, or table with a path field); following arguments are passed to scriptai.startFollowing.

#### `ai.startRecording(recordSpeed)`

Switches to 'script' mode and starts recording a trajectory via scriptai.

- `recordSpeed` (*number|nil*) : Speed parameter passed to scriptai.startRecording (inferred from code).

#### `ai.startStopDataLog(name)`

Toggles driving data recording: the first call starts, the next one stops and writes a CSV file.

- `name` (*string|nil*) : CSV file name.

#### `ai.stopFollowing(...)`

Alias of scriptStop: stops script following, mode 'disabled'.

- `...` (*any*) : Passed to scriptai.scriptStop.

#### `ai.stopRecording()`

Stops recording (mode goes back to 'disabled') and returns the recorded script.

- **returns**: table Script (list of points) returned by scriptai.stopRecording.

## Fields

| Field | Type | Description |
|---|---|---|
| `cutOffDrivability` | number | Drivability threshold below which roads are ignored in 'span' mode. Default 0. |
| `debugDraw` | function | Debug drawing function called by the main loop; nop by default, replaced by aiDebugDraw when debug mode is active. |
| `debugMode` | string | Debug drawing mode ('off' by default). |
| `driveInLaneFlag` | string | 'on' or 'off': stay in the legal lane. Default 'off'. |
| `extAggression` | number | Aggression requested from outside, default 0.3. |
| `extAvoidCars` | string | 'on', 'off' or 'auto' (default). |
| `manualTargetName` | string|nil | Name of the target waypoint set by setTarget (nil otherwise, reset to nil by reset). |
| `mode` | string | Main AI mode (see notes). Default 'disabled'. |
| `pullOver` | boolean | Request to pull over to the side (see setPullOver). Default false. |
| `routeSpeed` | number|nil | Route speed in m/s used depending on speedMode. |
| `speedMode` | string|nil | 'set', 'limit', 'legal', 'off' or nil. |
| `updateGFX` | function | Driving loop called on every graphics step; nop while the AI is disabled, replaced by the internal function or by scriptai.updateGFX. |

## Class `twt`

Internal state of the U-turn/reverse maneuver subsystem (twt): counters, radii and smoothers. Local table not exported by M, listed by the automatic extraction.

| Method | Description | Line |
|---|---|---|
| `twt.reset()` | Resets the twt state (state, minimum radii, blue noise, target speed and smoothers). Called internally. | 97 |

**UI events (guihooks.trigger):** `AIStateChange`, `AIStatusChange`

## Calls into the engine (C++)

- `obj:` `castRayStatic`, `getDirectionVector`, `getDirectionVectorUp`, `getDirectionVectorUpXYZ`, `getDirectionVectorXYZ`, `getFrontPosition`, `getFrontPositionXYZ`, `getGravity`, `getId`, `getInitialLength`, `getInitialWidth`, `getNodePosition`, `getObjectCenterPosition`, `getObjectCenterPositionXYZ`, `getObjectDirectionVector`, `getObjectDirectionVectorUp`, `getObjectDirectionVectorUpXYZ`, `getObjectDirectionVectorXYZ`, `getObjectFrontPositionXYZ`, `getObjectInitialHeight`, `getObjectInitialLength`, `getObjectInitialWidth`, `getOriginalFrontPositionRelative`, `getSmoothRefVelocityXYZ`, `getStaticFrictionCoef`, `getSurfaceHeightBelow`, `queueGameEngineLua`, `setAerodynamicsMode`, `setSelfCollisionMode`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/ai.lua`.*
