---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/mcp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Telemetry tracker for MCP tool calls (the game's Model Context Protocol server): for each tool call, records the tool name and whether the call failed (event "mcpToolCalled"). Arguments and results are not reported.
--- Access: extension `telemetry_trackers_mcp`: `extensions.load("telemetry_trackers_mcp")`, then the global `telemetry_trackers_mcp`
---@class telemetry_trackers_mcp
---@field dependencies string[] telemetry_core.
telemetry_trackers_mcp = {}

--- Hook called on load: manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/mcp.lua:18
function telemetry_trackers_mcp.onExtensionLoaded() end

--- Hook called when an MCP tool is called: emits mcpToolCalled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/mcp.lua:10
---@param toolName string MCP tool name.
---@param isError boolean true if the call failed.
function telemetry_trackers_mcp.onMcpToolCalled(toolName, isError) end

