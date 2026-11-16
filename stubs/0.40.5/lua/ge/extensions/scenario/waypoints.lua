---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/waypoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Waypoint system of a race scenario: from scenario.lapConfig (ordered list of waypoints/triggers) and the branches (lapConfigBranches), builds a successor graph, displays the markers (raceMarker) and detects every frame the passage of the wheels of the player's or AI-driven vehicles through the next waypoint. Emits the race hooks (onRaceWaypointReached, onRaceWaypoint, onRaceLap, onRaceBranchChosen) and ends the race when the last waypoint of the last lap is crossed. Loaded by scenario_scenariosLoader with scenario_scenarios.
--- Access: extension `scenario_waypoints`: `extensions.load("scenario_waypoints")`, then the global `scenario_waypoints`
---@class scenario_waypoints
---@field addWaypointBranch nil Exported but is nil (local variable not defined in the file).
---@field dependencies table<integer, string> {'scenario_scenarios'}
---@field onUpdate nil Exported but is nil (local variable not defined in the file).
---@field state table System state (see notes): vehicleWaypointsData, nextWpForVehicle, waypointBranches, currentWaypointChoice, currentBranch, waypointsConfigData, branchGraph, pathnodes.
scenario_waypoints = {}

--- Inserts into the vehicle's waypoint list the waypoints of the chosen branch, after the current waypoint, then emits onRaceBranchChosen({branchName, time, vehicleId, vehicleName}).
---Source: lua/ge/extensions/scenario/waypoints.lua:324
---@param branchName string branch name (key of lapConfigBranches)
---@param vehicleId integer vehicle id
---@param dtOff number time correction (s)
function scenario_waypoints.activateWaypointBranch(branchName, vehicleId, dtOff) end

--- Does nothing (returns immediately).
---Source: lua/ge/extensions/scenario/waypoints.lua:309
---@param branchName string branch name
function scenario_waypoints.deactivateWaypointBranch(branchName) end

--- Returns a deep copy of a vehicle's waypoint data (cur, next, lap, waypointConfig, nextWps, historicalLapConfig, wheel corners...).
---Source: lua/ge/extensions/scenario/waypoints.lua:680
---@param vehicleId integer vehicle id
---@return table|nil  data or nil
function scenario_waypoints.getVehicleWaypointData(vehicleId) end

--- Called by scenario_scenarios in 'pre-running': resets the state, builds the branches and the successor graph, creates a pathnode per waypoint, configures the markers (raceMarker.setupMarkers) and initializes the data of each vehicle in the scenario. Does nothing if lapConfig is empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:518
function scenario_waypoints.initialise() end

--- Supposed to tell whether a waypoint is the last one; always returns false (body commented out in the code).
---Source: lua/ge/extensions/scenario/waypoints.lua:665
---@param vehicleId integer vehicle id
---@param waypointName string waypoint name
---@return boolean  always false
function scenario_waypoints.isFinalWaypoint(vehicleId, waypointName) end

--- Level end hook: clears the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:724
function scenario_waypoints.onClientEndMission() end

--- Deserialization hook: restores the state by converting vehicle names back to ids.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:697
---@param data table data from onSerialize
function scenario_waypoints.onDeserialized(data) end

--- Per-frame hook (luaPreRender): updates the wheel corners of each tracked vehicle and detects the crossing of the next waypoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:606
---@param dtReal number real time (s)
---@param dtSim number simulated time (s)
---@param dtRaw number raw time (s)
function scenario_waypoints.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook emitted by scenario_scenarios on each state change; clears the system state when the scenario is nil (stop).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:267
---@param scenario table|nil scenario or nil
function scenario_waypoints.onScenarioChange(scenario) end

--- Hook emitted when a scenario restarts: restores lapConfig, clears the state, rebuilds branches and the successor graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:495
---@param scenario table scenario
function scenario_waypoints.onScenarioRestarted(scenario) end

--- Called internally when a vehicle crosses its target waypoint: processes the waypoint (markers, next), emits onRaceWaypointReached(data) (and onRaceWaypoint for playerUsable vehicles, with a sound), handles the end of the race (scenario_scenarios.endRace) and the laps (onRaceLap). Marked "private" in the code.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:205
---@param vid integer vehicle id
---@param wpData table scenario node {pos, radius, rot}
---@param dtOff number time correction (s)
function scenario_waypoints.onScenarioVehicleTrigger(vid, wpData, dtOff) end

--- Serialization hook before Lua reload: returns the data per vehicle name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:685
---@return table  serialized data
function scenario_waypoints.onSerialize() end

--- Hook emitted by scenario_scenarios: initializes waypoint tracking for a vehicle whose AI has just been enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypoints.lua:706
---@param data table {vehicleId, vehicleName, aiControlled}
function scenario_waypoints.onVehicleAIStateChanged(data) end

--- Resets the waypoint data of a vehicle that was put back in place: without curWpIndex (or with missing data) recreates them, otherwise sets cur = curWpIndex - 1 and next = nextWpIndex - 1 and reprocesses the waypoint. Used by checkpoints.lua according to the code.
---Source: lua/ge/extensions/scenario/waypoints.lua:712
---@param vehicleId integer vehicle id
---@param curWpIndex integer|nil (1-based) index of the current waypoint
---@param nextWpIndex integer|nil (1-based) index of the next waypoint
function scenario_waypoints.updateResetVehicleData(vehicleId, curWpIndex, nextWpIndex) end

