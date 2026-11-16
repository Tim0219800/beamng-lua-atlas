---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehiclePerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Performance certification ("performance index") of career vehicles, from the garage computer. startDragTest chains, with util_stepHandler, a recorded drag test on the alderStrip track (west_coast_usa) (power, 0-60 time, 60 ft, 330 ft, 1/8, 1000 ft, 1/4 mile, speeds, braking), then an AI-driven 10-lap skidpad test (lateral acceleration). The data is stored in vehicle.certificationData, the history (10 entries max) in performanceHistory, then converted to scores and class by gameplay_vehiclePerformance. Also handles the test cameras, action blocking during the test and cancellation (user, stuck vehicle, broken engine).
--- Access: extension `career_modules_vehiclePerformance`: `extensions.load("career_modules_vehiclePerformance")`, then the global `career_modules_vehiclePerformance`
---@class career_modules_vehiclePerformance
---@field dependencies string[] {"ui_vehicleSelector_vehicleSpecifications"}.
career_modules_vehiclePerformance = {}

--- Adds the performanceAggregateScores and vehicleClass fields to a data block and unlocks the associated achievements.
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:537
---@param performanceData table Performance data (modified in place).
function career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData) end

--- Requests cancellation of the current test and stops the camera zoom and the skidpad test.
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:546
---@param delay number|nil Delay in seconds before the actual stop, 0 by default.
---@param userAborted boolean|nil false if the cancellation is automatic (no onGameplayActivityAborted hook).
function career_modules_vehiclePerformance.cancelTest(delay, userAborted) end

--- UI data of the active vehicle (career_modules_inventory.getVehicleUiData).
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:616
---@return table|nil  UI data, nil if no active vehicle.
function career_modules_vehiclePerformance.getActiveVehicleUiData() end

--- Returns the aggregate scores (gameplay_vehiclePerformance.getAggregateScores) from a vehicle's certification.
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:509
---@param inventoryId integer Inventory id.
---@return table|nil  Scores, or nil without certification.
function career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId) end

--- Returns a vehicle's performance class (gameplay_vehiclePerformance.getClassFromData).
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:516
---@param inventoryId integer Inventory id.
---@return table|nil  Class, or nil without certification.
function career_modules_vehiclePerformance.getVehicleClass(inventoryId) end

--- Archives a vehicle's current certification into its history then deletes it (called after a parts or tuning change).
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:56
---@param inventoryId integer Inventory id.
function career_modules_vehiclePerformance.invalidateCertification(inventoryId) end

--- Indicates whether a certification test is in progress.
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:637
---@return boolean|nil  true during the test, nil otherwise.
function career_modules_vehiclePerformance.isTestInProgress() end

--- Triggers hook: changes the camera path (drag_pi_2 to 5) on entering the dragStageTrigger, drag60ftTrigger, dragTestTrigger2/3 triggers, and switches to the external camera on exiting dragEndCamTrigger. Only handles the test vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:555
---@param data table {triggerName, event ("enter"|"exit"), subjectID}.
function career_modules_vehiclePerformance.onBeamNGTrigger(data) end

--- Garage computer hook: adds the "performance index" button for each garage vehicle (disabled until the starter vehicle is bought).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:588
---@param menuData table Menu data.
---@param computerFunctions table Table to fill.
function career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions) end

--- Drag hook: 1 s after the countdown starts, switches to the start camera (behind the vehicle).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:580
---@param vehId integer Vehicle id.
---@param dial any Dial value (unused).
function career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial) end

--- UI router hook: attaches the active vehicle's data to data.vehicleData when the route is mounted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:623
---@param context any Router context.
---@param toRoute any Target route.
---@param fromRoute any Origin route.
---@param data table Route data table (receives vehicleData).
function career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data) end

--- Update hook: updates the braking camera zoom.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:75
---@param dtReal number Real time delta (s).
function career_modules_vehiclePerformance.onUpdate(dtReal) end

--- Called from the vehicle via a damageTracker callback: cancels the test after 3 s in case of catastrophic overtorque or a locked engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:627
---@param damageData table Damage data.
---@param damageDataDelta table Damage change (engine field).
function career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta) end

--- Sets the active vehicle and navigates to the career.computer.vehiclePerformance screen.
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:611
---@param options table {inventoryId = integer}.
function career_modules_vehiclePerformance.openMenu(options) end

--- Starts the full certification test on the active vehicle (activeInventoryId): fade to black, vehicle spawn, recorded drag test, then skidpad (10 laps), saving of the results, return to the garage and return to the performance screen. If autosave is active, saves the career at the end.
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:116
function career_modules_vehiclePerformance.startDragTest() end

--- Translates in place the drivetrain, fuelType, inductionType fields of a performance data block for display.
---Source: lua/ge/extensions/career/modules/vehiclePerformance.lua:523
---@param performanceData table|nil Performance data (modified in place).
function career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData) end

