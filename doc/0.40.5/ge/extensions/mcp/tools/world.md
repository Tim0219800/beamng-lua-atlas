# `mcp_tools_world`

*File: `lua/ge/extensions/mcp/tools/world.lua` · VM: Game Engine (GE) · 117 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_world`: `extensions.load("mcp_tools_world")`, then the global `mcp_tools_world`

MCP "world" tools: list and load levels, trigger a bound input action (like a key press), recover or delete a vehicle, and query the ground (height, grip/drivability) at a point.

## Notes

- Inconsistency: list_levels returns the key `file` for each level, whereas the schema description announces `[{name, title, path}]`.
- load_level is disruptive (reloads the world). It looks up the level by levelName in core_levels.getList(), otherwise by path.getPathLevelMain(name).
- trigger_action uses core_input_actions.triggerDown/triggerUp/triggerDownUp; without state it is a brief press.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_world.get_ground_at_point(args)` | Surface height under a point (be:getSurfaceHeightBelow) and terrain drivability (be:getTerrainDrivability) within a radius. | 67 |
| `mcp_tools_world.list_levels()` | Lists the installed levels: name (levelName), title, file (fullfilename or misFilePath). | 12 |
| `mcp_tools_world.load_level(args)` | Loads a level (core_levels.startLevel) by path or by name. | 22 |
| `mcp_tools_world.recover_vehicle(args)` | Puts the vehicle back on the last road and repairs it (spawn.teleportToLastRoad with resetVehicle). | 49 |
| `mcp_tools_world.remove_vehicle(args)` | Deletes a vehicle (veh:delete()). | 58 |
| `mcp_tools_world.trigger_action(args)` | Triggers a game input action by its name (e.g. recover_vehicle, toggleCamera, switch_next_vehicle). | 38 |

### Parameter details

#### `mcp_tools_world.get_ground_at_point(args)`

Surface height under a point (be:getSurfaceHeightBelow) and terrain drivability (be:getTerrainDrivability) within a radius.

- `args` (*table|nil*) : {pos?: {x,y,z} (default player vehicle position), radius?: number m (default 2)}
- **returns**: string JSON {pos, surfaceHeight, drivability}.
- **returns**: boolean true if no point.

#### `mcp_tools_world.list_levels()`

Lists the installed levels: name (levelName), title, file (fullfilename or misFilePath).

- **returns**: string JSON.
- **returns**: boolean true if core_levels is unavailable.

#### `mcp_tools_world.load_level(args)`

Loads a level (core_levels.startLevel) by path or by name.

- `args` (*table*) : {path?: string, name?: string}
- **returns**: string "loading level: …".
- **returns**: boolean true on error.

#### `mcp_tools_world.recover_vehicle(args)`

Puts the vehicle back on the last road and repairs it (spawn.teleportToLastRoad with resetVehicle).

- `args` (*table|nil*) : {id?: integer}
- **returns**: string Message.
- **returns**: boolean true on error.

#### `mcp_tools_world.remove_vehicle(args)`

Deletes a vehicle (veh:delete()).

- `args` (*table|nil*) : {id?: integer}
- **returns**: string Message.
- **returns**: boolean true if the vehicle does not exist.

#### `mcp_tools_world.trigger_action(args)`

Triggers a game input action by its name (e.g. recover_vehicle, toggleCamera, switch_next_vehicle).

- `args` (*table*) : {action: string, state?: 'down'|'up'}
- **returns**: string Message.
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the world tools. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `getSurfaceHeightBelow`, `getTerrainDrivability`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/world.lua`.*
