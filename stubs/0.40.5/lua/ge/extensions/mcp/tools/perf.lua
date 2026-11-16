---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/perf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP performance tools: metrics of the last frame, FPS limiter reason, VRAM usage, and Optick profiler captures (BNG_PROFILER=OPTICK builds only).
--- Access: extension `mcp_tools_perf`: `extensions.load("mcp_tools_perf")`, then the global `mcp_tools_perf`
---@class mcp_tools_perf
---@field schemas table<string, table> Schemas of the performance tools.
mcp_tools_perf = {}

--- Current sources and caps of the FPS limiter (vsync, foreground/background limits, focus), via Engine.getCurrentFpsLimitReason.
---Source: lua/ge/extensions/mcp/tools/perf.lua:17
---@return string  JSON or error.
---@return boolean  true if unavailable.
function mcp_tools_perf.get_fps_limit_reason() end

--- Metrics of the last frame (timings, memory, counters) via Engine.Debug.getLastPerformanceMetrics, as JSON.
---Source: lua/ge/extensions/mcp/tools/perf.lua:9
---@return string  JSON (empty object if the API is missing).
---@return boolean  false.
function mcp_tools_perf.get_performance_metrics() end

--- Video memory usage via Engine.Render.getVRAMUsage.
---Source: lua/ge/extensions/mcp/tools/perf.lua:22
---@return string  JSON (or tostring if it is not a table).
---@return boolean  true if unavailable.
function mcp_tools_perf.get_vram_usage() end

--- Triggers an Optick capture of `duration` seconds after `delay` and saves a .opt file; returns its path and the availability delay.
---Source: lua/ge/extensions/mcp/tools/perf.lua:52
---@param args table|nil {duration?: number s (default 5), delay?: number s (default 0), path?: string}
---@return string  JSON {ok, path, duration, delay, readyInSeconds, note} or error.
---@return boolean  true on error.
function mcp_tools_perf.profiler_run(args) end

--- Launches the external Optick interface (like the Ctrl+Alt+O shortcut) by calling the global function launchOptick if it exists.
---Source: lua/ge/extensions/mcp/tools/perf.lua:89
---@return string  JSON {ok=true} (even if launchOptick is missing).
---@return boolean  false.
function mcp_tools_perf.run_optick_ui() end

