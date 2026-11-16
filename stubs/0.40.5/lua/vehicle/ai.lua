---@meta
-- tim19Atlas stub generated from lua/vehicle/ai.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving artificial intelligence of a vehicle (vehicle VM, global `ai`). It drives the vehicle along a road graph (mapmgr) or a trajectory script, acting on throttle/brake/steering via electrics. A modder uses it to drive the vehicle: choose a mode (ai.setMode), a target (setTarget, driveUsingPath), a speed (setSpeed + setSpeedMode), an aggression level. The public state (mode, debugMode, speedMode, routeSpeed, extAggression, extAvoidCars, driveInLaneFlag, cutOffDrivability, manualTargetName, pullOver) is the table M itself, returned by getState() and sent to the UI via guihooks AIStateChange. The driving loop M.updateGFX is active only when the mode is not 'disabled'.
--- Access: global `ai`
---@class ai
---@field cutOffDrivability number Drivability threshold below which roads are ignored in 'span' mode. Default 0.
---@field debugDraw function Debug drawing function called by the main loop; nop by default, replaced by aiDebugDraw when debug mode is active.
---@field debugMode string Debug drawing mode ('off' by default).
---@field driveInLaneFlag string 'on' or 'off': stay in the legal lane. Default 'off'.
---@field extAggression number Aggression requested from outside, default 0.3.
---@field extAvoidCars string 'on', 'off' or 'auto' (default).
---@field manualTargetName string|nil Name of the target waypoint set by setTarget (nil otherwise, reset to nil by reset).
---@field mode string Main AI mode (see notes). Default 'disabled'.
---@field pullOver boolean Request to pull over to the side (see setPullOver). Default false.
---@field routeSpeed number|nil Route speed in m/s used depending on speedMode.
---@field speedMode string|nil 'set', 'limit', 'legal', 'off' or nil.
---@field updateGFX function Driving loop called on every graphics step; nop while the AI is disabled, replaced by the internal function or by scriptai.updateGFX.
ai = {}

--- Enables or disables driving on the legal side of the road (also affects pathfinding).
---Source: lua/vehicle/ai.lua:5785
---@param v string 'on' to enable; any other value disables.
function ai.driveInLane(v) end

--- Main interface for making the AI follow a route: sets the AI to 'manual' mode and configures path, speeds, laps, lane driving, aggression and avoidance. At least path, wpTargetList or script is required; any argument of the wrong type makes the call silently ignored. With script, the car is first teleported to the script's start point.
---Source: lua/vehicle/ai.lua:5950
---@param arg table Options table: path (string[], waypoint path), wpTargetList (string[], successive targets linked by shortest path), script (table of {x,y,z,[r],[vl],[v],[dir],[up]}: r width, vl speed limit, v speed imposed at this point in m/s), wpSpeeds (table waypoint_name -> speed m/s), noOfLaps (number, laps if loop, default 1), routeSpeed (number m/s), routeSpeedMode ('limit' or 'set'), driveInLane ('on', otherwise inactive), aggression (0.3 to 1, default 0.3), avoidCars ('on'/'off', default 'off'), and fine settings taken over in setParameters: driveStyle, staticFrictionCoefMult, lookAheadKv (min 0.1), understeerThrottleControl, oversteerThrottleControl, throttleTcs, abBrakeControl, underSteerBrakeControl, throttleKp, targetSpeedSmootherRate, turnForceCoef, springForceIntegratorDispLim.
function ai.driveUsingPath(arg) end

--- Dumps the current route to the console, for debugging.
---Source: lua/vehicle/ai.lua:6149
function ai.dumpCurrentRoute() end

--- Dumps the parameters and the internal aggression to the console.
---Source: lua/vehicle/ai.lua:359
function ai.dumpParameters() end

--- Returns the lane configuration of an edge in the fromNode -> toNode direction, as a string of '+' (lane in the travel direction) and '-' (opposite direction). If the edge has no lane data, they are inferred from the node radii (3.61 m per lane; direction according to mapmgr.rules.rightHandDrive).
---Source: lua/vehicle/ai.lua:1155
---@param fromNode string Name of the start node.
---@param toNode string Name of the end node.
---@return string  E.g. '--++'; Lua error if the edge does not exist in the graph.
function ai.getEdgeLaneConfig(fromNode, toNode) end

