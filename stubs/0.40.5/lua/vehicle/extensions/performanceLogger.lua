---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/performanceLogger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small profiling tool: measures durations in milliseconds with HighPerfTimer, either a single measurement (startMeasurement / stopMeasurement) or an average over N measurements written to the log (measureAverage).
--- Access: extension `performanceLogger`: `extensions.load (vehicle VM)("performanceLogger")`, then the global `performanceLogger`
---@class performanceLogger
performanceLogger = {}

--- Stops the timer, adds the measurement to the average and, after stopCount measurements, writes the average to the log.
---Source: lua/vehicle/extensions/performanceLogger.lua:28
---@param name string Name of the measurement.
---@param stopCount integer Number of measurements before display.
---@param showMin boolean|nil Display the minimum of the averages.
function performanceLogger.measureAverage(name, stopCount, showMin) end

--- Initialization hook: clears timers and measurements.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/performanceLogger.lua:48
function performanceLogger.onInit() end

--- Same function as onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/performanceLogger.lua:48
function performanceLogger.onReset() end

--- Creates (or resets) the named timer.
---Source: lua/vehicle/extensions/performanceLogger.lua:12
---@param name string Name of the measurement.
function performanceLogger.startMeasurement(name) end

--- Ends the named average and returns the accumulated average (removes the timer).
---Source: lua/vehicle/extensions/performanceLogger.lua:22
---@param name string Name of the measurement.
---@return number  Average in milliseconds.
function performanceLogger.stopAvergage(name) end

--- Stops the timer and returns the measured duration.
---Source: lua/vehicle/extensions/performanceLogger.lua:41
---@param name string Name of the measurement.
---@return number  Duration in milliseconds.
function performanceLogger.stopMeasurement(name) end

