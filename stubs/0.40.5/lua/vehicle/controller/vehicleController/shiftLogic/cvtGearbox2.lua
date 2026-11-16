---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Second CVT gearbox logic, driven by a map (target speed = f(wheel speed, aggression)) instead of a simple interpolator. Modes P R N D S. S mode enables simulated fixed gears (sport "steps") with a delay between changes. Loaded by vehicleController via jbeam shiftLogicName = "cvtGearbox2" (the "gearbox" device must be of type cvtGearbox for automatic selection, otherwise name the module explicitly). Sets the continuous ratio through gearbox:setGearRatio and a converter lockup with hysteresis.
--- Access: controller `vehicleController/shiftLogic/cvtGearbox2` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_cvtGearbox2
---@field brake number Brake (0..1).
---@field checkEngine boolean Engine disabled.
---@field clutchRatio number Always 1.
---@field currentGearIndex integer Virtual index (R -1, N/P 0, D 1, S 2).
---@field energyStorages table<integer, string> Engine tanks.
---@field engineLoad number Engine load.
---@field engineThrottle number Throttle applied to the engine.
---@field engineTorque number Combustion torque.
---@field engineTorqueData table
---@field flywheelTorque number Engine torque.
---@field gearboxHandling table|nil Injected by vehicleController.
---@field gearboxTorque number Gearbox output torque.
---@field idleRPM number Idle.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injected.
---@field isArcadeSwitched boolean Throttle/brake swapped.
---@field isEngineRunning number 1 if the engine is running.
---@field isManualModeActive boolean True in M modes (not available in practice).
---@field isSportModeActive boolean True in S mode.
---@field maxGearIndex integer Largest gearbox index.
---@field maxRPM number Max RPM.
---@field minGearIndex integer Absolute value of the smallest index (init).
---@field oilTemp number Oil temperature.
---@field rpm number Engine speed (RPM).
---@field shiftBehavior table|nil Injected.
---@field shiftPreventionData table|nil Injected.
---@field shiftingAggression number Copy of drivingAggression.
---@field smoothedAvgAVInput number Gearbox output angular velocity (rad/s).
---@field smoothedValues table|nil Injected.
---@field throttle number Throttle (0..1), swapped with the brake in arcade reverse.
---@field throttleInput number
---@field timer table|nil Injected.
---@field timerConstants table|nil Injected.
---@field torqueToMinRPM table
---@field updateGearboxGFX function nop then inGear of the active mode.
---@field waterTemp number Coolant temperature.
local controller_vehicleController_shiftLogic_cvtGearbox2 = {}

--- True outside arcade in manual mode (never in practice).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:104
---@return boolean  LEDs used?
function controller_vehicleController_shiftLogic_cvtGearbox2.areShiftLEDsInUse() end

--- Selects the arcade or realistic logic.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:144
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_shiftLogic_cvtGearbox2.gearboxBehaviorChanged(behavior) end

--- Mode name: P, R, N, D, or "S<n>" in sport (n = current fixed step).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:108
---@return string  Displayed name.
function controller_vehicleController_shiftLogic_cvtGearbox2.getGearName() end

--- Normalized lever position and mode index.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:118
---@return number  (index-1)/(number of modes-1)
---@return integer  Mode index.
function controller_vehicleController_shiftLogic_cvtGearbox2.getGearPosition() end

--- Saveable state {grb_mde = mode}.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:588
---@return table|nil  State.
function controller_vehicleController_shiftLogic_cvtGearbox2.getState() end

--- Creates smoothers, mode list, lockup parameters, target speed map and S mode fixed ratios; applies the default mode. Called by vehicleController (init and reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:430
---@param jbeamData table Jbeam data.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_cvtGearbox2.init(jbeamData, sharedFunctionTable) end

--- Asks the engine to send its torque curves to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:424
function controller_vehicleController_shiftLogic_cvtGearbox2.sendTorqueData() end

--- Restores the mode from data.grb_mde.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:594
---@param data table Table produced by getState.
function controller_vehicleController_shiftLogic_cvtGearbox2.setState(data) end

--- Realistic: previous mode.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:189
function controller_vehicleController_shiftLogic_cvtGearbox2.shiftDown() end

--- Realistic: mode matching the lever position; nonexistent -> message and N.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:201
---@param index integer Lever position (-1 R, 0 N, 1 P, 2 D, 3 S).
function controller_vehicleController_shiftLogic_cvtGearbox2.shiftToGearIndex(index) end

--- Realistic: next mode (P->R->N->D->S).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:177
function controller_vehicleController_shiftLogic_cvtGearbox2.shiftUp() end

return controller_vehicleController_shiftLogic_cvtGearbox2
