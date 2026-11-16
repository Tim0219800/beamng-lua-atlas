---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driving Dynamics Suite actuator: active torque split between the two outputs of a differential (torque vectoring). It compares the left and right wheel speeds corrected for the turning radius (`CMU.vehicleData.turningCircleSpeedRatios`) and, under throttle, uses a PID to compute a split offset (plus a term depending on the steering wheel, the longitudinal g and the throttle). The result sets the differential's `diffTorqueSplitA` and `diffTorqueSplitB` around 0.5/0.5. Call order: `defaultOrder = 80`.
--- Access: controller `drivingDynamics/actuators/activeDiffBias` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_drivingDynamics_actuators_activeDiffBias
---@field defaultOrder number 80.
---@field isActing boolean true if the split offset is non-zero.
---@field isActive boolean true if the differential and the wheels were found.
---@field overrideMax number Upper bound of the offset (1 by default).
---@field overrideMin number Lower bound of the offset imposed by a supervisor (-1 by default).
---@field type string "auxiliary".
---@field wheelSides table<string, integer> {left = -1|1, right = -1|1}: indicates which differential output feeds the left or right side (filled by initSecondStage).
local controller_drivingDynamics_actuators_activeDiffBias = {}

--- Returns a copy of the parameters.
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:280
---@return table  Deep copy.
function controller_drivingDynamics_actuators_activeDiffBias.getConfig() end

--- Reads the jbeam parameters and creates the split PID.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:156
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_activeDiffBias.init(jbeamData) end

--- Finds the differential (`differentialName`), its wheels per output and the left/right side; enables the system.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:180
---@param jbeamData table Jbeam data.
function controller_drivingDynamics_actuators_activeDiffBias.initSecondStage(jbeamData) end

--- Called by the CMU to give it a reference to itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:253
---@param cmu table CMU module.
function controller_drivingDynamics_actuators_activeDiffBias.registerCMU(cmu) end

--- Resets isActing and the override bounds to their initial value.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:150
function controller_drivingDynamics_actuators_activeDiffBias.reset() end

--- Resets the override bounds to -1 and 1.
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:51
function controller_drivingDynamics_actuators_activeDiffBias.resetOverride() end

--- Sends the parameters to the CMU in a config debug packet.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:284
function controller_drivingDynamics_actuators_activeDiffBias.sendConfigData() end

--- Replaces the whole parameter table.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:276
---@param configTable table New parameters.
function controller_drivingDynamics_actuators_activeDiffBias.setConfig(configTable) end

--- Enables or disables sending debug packets.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:247
---@param debugEnabled boolean true to send.
function controller_drivingDynamics_actuators_activeDiffBias.setDebugMode(debugEnabled) end

--- Changes avDiffThreshold, isEnabled, maxBiasOffset and brakingPIDkP/kI/kD at runtime (via CMU.applyParameter).
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:257
---@param parameters table Table of parameters to change.
function controller_drivingDynamics_actuators_activeDiffBias.setParameters(parameters) end

--- Stops the actuator.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:143
function controller_drivingDynamics_actuators_activeDiffBias.shutdown() end

--- Fixed step (100 Hz): computes the corrected speeds and the split offset (PID + steering wheel term) and sets the differential's torque split.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:56
---@param dt number Step in seconds.
function controller_drivingDynamics_actuators_activeDiffBias.updateFixedStep(dt) end

--- Every frame: nothing useful (returns if disabled). Debug variant: sends the values to the CMU.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua:112
---@param dt number Time step in seconds.
function controller_drivingDynamics_actuators_activeDiffBias.updateGFX(dt) end

return controller_drivingDynamics_actuators_activeDiffBias
