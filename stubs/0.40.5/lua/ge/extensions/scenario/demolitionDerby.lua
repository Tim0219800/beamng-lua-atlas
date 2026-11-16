---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/demolitionDerby.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Demolition-type scenario extension: it declares as winner the last vehicle still moving. Every second, it compares each scenario vehicle's position to its last known position; a vehicle that moves 1 m or less for more than 15 seconds is considered stopped.
--- Access: extension `scenario_demolitionDerby`: `extensions.load("scenario_demolitionDerby")`, then the global `scenario_demolitionDerby`
---@class scenario_demolitionDerby
scenario_demolitionDerby = {}

--- Hook called before rendering each frame. Every second, detects stationary vehicles and ends the scenario if only one vehicle is left moving.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/demolitionDerby.lua:40
---@param dt number Frame duration in seconds.
function scenario_demolitionDerby.onPreRender(dt) end

--- Hook called by scenario_scenarios on every scenario state change. When the scenario goes to 'running', resets the tracking and registers each scenario.vehicles vehicle found in the scenetree. Without a scenario, resets everything to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/demolitionDerby.lua:21
---@param sc any Argument passed by the hook, unused (the scenario is re-read via scenario_scenarios.getScenario()).
function scenario_demolitionDerby.onScenarioChange(sc) end

