---@meta
-- tim19Atlas stub generated from lua/console/bananabench.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle physics test bench "bananabench" (version 0.5), run in the console VM (BeamNG without UI). It initializes a physics engine (initBeamEngine at 2000 Hz), loads a vehicle (jbeam/loader), spawns it in 1 to N copies and measures, over 200 iterations of 100 physics steps, the throughput in millions of beams per second (MBeams/s) and the percentage of real time. It prints a table and returns the results. It is the base used by bananabench-json, bananabench-csv, bananabench-xml and bananabench-print.
--- Access: `require("bananabench")`
---@class bananabench
local bananabench = {}

--- Returns the BeamEngine engine object created by this module, to drive it directly (e.g. setThreadingLayout for a thread count sweep).
---Source: lua/console/bananabench.lua:234
---@return userdata  Native BeamNG system.
function bananabench.beam() end

--- Lists the subfolders of /vehicles (excluding /vehicles/common) as names.
---Source: lua/console/bananabench.lua:84
---@return string[]  Vehicle names.
function bananabench.getAllVehicles() end

--- Runs the physics benchmark (alias of benchPhysics). For each vehicle in the list, measures from vehicleMin to vehicleMax copies and prints an MBeams/s and % realtime table.
---Source: lua/console/bananabench.lua:94
---@param vehicles string[]|nil Folder names under /vehicles; default {'pickup'}.
---@param vehicleMin integer|nil Minimum number of simultaneous vehicles (default 1).
---@param vehicleMax integer|nil Maximum number (default VehiclesToTest or 40).
---@return table|nil  Benchmark results (see notes), nil if the engine is unavailable.
function bananabench.physics(vehicles, vehicleMin, vehicleMax) end

---Source: lua/console/bananabench.lua:71
---@param level any
---@param origin any
---@param msg any
---@param newline any
function benchLog(level, origin, msg, newline) end

---Source: lua/console/bananabench.lua:94
---@param vehicles any
---@param vehicleMin any
---@param vehicleMax any
function benchPhysics(vehicles, vehicleMin, vehicleMax) end

---Source: lua/console/bananabench.lua:33
---@param testVehicle any
---@param vehLPackData any
---@param n any
---@param steps any
function myBenchStep(testVehicle, vehLPackData, n, steps) end

return bananabench
