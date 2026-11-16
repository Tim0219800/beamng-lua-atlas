---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerDriving.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handles the player's driving in career: setup of traffic and parked vehicles, tracking of the player state (parked, traffic, police pursuit), arrest fines, tutorial phases (traffic hidden then restored), teleport to the garage (with trailer), retrieval of the favorite vehicle and display of a position by camera. Uses gameplay_traffic, gameplay_parking and gameplay_police.
--- Access: extension `career_modules_playerDriving`: `extensions.load("career_modules_playerDriving")`, then the global `career_modules_playerDriving`
---@class career_modules_playerDriving
---@field debugMode boolean not shipping_build: true outside distribution builds.
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_playerDriving = {}

--- Returns the player state table (traffic, parking, maximum amounts).
---Source: lua/ge/extensions/career/modules/playerDriving.lua:15
---@return table  playerData (direct reference).
function career_modules_playerDriving.getPlayerData() end

--- Hook: starts setupTraffic if the career is active and traffic was never prepared; enables special triggers during loading to precompute garage lighting.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:315
---@param active boolean Activation state.
function career_modules_playerDriving.onCareerActive(active) end

--- Pursuit hook: disables parking tracking at start, re-enables it on reset/evade, and issues a fine on arrest (UI message).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:262
---@param vehId integer Vehicle id.
---@param action string start, reset, evade or arrest.
---@param data table Pursuit data (mode, uniqueOffensesCount).
function career_modules_playerDriving.onPursuitAction(vehId, action, data) end

--- Hook: when traffic and parked cars are ready, closes the careerVehicles loading screen and disables special triggers; during the tutorial, hides them and remembers their amounts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:283
function career_modules_playerDriving.onTrafficOrParkingReady() end

--- Hook: when traffic activates, remembers the maximum amounts and resets the player state (outside the tutorial and missions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:245
function career_modules_playerDriving.onTrafficStarted() end

--- Hook: clears the player's traffic data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:258
function career_modules_playerDriving.onTrafficStopped() end

--- Frame hook: effectively empty ("career police logic" not implemented).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:309
---@param dtReal number Real time (s).
---@param dtSim number Simulated time (s).
---@param dtRaw number Raw time (s).
function career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw) end

--- Parking hook: sets playerData.isParked to true (valid event) or false (exit) for the player vehicle, outside missions and the tutorial.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:233
---@param vehId integer Vehicle id.
---@param data table Event data (event).
function career_modules_playerDriving.onVehicleParkingStatus(vehId, data) end

--- Hook: updates the player data for the new vehicle (outside the tutorial and missions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/playerDriving.lua:303
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
function career_modules_playerDriving.onVehicleSwitched(oldId, newId) end

--- Indicates whether the player is being pursued by the police (pursuit.mode different from 0).
---Source: lua/ge/extensions/career/modules/playerDriving.lua:107
---@return boolean|nil  true if a pursuit is in progress, false or nil otherwise.
function career_modules_playerDriving.playerPursuitActive() end

--- Recomputes the player data for the current vehicle, sets the traffic variables, police (arrest radius 15, evasion time 30) and parking (precision 0.2), and resets the player's traffic tracking.
---Source: lua/ge/extensions/career/modules/playerDriving.lua:111
function career_modules_playerDriving.resetPlayerState() end

--- Re-enables traffic if it was turned off, restores the remembered active amounts (or those from the settings if null) then calls setTrafficAfterTutorial.
---Source: lua/ge/extensions/career/modules/playerDriving.lua:141
function career_modules_playerDriving.restoreTrafficAfterTutorialPhase() end

--- Brings the inventory's favorite vehicle to the player's position: teleports it if it exists, otherwise spawns it if it is accessible and does not need repair.
---Source: lua/ge/extensions/career/modules/playerDriving.lua:157
function career_modules_playerDriving.retrieveFavoriteVehicle() end

--- End of tutorial phase: disperses traffic and parked cars, resets the player state and sets the police probability to 0.15.
---Source: lua/ge/extensions/career/modules/playerDriving.lua:125
function career_modules_playerDriving.setTrafficAfterTutorial() end

--- Tutorial phase: disperses parked cars and traffic, hides the parked ones (amount 0), sets active traffic to maxTrafficAmount and sets police to 0.
---Source: lua/ge/extensions/career/modules/playerDriving.lua:117
function career_modules_playerDriving.setTrafficForTutorial() end

--- Orients the player (walking mode) toward pos; if a static obstacle blocks the view, plays a short camera path (5.5 s) that shows the position then returns to the vehicle camera.
---Source: lua/ge/extensions/career/modules/playerDriving.lua:340
---@param pos vec3 Position to show.
function career_modules_playerDriving.showPosition(pos) end

--- Teleports the vehicle to the garage, cancels mission navigation, turns off the ignition, handles a possible trailer (deferred teleport, then deletion after part conditions are updated) and checks the minimum fuel.
---Source: lua/ge/extensions/career/modules/playerDriving.lua:205
---@param garageId string Garage identifier.
---@param veh userdata Vehicle object.
---@param resetVeh boolean|nil If true, resets the vehicle on teleport.
function career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh) end

