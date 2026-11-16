---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/police.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traffic police logic: tracks vehicles with the 'police' role, handles pursuits (levels -1 to 3 depending on the offense score), arrest, evasion, release, roadblocks (vehicles and props), and the queue of random suspects. It relies on gameplay_traffic (traffic data, roles). A modder uses it to start or end a pursuit, set the pursuit variables or set up a roadblock.
--- Access: extension `gameplay_police`: `extensions.load("gameplay_police")`, then the global `gameplay_police`
---@class gameplay_police
---@field enabled boolean If false, the police logic at runtime (onUpdate) is suspended. Is true by default.
gameplay_police = {}

--- Immediately declares a vehicle arrested: optional messages (ticket or arrest, list of offenses), emits onPursuitAction 'arrest' then setPursuitMode(-1) for the police targeting it. Works as intended if the target has the suspect role.
---Source: lua/ge/extensions/gameplay/police.lua:456
---@param id integer Arrested vehicle.
---@param showMessages boolean|nil Show the UI messages.
function gameplay_police.arrestVehicle(id, showMessages) end

--- Indicates how many of the provided vehicles fit in the width of a roadblock (from shortest to longest, length = largest extent of the box, or the axis chosen by useLength).
---Source: lua/ge/extensions/gameplay/police.lua:56
---@param vehIds integer[] Vehicle or prop ids.
---@param rbWidth number|nil Maximum roadblock width in meters (default 10).
---@param useLength boolean|nil nil = best axis; true = Y extent; false = X extent.
---@return integer[]  Ids that fit in the roadblock (nil if vehIds is not a table).
---@return number  Total length occupied in meters.
function gameplay_police.checkRoadblock(vehIds, rbWidth, useLength) end

--- Immediately declares that a vehicle escaped the police: emits onPursuitAction 'evade' then setPursuitMode(0).
---Source: lua/ge/extensions/gameplay/police.lua:493
---@param id integer Vehicle.
---@param showMessages boolean|nil Show the UI messages.
function gameplay_police.evadeVehicle(id, showMessages) end

--- Active police closest to the target, based on the distances cached in role.validTargets.
---Source: lua/ge/extensions/gameplay/police.lua:277
---@param targetId integer|nil Target id.
---@param isVisible boolean|nil Keep only the police that see the target (ignored if vars.useVisibility is false).
---@param isUsable boolean|nil Exclude police in the 'disabled' state.
---@return integer|nil  Police vehicle id.
---@return number  Distance (math.huge if none).
---@return number  Interactive distance (the police is facing forward).
function gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable) end

--- Alias of getPoliceVehicles.
---Source: lua/ge/extensions/gameplay/police.lua:273
---@return table<integer, table>  Police vehicles.
function gameplay_police.getPolice() end

--- Alias of getPursuitVars.
---Source: lua/ge/extensions/gameplay/police.lua:603
---@return table  Variables (direct reference).
function gameplay_police.getPoliceVars() end

--- Table of the traffic police vehicles, by vehicle id (gameplay_traffic data). Alias: getPolice.
---Source: lua/ge/extensions/gameplay/police.lua:273
---@return table<integer, table>  Police vehicles.
function gameplay_police.getPoliceVehicles() end

--- Pursuit data (veh.pursuit) of a traffic vehicle. Kept for compatibility.
---Source: lua/ge/extensions/gameplay/police.lua:594
---@param id integer|nil Vehicle (default player 0).
---@return table|nil  pursuit table (mode, score, timers, offensesList...).
function gameplay_police.getPursuitData(id) end

--- Current pursuit variables. Alias: getPoliceVars.
---Source: lua/ge/extensions/gameplay/police.lua:603
---@return table  Variables (direct reference).
function gameplay_police.getPursuitVars() end

--- Adds an object as a roadblock prop, if it exists, is not already a traffic vehicle and is not already registered.
---Source: lua/ge/extensions/gameplay/police.lua:235
---@param propId integer Object id.
function gameplay_police.insertProp(propId) end