--- Returns the table of current parameters (direct reference, not copied).
---Source: lua/vehicle/ai.lua:6153
---@return table  AI parameters.
function ai.getParameters() end

--- Returns the public state table M (direct reference).
---Source: lua/vehicle/ai.lua:253
---@return table  M.
function ai.getState() end

--- Indicates whether the driving loop (or scriptai) is active.
---Source: lua/vehicle/ai.lua:6211
---@return boolean  true if the AI is driving.
function ai.isDriving() end

--- Laterally offsets the nodes of the current plan to change lanes, progressively over a given distance, respecting the road width.
---Source: lua/vehicle/ai.lua:1068
---@param plan table|nil Plan to modify; nil = current route plan (no effect if there is none).
---@param dist number Distance (m) over which the offset is applied.
---@param signedDisp number Lateral offset in m, signed (the sign gives the side).
function ai.laneChange(plan, dist, signedDisp) end

--- Hook called by the vehicle serialization system after a reload (Ctrl+R): restores the state via setState.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/ai.lua:6144
---@param v table Saved state (same format as M).
function ai.onDeserialized(v) end

--- Called on vehicle reset (I key): clears the manual target, resets the internal states (traffic, crash, horn), smoothers, and reapplies the current mode without changing it. Stops data recording if active.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/ai.lua:5898
function ai.reset() end

--- Restores the gearbox mode stored by saveGearboxMode via controller.mainController.setGearboxMode.
---Source: lua/vehicle/ai.lua:158
function ai.restoreSavedGearboxMode() end

--- Computes, among the edges leaving wp2, the one that most naturally continues the edge wp1->wp2 (direction and lane flow).
---Source: lua/vehicle/ai.lua:1178
---@param wp1 string Previous node.
---@param wp2 string Current node.
---@return any  Chosen next node (inferred from code; not fully re-read).
function ai.roadNaturalContinuation(wp1, wp2) end

--- Stores the current gearbox mode (electrics.values.gearboxMode) to restore it later; no effect if already stored. For debugging.
---Source: lua/vehicle/ai.lua:154
function ai.saveGearboxMode() end

--- Returns the state of the current script according to scriptai.scriptState.
---Source: lua/vehicle/ai.lua:6194
---@return any  State returned by scriptai.scriptState.
function ai.scriptState() end

--- Stops script playback: mode 'disabled' then scriptai.scriptStop.
---Source: lua/vehicle/ai.lua:6187
---@param ... any Passed to scriptai.scriptStop.
function ai.scriptStop(...) end

--- Sets the driving aggression (M.extAggression) and applies it immediately, then notifies the UI. nil keeps the current value.
---Source: lua/vehicle/ai.lua:284
---@param v number|nil About 0.3 (normal) to 1 (limit of grip).
function ai.setAggression(v) end

--- Enables or disables the adaptive aggression mode.
---Source: lua/vehicle/ai.lua:290
---@param aggrmode string|nil 'rubberBand' for rubber banding (used automatically in flee/chase/follow); any other value disables it and reapplies the external aggression.
function ai.setAggressionMode(aggrmode) end

--- Enables/disables avoidance of other vehicles.
---Source: lua/vehicle/ai.lua:5775
---@param v string 'on' or 'off' (forced); any other value (e.g. 'auto'): falls back to 'off' in manual/slotTraffic modes, 'on' otherwise.
function ai.setAvoidCars(v) end

--- Only changes the drivability threshold (cutOffDrivability) without changing mode.
---Source: lua/vehicle/ai.lua:6139
---@param drivability number|nil Threshold (nil = 0).
function ai.setCutOffDrivability(drivability) end

--- Allows simplified physics (own collision and mode 2 aerodynamics) for traffic vehicles. Applied at the next setMode('traffic').
---Source: lua/vehicle/ai.lua:2040
---@param v boolean true enables; other = false.
function ai.setEnableFastPhysicsforTraffic(v) end

