---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data module for genericGauges: computes a red/yellow tachometer zone that depends on the oil temperature (cold engine = reduced max RPM) and a shift light. The values are converted to an integer output scale (e.g. number of segments of an LED bar).
--- Access: controller `gauges/customModules/dynamicRedlineData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_customModules_dynamicRedlineData
---@field type string "auxiliary".
local controller_gauges_customModules_dynamicRedlineData = {}

--- Reads the jbeam parameters of the output scale and the oil temperature.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:42
---@param jbeamData table Controller jbeam data.
function controller_gauges_customModules_dynamicRedlineData.init(jbeamData) end

--- Resets the module's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:39
function controller_gauges_customModules_dynamicRedlineData.reset() end

--- Called by genericGauges with the properties requested in displayData.customModules: no property is read; always produces yellow, red (integers) and shiftLight (boolean).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:36
---@param properties table<string, boolean> Set of requested properties (key = name, value = true).
function controller_gauges_customModules_dynamicRedlineData.setupGaugeData(properties) end

--- Does nothing (the update is done by updateGaugeData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:21
---@param dt number Time step (s).
function controller_gauges_customModules_dynamicRedlineData.updateGFX(dt) end

--- Called by genericGauges before each send: fills moduleData with the requested values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua:24
---@param moduleData table Module data table, then sent to the HTML page.
---@param dt number Time elapsed since the last send (s).
function controller_gauges_customModules_dynamicRedlineData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_dynamicRedlineData