--- Pursuit status of a traffic vehicle: for a police vehicle, true if it is pursuing (optionally targetId); for a suspect, true if pursuit.mode > 0.
---Source: lua/ge/extensions/gameplay/police.lua:299
---@param id integer|nil Vehicle (default player 0).
---@param targetId integer|nil Filter on the pursued target (police only).
---@return boolean  In pursuit.
---@return boolean  The vehicle is a police vehicle.
function gameplay_police.isVehicleInPursuit(id, targetId) end

--- Level end hook: clears the police list and resets the pursuit variables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:707
function gameplay_police.onClientEndMission() end

--- Hook after Lua reload: restores vars and policePropIds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:762
---@param data table Result of onSerialize.
function gameplay_police.onDeserialized(data) end

--- Hook before Lua reload: returns {vars, propIds} and clears the police list (rebuilt afterwards).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:756
---@return table  {vars, propIds}
function gameplay_police.onSerialize() end

--- Traffic hook: tracks role changes ('changeRole' action) to add or remove a vehicle from the police list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:607
---@param id integer Vehicle.
---@param action string Name of the action.
---@param data table For 'changeRole': name, prevName.
function gameplay_police.onTrafficAction(id, action, data) end

--- gameplay_traffic hook: registers the 'police' special vehicle provider (priority 10, at least 3 traffic vehicles in total, 25% of the total rounded up if options.police). The group comes from a group file (if options.autoLoadFromFile or the trafficSmartSelections setting), otherwise from trafficUtils.createPoliceGroup, otherwise from the fullsize/police.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:26
function gameplay_police.onTrafficSpecialVehiclesProviders() end

--- Hook at traffic start: logs the number of police vehicles and props.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:635
function gameplay_police.onTrafficStarted() end

--- Hook at traffic stop: clears the police list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:642
function gameplay_police.onTrafficStopped() end

--- Hook: adds the vehicle to the police list if its role is 'police'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:623
---@param id integer Vehicle added.
function gameplay_police.onTrafficVehicleAdded(id) end

--- Hook: removes the vehicle from the police list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:629
---@param id integer Vehicle removed.
function gameplay_police.onTrafficVehicleRemoved(id) end

--- Called every frame. For each traffic vehicle, triggers setPursuitMode when the score reaches a new scoreLevels step (with a short delay at the start). Also handles the random suspect timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:712
---@param dt number Real time delta (s).
---@param dtSim number Simulated time delta (s).
function gameplay_police.onUpdate(dt, dtSim) end

--- Hook: removes the destroyed object from the props list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:700
---@param id integer Destroyed object.
function gameplay_police.onVehicleDestroyed(id) end

--- AI vehicle reset hook: optionally picks a random suspect among the 'standard' vehicles when the timer has elapsed, or returns a non-'wanted' suspect to the standard role.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:683
---@param id integer Vehicle reset.
function gameplay_police.onVehicleResetted(id) end

--- Controlled vehicle change hook: inserts the new vehicle into traffic if needed; on a switch on foot/in vehicle (jbeam 'unicycle') during a pursuit, transfers the pursuit data to the new vehicle, restarts the mode, and forces the arrest on a return to a vehicle in front of the police. Sets ignorePolice to avoid the self-arrest of a police officer getting out.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/police.lua:646
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
function gameplay_police.onVehicleSwitched(oldId, newId) end

--- Places vehicles in a row across a road (centered on pos, spread over placeData.width), then teleports them with core_multiSpawn.placeGroup.
---Source: lua/ge/extensions/gameplay/police.lua:91
---@param vehIds integer[] Ids to place.
---@param pos vec3 Center of the roadblock.
---@param rot quat Orientation (the forward direction must follow the road).
---@param placeData table|nil width (default 10 m), angle (degrees, default 0), centerAngle (angle of the center vehicle).
function gameplay_police.placeRoadblock(vehIds, pos, rot, placeData) end

--- Releases a vehicle after arrest: emits onPursuitAction 'release' and sets the pursuit mode back to 0. If the vehicle is not traffic, sends controller.setFreeze(0) to its VM.
---Source: lua/ge/extensions/gameplay/police.lua:519
---@param id integer Vehicle.
---@param showMessages boolean|nil Show the "drive away" message if it is the player.
function gameplay_police.releaseVehicle(id, showMessages) end

