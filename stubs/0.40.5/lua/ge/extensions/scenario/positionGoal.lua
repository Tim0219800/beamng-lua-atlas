---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/positionGoal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "position" scenario goal (goals.vehicles with id = 'position'): at the end of the race, the vehicle must be in the zone of a scenetree object (for example a braking zone). The zone is defined by the distance to the center of the endPoint object, compared to its scale.x.
--- Access: extension `scenario_positionGoal`: `extensions.load("scenario_positionGoal")`, then the global `scenario_positionGoal`
---@class scenario_positionGoal
---@field instances table List of valid 'position' goals, filled by init().
scenario_positionGoal = {}

--- Resets instances and adds each goal id='position'; purpose is 'fail' if absent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/positionGoal.lua:60
---@param scenario table Current scenario.
function scenario_positionGoal.init(scenario) end

--- Called on every scenario state. On 'onRaceResult', checks that the vehicle is in the zone of the endPoint object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/positionGoal.lua:38
---@param scenario table Current scenario.
---@param state string State name.
---@param stateData table State data (unused).
function scenario_positionGoal.processState(scenario, state, stateData) end

--- Sends each instance's result to statistics_statistics.setGoalProgress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/positionGoal.lua:78
---@param scenario table Current scenario.
---@param instance table|nil Not used.
function scenario_positionGoal.updateFinalStatus(scenario, instance) end

