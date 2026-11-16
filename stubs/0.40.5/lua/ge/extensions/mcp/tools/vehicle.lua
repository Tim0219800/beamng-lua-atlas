---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP vehicle tools: list, detail, JBeam files and part tree, physics instability log, reset/reload of the player vehicle, reading and writing the pose (position + rotation).
--- Access: extension `mcp_tools_vehicle`: `extensions.load("mcp_tools_vehicle")`, then the global `mcp_tools_vehicle`
---@class mcp_tools_vehicle
---@field schemas table<string, table> Schemas of the vehicle tools.
mcp_tools_vehicle = {}

--- Returns the logged physics instabilities and clears the buffer by default.
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:86
---@param args table|nil {clear?: boolean} false to keep.
---@return string  JSON {count, events}.
---@return boolean  false.
function mcp_tools_vehicle.get_instability(args) end

--- Parts config as a table slot path -> chosen part name (flattened config.partsTree).
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:72
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true if no tree.
function mcp_tools_vehicle.get_part_tree(args) end

--- Player 0's vehicle id (be:getPlayerVehicleID(0)) as text.
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:33
---@return string  Id.
---@return boolean  false.
function mcp_tools_vehicle.get_player_vehicle_id() end

--- Pose of a vehicle: pos {x,y,z} and quaternion rot {x,y,z,w}.
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:107
---@param args table|nil {id?: integer}
---@return string  JSON {id, pos, rot}.
---@return boolean  true if the vehicle does not exist.
function mcp_tools_vehicle.get_position(args) end

--- Details: id, jbeam, name, configKey, pcFile, position, speed (m/s).
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:37
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true if the vehicle does not exist.
function mcp_tools_vehicle.get_vehicle(args) end

--- Files used: vehicleDirectory, directoriesLoaded, pcFile and sorted list of the JBeam files of the active parts (jbeam/io getPart).
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:55
---@param args table|nil {id?: integer}
---@return string  JSON.
---@return boolean  true if no vehicle data.
function mcp_tools_vehicle.get_vehicle_files(args) end

--- Lists the spawned vehicles: id, jbeam, display name (brand + name).
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:18
---@return string  JSON.
---@return boolean  false.
function mcp_tools_vehicle.get_vehicles() end

--- Engine hook (relayed by mcp_tools) called when the physics detects an unstable vehicle: appends {time, vid, jbeam} to shared.instabilityLog (50 max).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:11
---@param vid integer Vehicle id.
---@param returnData any Provided by the engine, unused.
function mcp_tools_vehicle.onInstabilityDetected(vid, returnData) end

--- Reloads the player vehicle from disk (core_vehicle_manager.reloadVehicle(0)), which re-reads its JBeam.
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:99
---@return string  Message.
---@return boolean  true if there is no player vehicle.
function mcp_tools_vehicle.reload_vehicle() end

--- Resets/repairs the player vehicle in place (be:resetVehicle(0)).
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:92
---@return string  Message.
---@return boolean  true if there is no player vehicle.
function mcp_tools_vehicle.reset_vehicle() end

--- Teleports a vehicle to a pose via spawn.safeTeleport; rot optional (keeps the current heading).
---Source: lua/ge/extensions/mcp/tools/vehicle.lua:117
---@param args table {pos: {x,y,z}, rot?: {x,y,z,w}, id?: integer}
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_vehicle.set_position(args) end

