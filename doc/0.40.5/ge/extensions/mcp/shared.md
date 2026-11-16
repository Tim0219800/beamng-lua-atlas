# `mcp_shared`

*File: `lua/ge/extensions/mcp/shared.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_shared`: `extensions.load("mcp_shared")`, then the global `mcp_shared`

State and small helpers shared by the MCP tool modules (mcp/tools/*.lua). Loaded by `require('mcp/shared')`, therefore a singleton via the require cache (it is not an extension loaded by extensions.load in normal use). Contains the results of asynchronous calls (GE <-> vehicle VM / UI), the physics instability log and helpers to resolve the vehicle id and read beamng.log.

## Example

```lua
local shared = require('mcp/shared')
local vid = shared.argVehId({id = 12})   -- 12, or the player vehicle if id is absent
local text, eof = shared.readLogFrom(nil) -- eof = current size of the log
```

## Notes

- readLogFrom opens `beamng.log` relative to the current directory (game folder / user folder depending on launch); returns nil if the file is not found.
- instabilityLog is fed by mcp/tools/vehicle.lua (onInstabilityDetected hook, 50 entries max).

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_shared.argModel(args)` | Model taken from args.model, otherwise the JBeam file of the current player vehicle. | 22 |
| `mcp_shared.argVehId(args)` | Vehicle id taken from args.id, otherwise that of player 0's vehicle. | 16 |
| `mcp_shared.readLogFrom(pos)` | Reads beamng.log from byte `pos` to the end. With pos=nil, starts at the end (returns ""): used to measure the current size. If the file has shrunk (rotation, truncation), restarts from 0. | 31 |
| `mcp_shared.vehData(args)` | Returns the spawned vehicle's data packet (parts, config, files, ioCtx) via core_vehicle_manager.getVehicleData. | 19 |

### Parameter details

#### `mcp_shared.argModel(args)`

Model taken from args.model, otherwise the JBeam file of the current player vehicle.

- `args` (*table|nil*) : Tool arguments; `model` field.
- **returns**: string|nil Model key, nil if there is neither argument nor player vehicle.

#### `mcp_shared.argVehId(args)`

Vehicle id taken from args.id, otherwise that of player 0's vehicle.

- `args` (*table|nil*) : Tool arguments; `id` field read with tonumber.
- **returns**: integer Vehicle id (can be -1 or invalid if there is no player vehicle).

#### `mcp_shared.readLogFrom(pos)`

Reads beamng.log from byte `pos` to the end. With pos=nil, starts at the end (returns ""): used to measure the current size. If the file has shrunk (rotation, truncation), restarts from 0.

- `pos` (*integer|nil*) : Byte offset to start from.
- **returns**: string|nil Text read (nil if the file could not be opened).
- **returns**: integer File size (end position) to reuse as the next `pos`.

#### `mcp_shared.vehData(args)`

Returns the spawned vehicle's data packet (parts, config, files, ioCtx) via core_vehicle_manager.getVehicleData.

- `args` (*table|nil*) : Tool arguments (see argVehId).
- **returns**: table|nil Vehicle data, or nil.

## Fields

| Field | Type | Description |
|---|---|---|
| `asyncResults` | table<string, any> | Results of asynchronous round trips, keyed by type: `vue`, `ui`, `vehLua` (table vehId -> result), `ai`, `electrics`, `hydro`, `testConfigs`. Filled by the `mcp_tools._cb.*` callbacks, consumed by the next tool call. |
| `instabilityLog` | table | List (max 50) of detected physics instabilities: {time, vid, jbeam}. The code comment wrongly says "async round-trip results" for this field: it is indeed the instability log. |
| `vehIdProp` | table | JSON schema fragment reused by vehicle tools: {id = {type='integer', description='Vehicle id (default: current player vehicle)'}}. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/shared.lua`.*
