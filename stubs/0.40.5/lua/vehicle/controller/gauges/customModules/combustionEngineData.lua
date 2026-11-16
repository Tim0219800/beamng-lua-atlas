---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/customModules/combustionEngineData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data module for genericGauges: computes fuel consumption (l/100 km), consumption display, power and torque of combustion engines and remaining range. Computations are only done for the requested properties.
--- Access: controller `gauges/customModules/combustionEngineData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_gauges_customModules_combustionEngineData
---@field type string "auxiliary".
local controller_gauges_customModules_combustionEngineData = {}

--- Initializes the smoothed average consumption to 10 l/100 km.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:133
---@param jbeamData table Controller jbeam data.
function controller_gauges_customModules_combustionEngineData.init(jbeamData) end

--- Resets the module's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:123
function controller_gauges_customModules_combustionEngineData.reset() end

--- Called by genericGauges with the properties requested in displayData.customModules: fuelConsumption (averageFuelConsumption, currentFuelConsumption), fuelDisplay (fuelDisplay, -1..3), currentPower (currentPower and averagePower in hp, currentTorque in N·m), remainingRange (remainingRange; also enables fuelConsumption).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:107
---@param properties table<string, boolean> Set of requested properties (key = name, value = true).
function controller_gauges_customModules_combustionEngineData.setupGaugeData(properties) end

--- Does nothing (the update is done by updateGaugeData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:40
---@param dt number Time step (s).
function controller_gauges_customModules_combustionEngineData.updateGFX(dt) end

--- Called by genericGauges before each send: fills moduleData with the requested values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/gauges/customModules/combustionEngineData.lua:43
---@param moduleData table Module data table, then sent to the HTML page.
---@param dt number Time elapsed since the last send (s).
function controller_gauges_customModules_combustionEngineData.updateGaugeData(moduleData, dt) end

return controller_gauges_customModules_combustionEngineData
