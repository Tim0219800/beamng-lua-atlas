---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/env.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP tools for the environment: read and set the time of day and astronomical parameters (latitude, longitude, date, UTC offset, celestial profile) via core_environment. Only available in a level.
--- Access: extension `mcp_tools_env`: `extensions.load("mcp_tools_env")`, then the global `mcp_tools_env`
---@class mcp_tools_env
---@field schemas table<string, table> Schemas of the tools get_time_of_day and set_time_of_day.
mcp_tools_env = {}

--- Returns core_environment.getTimeOfDay() as JSON: time, play, dayLength, startTime, latitude, longitude, date, utcOffset, dstRule, celestialProfile.
---Source: lua/ge/extensions/mcp/tools/env.lua:9
---@return string  JSON or error "core_environment unavailable".
---@return boolean  true on error.
function mcp_tools_env.get_time_of_day() end

--- Modifies the time and the provided astronomical fields then calls core_environment.setTimeOfDay.
---Source: lua/ge/extensions/mcp/tools/env.lua:15
---@param args table|nil {time?: 0..1, play?: boolean, dayLength?: number real s, startTime?: number, latitude?: number°, longitude?: number°, year?, month?, day?, utcOffset?: number h, dstRule?: string, celestialProfile?: string}
---@return string  "time of day set: time=…".
---@return boolean  true on error.
function mcp_tools_env.set_time_of_day(args) end

