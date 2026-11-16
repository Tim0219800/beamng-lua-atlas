---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/shared.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- State and small helpers shared by the MCP tool modules (mcp/tools/*.lua). Loaded by `require('mcp/shared')`, therefore a singleton via the require cache (it is not an extension loaded by extensions.load in normal use). Contains the results of asynchronous calls (GE <-> vehicle VM / UI), the physics instability log and helpers to resolve the vehicle id and read beamng.log.
--- Access: extension `mcp_shared`: `extensions.load("mcp_shared")`, then the global `mcp_shared`
---@class mcp_shared
---@field asyncResults table<string, any> Results of asynchronous round trips, keyed by type: `vue`, `ui`, `vehLua` (table vehId -> result), `ai`, `electrics`, `hydro`, `testConfigs`. Filled by the `mcp_tools._cb.*` callbacks, consumed by the next tool call.
---@field instabilityLog table List (max 50) of detected physics instabilities: {time, vid, jbeam}. The code comment wrongly says "async round-trip results" for this field: it is indeed the instability log.
---@field vehIdProp table JSON schema fragment reused by vehicle tools: {id = {type='integer', description='Vehicle id (default: current player vehicle)'}}.
mcp_shared = {}

--- Model taken from args.model, otherwise the JBeam file of the current player vehicle.
---Source: lua/ge/extensions/mcp/shared.lua:22
---@param args table|nil Tool arguments; `model` field.
---@return string|nil  Model key, nil if there is neither argument nor player vehicle.
function mcp_shared.argModel(args) end

--- Vehicle id taken from args.id, otherwise that of player 0's vehicle.
---Source: lua/ge/extensions/mcp/shared.lua:16
---@param args table|nil Tool arguments; `id` field read with tonumber.
---@return integer  Vehicle id (can be -1 or invalid if there is no player vehicle).
function mcp_shared.argVehId(args) end

--- Reads beamng.log from byte `pos` to the end. With pos=nil, starts at the end (returns ""): used to measure the current size. If the file has shrunk (rotation, truncation), restarts from 0.
---Source: lua/ge/extensions/mcp/shared.lua:31
---@param pos integer|nil Byte offset to start from.
---@return string|nil  Text read (nil if the file could not be opened).
---@return integer  File size (end position) to reuse as the next `pos`.
function mcp_shared.readLogFrom(pos) end

--- Returns the spawned vehicle's data packet (parts, config, files, ioCtx) via core_vehicle_manager.getVehicleData.
---Source: lua/ge/extensions/mcp/shared.lua:19
---@param args table|nil Tool arguments (see argVehId).
---@return table|nil  Vehicle data, or nil.
function mcp_shared.vehData(args) end

