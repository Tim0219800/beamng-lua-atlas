# `core_hardwareinfo`

*File: `lua/ge/extensions/core/hardwareinfo.lua` · VM: Game Engine (GE) · 253 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_hardwareinfo`: `extensions.load("core_hardwareinfo")`, then the global `core_hardwareinfo`

GE extension `core_hardwareinfo`: collects hardware and system information (OS, memory, CPU, GPU, battery, disk, mods) via Engine.Platform, computes performance warnings (insufficient memory, integrated Intel GPU, too many mods, nearly full disk, modified game files, OneDrive folder, pirated version) and sends them to the UI. Also handles the "bananabench" physics benchmark and the disk space analysis. Useful to a modder to read the machine's characteristics.

## Example

```lua
local info = core_hardwareinfo.getInfo()
print(info.gpu.name, info.mem.osPhysAvailable, info.globalState)   -- 'ok' | 'warn' | 'error'
```

## Notes

- Structure of the getInfo result: os, pwr, mem, cpu, gpu, disk, mods (or {state='load'} until core_modmanager is ready), hs (pirated version), plus globalState ('ok'/'warn'/'error') and sailingTheHighSeas. Each sub-table has warnings = [{type 'warn'|'error', msg, context?, ack?}] and state (the worst level).
- Memory in bytes. For an x64 build: processPhysUsedPercent, osPhysUsedPercent, processVirtUsedPercent, osVirtUsedPercent are fractions 0..1 (division by osPhysAvailable / osVirtAvailable, which seem to be the totals despite their name, inferred from code).
- Warning thresholds: physical memory < 60 % of 16 GB (9.6 GB) -> 'minmem'; otherwise less than 1 GB free -> 'freememlow'; GPU whose name contains 'intel' (excluding 'arc(tm)' and 'bmg') -> error 'intelgpu'; mods: >10 unpacked folders or >100 zips = warning, >20 or >150 = error ('toomanymods'); free space on root or user < 1 GB -> 'lowfreespace'; root size outside [integrity size - 10 MB; + 256 MB] -> 'rootmodified'; user path containing OneDrive -> 'onedrive'.
- A warning already acknowledged (setting PerformanceWarnings.<msg> set to true) receives ack = true. For each warning, the extensions hook onPerformanceHardwareWarning(section key, warning) is emitted on every getInfo call.
- The integrity test computes originalSize from integrity.json starting at -1 (not 0): one-byte offset with no practical consequence.
- Inconsistencies: the exported name M.latestBananbench (typo, 'Bananbench') points to readBananabenchFile; disableHwWarnings and sailingTheHighSeas are globals not defined here; getInfo calls M.runDiskUsage() inside the computation, which sends the already known disk data back to the UI.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_hardwareinfo.acknowledgeWarning(warning)` | Records in the settings that the user has acknowledged a warning (PerformanceWarnings.<warning> = true) and sends the state back to the UI. | 202 |
| `core_hardwareinfo.diskInfoCallback(data)` | Callback called by the engine during/after the disk analysis: relays to the UI; at the end (data.running false) stores the result and refreshes the report. *(internal)* | 211 |
| `core_hardwareinfo.getInfo()` | Builds and returns the complete hardware report with warnings and states (see notes). | 10 |
| `core_hardwareinfo.latestBananbench()` | Reads 'bananabench.json' (last benchmark). Name exported with a typo. | 194 |
| `core_hardwareinfo.latestBenchmarkExists()` | Indicates whether 'bananabench.json' exists. | 198 |
| `core_hardwareinfo.logInfo(filename)` | Writes the raw memory, CPU, GPU, OS and power information to a JSON file (without warnings). | 164 |
| `core_hardwareinfo.onBananaBenchReady(outFilename)` | Hook called by the engine when the benchmark is finished: reads the result file and sends it to the UI (guihooks BananaBenchReady, nil if the file is absent). *(internal)* *(hook)* | 183 |
| `core_hardwareinfo.onModManagerReady()` | Hook called when the mod manager is ready: sends the up-to-date report to the UI. *(internal)* *(hook)* | 207 |
| `core_hardwareinfo.requestInfo()` | Computes the report (getInfo) and sends it to the UI via guihooks 'HardwareInfo'. | 157 |
| `core_hardwareinfo.runDiskUsage()` | Launches the C++ disk space analysis if it has not already been done; otherwise sends the known results back to the UI (guihooks diskInfoCallback). | 225 |
| `core_hardwareinfo.runPhysicsBenchmark()` | Deletes the old 'bananabench.json' and launches the C++ physics benchmark (Engine.Platform.runBananaBench). The result arrives via onBananaBenchReady. | 175 |

### Parameter details

#### `core_hardwareinfo.acknowledgeWarning(warning)`

Records in the settings that the user has acknowledged a warning (PerformanceWarnings.<warning> = true) and sends the state back to the UI.

- `warning` (*string*) : msg code of the warning (e.g. 'toomanymods').

#### `core_hardwareinfo.diskInfoCallback(data)`

Callback called by the engine during/after the disk analysis: relays to the UI; at the end (data.running false) stores the result and refreshes the report.

- `data` (*table*) : Analysis data: running, name, size…

#### `core_hardwareinfo.getInfo()`

Builds and returns the complete hardware report with warnings and states (see notes).

- **returns**: table Report {os, pwr, mem, cpu, gpu, disk, mods, hs?, globalState, sailingTheHighSeas}.

#### `core_hardwareinfo.latestBananbench()`

Reads 'bananabench.json' (last benchmark). Name exported with a typo.

- **returns**: table|nil Benchmark result or nil.

#### `core_hardwareinfo.latestBenchmarkExists()`

Indicates whether 'bananabench.json' exists.

- **returns**: boolean true if the file exists.

#### `core_hardwareinfo.logInfo(filename)`

Writes the raw memory, CPU, GPU, OS and power information to a JSON file (without warnings).

- `filename` (*string*) : Path of the output JSON file.

#### `core_hardwareinfo.onBananaBenchReady(outFilename)`

Hook called by the engine when the benchmark is finished: reads the result file and sends it to the UI (guihooks BananaBenchReady, nil if the file is absent).

- `outFilename` (*string*) : Path of the result file.
- **returns**: nil nil if the file does not exist, otherwise nothing.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPerformanceHardwareWarning` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `BananaBenchReady`, `HardwareInfo`, `diskInfoCallback`

## Calls into the engine (C++)

- `FS:` `fileExists`, `getUserPath`, `isGamePathCaseSensitive`, `isUserPathCaseSensitive`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/hardwareinfo.lua`.*
