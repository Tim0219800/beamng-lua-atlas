---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/pursuit/pursuit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pursuit mode manager: a gameplay event where several "chase" vehicles (police) pursue several "flee" vehicles (fugitives), players or AI. Only one instance at a time. It inserts the vehicles (police/suspect roles), handles the goals (free, timed, score, destination modes), the start (manual or at a given speed), arrests, recovery of released fugitives and stuck detection. The manager states are 'off', 'ready', 'active', 'inactive' and 'complete'.
--- Access: extension `gameplay_pursuit_pursuit`: `extensions.load("gameplay_pursuit_pursuit")`, then the global `gameplay_pursuit_pursuit`
---@class gameplay_pursuit_pursuit
gameplay_pursuit_pursuit = {}

--- Copies the parking point list and, if both quantities are given, rearranges it into n points tagged 'chase' then n points tagged 'flee' (without the opposite tag). Keeps the original list if the two lists are not filled enough.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:280
---@param parkingSpots table[] Parking points with customFields.tags.
---@param chaseAmount integer|nil Number of chase points wanted.
---@param fleeAmount integer|nil Number of flee points wanted.
---@return table[]  Filtered list (shallow copy).
function gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount) end

--- Returns the manager object (vehData, vehIds, chaseVehs, fleeVehs, options, goals, state, running, data{duration, arrests, totalScore, tempScore, locations, roadblocks}).
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:507
---@return table  Manager (direct reference).
function gameplay_pursuit_pursuit.getManager() end

--- Validates and inserts a vehicle into the manager. Reuses the traffic data if there is any (isShared), otherwise creates a traffic vehicle object. Gives it the police or suspect role, disables respawn and pooling, and sets the AI to 'stop' mode (or 'disabled' for a player).
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:106
---@param vehId integer Vehicle id.
---@param isChase boolean true = pursuer, false = fugitive.
---@param isAiControlled boolean true if driven by the AI (not usable by the player).
---@param options table|nil Options (not used in the function).
---@return boolean|nil  true if inserted, false if the data could not be created, nil if id is missing or already inserted.
function gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options) end

--- Hook after Lua reload: resets then restores the manager and reinserts the vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:746
---@param data table Result of onSerialize.
function gameplay_pursuit_pursuit.onDeserialized(data) end

--- Hook emitted by gameplay_police for a pursuit action. Active only if the state is 'active' and for a fugitive: 'arrest' counts the arrest, 'evade' removes the fugitive from targeting, 'release' applies the recoveryMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:511
---@param vehId integer Fugitive concerned.
---@param action string 'start', 'arrest', 'evade', 'release', 'roadblockAlert', 'roadblock'.
---@param pursuit table Pursuit data of the vehicle.
function gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit) end

--- Hook before Lua reload: returns the manager state (options, goals, data, state) and the serialized vehicle data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:719
---@return table  {manager, vehicles}
function gameplay_pursuit_pursuit.onSerialize() end

--- Hook on change of the number of traffic vehicles; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:716
function gameplay_pursuit_pursuit.onTrafficAmountChanged() end

--- Hook at traffic start: replaces the traffic entries with the manager's data for the vehicles that are part of it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:704
function gameplay_pursuit_pursuit.onTrafficStarted() end

--- Hook at traffic stop; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:713
function gameplay_pursuit_pursuit.onTrafficStopped() end

--- Called every frame. Updates the non-shared vehicles, triggers the automatic start (options.startSpeed), and in active play: duration, targeting every second, stuck detection, recovery, fades, total score and victory conditions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:560
---@param dt number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_pursuit_pursuit.onUpdate(dt, dtSim) end

--- core_multiSpawn hook: when the 'autoPursuitChase' then 'autoPursuitFlee' groups have spawned, calls setupPursuitMulti with the stored data; fails (reset) if one of the groups is empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:682
---@param vehList integer[] Ids of the spawned vehicles.
---@param groupId any Group id (unused).
---@param groupName string Group name.
function gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName) end

