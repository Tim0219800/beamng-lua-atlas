---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/accelerationData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data module for genericGauges (type "auxiliary"): provides the vehicle sensor's accelerations. To be referenced in displayData.customModules with the module name accelerationData.
--- Access: controller `gauges/customModules/accelerationData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_customModules_accelerationData
---@field type string "auxiliary".
local controller_gauges_customModules_accelerationData = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/accelerationData.lua:37
---@param jbeamData table Controller jbeam data.
function controller_gauges_customModules_accelerationData.init(jbeamData) end

--- Resets the module's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/accelerationData.lua:34
function controller_gauges_customModules_accelerationData.reset() end

--- Called by genericGauges with the properties requested in displayData.customModules: acceleration (x, y, z = sensors.gx/gy/gz) and accelerationSmooth (xSmooth, ySmooth, zSmooth = sensors.gx2/gy2/gz2).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/accelerationData.lua:29
---@param properties table<string, boolean> Set of requested properties (key = name, value = true).
function controller_gauges_customModules_accelerationData.setupGaugeData(properties) end

--- Does nothing (the update is done by updateGaugeData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/accelerationData.lua:13
---@param dt number Time step (s).
function controller_gauges_customModules_accelerationData.updateGFX(dt) end

--- Called by genericGauges before each send: fills moduleData with the requested values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/accelerationData.lua:16
---@param moduleData table Module data table, then sent to the HTML page.
---@param dt number Time elapsed since the last send (s).
function controller_gauges_customModules_accelerationData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_accelerationData