--- Changes the AI's main mode and (re)initializes the route, the road map (mapmgr.requestMap except slotTraffic) and the speed smoothing. Has no effect if the vehicle has no wheels. With mode=nil, simply reapplies the current mode. In 'disabled' cuts the controls and the updateGFX loop.
---Source: lua/vehicle/ai.lua:5806
---@param mode string|nil 'disabled', 'manual', 'random', 'span', 'traffic', 'slotTraffic', 'flee', 'chase', 'follow', 'stop', 'script'; nil to keep the current mode.
function ai.setMode(mode) end

--- Merges (tableMerge) fine settings into the AI's parameter table. Known keys and defaults: turnForceCoef 2, awarenessForceCoef 0.25, edgeDist 0, trafficWaitTime 2, enableElectrics true, driveStyle 'default', staticFrictionCoefMult 0.95, lookAheadKv 0.6, minStTargetDist 4.5, applyWidthMarginOffset true, planErrorSmoothing true, springForceIntegratorDispLim 0.1, understeerThrottleControl/oversteerThrottleControl/throttleTcs 'on' (anything other than 'off' = active), abBrakeControl 'on', underSteerBrakeControl 'on', throttleKp 0.5, targetSpeedSmootherRate 10, str 1, stt 0.5.
---Source: lua/vehicle/ai.lua:355
---@param data table Keys/values to overwrite in the parameters.
function ai.setParameters(data) end

--- Sets an explicit path (sequence of waypoint names to follow in order) for 'manual' mode.
---Source: lua/vehicle/ai.lua:5945
---@param path string[] Consecutive waypoint names forming a path.
function ai.setPath(path) end

--- Sets M.pullOver (request to pull over to the side, read by the traffic logic).
---Source: lua/vehicle/ai.lua:4285
---@param val boolean true to pull over.
function ai.setPullOver(val) end

--- Enables/disables the AI's internal racing option.
---Source: lua/vehicle/ai.lua:2031
---@param v boolean true enables; any other value = false.
function ai.setRacing(v) end

--- Allows the AI to try to recover when it stays stuck for about 5 s without moving despite having a target.
---Source: lua/vehicle/ai.lua:5884
---@param val boolean true to enable.
function ai.setRecoverOnCrash(val) end

--- Enables debug drawing of script following (scriptai.debugMode = mode). With nil or 'off', disables drawing (see notes).
---Source: lua/vehicle/ai.lua:6199
---@param mode string|nil scriptai debug mode; nil or 'off' to turn off.
function ai.setScriptDebugMode(mode) end

--- Provides a position and speed target for 'slotTraffic' mode (switches to this mode if needed). The target's age is reset to 0 on each call.
---Source: lua/vehicle/ai.lua:5877
---@param x number|nil World X position (nil = 0).
---@param y number|nil World Y position (nil = 0).
---@param z number|nil World Z position (nil = 0).
---@param speed number|nil Target speed in m/s (min 0).
function ai.setSlotTrafficTarget(x, y, z, speed) end

--- Sets the route speed (routeSpeed); any non-numeric value resets it to nil.
---Source: lua/vehicle/ai.lua:263
---@param speed number|nil Speed in m/s.
function ai.setSpeed(speed) end

--- Defines how routeSpeed is interpreted.
---Source: lua/vehicle/ai.lua:267
---@param speedMode string|nil 'set' (aims for the speed), 'limit' (cap), 'legal' (legal limits), 'off'. Any other value = nil.
function ai.setSpeedMode(speedMode) end

--- Chooses the speed profile generation method.
---Source: lua/vehicle/ai.lua:1913
---@param mode string|nil 'Back' (backward method), 'ForwBack' (forward + backward); other = nil (default method).
function ai.setSpeedProfileMode(mode) end

--- Applies a full state (M-like table: mode, extAggression, extAvoidCars, driveInLaneFlag, debugMode, targetObjectID, etc.) by merging into M, reapplies the mode and notifies the GE (onAiModeChange) if the mode changes. Has no effect if the vehicle has no wheels.
---Source: lua/vehicle/ai.lua:5917
---@param newState table Partial or full state.
function ai.setState(newState) end

