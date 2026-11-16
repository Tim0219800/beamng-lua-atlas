---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayStatistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle-side gameplay statistics relay: forwards metrics to the GE module gameplay_statistic (metricAdd/metricSet) and runs registered watch functions in turn, one per frame (scheduler). On load it enables the watchAirtime (airtime) and watchBurnout (burnout time) modules.
--- Access: extension `gameplayStatistic`: `extensions.load (vehicle VM)("gameplayStatistic")`, then the global `gameplayStatistic`
---@class gameplayStatistic
gameplayStatistic = {}

--- Adds a function to the scheduler (run once every N frames where N = number of functions) and enables updateGFX.
---Source: lua/vehicle/extensions/gameplayStatistic.lua:31
---@param fn function Argument-less function to run periodically.
function gameplayStatistic.addSchedule(fn) end

--- Adds a value to a GE metric.
---Source: lua/vehicle/extensions/gameplayStatistic.lua:14
---@param name string Metric name (e.g. 'vehicle/airtime.time').
---@param value number Value to add.
---@param aggregate boolean|nil Passed as is to the GE (aggregation, inferred from code).
function gameplayStatistic.metricAdd(name, value, aggregate) end

--- Sets the value of a GE metric.
---Source: lua/vehicle/extensions/gameplayStatistic.lua:18
---@param name string Metric name.
---@param value number Value.
---@param aggregate boolean|nil Passed as is to the GE.
function gameplayStatistic.metricSet(name, value, aggregate) end

--- Called on load: unloads itself for vehicles without wheels or powertrain/hydros physics, otherwise loads watchAirtime and watchBurnout and registers their workload in the scheduler.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayStatistic.lua:53
---@return boolean|nil  false to request unloading.
function gameplayStatistic.onExtensionLoaded() end

--- Removes a function from the scheduler; disables updateGFX if none remain.
---Source: lua/vehicle/extensions/gameplayStatistic.lua:38
---@param fn function Previously added function.
---@return boolean  true if removed, false if not found.
function gameplayStatistic.removeSchedule(fn) end

--- Is nil at rest; when active, runs one scheduler function per frame. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayStatistic.lua:dyn
---@param dt number Time step in seconds.
function gameplayStatistic.updateGFX(dt) end