--- Removes a vehicle from the manager and gives it back its automatic traffic role if it is part of it.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:159
---@param vehId integer Vehicle id.
function gameplay_pursuit_pursuit.removeVeh(vehId) end

--- Completely resets the manager (stops the gameplay if running, clears the vehicles, sets the state to 'off', resets the vehicles and the gameplay_police variables).
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:221
function gameplay_pursuit_pursuit.reset() end

--- Sets the gameplay back to the 'ready' state without clearing the manager: resets the data, the pursuits and returns the vehicles to their original position (interactRecovery loadHome). Does not start.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:241
function gameplay_pursuit_pursuit.restart() end

--- Computes the goals (mode, time, score, arrests, locations) from the options; applies minimums depending on the mode.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:70
---@param options table|nil gameMode, timeLimit, scoreGoal, arrestGoal, locationGoal; default manager.options.
function gameplay_pursuit_pursuit.setupGoals(options) end

--- Creates a pursuit with one existing pursuer and one existing fugitive (first resets the manager if it is not 'off'). Moves to the 'ready' state.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:310
---@param chaseVehId integer Pursuer id.
---@param fleeVehId integer Fugitive id.
---@param options table|nil Gameplay options.
---@param pursuitVars table|nil Variables passed to gameplay_police.setPursuitVars.
---@return boolean  false if one of the vehicles is not found.
function gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars) end

--- Creates a pursuit with several pursuers and fugitives. Fails (reset) if there is no pursuer or no fugitive inserted; warns if some failed.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:342
---@param chaseVehIds integer[] Pursuer ids.
---@param fleeVehIds integer[] Fugitive ids.
---@param options table|nil Gameplay options.
---@param pursuitVars table|nil Pursuit variables.
---@return boolean  true if the setup is ready.
function gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars) end

--- Spawns the vehicle groups (core_multiSpawn.spawnGroup, names 'autoPursuitChase' and 'autoPursuitFlee') then, via onVehicleGroupSpawned, calls setupPursuitMulti. Uses the provided parking points, otherwise places the vehicles on the road ahead (15 m gap).
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:420
---@param chaseAmount integer|nil Number of pursuers (default 1).
---@param fleeAmount integer|nil Number of fugitives (default 1).
---@param chaseVehGroup table|nil Vehicle group {model, config...} of the pursuers.
---@param fleeVehGroup table|nil Fugitives' group.
---@param parkingSpots table[]|nil Points {pos, rot}, the first ones for the pursuers.
---@param options table|nil Options (shuffleVehGroups...).
---@param pursuitVars table|nil Pursuit variables.
---@return boolean  false if a quantity is less than 1.
function gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars) end

--- Like setupVehicles but reads the vehicle groups (data field) from JSON files, and optionally the parking points from a sites file (optional zone options.zoneName, shuffle options.shuffleSpots, filter by chase/flee tags).
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:448
---@param chaseAmount integer Number of pursuers (>= 1).
---@param fleeAmount integer Number of fugitives (>= 1).
---@param chaseVehGroupFile string Path of the pursuer group JSON.
---@param fleeVehGroupFile string Path of the fugitive group JSON.
---@param sitesFile string|nil Path of the sites file.
---@param options table|nil Options (zoneName, shuffleSpots, shuffleVehGroups...).
---@param pursuitVars table|nil Pursuit variables.
---@return boolean  false if the quantities are invalid or a group file is unreadable.
function gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars) end

--- Starts the gameplay ('ready' or 'inactive' states only): activates the vehicles (pursuers in pursuitStart action level 3, fugitives in fleePolice) and emits onPursuitGameplayStarted.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:250
function gameplay_pursuit_pursuit.start() end

--- Stops the active gameplay. With a winner, the state becomes 'complete', the fugitives' pursuits are reset and onPursuitGameplayFinished is emitted; without a winner, the state becomes 'inactive'.
---Source: lua/ge/extensions/gameplay/pursuit/pursuit.lua:258
---@param winner string|nil 'flee', 'chase' or another non-nil value to finish; nil to simply pause.
function gameplay_pursuit_pursuit.stop(winner) end

