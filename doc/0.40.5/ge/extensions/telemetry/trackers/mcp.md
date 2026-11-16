# `telemetry_trackers_mcp`

*File: `lua/ge/extensions/telemetry/trackers/mcp.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_mcp`: `extensions.load("telemetry_trackers_mcp")`, then the global `telemetry_trackers_mcp`

Telemetry tracker for MCP tool calls (the game's Model Context Protocol server): for each tool call, records the tool name and whether the call failed (event "mcpToolCalled"). Arguments and results are not reported.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_mcp.onExtensionLoaded()` | Hook called on load: manual unload. *(internal)* *(hook)* | 18 |
| `telemetry_trackers_mcp.onMcpToolCalled(toolName, isError)` | Hook called when an MCP tool is called: emits mcpToolCalled. *(internal)* *(hook)* | 10 |

### Parameter details

#### `telemetry_trackers_mcp.onMcpToolCalled(toolName, isError)`

Hook called when an MCP tool is called: emits mcpToolCalled.

- `toolName` (*string*) : MCP tool name.
- `isError` (*boolean*) : true if the call failed.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/mcp.lua`.*
