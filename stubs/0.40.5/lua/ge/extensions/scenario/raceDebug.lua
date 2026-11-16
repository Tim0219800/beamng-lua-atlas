---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visual debugging aid for scenario races: computes the path between the lapConfig waypoints (map.getPath) and draws it with debugDrawer (red spheres at waypoints, green prisms along the road, red when the segment is direct). Only active if the editor is enabled and the BeamNGRaceDrawDebug setting is true.
--- Access: extension `scenario_raceDebug`: `extensions.load("scenario_raceDebug")`, then the global `scenario_raceDebug`
---@class scenario_raceDebug
scenario_raceDebug = {}

--- Debug draw hook called every frame: draws the waypoints (sphere of radius n.radius and label 'wp i/N') and the computed path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceDebug.lua:46
---@param focusPos vec3 Camera focus position (unused).
function scenario_raceDebug.onDrawDebug(focusPos) end

--- Hook called on every scenario state change. If the scenario is 'running' and has lapConfig, fills currentScenario.debugPath (road nodes) and currentScenario.debugNodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/raceDebug.lua:7
---@param scenario table Scenario (unused, the current scenario is re-read).
function scenario_raceDebug.onScenarioChange(scenario) end

