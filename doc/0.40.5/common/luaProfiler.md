# `luaProfiler`

*File: `lua/common/luaProfiler.lua` · VM: Common (GE + vehicle) · 235 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("luaProfiler")`

Small Lua code-section profiler. You create a profiler with LuaProfiler(title), call p:start() at the beginning of a function, p:add('name') after each section to measure (time and allocated memory), then p:finish(...) at the end to write the durations, the memory and a small graph to the log, with optional peak detection against a smoothed average. Useful for finding the slow or garbage-generating parts of a mod.

## Example

```lua
local p = LuaProfiler('mon profileur')
function updateGFX(dt)
  p:start()
  foo()
  p:add('foo')
  bar()
  p:add('bar')
  p:finish(true)            -- display every frame
  -- p:finish(dt > 0, dt)   -- with peak detection
  -- p:finish(true, nil, 0.002) -- hide sections < 2 ms
end
```

## Notes

- ACTUAL SIGNATURE: finish(compute, dt, threshold); finishToTable(dt, threshold). The extracted page showed finish(dt, threshold), which is inaccurate.
- compute == false disables all computation and logging (quick way to turn profiling off without removing the add() calls). dt (number) enables the average computation and peak detection; threshold = minimum duration to display a line.
- Several add() with the same name in the same frame are accumulated (field runs, displayed '(xN)'). start() and add() reset the timer: measuring independent functions requires one start() each.
- Durations are displayed in 'ms' in the messages (value returned by the high-precision timer, HighPerfTimer or hptimer) and memory in bytes (collectgarbage('count')*1024).
- In the code, `peakDetected = true` is assigned unconditionally in computeFrameResult right after its computation: the global peak detection is therefore always true (only the per-section test on deltaRel > 0.3 filters).
- Uses game globals: log, newTemporalSmoothing (filters.lua), lpad, graphs, HighPerfTimer/hptimer.
- The example comment in the code contains a mistake (`p.add` and `done`), ignore it: the correct syntax is p:add and end.

## Class `C`

Profiler class (object returned by LuaProfiler).

| Method | Description | Line |
|---|---|---|
| `C:add(section)` | To be called after each code section to measure: records the time and memory since the last start/add under the name `section`, then restarts the timer. Logs an error if start() was not called. | 49 |
| `C:finish(compute, dt, threshold)` | Ends the frame: computes the statistics and writes to the log the TOTAL line then one line per section (memory, duration, optional deviation from the average, graph). Then resets the timer and the sections. | 191 |
| `C:finishToTable(dt, threshold)` | Like finish but returns a serializable report instead of writing to the log: {title, detectPeaks, threshold, peakDetected, shouldOutput, total = {time, garbage, stats}, sections = [{section, runs, time, garbage, peakDetected, shouldOutput, graph, stats}]}. | 222 |
| `C:init(title)` | Constructor: stores the title. | 44 |
| `C:start()` | Starts (or resets) the timer and the memory counter. To be called once per independent function to profile (with no common caller with another already profiled). | 183 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `LuaProfiler(...)` | GLOBAL function: creates a profiler (object of class C) and calls its init with the given arguments. | 229 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/luaProfiler.lua`.*
