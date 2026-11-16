---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/freeroam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Freeroam" game mode (free roam): starts a level in freeroam, applies the spawn options (traffic, parked vehicles, time of day, date, time flow), launches the flowgraphs associated with the level, handles the player's reset and radar messages. A modder uses it to launch a level (startFreeroam / startFreeroamByName) or to preconfigure traffic and time via spawningOptionsHelper before launch. Global: freeroam_freeroam.
--- Access: extension `freeroam_freeroam`: `extensions.load("freeroam_freeroam")`, then the global `freeroam_freeroam`
---@class freeroam_freeroam
---@field dependencies string[] {'core_environment'}
---@field spawningOptionsHelper table Launch options: trafficMode ('fromSetting'|'disabled'|'enabled'), trafficAmount (-1 auto, 0 none, N), trafficPolice ('disabled'|'enabled'), trafficParked ('disabled'|'enabled'), trafficParkedAmount (-1 auto), timeOfDay ('default'|'current'|'currentUtc'|level key|number 0..1), date (Unix epoch seconds), timePlay ('disabled'|'level'|'fast'|'normal'|'slow'|'realtime'), resetOptionsAfterStartingFreeroam (boolean).
freeroam_freeroam = {}

--- End-of-level hook: disables freeroamActive, removes the ExplorationCheckpointsActionMap action map and unloads mainLevel if loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:301
---@param levelPath string Level path.
function freeroam_freeroam.onClientEndMission(levelPath) end

--- Hook after start: applies the date, time of day and time flow requested in spawningOptionsHelper, resets them to default, then launches the flowgraphs associated with the level (unless a scenario is active).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:224
---@param levelPath string Level path.
function freeroam_freeroam.onClientPostStartMission(levelPath) end

--- Hook before the level starts: loads the `mainLevel.lua` file from the level folder at the root if it exists and calls its onClientPreStartMission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:187
---@param levelPath string Level path.
function freeroam_freeroam.onClientPreStartMission(levelPath) end

--- Hook when the level starts: if freeroam is active, emits onFreeroamLoaded(levelPath) and pushes the ExplorationCheckpointsActionMap action map if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:197
---@param levelPath string Level path.
function freeroam_freeroam.onClientStartMission(levelPath) end

--- Hook called when the player camera is ready: if freeroam is active, decides on traffic and parked vehicles based on spawningOptionsHelper and the trafficParkedVehicles setting, then calls gameplay_traffic.setupTrafficHelper. Does nothing if the level does not support traffic.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:118
function freeroam_freeroam.onPlayerCameraReady() end

--- Red light camera hook: in freeroam for the player vehicle, displays a message with the license plate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:393
---@param speedTrapData table Speed trap data.
---@param playerSpeed number Speed (unused).
function freeroam_freeroam.onRedLightCamTriggered(speedTrapData, playerSpeed) end

--- Player reset hook: ignored in scenario, campaign, recovery prompt, blocking flowgraph or multiplayer session; otherwise spawn.safeReset if the enableSmartRecovery setting is active, else be:resetVehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:324
---@param playerID integer Player (-1 = no vehicle).
function freeroam_freeroam.onResetGameplay(playerID) end

--- Speed trap hook: in freeroam, if the subject is the player vehicle, records the record in gameplay_speedTrapLeaderboards and displays the speed and record messages (ui_message).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:370
---@param speedTrapData table Speed trap data (speedLimit, subjectID...).
---@param playerSpeed number Recorded speed (m/s, inferred from code).
---@param overSpeed number|boolean Overspeed (inferred from code).
function freeroam_freeroam.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed) end

--- Hook called when traffic/parked vehicles are ready: removes the "traffic" loading screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:181
function freeroam_freeroam.onTrafficOrParkingReady() end

--- Per-frame hook: while worldReadyState is 0, initializes the camera (commands.initCamera) and switches to the free camera if there is no player vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:354
---@param dtReal number Real duration (s).
---@param dtSim number Simulated duration (s).
---@param dtRaw number Raw duration (s).
function freeroam_freeroam.onUpdate(dtReal, dtSim, dtRaw) end

--- Vehicle spawn hook: resets the part highlights and calls core_vehicle_partmgmt.setNewParts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:319
---@param vehID integer Vehicle id.
function freeroam_freeroam.onVehicleSpawned(vehID) end

--- Vehicle change hook: clears the part highlights of the old vehicle (core_vehicle_partmgmt.clearVehicleHighlights).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroam.lua:315
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer Player (unused).
function freeroam_freeroam.onVehicleSwitched(oldId, newId, player) end

--- Resets spawningOptionsHelper to its default values (deep copy of the initial state).
---Source: lua/ge/extensions/freeroam/freeroam.lua:31
function freeroam_freeroam.resetSpawningOptions() end

--- Starts freeroam on a level: shows the loading screen, unloads the automatic extensions, loads the preset extensions, empties the action filter, then core_levels.startLevel. If a level is already loaded, waits for it to finish.
---Source: lua/ge/extensions/freeroam/freeroam.lua:83
---@param level table|string Level table (levelName, misFilePath) or level file path.
---@param startPointName string|nil Spawn point name (only used if level is a table, via setSpawnpoint.setDefaultSP).
---@param wasDelayed boolean|nil True when the call comes from a deferred start (not used in the active body).
---@param spawnVehicle boolean|nil false = do not spawn a vehicle (clears the $beamngVehicle* variables).
---@param customLoadingFunction function|nil Custom loading function passed to core_levels.startLevel.
function freeroam_freeroam.startFreeroam(level, startPointName, wasDelayed, spawnVehicle, customLoadingFunction) end

--- Finds the level by name (core_levels.getLevelByName) and calls startFreeroam.
---Source: lua/ge/extensions/freeroam/freeroam.lua:109
---@param levelName string Level name.
---@param startPointName string|nil Start point.
---@param wasDelayed boolean|nil See startFreeroam.
---@param spawnVehicle boolean|nil See startFreeroam.
---@param customLoadingFunction function|nil See startFreeroam.
---@return boolean  true if the level exists.
function freeroam_freeroam.startFreeroamByName(levelName, startPointName, wasDelayed, spawnVehicle, customLoadingFunction) end

--- Loads the trackbuilder_trackBuilder extension and calls its enter(levelName, forceLoad).
---Source: lua/ge/extensions/freeroam/freeroam.lua:343
---@param levelName string Level.
---@param forceLoad boolean|nil Force the load.
function freeroam_freeroam.startTrackBuilder(levelName, forceLoad) end

