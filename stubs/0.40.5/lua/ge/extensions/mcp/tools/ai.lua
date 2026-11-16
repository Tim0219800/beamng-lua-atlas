---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/ai.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP tools for vehicle AI: read/modify its settings (mode, speed, aggression, target), send it to a point, and inspect the navgraph (AI and traffic road network). Module loaded by mcp_tools (require), not a standalone extension; each M.xxx function is an MCP tool whose arguments arrive in the `args` table. Tool return: (text, isError).
--- Access: extension `mcp_tools_ai`: `extensions.load("mcp_tools_ai")`, then the global `mcp_tools_ai`
---@class mcp_tools_ai
---@field cb table<string, function> Callbacks: `ai(vid, json)` stores the JSON in shared.asyncResults.ai.
---@field schemas table<string, table> Descriptions and inputSchema of the tools get_ai, set_ai, drive_to, get_navgraph.
mcp_tools_ai = {}

--- Sends the AI to a destination with ai.driveUsingPath: 'waypoint' (navgraph node name), or 'pos' {x,y,z}, or 'targetId' (current position of another object), snapped to the nearest road node (map.findClosestRoad). avoidCars is 'on' by default.
---Source: lua/ge/extensions/mcp/tools/ai.lua:48
---@param args table {waypoint?: string, pos?: {x,y,z}, targetId?: integer, routeSpeed?: number (m/s), routeSpeedMode?: 'limit'|'set' (default 'limit'), aggression?: number, avoidCars?: 'on'|'off', driveInLane?: 'on'|'off', id?: integer}
---@return string  Confirmation or error message (no nearby road, missing target).
---@return boolean  true on error.
function mcp_tools_ai.drive_to(args) end

--- Requests a vehicle's AI state (asynchronous). Sends a snippet to the vehicle VM that returns a JSON {mode, speedMode, routeSpeed, aggression, targetObjectID, avoidCars} (or {error='ai not loaded'}).
---Source: lua/ge/extensions/mcp/tools/ai.lua:18
---@param args table|nil {id?: integer} vehicle (default: player).
---@return string  JSON from the previous call, or "requested (async)" message.
---@return boolean  true if the vehicle does not exist.
function mcp_tools_ai.get_ai(args) end

--- Navgraph statistics (nodeCount, linkCount, bbox); with 'near'/'radius' or all=true, adds the nearby nodes (name, pos, radius, links with to/drivability/oneWay/speedLimit/len) and the closest road (closestRoad).
---Source: lua/ge/extensions/mcp/tools/ai.lua:76
---@param args table|nil {near?: {x,y,z} (default player vehicle or camera), radius?: number in m (default 100), all?: boolean, maxNodes?: integer (default 300)}
---@return string  JSON or error message ("navgraph not loaded").
---@return boolean  true on error.
function mcp_tools_ai.get_navgraph(args) end

--- Modifies the AI settings via ai.setState in the vehicle VM. Only passes the keys provided: mode, speedMode, routeSpeed, aggression (-> extAggression), targetObjectID, avoidCars (-> extAvoidCars).
---Source: lua/ge/extensions/mcp/tools/ai.lua:29
---@param args table {mode?, speedMode?, routeSpeed?, aggression?, targetObjectID?, avoidCars?, id?}. Error if no setting key is given.
---@return string  Confirmation with the applied JSON.
---@return boolean  true on error.
function mcp_tools_ai.set_ai(args) end

