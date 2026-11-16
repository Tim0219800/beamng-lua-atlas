---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/environmentData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data module for genericGauges: provides the outside temperature and the system time.
--- Access: controller `gauges/customModules/environmentData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_customModules_environmentData
---@field type string "auxiliary".
local controller_gauges_customModules_environmentData = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/environmentData.lua:24
---@param jbeamData table Controller jbeam data.
function controller_gauges_customModules_environmentData.init(jbeamData) end

--- Resets the module's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/environmentData.lua:21
function controller_gauges_customModules_environmentData.reset() end

--- Called by genericGauges with the properties requested in displayData.customModules: no property is read; always produces temperatureEnv and time.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/environmentData.lua:18
---@param properties table<string, boolean> Set of requested properties (key = name, value = true).
function controller_gauges_customModules_environmentData.setupGaugeData(properties) end

--- Does nothing (the update is done by updateGaugeData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/environmentData.lua:10
---@param dt number Time step (s).
function controller_gauges_customModules_environmentData.updateGFX(dt) end

--- Called by genericGauges before each send: fills moduleData with the requested values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/environmentData.lua:13
---@param moduleData table Module data table, then sent to the HTML page.
---@param dt number Time elapsed since the last send (s).
function controller_gauges_customModules_environmentData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_environmentData
