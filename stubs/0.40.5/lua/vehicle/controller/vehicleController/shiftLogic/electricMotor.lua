---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Gearbox" logic for electric vehicles: modes P R N D that set the rotation direction (motorDirection) of the electric motors, regenerative braking (regeneration on brake, one-pedal driving with force levels), friction brake compensation at low speed and smooth stop. Loaded by vehicleController when the "gearbox" device is of type electricMotor (or shiftLogicName). It computes M.regen (0..1 coefficient applied to the motors) and adjusts M.brake for the friction brakes. Publishes electrics.values.regenFromBrake, regenFromOnePedal, regenThrottle, maxRegenStrength and reads regenStrength.
--- Access: controller `vehicleController/shiftLogic/electricMotor` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_electricMotor
---@field brake number Final friction brake after deducting regeneration.
---@field checkEngine boolean Declared boolean, but set to 0 (number) by updateExposedData.
---@field clutchRatio number Always 1.
---@field currentGearIndex integer R -1, N/P 0, D 1.
---@field energyStorages table<integer, string> Motor batteries.
---@field engineLoad number Average load of the motors.
---@field engineThrottle number Copy of throttle.
---@field engineTorque number Sum of the motor torques.
---@field flywheelTorque number Same as engineTorque.
---@field gearboxHandling table|nil Injected by vehicleController.
---@field gearboxTorque number Same as engineTorque.
---@field idleRPM number 0.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injected.
---@field isArcadeSwitched boolean Throttle/brake swapped (arcade, reverse).
---@field isEngineRunning number Always 1.
---@field isSportModeActive boolean Always false in practice.
---@field maxGearIndex integer Largest index.
---@field maxRPM number Highest max speed of the motors.
---@field minGearIndex integer Absolute value of the smallest index.
---@field oilTemp number 0.
---@field regen number Current regeneration coefficient (0..1) applied to the motors.
---@field rpm number Highest motor speed (RPM, absolute value).
---@field shiftBehavior table|nil Injected.
---@field shiftPreventionData table|nil Injected.
---@field shiftingAggression number 0 by default.
---@field smoothedAvgAVInput number Average angular velocity of the devices of category "engine" (rad/s).
---@field smoothedValues table|nil Injected.
---@field throttle number Throttle (0..1), remapped in one-pedal driving.
---@field throttleInput number
---@field timer table|nil Injected.
---@field timerConstants table|nil Injected.
---@field updateGearboxGFX function nop then inGear of the active mode.
---@field waterTemp number 0.
local controller_vehicleController_shiftLogic_electricMotor = {}

--- Always false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:105
---@return boolean  false
function controller_vehicleController_shiftLogic_electricMotor.areShiftLEDsInUse() end

--- Selects the arcade or realistic logic.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:117
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_shiftLogic_electricMotor.gearboxBehaviorChanged(behavior) end

--- Mode name (P, R, N, D).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:109
---@return string  Mode.
function controller_vehicleController_shiftLogic_electricMotor.getGearName() end

--- Normalized lever position and mode index.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:113
---@return number  Position 0..1.
---@return integer  Mode index.
function controller_vehicleController_shiftLogic_electricMotor.getGearPosition() end

--- Saveable state {grb_mde = mode}.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:661
---@return table|nil  State.
function controller_vehicleController_shiftLogic_electricMotor.getState() end

--- Gets the motors, builds the brake/regeneration curves, the smoothers, the modes, registers the quick menu and applies the default mode. Called by vehicleController (init and reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:499
---@param jbeamData table Jbeam data.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_electricMotor.init(jbeamData, sharedFunctionTable) end

--- Load hook: restores electrics.values.regenStrength (clamped).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:651
---@param data table Table produced by onSerialize.
function controller_vehicleController_shiftLogic_electricMotor.onDeserialize(data) end

--- Save hook: {regenLevel = regeneration level}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:657
---@return table  Data.
function controller_vehicleController_shiftLogic_electricMotor.onSerialize() end

--- Asks each motor to send its torque curves to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:415
function controller_vehicleController_shiftLogic_electricMotor.sendTorqueData() end

--- Turns the ignition of all motors on or off; called by vehicleController.setEngineIgnition when there is no main engine device.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:421
---@param enabled boolean Ignition active?
function controller_vehicleController_shiftLogic_electricMotor.setIgnition(enabled) end

--- Restores the mode from data.grb_mde.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:667
---@param data table Table produced by getState.
function controller_vehicleController_shiftLogic_electricMotor.setState(data) end

--- Realistic: previous mode.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:159
function controller_vehicleController_shiftLogic_electricMotor.shiftDown() end

--- Realistic: selects the lever's mode; nonexistent -> message and N.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:170
---@param index integer Lever position (-1 R, 0 N, 1 P, 2 D).
function controller_vehicleController_shiftLogic_electricMotor.shiftToGearIndex(index) end

--- Realistic: next mode in the list (P->R->N->D) and updates the motor direction.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:148
function controller_vehicleController_shiftLogic_electricMotor.shiftUp() end

return controller_vehicleController_shiftLogic_electricMotor
