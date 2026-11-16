---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Neutral" gearbox logic module loaded by vehicleController when the vehicle has no "gearbox" device (or via jbeam shiftLogicName = "dummy"). It simply copies the driver's throttle/brake inputs, reads the speed of the "mainEngine" engine if it exists and fills in the values (temperatures, load, torques, engine state) that vehicleController publishes in electrics. No gear changes.
--- Access: controller `vehicleController/shiftLogic/dummy` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_dummy
---@field brake number Copy of inputValues.brake.
---@field checkEngine boolean True if the engine is disabled (isDisabled).
---@field clutchRatio number Always 0.
---@field currentGearIndex integer Always 0.
---@field energyStorages table<integer, string> Engine tank names (sharedFunctions.getEnergyStorages).
---@field engineLoad number Instantaneous engine load.
---@field engineThrottle number Throttle sent to the engine (0 if engine disabled).
---@field engineTorque number Engine combustion torque.
---@field flywheelTorque number Engine output torque (outputTorque1).
---@field gearboxBehaviorChanged function nop.
---@field gearboxHandling table|nil Injected by vehicleController.
---@field gearboxTorque number Gearbox device output torque.
---@field idleRPM number Engine idle (RPM) read at init.
---@field ignition boolean True if electrics.values.ignitionLevel > 1.
---@field inputValues table|nil Injected: {throttle, clutch} bounded 0..1 (or electrics overrides).
---@field isArcadeSwitched boolean Always false.
---@field isEngineRunning number 1 if the engine is running (speed > 80% of starterMaxAV and starter disengaged) or if it has no starter, otherwise 0.
---@field isSportModeActive boolean Always false.
---@field maxGearIndex integer Always 0.
---@field maxRPM number Engine max RPM read at init.
---@field minGearIndex integer Always 0.
---@field oilTemp number Engine oil temperature.
---@field rpm number Engine speed in RPM (outputAV1 of the mainEngine).
---@field shiftBehavior table|nil Injected by vehicleController.
---@field shiftDown function nop.
---@field shiftPreventionData table|nil Injected by vehicleController.
---@field shiftToGearIndex function nop.
---@field shiftUp function nop.
---@field shiftingAggression number Always 0.
---@field smoothedAvgAVInput number Angular velocity (rad/s) of the "gearbox" device output (0 if absent).
---@field smoothedValues table|nil Injected by vehicleController.
---@field throttle number Copy of inputValues.throttle.
---@field timer table|nil Injected by vehicleController.
---@field timerConstants table|nil Injected by vehicleController.
---@field waterTemp number Coolant temperature (or oil temperature as a fallback).
local controller_vehicleController_shiftLogic_dummy = {}

--- Always false: no shift LEDs.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:55
---@return boolean  false
function controller_vehicleController_shiftLogic_dummy.areShiftLEDsInUse() end

--- Displayed gear name: empty string.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:59
---@return string  ""
function controller_vehicleController_shiftLogic_dummy.getGearName() end

--- Lever position for animation: 0, 0.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:63
---@return number  gear_A
---@return number  gearModeIndex
function controller_vehicleController_shiftLogic_dummy.getGearPosition() end

--- Stores sharedFunctions, gets the mainEngine and gearbox devices, resets values to zero and reads the engine's maxRPM/idleRPM/energy. Called by vehicleController at init and reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:94
---@param jbeamData table Jbeam data (unused).
---@param sharedFunctionTable table sharedFunctions utilities of vehicleController.
function controller_vehicleController_shiftLogic_dummy.init(jbeamData, sharedFunctionTable) end

--- Asks the engine to send its torque curves to the UI (if an engine exists).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:88
function controller_vehicleController_shiftLogic_dummy.sendTorqueData() end

--- Every frame: copies the inputs and updates rpm, temperatures, load, torques, ignition and engine state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:67
---@param dt number Time step in seconds.
function controller_vehicleController_shiftLogic_dummy.updateGearboxGFX(dt) end

return controller_vehicleController_shiftLogic_dummy
