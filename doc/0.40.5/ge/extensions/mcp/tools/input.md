# `mcp_tools_input`

*File: `lua/ge/extensions/mcp/tools/input.lua` · VM: Game Engine (GE) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_input`: `extensions.load("mcp_tools_input")`, then the global `mcp_tools_input`

MCP vehicle input tools: inject a control event (steering, throttle, brake…), test a "hydro" control round trip with error detection in the log, and run Lua in the VM of one or all vehicles.

## Notes

- run_lua_vehicle is asynchronous: it returns the results of the PREVIOUS call (JSON vehId -> result) and launches the new one; call again to get the latest. The code is compiled with loadstring in the vehicle VM, errors caught by pcall.
- test_hydro chains input.event(event, 1) -> (0.6 s) -> -1 -> (0.6 s) -> 0 -> (0.3 s) then scans beamng.log for "|E|" lines; result in shared.asyncResults.hydro, returned on the next call.
- filter 2 = FILTER_DIRECT (default value).
- Security warning: run_lua_vehicle runs arbitrary code in the vehicle VMs.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_input.inject_input(args)` | Sends input.event(event, value, filter) into the vehicle's VM via be:queueObjectLua. | 43 |
| `mcp_tools_input.onUpdate(dtReal)` | Called every frame: advances the test_hydro sequence (timed steps 1 to 3) and, at the end, reads the errors from the log. *(internal)* *(hook)* | 26 |
| `mcp_tools_input.run_lua_vehicle(args)` | Runs Lua in a vehicle's VM (or all of them with all=true); asynchronous results. | 66 |
| `mcp_tools_input.test_hydro(args)` | Runs the up/down/neutral test of an input event and detects logged errors. Asynchronous: call again after ~2 s. | 54 |

### Parameter details

#### `mcp_tools_input.inject_input(args)`

Sends input.event(event, value, filter) into the vehicle's VM via be:queueObjectLua.

- `args` (*table*) : {event: string (steering, throttle, brake, parkingbrake, clutch…), value?: number (default 0, typ. -1..1 or 0..1), filter?: integer (default 2), id?: integer}
- **returns**: string Confirmation.
- **returns**: boolean true on error.

#### `mcp_tools_input.onUpdate(dtReal)`

Called every frame: advances the test_hydro sequence (timed steps 1 to 3) and, at the end, reads the errors from the log.

- `dtReal` (*number*) : Real duration (s).

#### `mcp_tools_input.run_lua_vehicle(args)`

Runs Lua in a vehicle's VM (or all of them with all=true); asynchronous results.

- `args` (*table*) : {code: string, id?: integer, all?: boolean}
- **returns**: string JSON of the previous results or "queued" message.
- **returns**: boolean true on error.

#### `mcp_tools_input.test_hydro(args)`

Runs the up/down/neutral test of an input event and detects logged errors. Asynchronous: call again after ~2 s.

- `args` (*table|nil*) : {event?: string (default 'steering'), id?: integer}
- **returns**: string JSON {event, vid, ok, errors} from the previous test, or start message.
- **returns**: boolean true if the vehicle does not exist.

## Fields

| Field | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callback `vehLua(vid, result)`: stores result in shared.asyncResults.vehLua[tostring(vid)]. |
| `schemas` | table<string, table> | Schemas of inject_input, test_hydro, run_lua_vehicle. |

## Calls into the engine (C++)

- `be:` `queueAllObjectLua`, `queueObjectLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/input.lua`.*
