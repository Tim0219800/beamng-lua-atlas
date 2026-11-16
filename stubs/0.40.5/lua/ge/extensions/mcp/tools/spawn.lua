---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/spawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP spawn tools: list a model's configurations, spawn or replace a vehicle, and automatically test all of a model's configurations (spawn each one then collect log errors and physics instabilities). Useful for validating a vehicle mod.
--- Access: extension `mcp_tools_spawn`: `extensions.load("mcp_tools_spawn")`, then the global `mcp_tools_spawn`
---@class mcp_tools_spawn
---@field schemas table<string, table> Schemas of get_configs, spawn and test_configs.
mcp_tools_spawn = {}

--- Sorted list of a model's configuration keys (.pc) via core_vehicles.getModel.
---Source: lua/ge/extensions/mcp/tools/spawn.lua:44
---@param args table|nil {model?: string} (default: player vehicle's model).
---@return string  JSON {model, configs}.
---@return boolean  true on error.
function mcp_tools_spawn.get_configs(args) end

--- Called every frame: advances the configuration test (spawn, wait, analysis of the log and shared.instabilityLog, moving to the next config, final report in shared.asyncResults.testConfigs).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/tools/spawn.lua:12
---@param dtReal number Real duration (s).
function mcp_tools_spawn.onUpdate(dtReal) end

--- Spawns a vehicle: replaces the current vehicle (core_vehicles.replaceVehicle) or, with add=true, adds one (core_vehicles.spawnNewVehicle).
---Source: lua/ge/extensions/mcp/tools/spawn.lua:56
---@param args table|nil {model?: string, config?: string (key or .pc path), add?: boolean}
---@return string  Confirmation message.
---@return boolean  true on error.
function mcp_tools_spawn.spawn(args) end

--- Tests each config of a model (asynchronous, long). See the notes for the call protocol.
---Source: lua/ge/extensions/mcp/tools/spawn.lua:67
---@param args table|nil {model?: string, delay?: number s of wait per config (default 3)}
---@return string  Progress JSON or report {model, total, results:[{config, ok, errorCount, errors, unstable}]}.
---@return boolean  true on error.
function mcp_tools_spawn.test_configs(args) end

