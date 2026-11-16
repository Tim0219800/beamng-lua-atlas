---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/world.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP "world" tools: list and load levels, trigger a bound input action (like a key press), recover or delete a vehicle, and query the ground (height, grip/drivability) at a point.
--- Access: extension `mcp_tools_world`: `extensions.load("mcp_tools_world")`, then the global `mcp_tools_world`
---@class mcp_tools_world
---@field schemas table<string, table> Schemas of the world tools.
mcp_tools_world = {}

--- Surface height under a point (be:getSurfaceHeightBelow) and terrain drivability (be:getTerrainDrivability) within a radius.
---Source: lua/ge/extensions/mcp/tools/world.lua:67
---@param args table|nil {pos?: {x,y,z} (default player vehicle position), radius?: number m (default 2)}
---@return string  JSON {pos, surfaceHeight, drivability}.
---@return boolean  true if no point.
function mcp_tools_world.get_ground_at_point(args) end

--- Lists the installed levels: name (levelName), title, file (fullfilename or misFilePath).
---Source: lua/ge/extensions/mcp/tools/world.lua:12
---@return string  JSON.
---@return boolean  true if core_levels is unavailable.
function mcp_tools_world.list_levels() end

--- Loads a level (core_levels.startLevel) by path or by name.
---Source: lua/ge/extensions/mcp/tools/world.lua:22
---@param args table {path?: string, name?: string}
---@return string  "loading level: …".
---@return boolean  true on error.
function mcp_tools_world.load_level(args) end

--- Puts the vehicle back on the last road and repairs it (spawn.teleportToLastRoad with resetVehicle).
---Source: lua/ge/extensions/mcp/tools/world.lua:49
---@param args table|nil {id?: integer}
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_world.recover_vehicle(args) end

--- Deletes a vehicle (veh:delete()).
---Source: lua/ge/extensions/mcp/tools/world.lua:58
---@param args table|nil {id?: integer}
---@return string  Message.
---@return boolean  true if the vehicle does not exist.
function mcp_tools_world.remove_vehicle(args) end

--- Triggers a game input action by its name (e.g. recover_vehicle, toggleCamera, switch_next_vehicle).
---Source: lua/ge/extensions/mcp/tools/world.lua:38
---@param args table {action: string, state?: 'down'|'up'}
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_world.trigger_action(args) end

