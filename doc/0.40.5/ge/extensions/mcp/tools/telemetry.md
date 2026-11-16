# `mcp_tools_telemetry`

*File: `lua/ge/extensions/mcp/tools/telemetry.lua` · VM: Game Engine (GE) · 88 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_telemetry`: `extensions.load("mcp_tools_telemetry")`, then the global `mcp_tools_telemetry`

MCP vehicle telemetry tools: electrics values (RPM, speed, gear, fuel…), damage summary, and a global GE-side state snapshot.

## Notes

- get_electrics is asynchronous (vehicle VM -> `_cb.electrics` callback -> shared.asyncResults.electrics): the call returns the result of the previous request.
- Without `keys`, only the scalar values (number, string, boolean) of electrics.values are returned.
- get_status does not include rpm/gear/AI (vehicle VM): use get_electrics and get_ai.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_telemetry.get_electrics(args)` | Fetches a vehicle's electrics.values (asynchronous). | 15 |
| `mcp_tools_telemetry.get_status()` | Snapshot: sim {physicsRunning, timeScale}, vehicleCount, level, camera {mode, pos}, player vehicle {id, jbeam, configKey, pos, speed (m/s), damage}. | 43 |
| `mcp_tools_telemetry.get_vehicle_damage(args)` | Damage summary: id and damageSum (veh:getSectionDamageSum()). | 32 |

### Parameter details

#### `mcp_tools_telemetry.get_electrics(args)`

Fetches a vehicle's electrics.values (asynchronous).

- `args` (*table|nil*) : {keys?: string[], id?: integer}
- **returns**: string Previous JSON or "requested (async)" message.
- **returns**: boolean true if the vehicle does not exist.

#### `mcp_tools_telemetry.get_status()`

Snapshot: sim {physicsRunning, timeScale}, vehicleCount, level, camera {mode, pos}, player vehicle {id, jbeam, configKey, pos, speed (m/s), damage}.

- **returns**: string JSON.
- **returns**: boolean false.

#### `mcp_tools_telemetry.get_vehicle_damage(args)`

Damage summary: id and damageSum (veh:getSectionDamageSum()).

- `args` (*table|nil*) : {id?: integer}
- **returns**: string JSON.
- **returns**: boolean true if the vehicle does not exist.

## Fields

| Field | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callback `electrics(vid, json)`: stores the JSON in shared.asyncResults.electrics. |
| `schemas` | table<string, table> | Schemas of the telemetry tools. |

## Calls into the engine (C++)

- `be:` `getPhysicsRunning`, `getPlayerVehicle`, `getSimulationTimeScale`, `queueObjectLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/telemetry.lua`.*
