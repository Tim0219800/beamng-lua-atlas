---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP vehicle input tools: inject a control event (steering, throttle, brake…), test a "hydro" control round trip with error detection in the log, and run Lua in the VM of one or all vehicles.
--- Access: extension `mcp_tools_input`: `extensions.load("mcp_tools_input")`, then the global `mcp_tools_input`
---@class mcp_tools_input
---@field cb table<string, function> Callback `vehLua(vid, result)`: stores result in shared.asyncResults.vehLua[tostring(vid)].
---@field schemas table<string, table> Schemas of inject_input, test_hydro, run_lua_vehicle.
mcp_tools_input = {}

--- Sends input.event(event, value, filter) into the vehicle's VM via be:queueObjectLua.
---Source: lua/ge/extensions/mcp/tools/input.lua:43
---@param args table {event: string (steering, throttle, brake, parkingbrake, clutch…), value?: number (default 0, typ. -1..1 or 0..1), filter?: integer (default 2), id?: integer}
---@return string  Confirmation.
---@return boolean  true on error.
function mcp_tools_input.inject_input(args) end

--- Called every frame: advances the test_hydro sequence (timed steps 1 to 3) and, at the end, reads the errors from the log.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/tools/input.lua:26
---@param dtReal number Real duration (s).
function mcp_tools_input.onUpdate(dtReal) end

--- Runs Lua in a vehicle's VM (or all of them with all=true); asynchronous results.
---Source: lua/ge/extensions/mcp/tools/input.lua:66
---@param args table {code: string, id?: integer, all?: boolean}
---@return string  JSON of the previous results or "queued" message.
---@return boolean  true on error.
function mcp_tools_input.run_lua_vehicle(args) end

--- Runs the up/down/neutral test of an input event and detects logged errors. Asynchronous: call again after ~2 s.
---Source: lua/ge/extensions/mcp/tools/input.lua:54
---@param args table|nil {event?: string (default 'steering'), id?: integer}
---@return string  JSON {event, vid, ok, errors} from the previous test, or start message.
---@return boolean  true if the vehicle does not exist.
function mcp_tools_input.test_hydro(args) end

