---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Braking component of the drivingDynamics system (type "auxiliary", defaultOrder 70). It acts as traction control (order 30), yaw control (order 50) and ABS (order 50) by braking individual wheels. The traction and yaw braking is added every step to wheel.desiredBrakingTorque in updateWheelsIntermediate; the ABS replaces each wheel's brake torque computation functions (wheels.setWheelBrakeUpdate). Each role is handled by parallel PID regulators configurable in the jbeam or via setParameters.
--- Access: controller `drivingDynamics/supervisors/components/brakeControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_supervisors_components_brakeControl
---@field componentOrderABSControl number 50.
---@field componentOrderTractionControl number 30.
---@field componentOrderYawControl number 50.
---@field defaultOrder number Default execution order (70).
---@field isActingAsABS boolean True when the ABS limits the braking.
---@field isActingAsTC boolean True when a traction control brake is active.
---@field isActingAsYC boolean True when a yaw control brake is active.
---@field isActive boolean True after initSecondStage.
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_components_brakeControl = {}

--- Called by the absControl supervisor for each wheel: periodically updates the ABS coefficient (absCoef) via a PID on the slip.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:213
---@param wheelData table Wheel data {wheelName, slip}.
---@param brake number Brake input 0..1.
---@param vehicleVelocity number Vehicle speed (m/s).
---@param dt number Time step (s).
---@return boolean  True if the ABS reduces braking (absCoef < 0.9).
function controller_drivingDynamics_supervisors_components_brakeControl.actAsABSControl(wheelData, brake, vehicleVelocity, dt) end

--- Called by tractionControl for each wheel group: computes each wheel's braking factor from its slip.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:69
---@param wheelGroup table Wheel group {name, wheels, wheelCount, slipRange...}.
---@param dt number Time step (s).
---@return boolean  True if a traction control brake is requested.
function controller_drivingDynamics_supervisors_components_brakeControl.actAsTractionControl(wheelGroup, dt) end

--- Called by yawControl: picks the wheel to brake according to the dominant PID (yaw error, body slip angle, front slip) and sets its brake factor.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:106
---@param measuredYaw number Measured yaw (rad/s).
---@param expectedYaw number Expected yaw, unused.
---@param yawDifference number Yaw error (positive = oversteer).
---@param bodySlipAngle number Adjusted body slip angle (rad).
---@param frontSlipAngle number Front axle slip angle (rad).
---@param rearSlipAngle number Rear axle slip angle (rad).
---@param dt number Time step (s).
---@return boolean  True if a wheel is braked by the yaw control.
function controller_drivingDynamics_supervisors_components_brakeControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt) end

--- Returns a copy of the configuration.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:591
---@return table  Copy of the configuration.
function controller_drivingDynamics_supervisors_components_brakeControl.getConfig() end

--- Resets the action flags to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:330
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_brakeControl.init(jbeamData) end

--- Stores the number of wheels.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:533
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_supervisors_components_brakeControl.initLastStage(jbeamData) end

--- Reads the configuration, creates the PIDs and registers with tractionControl, yawControl and absControl depending on their presence; installs the ABS brake functions on the wheels.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:373
---@param jbeamData table jbeam data (see notes).
function controller_drivingDynamics_supervisors_components_brakeControl.initSecondStage(jbeamData) end

--- Stores the reference to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:299
---@param cmu table CMU controller.
function controller_drivingDynamics_supervisors_components_brakeControl.registerCMU(cmu) end

--- Resets flags and PIDs and reinstalls the ABS brake functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:309
function controller_drivingDynamics_supervisors_components_brakeControl.reset() end

--- Sends the configuration to the CMU.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:595
function controller_drivingDynamics_supervisors_components_brakeControl.sendConfigData() end

--- Replaces the entire configuration and reconfigures the PIDs.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:586
---@param configTable table Table {tractionControl, yawControl, absControl}.
function controller_drivingDynamics_supervisors_components_brakeControl.setConfig(configTable) end

--- Enables/disables debug packets.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:293
---@param debugEnabled boolean True to enable.
function controller_drivingDynamics_supervisors_components_brakeControl.setDebugMode(debugEnabled) end

--- Applies parameters (see notes) then reconfigures the PIDs.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:546
---@param parameters table<string, any> Parameters to apply.
function controller_drivingDynamics_supervisors_components_brakeControl.setParameters(parameters) end

--- Disables the component.
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:537
function controller_drivingDynamics_supervisors_components_brakeControl.shutdown() end

--- Writes electrics.values.isYCBrakeActive/isTCBrakeActive/isABSBrakeActive then resets them to zero (debug version: also sends a detailed packet).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:245
---@param dt number Graphics time step (s).
function controller_drivingDynamics_supervisors_components_brakeControl.updateGFX(dt) end

--- Every step: adds the TC/YC brake of each controlled wheel to wheel.desiredBrakingTorque and rotates the ABS torque limits.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/supervisors/components/brakeControl.lua:51
---@param dt number Time step (s).
function controller_drivingDynamics_supervisors_components_brakeControl.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_supervisors_components_brakeControl
