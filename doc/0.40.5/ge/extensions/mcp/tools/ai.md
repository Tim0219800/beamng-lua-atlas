# `mcp_tools_ai`

*File: `lua/ge/extensions/mcp/tools/ai.lua` · VM: Game Engine (GE) · 170 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_ai`: `extensions.load("mcp_tools_ai")`, then the global `mcp_tools_ai`

MCP tools for vehicle AI: read/modify its settings (mode, speed, aggression, target), send it to a point, and inspect the navgraph (AI and traffic road network). Module loaded by mcp_tools (require), not a standalone extension; each M.xxx function is an MCP tool whose arguments arrive in the `args` table. Tool return: (text, isError).

## Notes

- get_ai is asynchronous (GE -> vehicle VM -> `_cb.ai` callback): the first call triggers the read and returns a message; the next call returns the JSON from the previous call.
- Mode values accepted by set_ai according to the schema: disabled, random, span, manual, chase, flee, stop, follow, traffic, script; speedMode: set, limit, legal, off; routeSpeed in m/s; aggression ~0.3 (calm) to 1.
- get_ai only returns: mode, speedMode, routeSpeed, aggression (key read from ai.extAggression), targetObjectID, avoidCars (ai.extAvoidCars).

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_ai.drive_to(args)` | Sends the AI to a destination with ai.driveUsingPath: 'waypoint' (navgraph node name), or 'pos' {x,y,z}, or 'targetId' (current position of another object), snapped to the nearest road node (map.findClosestRoad). avoidCars is 'on' by default. | 48 |
| `mcp_tools_ai.get_ai(args)` | Requests a vehicle's AI state (asynchronous). Sends a snippet to the vehicle VM that returns a JSON {mode, speedMode, routeSpeed, aggression, targetObjectID, avoidCars} (or {error='ai not loaded'}). | 18 |
| `mcp_tools_ai.get_navgraph(args)` | Navgraph statistics (nodeCount, linkCount, bbox); with 'near'/'radius' or all=true, adds the nearby nodes (name, pos, radius, links with to/drivability/oneWay/speedLimit/len) and the closest road (closestRoad). | 76 |
| `mcp_tools_ai.set_ai(args)` | Modifies the AI settings via ai.setState in the vehicle VM. Only passes the keys provided: mode, speedMode, routeSpeed, aggression (-> extAggression), targetObjectID, avoidCars (-> extAvoidCars). | 29 |

### Parameter details

#### `mcp_tools_ai.drive_to(args)`

Sends the AI to a destination with ai.driveUsingPath: 'waypoint' (navgraph node name), or 'pos' {x,y,z}, or 'targetId' (current position of another object), snapped to the nearest road node (map.findClosestRoad). avoidCars is 'on' by default.

- `args` (*table*) : {waypoint?: string, pos?: {x,y,z}, targetId?: integer, routeSpeed?: number (m/s), routeSpeedMode?: 'limit'|'set' (default 'limit'), aggression?: number, avoidCars?: 'on'|'off', driveInLane?: 'on'|'off', id?: integer}
- **returns**: string Confirmation or error message (no nearby road, missing target).
- **returns**: boolean true on error.

#### `mcp_tools_ai.get_ai(args)`

Requests a vehicle's AI state (asynchronous). Sends a snippet to the vehicle VM that returns a JSON {mode, speedMode, routeSpeed, aggression, targetObjectID, avoidCars} (or {error='ai not loaded'}).

- `args` (*table|nil*) : {id?: integer} vehicle (default: player).
- **returns**: string JSON from the previous call, or "requested (async)" message.
- **returns**: boolean true if the vehicle does not exist.

#### `mcp_tools_ai.get_navgraph(args)`

Navgraph statistics (nodeCount, linkCount, bbox); with 'near'/'radius' or all=true, adds the nearby nodes (name, pos, radius, links with to/drivability/oneWay/speedLimit/len) and the closest road (closestRoad).

- `args` (*table|nil*) : {near?: {x,y,z} (default player vehicle or camera), radius?: number in m (default 100), all?: boolean, maxNodes?: integer (default 300)}
- **returns**: string JSON or error message ("navgraph not loaded").
- **returns**: boolean true on error.

#### `mcp_tools_ai.set_ai(args)`

Modifies the AI settings via ai.setState in the vehicle VM. Only passes the keys provided: mode, speedMode, routeSpeed, aggression (-> extAggression), targetObjectID, avoidCars (-> extAvoidCars).

- `args` (*table*) : {mode?, speedMode?, routeSpeed?, aggression?, targetObjectID?, avoidCars?, id?}. Error if no setting key is given.
- **returns**: string Confirmation with the applied JSON.
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callbacks: `ai(vid, json)` stores the JSON in shared.asyncResults.ai. |
| `schemas` | table<string, table> | Descriptions and inputSchema of the tools get_ai, set_ai, drive_to, get_navgraph. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `queueObjectLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/ai.lua`.*
