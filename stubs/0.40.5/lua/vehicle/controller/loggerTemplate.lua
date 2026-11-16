---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/loggerTemplate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data logging controller template (type "auxiliary", defaultOrder 100000): every frame it appends to an in-memory CSV (csvlib library) time, throttle, brake, stored energy of the electric batteries and power of the electric motors. saveLogToCSV writes the "testLog" file. To be copied as a starting point for a custom logger.
--- Access: controller `loggerTemplate` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_loggerTemplate
---@field defaultOrder number 100000.
---@field type string "auxiliary".
local controller_loggerTemplate = {}

--- Creates the CSV (columns time, throttle, brake, batteryCapacity, motorPower) and resets the timer to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/loggerTemplate.lua:83
function controller_loggerTemplate.init() end

--- Recreates an empty CSV and resets the timer to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/loggerTemplate.lua:77
function controller_loggerTemplate.reset() end

--- Writes the CSV to disk under the name testLog.
---Source: lua/vehicle/controller/loggerTemplate.lua:19
function controller_loggerTemplate.saveLogToCSV() end

--- Increments the internal timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/loggerTemplate.lua:70
---@param dt number Time step (s).
function controller_loggerTemplate.update(dt) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/loggerTemplate.lua:60
---@param dt number Time step (s).
function controller_loggerTemplate.updateFixedStep(dt) end

--- Adds a data row to the CSV.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/loggerTemplate.lua:55
---@param dt number Time step (s).
function controller_loggerTemplate.updateGFX(dt) end

return controller_loggerTemplate
