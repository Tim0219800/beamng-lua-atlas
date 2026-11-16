# `perf`

*File: `lua/common/utils/perf.lua` · VM: Common (GE + vehicle) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `perf`

Small hook-based performance measurement library: while enabled, each Lua function call/return is timed, and per-function statistics are computed over time windows. Loaded with require('utils/perf'). Debugging only, slows execution heavily; can feed the debug UI via a guihooks event.

## Example

```lua
local perf = require('utils/perf')
perf.enable(1)
-- code to measure, and perf.update() every frame
perf.disable()
perf.saveDataToCSV('vehicleloading.csv')
```

## Notes

- enable() replaces any existing debug hook; disable() removes it (debug.sethook()).
- M.update is nop until enable() has been called: perf.update() must be called every frame once enabled.
- M.data contains {frameCount, size, memory, fcts = {{f=name, t=cumulative time, c=call count, s=score}}} plus the fields of srcData; memory comes from gcinfo().
- The score s = t * c / (windowSize * 1000): product of cumulative time x calls (odd formula, inferred from code; it is not a simple average time).
- Inconsistency: the default window of enable() is 10 s whereas the module variable windowSize is initialized to 2.
- saveDataToCSV writes the header ';function, time' then 'name, score' lines sorted by descending score; returns false if the file cannot be opened, but nothing (nil) on success.

## Functions

| Function | Description | Line |
|---|---|---|
| `perf.disable()` | Disables profiling and resets M.update to nop. | 124 |
| `perf.enable(_windowSize, _guiHook, _srcData)` | Enables hook-based profiling ('call' and 'return' events). | 116 |
| `perf.getData()` | Forces the computation of the current window's statistics (and resets the counters), then returns M.data. | 89 |
| `perf.saveDataToCSV(filename)` | Computes the current statistics and writes them to a CSV, sorted by descending score. | 94 |
| `perf.update()` | To be called every frame once enabled: counts frames and triggers the statistics computation at each elapsed window. nop if disabled. | 38 |

### Parameter details

#### `perf.enable(_windowSize, _guiHook, _srcData)`

Enables hook-based profiling ('call' and 'return' events).

- `_windowSize` (*number|nil*) : Duration of a statistics window in seconds, 10 by default
- `_guiHook` (*string|nil*) : guihooks.trigger event name to which M.data is sent on each window
- `_srcData` (*table|nil*) : Fields added as is to M.data

#### `perf.getData()`

Forces the computation of the current window's statistics (and resets the counters), then returns M.data.

- **returns**: table Statistics (see notes)

#### `perf.saveDataToCSV(filename)`

Computes the current statistics and writes them to a CSV, sorted by descending score.

- `filename` (*string*) : Output file
- **returns**: boolean|nil false if it cannot be opened, nil otherwise

## Fields

| Field | Type | Description |
|---|---|---|
| `data` | table | Last computed statistics (see notes). Empty until a window has completed. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/perf.lua`.*
