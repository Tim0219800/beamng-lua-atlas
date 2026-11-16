---@meta
-- tim19Atlas stub generated from lua/console/bananabench-async.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Log collector: stores the entries (except levels A, D, S) in a local list and remembers the maximum severity (warn/error).
---Source: lua/console/bananabench-async.lua:41
---@param level string Log level (A, D, S, W, E…).
---@param origin string Origin.
---@param msg string Message.
---@param newline boolean Line break.
function benchLog(level, origin, msg, newline) end

--- Runs the benchmark (dynamic collision enabled then disabled) for each vehicle and returns the results table; must run in a coroutine.
---Source: lua/console/bananabench-async.lua:72
---@param vehicles string[]|nil Vehicles (default {'pickup'}).
---@param vehicleMin integer|nil Minimum (default 1).
---@param vehicleMax integer|nil Maximum (default 12).
---@return table  Benchmark results.
function benchPhysics(vehicles, vehicleMin, vehicleMax) end

--- Creates the coroutine that will run benchPhysics.
---*(internal: called by the engine or the main loop)*
---Source: lua/console/bananabench-async.lua:210
function benchmark_start() end

--- Resumes the coroutine by one step; to be called on every update by the host program.
---*(internal: called by the engine or the main loop)*
---Source: lua/console/bananabench-async.lua:215
function benchmark_update() end

--- Spawns vehicles up to n (positions 300*i), then lets gfxSteps frames pass (coroutine.yield) while measuring the time. Reports an instability.
---Source: lua/console/bananabench-async.lua:16
---@param testVehicle string Vehicle folder (vehicles/<name>/).
---@param n integer Number of vehicles to have in the scene.
---@return number  Spawn time.
---@return number  Simulation time.
function myBenchStep(testVehicle, n) end

---@type table
M = nil
