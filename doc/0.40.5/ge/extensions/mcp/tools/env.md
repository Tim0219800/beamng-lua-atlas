# `mcp_tools_env`

*File: `lua/ge/extensions/mcp/tools/env.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_env`: `extensions.load("mcp_tools_env")`, then the global `mcp_tools_env`

MCP tools for the environment: read and set the time of day and astronomical parameters (latitude, longitude, date, UTC offset, celestial profile) via core_environment. Only available in a level.

## Notes

- time is normalized 0..1 (0 or 1 = midnight, 0.5 = noon).
- set_time_of_day reads the current table, only modifies the provided fields, then reapplies it in full.
- dstRule: auto, eu, us, au or none (according to the schema).

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_env.get_time_of_day()` | Returns core_environment.getTimeOfDay() as JSON: time, play, dayLength, startTime, latitude, longitude, date, utcOffset, dstRule, celestialProfile. | 9 |
| `mcp_tools_env.set_time_of_day(args)` | Modifies the time and the provided astronomical fields then calls core_environment.setTimeOfDay. | 15 |

### Parameter details

#### `mcp_tools_env.get_time_of_day()`

Returns core_environment.getTimeOfDay() as JSON: time, play, dayLength, startTime, latitude, longitude, date, utcOffset, dstRule, celestialProfile.

- **returns**: string JSON or error "core_environment unavailable".
- **returns**: boolean true on error.

#### `mcp_tools_env.set_time_of_day(args)`

Modifies the time and the provided astronomical fields then calls core_environment.setTimeOfDay.

- `args` (*table|nil*) : {time?: 0..1, play?: boolean, dayLength?: number real s, startTime?: number, latitude?: number°, longitude?: number°, year?, month?, day?, utcOffset?: number h, dstRule?: string, celestialProfile?: string}
- **returns**: string "time of day set: time=…".
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the tools get_time_of_day and set_time_of_day. |

## Calls into the engine (C++)

- `core_environment.` `getTimeOfDay`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/env.lua`.*
