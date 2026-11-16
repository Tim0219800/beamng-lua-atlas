# `mcp_tools_spawn`

*File: `lua/ge/extensions/mcp/tools/spawn.lua` · VM: Game Engine (GE) · 109 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_spawn`: `extensions.load("mcp_tools_spawn")`, then the global `mcp_tools_spawn`

MCP spawn tools: list a model's configurations, spawn or replace a vehicle, and automatically test all of a model's configurations (spawn each one then collect log errors and physics instabilities). Useful for validating a vehicle mod.

## Notes

- test_configs is a state machine driven by onUpdate: phase 'spawn' (replaces the vehicle with the current config) then 'wait' (after `delay` seconds, reads the log). Only "|E|" error lines mentioning the model, "jbeam", "skin", "slot" or "flexbod" are counted; 3 examples max per config.
- test_configs call: first call = start; subsequent calls = progress {running, model, done, total, current}; at the end, one call returns the final report (which is then consumed).
- Configs are sorted by key.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_spawn.get_configs(args)` | Sorted list of a model's configuration keys (.pc) via core_vehicles.getModel. | 44 |
| `mcp_tools_spawn.onUpdate(dtReal)` | Called every frame: advances the configuration test (spawn, wait, analysis of the log and shared.instabilityLog, moving to the next config, final report in shared.asyncResults.testConfigs). *(internal)* *(hook)* | 12 |
| `mcp_tools_spawn.spawn(args)` | Spawns a vehicle: replaces the current vehicle (core_vehicles.replaceVehicle) or, with add=true, adds one (core_vehicles.spawnNewVehicle). | 56 |
| `mcp_tools_spawn.test_configs(args)` | Tests each config of a model (asynchronous, long). See the notes for the call protocol. | 67 |

### Parameter details

#### `mcp_tools_spawn.get_configs(args)`

Sorted list of a model's configuration keys (.pc) via core_vehicles.getModel.

- `args` (*table|nil*) : {model?: string} (default: player vehicle's model).
- **returns**: string JSON {model, configs}.
- **returns**: boolean true on error.

#### `mcp_tools_spawn.onUpdate(dtReal)`

Called every frame: advances the configuration test (spawn, wait, analysis of the log and shared.instabilityLog, moving to the next config, final report in shared.asyncResults.testConfigs).

- `dtReal` (*number*) : Real duration (s).

#### `mcp_tools_spawn.spawn(args)`

Spawns a vehicle: replaces the current vehicle (core_vehicles.replaceVehicle) or, with add=true, adds one (core_vehicles.spawnNewVehicle).

- `args` (*table|nil*) : {model?: string, config?: string (key or .pc path), add?: boolean}
- **returns**: string Confirmation message.
- **returns**: boolean true on error.

#### `mcp_tools_spawn.test_configs(args)`

Tests each config of a model (asynchronous, long). See the notes for the call protocol.

- `args` (*table|nil*) : {model?: string, delay?: number s of wait per config (default 3)}
- **returns**: string Progress JSON or report {model, total, results:[{config, ok, errorCount, errors, unstable}]}.
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of get_configs, spawn and test_configs. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/spawn.lua`.*
