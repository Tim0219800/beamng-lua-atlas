---@meta
-- tim19Atlas stub generated from lua/common/utils/perf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small hook-based performance measurement library: while enabled, each Lua function call/return is timed, and per-function statistics are computed over time windows. Loaded with require('utils/perf'). Debugging only, slows execution heavily; can feed the debug UI via a guihooks event.
--- Access: global `perf`
---@class perf
---@field data table Last computed statistics (see notes). Empty until a window has completed.
perf = {}

--- Disables profiling and resets M.update to nop.
---Source: lua/common/utils/perf.lua:124
function perf.disable() end

--- Enables hook-based profiling ('call' and 'return' events).
---Source: lua/common/utils/perf.lua:116
---@param _windowSize number|nil Duration of a statistics window in seconds, 10 by default
---@param _guiHook string|nil guihooks.trigger event name to which M.data is sent on each window
---@param _srcData table|nil Fields added as is to M.data
function perf.enable(_windowSize, _guiHook, _srcData) end

--- Forces the computation of the current window's statistics (and resets the counters), then returns M.data.
---Source: lua/common/utils/perf.lua:89
---@return table  Statistics (see notes)
function perf.getData() end

--- Computes the current statistics and writes them to a CSV, sorted by descending score.
---Source: lua/common/utils/perf.lua:94
---@param filename string Output file
---@return boolean|nil  false if it cannot be opened, nil otherwise
function perf.saveDataToCSV(filename) end

--- To be called every frame once enabled: counts frames and triggers the statistics computation at each elapsed window. nop if disabled.
---Source: lua/common/utils/perf.lua:38
function perf.update() end