--- Defines the plan's stop segment: the AI stops at the given distance along the plan. Without dist, cancels the stop (stopSeg = math.huge).
---Source: lua/vehicle/ai.lua:1096
---@param plan table|nil Plan; nil = current plan.
---@param dist number|nil Stop distance in m, nil to cancel.
---@param args table|nil Option avoidJunction=true: pushes the stop point back in steps of 20 m so as not to stop inside an intersection.
function ai.setStopPoint(plan, dist, args) end

--- Sets a single waypoint as the target ('manual' mode); the name is validated on the next step of the loop.
---Source: lua/vehicle/ai.lua:5939
---@param wp string Name of the road map waypoint.
function ai.setTarget(wp) end

--- Manually chooses the target vehicle (player) for flee/chase/follow modes. Passing -1 goes back to automatic selection. See notes: the internal comparison seems wrong.
---Source: lua/vehicle/ai.lua:365
---@param id integer ID of the target vehicle, or -1 for none.
function ai.setTargetObjectID(id) end

--- Chooses the grip constraint of the speed profile (only useful in 'Back' or 'ForwBack' profile).
---Source: lua/vehicle/ai.lua:1944
---@param model_index integer 1 = linear model (acc_eval_1); any other value = elliptic model (acc_eval_2, default).
function ai.setTractionModel(model_index) end

--- Merges the given table into the state M (typically {debugMode = '...'}), notifies aiDebugDraw and enables or disables debug drawing depending on whether debugMode is 'off' or not.
---Source: lua/vehicle/ai.lua:5796
---@param newMode table E.g. {debugMode = 'route'}; values: 'off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all'.
function ai.setVehicleDebugMode(newMode) end

--- Sets the AI to 'span' mode: covers the whole road network, driving over every road.
---Source: lua/vehicle/ai.lua:6133
---@param cutOffDrivability number|nil Roads with lower drivability are ignored (nil = 0).
function ai.spanMap(cutOffDrivability) end

--- Makes the AI follow a recorded script. If the script (or script.path) contains points with speed v, goes through driveUsingPath{script=...}; otherwise uses scriptai in 'script' mode.
---Source: lua/vehicle/ai.lua:6172
---@param ... any First argument: script (table, or table with a path field); following arguments are passed to scriptai.startFollowing.
function ai.startFollowing(...) end

--- Switches to 'script' mode and starts recording a trajectory via scriptai.
---Source: lua/vehicle/ai.lua:6157
---@param recordSpeed number|nil Speed parameter passed to scriptai.startRecording (inferred from code).
function ai.startRecording(recordSpeed) end

--- Toggles driving data recording: the first call starts, the next one stops and writes a CSV file.
---Source: lua/vehicle/ai.lua:217
---@param name string|nil CSV file name.
function ai.startStopDataLog(name) end

--- Sends the state to the UI (guihooks AIStateChange) if a player is seated in this vehicle.
---Source: lua/vehicle/ai.lua:257
function ai.stateChanged() end

--- Alias of scriptStop: stops script following, mode 'disabled'.
---Source: lua/vehicle/ai.lua:6187
---@param ... any Passed to scriptai.scriptStop.
function ai.stopFollowing(...) end

--- Stops recording (mode goes back to 'disabled') and returns the recorded script.
---Source: lua/vehicle/ai.lua:6164
---@return table  Script (list of points) returned by scriptai.stopRecording.
function ai.stopRecording() end

--- Toggles between 'traffic' mode (with crash recovery enabled) and 'disabled'.
---Source: lua/vehicle/ai.lua:5888
function ai.toggleTrafficMode() end

--- Internal state of the U-turn/reverse maneuver subsystem (twt): counters, radii and smoothers. Local table not exported by M, listed by the automatic extraction.
---@class ai_twt
local ai_twt = {}

--- Resets the twt state (state, minimum radii, blue noise, target speed and smoothers). Called internally.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/ai.lua:97
function ai_twt.reset() end

