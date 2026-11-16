---@meta
-- tim19Atlas stub generated from lua/common/utils/simpleProfiler/report.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates a profiling report from the engine's 'simpleProfiler' journal (global simpleProfilerGetJournal): an interactive HTML page (bar/flame chart, via a mustache template) and a Markdown 'AI summary' next to it. Accessible as an extension: extensions.utils_simpleProfiler_report.createReport('vehicle_spawn'). A modder uses it to analyze where time is spent (e.g. loading a vehicle).
--- Access: `require("utils/simpleProfiler/report")`
---@class utils_simpleProfiler_report
local utils_simpleProfiler_report = {}

--- Fetches the profiler journal (simpleProfilerGetJournal(true, filter)), produces the HTML page via lustache and the Markdown summary, then logs the created paths.
---Source: lua/common/utils/simpleProfiler/report.lua:241
---@param filebasename string|nil Base name of the output files (without extension), 'profilerReport' by default
---@param reportTitle string|nil Report title, 'Profiler Summary' by default
---@param meta table|nil Optional metadata (see notes)
function utils_simpleProfiler_report.createReport(filebasename, reportTitle, meta) end

return utils_simpleProfiler_report
