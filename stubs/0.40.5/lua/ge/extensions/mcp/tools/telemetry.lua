---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/telemetry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP vehicle telemetry tools: electrics values (RPM, speed, gear, fuel…), damage summary, and a global GE-side state snapshot.
--- Access: extension `mcp_tools_telemetry`: `extensions.load("mcp_tools_telemetry")`, then the global `mcp_tools_telemetry`
---@class mcp_tools_telemetry
---@field cb table<string, function> Callback `electrics(vid, json)`: stores the JSON in shared.asyncResults.electrics.
---@field schemas table<string, table> Schemas of the telemetry tools.
mcp_tools_telemetry = {}

--- Fetches a vehicle's electrics.values (asynchronous).
---Source: lua/ge/extensions/mcp/tools/telemetry.lua:15
---@param args table|nil {keys?: string[], id?: integer}
---@return string  Previous JSON or "requested (async)" message.
---@return boolean  true if the vehicle does not exist.
function mcp_tools_telemetry.get_electrics(args) end

--- Snapshot: sim {physicsRunning, timeScale}, vehicleCount, level, camera {mode, pos}, player vehicle {id, jbeam, configKey, pos, speed (m/s), damage}.
---Source: lua/ge/extensions/mcp/tools/telemetry.lua:43
---@return string  JSON.
---@return boolean  false.
function mcp_tools_telemetry.get_status() end

--- Damage summary: id and damageSum (veh:getSectionDamageSum()).
---Source: lua/ge/extensions/mcp/tools/telemetry.lua:32
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true if the vehicle does not exist.
function mcp_tools_telemetry.get_vehicle_damage(args) end

