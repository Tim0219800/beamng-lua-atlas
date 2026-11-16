---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/busdriver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bus driving scenario (line route with stops). From the scenario.busdriver configuration (routeID, variance, strictStop, simulatePassengers, traffic), it retrieves the line via core_busRouteManager.setLine, draws the ground path (core_groundMarkers), tracks the bus stop triggers (BeamNGTrigger of type 'busstop' and 'buswp'), handles the 5 s wait time at the stop, the doors and the kneeling position, moves 4 stop frame markers and ends the scenario as a success at the last stop or as a failure if a stop is skipped. The player is the vehicle 'scenario_player0'.
--- Access: extension `scenario_busdriver`: `extensions.load("scenario_busdriver")`, then the global `scenario_busdriver`
---@class scenario_busdriver
---@field dependencies string[] Extensions loaded first: scenario_scenarios, core_groundMarkers.
---@field enabledLineDebug boolean If true, onPreRender draws the whole route (renderDebugLine) with debug texts. False by default.
scenario_busdriver = {}

--- Ends the scenario as a failure (scenario_scenarios.finish({failed = reason})) then resets the module state.
---Source: lua/ge/extensions/scenario/busdriver.lua:80
---@param reason string|table Failure message or translation key.
function scenario_busdriver.fail(reason) end

--- Hook called when a BeamNGTrigger is crossed. Handles entering and leaving the line's bus stops (type 'busstop') and recording waypoints (type 'buswp').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:347
---@param data table {type, event ('enter'|'exit'), subjectName, triggerName}.
function scenario_busdriver.onBeamNGTrigger(data) end

--- Hook sent by the bus (vehicle) controller with events: 'onTriggerTick' (stop progress: speed, doors, kneeling), 'onApproachStop' (shows the stop markers, target alpha 1) and 'onDepartedStop' (restores the original bounding box).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:668
---@param state table {event, triggerName, speed, bus_dooropen, bus_kneel}.
function scenario_busdriver.onBusUpdate(state) end

--- End-of-mission hook: clears the marker list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:838
function scenario_busdriver.onClientEndMission() end

--- Unload hook: clears the markers, clears the groundMarkers path and unfreezes the player vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:801
function scenario_busdriver.onExtensionUnloaded() end

--- Hook: physics is paused; the stop timer no longer advances.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:812
function scenario_busdriver.onPhysicsPaused() end

--- Hook: physics resumes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:816
function scenario_busdriver.onPhysicsUnpaused() end

--- Hook called before each frame. Animates the markers' alpha, computes driving statistics (acceleration, jerk, damage, stop distance and angle), updates the ground path to the next stop (core_groundMarkers.setPath) and colors the markers depending on whether the bus is in the stop zone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:501
---@param dt number Real frame duration (s).
---@param dtSim number Simulated duration (s).
function scenario_busdriver.onPreRender(dt, dtSim) end

--- End-of-race hook: if playerWon is true, records the final time in the highscores (core_highscores.setScenarioHighscoresCustom, key 'busRoute').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:421
---@param final table Result, final.finalTime in seconds.
function scenario_busdriver.onRaceResult(final) end

--- Race start hook: resets, loads the line, unfreezes the player, creates the 4 TSStatic markers (busMarkerTL, TR, BL, BR, model position_marker.dae) in ScenarioObjectsGroup, checks the road map's navhelp points and draws the path to the first stop (line's routeColor color). Sets running to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:229
function scenario_busdriver.onRaceStart() end

--- Hook called when the scenario is loaded. If busdriver.simulatePassengers, adds the part 'citybus_seats_ballast' to the player vehicle's configuration; if busdriver.traffic and traffic is off, starts traffic with trafficAmount (or the maximum for 12 vehicles if 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:781
---@param scenario table Loaded scenario (scenario.busdriver).
function scenario_busdriver.onScenarioLoaded(scenario) end

--- Hook called when the scenario restarts: resets the state and reloads the line.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:188
---@param scenario table Restarted scenario.
function scenario_busdriver.onScenarioRestarted(scenario) end

--- Hook called on vehicle switch. For player 0, resets, freezes the new vehicle and reloads the line; fails if the line is not found.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/busdriver.lua:448
---@param oldId integer Old vehicle identifier.
---@param newId integer New identifier.
---@param player integer Player index.
function scenario_busdriver.onVehicleSwitched(oldId, newId, player) end

--- Requested by the UI: sends to the BusDisplayUpdate event the current line reduced to the remaining stops (from the next one). Logs an error and exits if no line is loaded.
---Source: lua/ge/extensions/scenario/busdriver.lua:820
function scenario_busdriver.requestState() end

