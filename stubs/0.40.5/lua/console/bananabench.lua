---@meta
-- tim19Atlas stub generated from lua/console/bananabench.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("bananabench")`
---@class bananabench
local bananabench = {}

--- Exposed so callers can drive the engine directly, e.g. setThreadingLayout() for a
---  worker-count sweep (see bananabench-threads.lua). It is a BeamNG::System, so every
---  method in beamng.h is reachable from here.
---Source : lua/console/bananabench.lua:234
function bananabench.beam() end

---Source : lua/console/bananabench.lua:84
function bananabench.getAllVehicles() end

---Source : lua/console/bananabench.lua:94
---@param vehicles any
---@param vehicleMin any
---@param vehicleMax any
function bananabench.physics(vehicles, vehicleMin, vehicleMax) end

---Source : lua/console/bananabench.lua:71
---@param level any
---@param origin any
---@param msg any
---@param newline any
function benchLog(level, origin, msg, newline) end

---Source : lua/console/bananabench.lua:94
---@param vehicles any
---@param vehicleMin any
---@param vehicleMax any
function benchPhysics(vehicles, vehicleMin, vehicleMax) end

---Source : lua/console/bananabench.lua:33
---@param testVehicle any
---@param vehLPackData any
---@param n any
---@param steps any
function myBenchStep(testVehicle, vehLPackData, n, steps) end

return bananabench
