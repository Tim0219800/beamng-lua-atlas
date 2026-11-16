---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traffic vehicle object. Common fields: id, state, isAi, isPerson, isVehicle, isPlayerControlled, model, modelName, drivability, autoRole, role, tracking (roadTracking), collisions, pursuit, respawn, pos/dirVec/vel/driveVec/targetPos, speed, damage, alpha, focus, focusDist, enableRespawn, enableTracking, enableAutoPooling, camVisible, headlights, queuedFuncs.
---@class gameplay_traffic_vehicle
local gameplay_traffic_vehicle = {}

--- Deduced from the model and config data: display name, drivability (from the off-road score and size), random paint, taxi, vehicle status (types car, truck, automation, traffic, proptraffic, player) and automatic role ('police' for police configs, otherwise 'standard'; 'empty' if not a vehicle).
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:98
function gameplay_traffic_vehicle:applyModelConfigData() end

--- Detects contacts with the other objects on the map (OBB check), creates and updates the collision tables (counter, speed, damage, dot product), notifies the role (onCollision) and the other traffic vehicles (onOtherCollision) when the speed >= 1 m/s, and handles the case of a pedestrian (unicycle) being hit (the AI stops then resumes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:319
function gameplay_traffic_vehicle:checkCollisions() end

--- Evaluates the vehicle's offenses for the police (speeding, racing, reckless driving, wrong way, light/stop, collision with police or traffic) from the roadTracking faults and the collisions. No effect if strictness <= 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:492
function gameplay_traffic_vehicle:checkOffenses() end

--- Determines the closest police, increases or decreases sightValue (visibility 0 to 1; policeVisible if >= 0.5) and updates the pursuit score.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:550
---@param dtSim number Simulation time delta (s).
function gameplay_traffic_vehicle:checkPoliceVisibility(dtSim) end

--- Tests the static line of sight between two points (castRayStatic).
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:412
---@param startPos vec3|nil Start (vehicle position by default).
---@param endPos vec3|nil End (vehicle position by default).
---@return boolean  true if the ray reaches the position without obstacle.
function gameplay_traffic_vehicle:checkRayCast(startPos, endPos) end

--- Indicates whether it is daytime based on the game time and the solar night window.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:599
---@return boolean  true during the day.
function gameplay_traffic_vehicle:checkTimeOfDay() end

--- Varies the vehicle's opacity; at 0 when fading out the state becomes 'queued', at 1 when fading in it becomes 'active'.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:401
---@param rate number|nil Opacity step (0.1 by default).
---@param isFadeOut boolean|nil true to disappear, false/nil to appear.
function gameplay_traffic_vehicle:fade(rate, isFadeOut) end

--- Estimates the braking distance: v² / (2 · accel · g), with g bounded to avoid a division by zero.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:311
---@param speed number|nil Speed in m/s (self.speed by default).
---@param accel number|nil Deceleration as a fraction of g (the driver's aggression by default).
---@return number  Distance in meters.
function gameplay_traffic_vehicle:getBrakingDistance(speed, accel) end

--- Returns the distance between the vehicle's "look ahead" point (targetPos, 10 to 50 m ahead depending on speed) and a position.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:297
---@param pos vec3|nil Position to measure.
---@param squared boolean|nil If true, returns the squared distance.
---@return number  Distance in meters (math.huge if pos is nil).
function gameplay_traffic_vehicle:getInteractiveDistance(pos, squared) end

--- Turns on the horn then stops it after the given duration (deferred function 'horn').
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:213
---@param duration number|nil Duration in seconds (1 by default).
function gameplay_traffic_vehicle:honkHorn(duration) end

--- Initializes the traffic vehicle: forces visibility, creates collision and deferred function tables, the roadTracking object and the getters, calls resetAll, measures width/length and sets the default 'empty' role. Does nothing (and the constructor returns nil) if the vehicle does not exist or has ignoreTraffic.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:23
---@param id integer Vehicle id.
---@param role string|nil Not used in the function body.
function gameplay_traffic_vehicle:init(id, role) end

--- Immediately increases the respawn radii to keep the vehicle active longer (used after a collision and during pursuits).
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:305
---@param addActiveRadius number|nil Addition to the active radius (m).
---@param addInnerRadius number|nil Addition to the inner radius (m).
function gameplay_traffic_vehicle:modifyRespawnValues(addActiveRadius, addInnerRadius) end

--- Called after fading out or being sent to the inactive pool; relays to role:onActiveDone().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:618
function gameplay_traffic_vehicle:onActiveDone() end

--- Restores the state from the onSerialize table, recreates the role and restores tracking; sets the state to 'queued' if the object is not active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:994
---@param data table Data produced by onSerialize.
function gameplay_traffic_vehicle:onDeserialized(data) end

--- Advances the pursuit: alert, arrest (arrestTime), release, roadblocks (mode 3), evasion (evadeTime), arrest and evasion radii, and the normalized values arrestValue and evadeValue. For a vehicle outside the main traffic, emits the onPursuitAction hooks directly.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:755
---@param dt number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function gameplay_traffic_vehicle:onPursuitUpdate(dt, dtSim) end

--- Called when the vehicle data must be refreshed (usually after a respawn). For an AI: reset, playerUsable setting, AI debug mode, night adjustment of spawnValue (x0.25), active/fadeIn state, reset of the role's action and personality, AI parameters. Then calls role:onRefresh().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:632
function gameplay_traffic_vehicle:onRefresh() end

--- Called after a respawn in traffic: repaints at random if allowed, increments respawnCount, sets the state to 'reset'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:622
function gameplay_traffic_vehicle:onRespawn() end

--- Serializes the traffic vehicle's state (including road tracking and role) for saving.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:966
---@return table  Serializable data.
function gameplay_traffic_vehicle:onSerialize() end

--- Traffic tick (0.25 s): updates road tracking, visibility, active radius, headlights (night or tunnel), detects crash damage (hook onTrafficVehicleCrashed) and near misses, then calls role:onTrafficTick.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:668
---@param tickTime number Tick duration (0.25 s).
function gameplay_traffic_vehicle:onTrafficTick(tickTime) end

--- Per-frame update: reads position, direction and speed from map.objects, computes driveVec and targetPos, handles the states (locked, fadeIn, fadeOut), paces the traffic ticks, tracks collisions and police, runs the deferred functions and calls role:onUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:875
---@param dt number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function gameplay_traffic_vehicle:onUpdate(dt, dtSim) end

--- Called when the vehicle is reset (automatic or manual): unfreezes the vehicle if needed and resets tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:610
function gameplay_traffic_vehicle:onVehicleResetted() end

--- To call after initialization: applies the model/config data (applyModelConfigData) then the chosen automatic role (autoRole).
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:93
function gameplay_traffic_vehicle:postInit() end

--- Calls resetPursuit, resetTracking and resetValues.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:207
function gameplay_traffic_vehicle:resetAll() end

--- Turns off the vehicle's light bar, warnings and horn (vehicle Lua commands).
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:200
function gameplay_traffic_vehicle:resetElectrics() end

--- Resets the pursuit state (mode 0, scores, counters, timers); if a pursuit was ongoing, first calls gameplay_police.setPursuitMode(0, id).
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:168
function gameplay_traffic_vehicle:resetPursuit() end

--- Refreshes roadTracking and resets collision counters and crash damage; stores the current damage as a reference.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:177
function gameplay_traffic_vehicle:resetTracking() end

--- Resets the respawn values (from the traffic variables), and clears collisions, deferred functions and active data.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:184
function gameplay_traffic_vehicle:resetValues() end

--- Sets the vehicle's AI mode (ai.setMode) and its automatic parameters: 'traffic' (base aggression, legal speed, lane driving), 'random', 'flee' and 'chase' (aggression >= 0.8 for flee/chase, no speed limit). Sets isAi to false if the mode is 'disabled'. Ends with ai.reset().
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:225
---@param mode string|nil AI mode; uses trafficVars.aiMode if nil. Examples: 'traffic', 'random', 'flee', 'chase', 'follow', 'stop', 'disabled'.
---@param ignoreParams boolean|nil If true, does not set the automatic parameters nor reset the AI.
function gameplay_traffic_vehicle:setAiMode(mode, ignoreParams) end

--- Applies to the AI the aggression, the speed limit (negative = legal speed) and the aiAware setting (car avoidance) from params or, by default, from the traffic variables.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:253
---@param params table|nil Fields aggression/baseAggression, speedLimit (m/s), aiAware.
function gameplay_traffic_vehicle:setAiParameters(params) end

--- Changes the driver's role: ends the old role (onRoleEnded), creates the new one via trafficUtils.getRoleConstructor, calls onRoleStarted and emits the hook onTrafficAction(id, 'changeRole', ...).
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:278
---@param roleName string|nil Role name ('standard' by default).
function gameplay_traffic_vehicle:setRole(roleName) end

--- Evolves a collision's state: 'active' then 'resolved' (stopped near the site for 5 s) or 'abandoned' (the vehicle moves away); clears the collision when the other vehicle is more than 120 m away.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:377
---@param otherId integer|nil Id of the other vehicle.
---@param dt number Delta time in seconds.
function gameplay_traffic_vehicle:trackCollision(otherId, dt) end

--- Records a pursuit offense (unique key, default score 100, divided by 2 for an AI), updates counters and additional score and emits the hook onPursuitOffense the first time.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:473
---@param data table {key = string, score? = number, value?, threshold?}; without key, nothing is done.
function gameplay_traffic_vehicle:triggerOffense(data) end

--- Tests whether the vehicle is far enough from the focus to respawn (never the player's vehicle) and that no non-traffic vehicle is too close; then switches to the 'fadeOut' state and turns off horn and headlights.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:439
function gameplay_traffic_vehicle:tryRespawn() end

--- Updates the radii that decide whether the vehicle can respawn: active radius decreasing according to spawnValue and visibility, plus an extra radius depending on the focus's speed and direction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:421
---@param tickTime number Tick duration (s).
function gameplay_traffic_vehicle:updateActiveRadius(tickTime) end

--- Turns on the light bar with siren (signal 2) then sets it back to 1 (or 0 if disableAfterUse) after the given duration. Assumes the vehicle has a light bar. Uses the same deferred entry 'horn' as honkHorn: the two overwrite each other.
---Source: lua/ge/extensions/gameplay/traffic/vehicle.lua:218
---@param duration number|nil Duration in seconds (1 by default).
---@param disableAfterUse boolean|nil If true, turns the light bar off at the end instead of lights-only mode.
function gameplay_traffic_vehicle:useSiren(duration, disableAfterUse) end

