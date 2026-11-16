---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/vehiclePerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes a vehicle's performance index (PI) and class (X, S, A, B, C, D) from its automatic test results (0-60 time, 1/8 and 1/4 mile, trap speeds, braking in g, etc.). Also provides aggregate scores compared to a reference vehicle, class utilities for the UI (minimum class requirement) and selection of a mission's default vehicle. The data comes from vehicle configs ("Performance Data", "Drag Times", "Power", "Weight").
--- Access: extension `gameplay_vehiclePerformance`: `extensions.load("gameplay_vehiclePerformance")`, then the global `gameplay_vehiclePerformance`
---@class gameplay_vehiclePerformance
gameplay_vehiclePerformance = {}

--- Builds a table in the performance index badge format for a class requirement alone; isThreshold = true tells the UI to display a minimum threshold (>=).
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:150
---@param name string Class letter.
---@return table|nil  {class = {name, description, minPI}, performanceIndex = minPI, isThreshold = true} or nil if the class is unknown.
function gameplay_vehiclePerformance.buildClassRequirement(name) end

--- Computes aggregate scores (power, power-to-weight ratio, 0-60 mph, 60 ft, quarter mile, speed progression, braking) as a percentage of the reference vehicle.
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:48
---@param testData table|nil Test data: time_60, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG, power ({propulsionPowerCombined}), weight.
---@return table|nil  {powerScore, powerToWeightScore, timeTo60Score, quarterMileScore, speedProgressionScore, brakingGForceScore, time0To60Score}
function gameplay_vehiclePerformance.getAggregateScores(testData) end

--- Returns the class row matching the given letter.
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:131
---@param name string|nil Class letter (X, S, A, B, C, D).
---@return table|nil  {name, minPI, description} or nil.
function gameplay_vehiclePerformance.getClassByName(name) end

--- Class of a vehicle config identified by model and config name (core_vehicles.getConfig).
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:123
---@param model string Vehicle model.
---@param configName string Config name.
---@return table|nil  {class, performanceIndex} or nil.
function gameplay_vehiclePerformance.getClassFromConfig(model, configName) end

--- Reads the class and PI already recorded by the automatic test (config["Performance Data"]); otherwise recomputes them from config["Drag Times"], config["Power"] and config["Weight"].
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:99
---@param configTable table|nil Vehicle config table.
---@return table|nil  {class, performanceIndex} or nil if no data.
function gameplay_vehiclePerformance.getClassFromConfigTable(configTable) end

--- Computes the PI from the test data and returns the first class whose minimum PI is reached.
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:85
---@param testData table Test data (time_60, time_330, time_1000, time_1_8, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG).
---@return table|nil  {class = {name, description, minPI}, performanceIndex}
function gameplay_vehiclePerformance.getClassFromData(testData) end

--- Class of a vehicle present in the game, via core_vehicles.getVehicleDetails(vehId).configs.
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:116
---@param vehId integer Vehicle id.
---@return table|nil  {class, performanceIndex} or nil.
function gameplay_vehiclePerformance.getClassFromVehId(vehId) end

--- Lists the class names, from highest to lowest.
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:139
---@return string[]  {"X","S","A","B","C","D"}
function gameplay_vehiclePerformance.getClassNames() end

--- Determines the default vehicle implied by a mission's setupModules.vehicles block (the one the settings UI preselects): the player's vehicle, the first preset, or nothing.
---Source: lua/ge/extensions/gameplay/vehiclePerformance.lua:166
---@param setupModule table|nil Setup module: enabled, includePlayerVehicle, prioritizePlayerVehicle, vehicles ({model, config}).
---@return table|nil  {kind = "player"} or {kind = "preset", model, config} or nil.
function gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule) end

