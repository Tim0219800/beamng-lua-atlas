# `mcp_tools_vehicle`

*File: `lua/ge/extensions/mcp/tools/vehicle.lua` · VM: Game Engine (GE) · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_vehicle`: `extensions.load("mcp_tools_vehicle")`, then the global `mcp_tools_vehicle`

MCP vehicle tools: list, detail, JBeam files and part tree, physics instability log, reset/reload of the player vehicle, reading and writing the pose (position + rotation).

## Notes

- get_instability clears the buffer after reading, unless clear=false; the log keeps 50 events maximum ({time, vid, jbeam}).
- get_position/set_position use the rotation as a quaternion {x,y,z,w} computed with quatFromDir(direction, up); set_position goes through spawn.safeTeleport (teleports and repairs).
- reset_vehicle and reload_vehicle only concern player 0's vehicle (no id argument).

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_vehicle.get_instability(args)` | Returns the logged physics instabilities and clears the buffer by default. | 86 |
| `mcp_tools_vehicle.get_part_tree(args)` | Parts config as a table slot path -> chosen part name (flattened config.partsTree). | 72 |
| `mcp_tools_vehicle.get_player_vehicle_id()` | Player 0's vehicle id (be:getPlayerVehicleID(0)) as text. | 33 |
| `mcp_tools_vehicle.get_position(args)` | Pose of a vehicle: pos {x,y,z} and quaternion rot {x,y,z,w}. | 107 |
| `mcp_tools_vehicle.get_vehicle(args)` | Details: id, jbeam, name, configKey, pcFile, position, speed (m/s). | 37 |
| `mcp_tools_vehicle.get_vehicle_files(args)` | Files used: vehicleDirectory, directoriesLoaded, pcFile and sorted list of the JBeam files of the active parts (jbeam/io getPart). | 55 |
| `mcp_tools_vehicle.get_vehicles()` | Lists the spawned vehicles: id, jbeam, display name (brand + name). | 18 |
| `mcp_tools_vehicle.onInstabilityDetected(vid, returnData)` | Engine hook (relayed by mcp_tools) called when the physics detects an unstable vehicle: appends {time, vid, jbeam} to shared.instabilityLog (50 max). *(internal)* *(hook)* | 11 |
| `mcp_tools_vehicle.reload_vehicle()` | Reloads the player vehicle from disk (core_vehicle_manager.reloadVehicle(0)), which re-reads its JBeam. | 99 |
| `mcp_tools_vehicle.reset_vehicle()` | Resets/repairs the player vehicle in place (be:resetVehicle(0)). | 92 |
| `mcp_tools_vehicle.set_position(args)` | Teleports a vehicle to a pose via spawn.safeTeleport; rot optional (keeps the current heading). | 117 |

### Parameter details

#### `mcp_tools_vehicle.get_instability(args)`

Returns the logged physics instabilities and clears the buffer by default.

- `args` (*table|nil*) : {clear?: boolean} false to keep.
- **returns**: string JSON {count, events}.
- **returns**: boolean false.

#### `mcp_tools_vehicle.get_part_tree(args)`

Parts config as a table slot path -> chosen part name (flattened config.partsTree).

- `args` (*table|nil*) : {id?: integer}
- **returns**: string JSON.
- **returns**: boolean true if no tree.

#### `mcp_tools_vehicle.get_player_vehicle_id()`

Player 0's vehicle id (be:getPlayerVehicleID(0)) as text.

- **returns**: string Id.
- **returns**: boolean false.

#### `mcp_tools_vehicle.get_position(args)`

Pose of a vehicle: pos {x,y,z} and quaternion rot {x,y,z,w}.

- `args` (*table|nil*) : {id?: integer}
- **returns**: string JSON {id, pos, rot}.
- **returns**: boolean true if the vehicle does not exist.

#### `mcp_tools_vehicle.get_vehicle(args)`

Details: id, jbeam, name, configKey, pcFile, position, speed (m/s).

- `args` (*table|nil*) : {id?: integer}
- **returns**: string JSON.
- **returns**: boolean true if the vehicle does not exist.

#### `mcp_tools_vehicle.get_vehicle_files(args)`

Files used: vehicleDirectory, directoriesLoaded, pcFile and sorted list of the JBeam files of the active parts (jbeam/io getPart).

- `args` (*table|nil*) : {id?: integer}
- **returns**: string JSON.
- **returns**: boolean true if no vehicle data.

#### `mcp_tools_vehicle.get_vehicles()`

Lists the spawned vehicles: id, jbeam, display name (brand + name).

- **returns**: string JSON.
- **returns**: boolean false.

#### `mcp_tools_vehicle.onInstabilityDetected(vid, returnData)`

Engine hook (relayed by mcp_tools) called when the physics detects an unstable vehicle: appends {time, vid, jbeam} to shared.instabilityLog (50 max).

- `vid` (*integer*) : Vehicle id.
- `returnData` (*any*) : Provided by the engine, unused.

#### `mcp_tools_vehicle.reload_vehicle()`

Reloads the player vehicle from disk (core_vehicle_manager.reloadVehicle(0)), which re-reads its JBeam.

- **returns**: string Message.
- **returns**: boolean true if there is no player vehicle.

#### `mcp_tools_vehicle.reset_vehicle()`

Resets/repairs the player vehicle in place (be:resetVehicle(0)).

- **returns**: string Message.
- **returns**: boolean true if there is no player vehicle.

#### `mcp_tools_vehicle.set_position(args)`

Teleports a vehicle to a pose via spawn.safeTeleport; rot optional (keeps the current heading).

- `args` (*table*) : {pos: {x,y,z}, rot?: {x,y,z,w}, id?: integer}
- **returns**: string Message.
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the vehicle tools. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`, `resetVehicle`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/vehicle.lua`.*
