---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/autoLevelSuspension.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary pneumatic suspension controller with automatic leveling (defaultOrder 80). For each "control group" (one measurement beam + one or more airbag beam groups), it compares the measured length of the beam to a target length and opens/closes the actuator's valves (by default the "airbags" controller) in proportion to the difference. A modder uses it to set the ride height (setTargetLength), raise/lower it manually (setAdjustmentRate) or temporarily suspend the regulation.
--- Access: controller `pneumatics/autoLevelSuspension` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pneumatics_autoLevelSuspension
---@field defaultOrder number Execution order (80).
---@field type string "auxiliary".
local controller_pneumatics_autoLevelSuspension = {}

--- Average air flow in the actuator's beam groups for this group.
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:113
---@param groupName string Group name.
---@return number  Average flow (actuator unit).
function controller_pneumatics_autoLevelSuspension.getAverageFlowRate(groupName) end

--- Returns the last measured length of the control beam (0 and log E if unknown).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:104
---@param groupName string Group name.
---@return number  Length in m.
function controller_pneumatics_autoLevelSuspension.getCurrentLength(groupName) end

--- Saveable state: target length and adjustment rate of each group (keys prefixed by the controller name).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:294
---@return table  State table (reused between calls).
function controller_pneumatics_autoLevelSuspension.getState() end

--- Returns the target length of a group (0 and log E if unknown).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:95
---@param groupName string Group name.
---@return number  Target length in m.
function controller_pneumatics_autoLevelSuspension.getTargetLength(groupName) end

--- Builds the control groups from the jbeam section actuatorGroups and reads the actuation parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:213
---@param jbeamData table Controller jbeam data.
function controller_pneumatics_autoLevelSuspension.init(jbeamData) end

--- Gets the actuator controller (jbeam actuatorName, "airbags" by default). Called after the init of all controllers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:282
---@param jbeamData table Jbeam data.
function controller_pneumatics_autoLevelSuspension.initSecondStage(jbeamData) end

--- True while the group is in initial calibration (1.5 s).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:131
---@param groupName string Group name.
---@return boolean  In calibration?
function controller_pneumatics_autoLevelSuspension.isCalibrating(groupName) end

--- True if the absolute value of the average flow exceeds 1e-4.
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:122
---@param groupName string Group name.
---@return boolean  Is the group moving?
function controller_pneumatics_autoLevelSuspension.isMoving(groupName) end

--- Resets targets, lengths, timers and adjustment speeds to zero; restarts the calibration of groups without defaultTargetLength.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:196
function controller_pneumatics_autoLevelSuspension.reset() end

--- Forces a manual height adjustment: the valve state is imposed at rate (-1 lowers, 1 raises).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:53
---@param groupNames string|table<integer, string> Control group(s).
---@param rate number Rate -1..1 (bounded).
function controller_pneumatics_autoLevelSuspension.setAdjustmentRate(groupNames, rate) end

--- Deprecated (log W): equivalent to setAdjustmentRate(groups, -1) then stopAdjusting(groups, true).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:76
---@param groupNames string|table<integer, string> Group(s).
---@param decrease boolean Lower (true) or stop (false).
function controller_pneumatics_autoLevelSuspension.setMomentaryDecrease(groupNames, decrease) end

--- Deprecated (log W): equivalent to setAdjustmentRate(groups, 1) then stopAdjusting(groups, true).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:67
---@param groupNames string|table<integer, string> Group(s).
---@param increase boolean Raise (true) or stop (false).
function controller_pneumatics_autoLevelSuspension.setMomentaryIncrease(groupNames, increase) end

--- Restores targets and adjustment rates (NaN or non-numeric values ignored).
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:302
---@param data table|nil Table produced by getState.
function controller_pneumatics_autoLevelSuspension.setState(data) end

--- Sets the target length (m) of the groups; with immediate true, the regulation starts without waiting for actuationDelay.
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:85
---@param groupNames string|table<integer, string> Control group(s).
---@param targetLength number Target length of the measurement beam in m.
---@param immediate boolean|nil Bypass the actuation delay.
function controller_pneumatics_autoLevelSuspension.setTargetLength(groupNames, targetLength, immediate) end

--- Suspends (true) or resumes (false) the automatic regulation of the groups; valves closed during suspension.
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:47
---@param groupNames string|table<integer, string> Control group(s).
---@param disabled boolean Suspend?
function controller_pneumatics_autoLevelSuspension.setTemporarilyDisabled(groupNames, disabled) end

--- Stops the manual adjustment; with commitNewHeight true the current length becomes the new target.
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:60
---@param groupNames string|table<integer, string> Control group(s).
---@param commitNewHeight boolean|nil Store the reached height as the target.
function controller_pneumatics_autoLevelSuspension.stopAdjusting(groupNames, commitNewHeight) end

--- Physics step: for each group, calibrates, applies a manual adjustment or regulates toward the target length via actuator.setBeamGroupsValveState.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/autoLevelSuspension.lua:140
---@param dt number Physics step in seconds.
function controller_pneumatics_autoLevelSuspension.updateFixedStep(dt) end

return controller_pneumatics_autoLevelSuspension
