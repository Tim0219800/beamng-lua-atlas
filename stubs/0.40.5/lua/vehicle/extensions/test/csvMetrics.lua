---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/test/csvMetrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test tool: periodically records vehicle metrics (time, position, quaternion rotation, and in extended mode temperatures, RPM, fuel, speeds, brake and engine thermals) into a CSV report written with csvlib when disable() is called. Reads electrics.values and powertrain.getDevicesByType('combustionEngine').
--- Access: extension `test_csvMetrics`: `extensions.load (vehicle VM)("test_csvMetrics")`, then the global `test_csvMetrics`
---@class test_csvMetrics
test_csvMetrics = {}

--- Writes the accumulated CSV to disk (csvData:write(path)), disables recording and resets the frame counter to 1.
---Source: lua/vehicle/extensions/test/csvMetrics.lua:95
function test_csvMetrics.disable() end

--- Starts recording: stores the output path and the rate, builds the CSV header (simple or extended) and enables updateGFX.
---Source: lua/vehicle/extensions/test/csvMetrics.lua:16
---@param path string Path of the CSV file written by disable().
---@param writeRate integer|nil One row every N frames; 64 if nil.
---@param extended boolean|nil nil = extended metrics; any other value = simple metrics (see notes, inverted behavior).
function test_csvMetrics.enable(path, writeRate, extended) end

--- Called every graphics frame (extensions.hook('updateGFX')). If enabled, accumulates time and writes a row every `rate` frames.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/test/csvMetrics.lua:82
---@param dt number Time step in seconds.
function test_csvMetrics.updateGFX(dt) end

