---@meta
-- tim19Atlas stub generated from lua/common/luaProfiler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Profiler class (object returned by LuaProfiler).
---@class luaProfiler_C
local luaProfiler_C = {}

--- To be called after each code section to measure: records the time and memory since the last start/add under the name `section`, then restarts the timer. Logs an error if start() was not called.
---Source: lua/common/luaProfiler.lua:49
---@param section string|nil section name (nil = only reset the timer)
function luaProfiler_C:add(section) end

--- Ends the frame: computes the statistics and writes to the log the TOTAL line then one line per section (memory, duration, optional deviation from the average, graph). Then resets the timer and the sections.
---Source: lua/common/luaProfiler.lua:191
---@param compute boolean|nil false = compute and display nothing
---@param dt number|nil time step for the average/peak detection (enables detection)
---@param threshold number|nil minimum duration to display, default 0
---@return number|nil  total time of the frame's sections (nil if compute == false)
function luaProfiler_C:finish(compute, dt, threshold) end

--- Like finish but returns a serializable report instead of writing to the log: {title, detectPeaks, threshold, peakDetected, shouldOutput, total = {time, garbage, stats}, sections = [{section, runs, time, garbage, peakDetected, shouldOutput, graph, stats}]}.
---Source: lua/common/luaProfiler.lua:222
---@param dt number|nil time step for peak detection
---@param threshold number|nil minimum duration
---@return table  report
function luaProfiler_C:finishToTable(dt, threshold) end

--- Constructor: stores the title.
---Source: lua/common/luaProfiler.lua:44
---@param title string|nil title
function luaProfiler_C:init(title) end

--- Starts (or resets) the timer and the memory counter. To be called once per independent function to profile (with no common caller with another already profiled).
---Source: lua/common/luaProfiler.lua:183
function luaProfiler_C:start() end

--- GLOBAL function: creates a profiler (object of class C) and calls its init with the given arguments.
---Source: lua/common/luaProfiler.lua:229
---@param ... any
---@return table  profiler with methods start, add, finish, finishToTable
function LuaProfiler(...) end

