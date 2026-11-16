---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Continuously variable transmission (CVT) gearbox logic, modes P R N D. Loaded by vehicleController when the "gearbox" device is of type cvtGearbox. Instead of choosing a discrete gear, it sets the continuous ratio every frame (gearbox:setGearRatio) to bring the engine speed toward a target speed interpolated between cvtLowRPM and cvtHighRPM according to driving aggression, and drives a simple converter lockup (electrics.values.lockupClutchRatio).
--- Access: controller `vehicleController/shiftLogic/cvtGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_cvtGearbox
---@field brake number Brake (0..1), at least arcadeAutoBrakeAmount at standstill in arcade.
---@field checkEngine boolean Engine disabled.
---@field clutchRatio number Always 1 (no driven clutch).
---@field currentGearIndex integer Virtual index (R -1, N/P 0, D 1).
---@field energyStorages table<integer, string> Engine tanks.
---@field engineLoad number Engine load.
---@field engineThrottle number Throttle applied to the engine.
---@field engineTorque number Combustion torque.
---@field flywheelTorque number Engine torque.
---@field gearboxHandling table|nil Injected by vehicleController.
---@field gearboxTorque number Gearbox output torque.
---@field idleRPM number Idle.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injected.
---@field isArcadeSwitched boolean Throttle/brake swapped.
---@field isEngineRunning number 1 if the engine is running.
---@field isManualModeActive boolean True in M modes (not available in practice).
---@field isSportModeActive boolean True in S mode (not available in practice).
---@field maxGearIndex integer Largest gearbox index.
---@field maxRPM number Max RPM.
---@field minGearIndex integer Absolute value of the smallest index (init), then not updated.
---@field oilTemp number Oil temperature.
---@field rpm number Engine speed (RPM).
---@field shiftBehavior table|nil Injected.
---@field shiftPreventionData table|nil Injected.
---@field shiftingAggression number Copy of smoothedValues.drivingAggression.
---@field smoothedAvgAVInput number Gearbox output angular velocity (rad/s).
---@field smoothedValues table|nil Injected.
---@field throttle number Throttle (0..1), swapped with the brake in arcade reverse.
---@field throttleInput number
---@field timer table|nil Injected.
---@field timerConstants table|nil Injected.
---@field updateGearboxGFX function nop then inGear of the active mode.
---@field waterTemp number Coolant temperature.
local controller_vehicleController_shiftLogic_cvtGearbox = {}

--- True outside arcade in manual mode (never in practice).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:98
---@return boolean  LEDs used?
function controller_vehicleController_shiftLogic_cvtGearbox.areShiftLEDsInUse() end

--- Selects the arcade or realistic logic.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:132
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_shiftLogic_cvtGearbox.gearboxBehaviorChanged(behavior) end

--- Name of the current mode (P, R, N, D).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:102
---@return string  Mode.
function controller_vehicleController_shiftLogic_cvtGearbox.getGearName() end

--- Normalized lever position and mode index.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:106
---@return number  (index-1)/(number of modes-1)
---@return integer  Mode index.
function controller_vehicleController_shiftLogic_cvtGearbox.getGearPosition() end

--- Saveable state {grb_mde = mode}.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:454
---@return table|nil  State.
function controller_vehicleController_shiftLogic_cvtGearbox.getState() end

--- Creates the gear ratio and target speed smoothers, the mode list, the lockup parameters and applies the default mode. Called by vehicleController (init and reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:333
---@param jbeamData table Jbeam data.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_cvtGearbox.init(jbeamData, sharedFunctionTable) end

--- Asks the engine to send its torque curves to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:327
function controller_vehicleController_shiftLogic_cvtGearbox.sendTorqueData() end

--- Restores the mode from data.grb_mde.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:460
---@param data table Table produced by getState.
function controller_vehicleController_shiftLogic_cvtGearbox.setState(data) end

--- Realistic: switches to the previous mode.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:173
function controller_vehicleController_shiftLogic_cvtGearbox.shiftDown() end

--- Realistic: chooses the mode matching the lever position (-1 R, 0 N, 1 P, 2 D); nonexistent -> message and N.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:185
---@param index integer Lever position.
function controller_vehicleController_shiftLogic_cvtGearbox.shiftToGearIndex(index) end

--- Realistic: switches to the next mode in the list (P->R->N->D).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:161
function controller_vehicleController_shiftLogic_cvtGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_cvtGearbox
