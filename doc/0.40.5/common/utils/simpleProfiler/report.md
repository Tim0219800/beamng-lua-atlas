# `utils_simpleProfiler_report`

*File: `lua/common/utils/simpleProfiler/report.lua` · VM: Common (GE + vehicle) · 285 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/simpleProfiler/report")`

Generates a profiling report from the engine's 'simpleProfiler' journal (global simpleProfilerGetJournal): an interactive HTML page (bar/flame chart, via a mustache template) and a Markdown 'AI summary' next to it. Accessible as an extension: extensions.utils_simpleProfiler_report.createReport('vehicle_spawn'). A modder uses it to analyze where time is spent (e.g. loading a vehicle).

## Example

```lua
extensions.utils_simpleProfiler_report.createReport('vehicle_spawn', 'Pickup spawn', {vehicleName = 'pickup', durationFilterSec = 0.001, topN = 20})
```

## Notes

- Writes two files: <filebasename>.html and <filebasename>.summary.md (via writeFile, so relative to the working directory or the given path).
- The template read is 'lua/common/utils/simpleProfiler/interactiveBarChart.mustache.html'; if it is not found an error is logged and nothing is written.
- If simpleProfilerGetJournal does not exist (profiler not available), an error is logged and the function returns without doing anything.
- The comment at the top of the file gives the call: extensions.utils_simpleProfiler_report.createReport('vehicle_spawn.html'); note that the extension adds '.html' itself: passing 'vehicle_spawn.html' would produce 'vehicle_spawn.html.html' (inferred from code).
- Fields read from meta: durationFilterSec (seconds, minimum event duration filter), vehicleName, topN (30 by default), jbeamCached, meshCacheSummary {percentLoaded, totalFiles, loadedFiles, filesAlreadyInCache, totalMeshes, loadedMeshes}. meta is modified (durationFilterSec is written into it) and attached to root.meta.
- The Markdown summary aggregates by exact event name: total duration (inclusive), self duration (selfDuration = total minus direct children), call count, maxima; top N tables by self, total, calls, peaks, and an I/O section (names starting with readFile/readFiles).

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_simpleProfiler_report.createReport(filebasename, reportTitle, meta)` | Fetches the profiler journal (simpleProfilerGetJournal(true, filter)), produces the HTML page via lustache and the Markdown summary, then logs the created paths. | 241 |

### Parameter details

#### `utils_simpleProfiler_report.createReport(filebasename, reportTitle, meta)`

Fetches the profiler journal (simpleProfilerGetJournal(true, filter)), produces the HTML page via lustache and the Markdown summary, then logs the created paths.

- `filebasename` (*string|nil*) : Base name of the output files (without extension), 'profilerReport' by default
- `reportTitle` (*string|nil*) : Report title, 'Profiler Summary' by default
- `meta` (*table|nil*) : Optional metadata (see notes)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/simpleProfiler/report.lua`.*
