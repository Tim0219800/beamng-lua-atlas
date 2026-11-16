---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/waypointAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "wayPointAction" scenario goal: displays an on-screen message when a vehicle reaches certain waypoints of the race. Loaded by scenario_raceGoals (init, processState, updateFinalStatus); declared in goals.vehicles with id 'wayPointAction'.
--- Access: extension `scenario_waypointAction`: `extensions.load("scenario_waypointAction")`, then the global `scenario_waypointAction`
---@class scenario_waypointAction
---@field instances table<integer, table> 'wayPointAction' goal instances for the current scenario, filled by init.
scenario_waypointAction = {}

--- Rebuilds M.instances from scenario.goals.vehicles (id == 'wayPointAction') after validating the type of wayPointNum (array).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypointAction.lua:38
---@param scenario table current scenario
function scenario_waypointAction.init(scenario) end

--- Called by scenario_raceGoals; only reacts to 'onRaceWaypointReached' during the race and displays the message of the waypoint reached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypointAction.lua:9
---@param scenario table current scenario
---@param state string hook name
---@param stateData table|nil hook data (unused)
function scenario_waypointAction.processState(scenario, state, stateData) end

--- Called at the end of the scenario; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/waypointAction.lua:55
---@param scenario table current scenario
---@param instance table unused
function scenario_waypointAction.updateFinalStatus(scenario, instance) end

