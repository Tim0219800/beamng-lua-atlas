---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/tireData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data module for genericGauges: provides for each wheel a temperature color (fixed value) and the tire pressure.
--- Access: controller `gauges/customModules/tireData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_customModules_tireData
---@field type string "auxiliary".
local controller_gauges_customModules_tireData = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/tireData.lua:46
---@param jbeamData table Controller jbeam data.
function controller_gauges_customModules_tireData.init(jbeamData) end

--- Resets the module's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/tireData.lua:43
function controller_gauges_customModules_tireData.reset() end

--- Called by genericGauges with the properties requested in displayData.customModules: temperatures (table wheelName -> "#ffffff") and pressures (table wheelName -> pressure).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/tireData.lua:38
---@param properties table<string, boolean> Set of requested properties (key = name, value = true).
function controller_gauges_customModules_tireData.setupGaugeData(properties) end

--- Does nothing (the update is done by updateGaugeData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/tireData.lua:15
---@param dt number Time step (s).
function controller_gauges_customModules_tireData.updateGFX(dt) end

--- Called by genericGauges before each send: fills moduleData with the requested values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/tireData.lua:18
---@param moduleData table Module data table, then sent to the HTML page.
---@param dt number Time elapsed since the last send (s).
function controller_gauges_customModules_tireData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_tireData
