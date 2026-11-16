---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/hardwareinfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_hardwareinfo`: collects hardware and system information (OS, memory, CPU, GPU, battery, disk, mods) via Engine.Platform, computes performance warnings (insufficient memory, integrated Intel GPU, too many mods, nearly full disk, modified game files, OneDrive folder, pirated version) and sends them to the UI. Also handles the "bananabench" physics benchmark and the disk space analysis. Useful to a modder to read the machine's characteristics.
--- Access: extension `core_hardwareinfo`: `extensions.load("core_hardwareinfo")`, then the global `core_hardwareinfo`
---@class core_hardwareinfo
core_hardwareinfo = {}

--- Records in the settings that the user has acknowledged a warning (PerformanceWarnings.<warning> = true) and sends the state back to the UI.
---Source: lua/ge/extensions/core/hardwareinfo.lua:202
---@param warning string msg code of the warning (e.g. 'toomanymods').
function core_hardwareinfo.acknowledgeWarning(warning) end

--- Callback called by the engine during/after the disk analysis: relays to the UI; at the end (data.running false) stores the result and refreshes the report.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hardwareinfo.lua:211
---@param data table Analysis data: running, name, size…
function core_hardwareinfo.diskInfoCallback(data) end

--- Builds and returns the complete hardware report with warnings and states (see notes).
---Source: lua/ge/extensions/core/hardwareinfo.lua:10
---@return table  Report {os, pwr, mem, cpu, gpu, disk, mods, hs?, globalState, sailingTheHighSeas}.
function core_hardwareinfo.getInfo() end

--- Reads 'bananabench.json' (last benchmark). Name exported with a typo.
---Source: lua/ge/extensions/core/hardwareinfo.lua:194
---@return table|nil  Benchmark result or nil.
function core_hardwareinfo.latestBananbench() end

--- Indicates whether 'bananabench.json' exists.
---Source: lua/ge/extensions/core/hardwareinfo.lua:198
---@return boolean  true if the file exists.
function core_hardwareinfo.latestBenchmarkExists() end

--- Writes the raw memory, CPU, GPU, OS and power information to a JSON file (without warnings).
---Source: lua/ge/extensions/core/hardwareinfo.lua:164
---@param filename string Path of the output JSON file.
function core_hardwareinfo.logInfo(filename) end

--- Hook called by the engine when the benchmark is finished: reads the result file and sends it to the UI (guihooks BananaBenchReady, nil if the file is absent).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hardwareinfo.lua:183
---@param outFilename string Path of the result file.
---@return nil  nil if the file does not exist, otherwise nothing.
function core_hardwareinfo.onBananaBenchReady(outFilename) end

--- Hook called when the mod manager is ready: sends the up-to-date report to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hardwareinfo.lua:207
function core_hardwareinfo.onModManagerReady() end

--- Computes the report (getInfo) and sends it to the UI via guihooks 'HardwareInfo'.
---Source: lua/ge/extensions/core/hardwareinfo.lua:157
function core_hardwareinfo.requestInfo() end

--- Launches the C++ disk space analysis if it has not already been done; otherwise sends the known results back to the UI (guihooks diskInfoCallback).
---Source: lua/ge/extensions/core/hardwareinfo.lua:225
function core_hardwareinfo.runDiskUsage() end

--- Deletes the old 'bananabench.json' and launches the C++ physics benchmark (Engine.Platform.runBananaBench). The result arrives via onBananaBenchReady.
---Source: lua/ge/extensions/core/hardwareinfo.lua:175
function core_hardwareinfo.runPhysicsBenchmark() end

