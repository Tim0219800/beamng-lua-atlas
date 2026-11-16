---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/electricMotorData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data module for genericGauges: computes the displayed power, the power and torque, the remaining range and a consumption graph for electric motors.
--- Access: controller `gauges/customModules/electricMotorData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_customModules_electricMotorData
---@field type string "auxiliary".
local controller_gauges_customModules_electricMotorData = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/electricMotorData.lua:109
---@param jbeamData table Controller jbeam data.
function controller_gauges_customModules_electricMotorData.init(jbeamData) end

--- Resets the module's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/electricMotorData.lua:105
function controller_gauges_customModules_electricMotorData.reset() end

--- Called by genericGauges with the properties requested in displayData.customModules: powerDisplay (electricPowerDisplay: average throttle minus regeneration), currentPower (currentPower and averagePower in hp, currentTorque in N·m), remainingRange, consumptionGraph (averageConsumption, sent every 5 s, otherwise nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/electricMotorData.lua:92
---@param properties table<string, boolean> Set of requested properties (key = name, value = true).
function controller_gauges_customModules_electricMotorData.setupGaugeData(properties) end

--- Does nothing (the update is done by updateGaugeData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/electricMotorData.lua:33
---@param dt number Time step (s).
function controller_gauges_customModules_electricMotorData.updateGFX(dt) end

--- Called by genericGauges before each send: fills moduleData with the requested values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/electricMotorData.lua:36
---@param moduleData table Module data table, then sent to the HTML page.
---@param dt number Time elapsed since the last send (s).
function controller_gauges_customModules_electricMotorData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_electricMotorData