--- Removes a prop from the roadblock list.
---Source: lua/ge/extensions/gameplay/police.lua:242
---@param propId integer Object id.
function gameplay_police.removeProp(propId) end

--- Alias of setPursuitVars.
---Source: lua/ge/extensions/gameplay/police.lua:265
---@param data table|nil|false See setPursuitVars.
function gameplay_police.setPoliceVars(data) end

--- Enables or disables all registered roadblock props; with reset, calls recovery.loadHome() on each.
---Source: lua/ge/extensions/gameplay/police.lua:226
---@param active boolean true to enable.
---@param reset boolean|nil true to return them to their original position.
function gameplay_police.setPropsActive(active, reset) end

--- Sets a target's pursuit mode: -1 arrested, 0 end, 1 to 3 level. Gives the target the suspect role (fleePolice action), updates the police (pursuitStart, pursuitEnd, resetAction) and the score, then emits onPursuitModeUpdate. When going from 0 to >0, emits onPursuitAction 'start'. Has no effect if the target is not traffic or has ignorePursuit.
---Source: lua/ge/extensions/gameplay/police.lua:325
---@param mode integer -1 to 3 (clamped).
---@param targetId integer|nil Target (default player 0).
---@param policeIds integer[]|integer|nil Police concerned (default all; a single number is accepted).
function gameplay_police.setPursuitMode(mode, targetId, policeIds) end

--- Merges data into the pursuit variables; without a valid table (nil/false), resets them to default. Alias: setPoliceVars.
---Source: lua/ge/extensions/gameplay/police.lua:265
---@param data table|nil|false Variables to change (scoreLevels, strictness, arrestTime, arrestRadius, evadeTime, evadeRadius, suspectFrequency, roadblockFrequency, useVisibility, autoRelease).
function gameplay_police.setPursuitVars(data) end

--- Sets a traffic vehicle to the 'suspect' role with the 'watchPolice' action (kept on role refresh).
---Source: lua/ge/extensions/gameplay/police.lua:429
---@param id integer Vehicle id.
function gameplay_police.setSuspect(id) end

--- Sets the delay before the next random suspect. With no argument: 120 * coef * (1 - suspectFrequency)^2 + 15 to 45 s; coef is 2, 1 after an arrest by the police player, 5 after an evasion.
---Source: lua/ge/extensions/gameplay/police.lua:439
---@param time number|nil Delay in seconds; nil = automatic calculation.
function gameplay_police.setSuspectTimer(time) end

--- Prepares a pursuit scenario: inserts the suspect into traffic (without deactivation by the vehicle pool), disables its respawn, gives it the suspect role (pursuitMode), forces the 'police' role on the provided policeIds, and starts the 'watchPolice' action unless preventAutoStart.
---Source: lua/ge/extensions/gameplay/police.lua:544
---@param suspectId integer|nil Suspect (default player 0 vehicle).
---@param policeIds integer[]|nil Police (default: existing police).
---@param options table|nil playerId, pursuitMode (default 2), preventAutoStart (default false).
---@return boolean  false if the suspect is not found or if there is no police.
function gameplay_police.setupPursuitGameplay(suspectId, policeIds, options) end

--- Prepares and places a roadblock in front of the target. Chooses the active police vehicles, farther than activeDist and behind the origin, that can target targetId. Looks for a road point at spawnDist ahead, computes the road width, adjusts the angle randomly, puts the police in 'roadblock' action and also places props (propIds).
---Source: lua/ge/extensions/gameplay/police.lua:136
---@param targetId integer|nil Target (default player 0 vehicle).
---@param roadblockVehIds integer[]|nil Candidate vehicles (default all police vehicles).
---@param roadblockPropIds integer[]|nil Props (default those of insertProp).
---@param originPos vec3|nil Origin (default camera position).
---@param originDirVec vec3|nil Origin direction (default camera forward).
---@param activeDist number|nil Radiating distance (default 100 m); 0 skips the distance and direction tests.
---@param spawnDist number|nil Minimum placement distance (default 120 m); 0 forces placement at the origin.
---@return table|nil  {vehIds, propIds} of the placed elements; nil on failure.
function gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist) end

