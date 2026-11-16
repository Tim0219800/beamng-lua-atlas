# `mcp_tools_perf`

*File: `lua/ge/extensions/mcp/tools/perf.lua` · VM: Game Engine (GE) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_perf`: `extensions.load("mcp_tools_perf")`, then the global `mcp_tools_perf`

MCP performance tools: metrics of the last frame, FPS limiter reason, VRAM usage, and Optick profiler captures (BNG_PROFILER=OPTICK builds only).

## Notes

- profiler_run is non-blocking: a job (core_jobsystem) waits delay then captures for duration seconds then saves the .opt; only one at a time ("already running").
- Output path: by default <user folder>/optick/optick_YYYY-MM-DD_HH-MM-SS.opt; a relative path is placed under optick/; an absolute path (drive or UNC) is used as is.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_perf.get_fps_limit_reason()` | Current sources and caps of the FPS limiter (vsync, foreground/background limits, focus), via Engine.getCurrentFpsLimitReason. | 17 |
| `mcp_tools_perf.get_performance_metrics()` | Metrics of the last frame (timings, memory, counters) via Engine.Debug.getLastPerformanceMetrics, as JSON. | 9 |
| `mcp_tools_perf.get_vram_usage()` | Video memory usage via Engine.Render.getVRAMUsage. | 22 |
| `mcp_tools_perf.profiler_run(args)` | Triggers an Optick capture of `duration` seconds after `delay` and saves a .opt file; returns its path and the availability delay. | 52 |
| `mcp_tools_perf.run_optick_ui()` | Launches the external Optick interface (like the Ctrl+Alt+O shortcut) by calling the global function launchOptick if it exists. | 89 |

### Parameter details

#### `mcp_tools_perf.get_fps_limit_reason()`

Current sources and caps of the FPS limiter (vsync, foreground/background limits, focus), via Engine.getCurrentFpsLimitReason.

- **returns**: string JSON or error.
- **returns**: boolean true if unavailable.

#### `mcp_tools_perf.get_performance_metrics()`

Metrics of the last frame (timings, memory, counters) via Engine.Debug.getLastPerformanceMetrics, as JSON.

- **returns**: string JSON (empty object if the API is missing).
- **returns**: boolean false.

#### `mcp_tools_perf.get_vram_usage()`

Video memory usage via Engine.Render.getVRAMUsage.

- **returns**: string JSON (or tostring if it is not a table).
- **returns**: boolean true if unavailable.

#### `mcp_tools_perf.profiler_run(args)`

Triggers an Optick capture of `duration` seconds after `delay` and saves a .opt file; returns its path and the availability delay.

- `args` (*table|nil*) : {duration?: number s (default 5), delay?: number s (default 0), path?: string}
- **returns**: string JSON {ok, path, duration, delay, readyInSeconds, note} or error.
- **returns**: boolean true on error.

#### `mcp_tools_perf.run_optick_ui()`

Launches the external Optick interface (like the Ctrl+Alt+O shortcut) by calling the global function launchOptick if it exists.

- **returns**: string JSON {ok=true} (even if launchOptick is missing).
- **returns**: boolean false.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the performance tools. |

## Calls into the engine (C++)

- `Engine.` `getCurrentFpsLimitReason`
- `FS:` `directoryCreate`, `getUserPath`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/perf.lua`.*
