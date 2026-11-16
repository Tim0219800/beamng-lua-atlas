---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/electricServo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `electricServo`: electric servo that turns a "rotor" wheel (jbeam key `connectedRotator`, a wheel declared as a rotator) toward a target angle, with a proportional regulator (angularSpring) and a limited torque (stallTorque). Category `engine` but without an output port: it has no powertrain parent and directly applies `propulsionTorque` to the wheel. The target angle is set by setTargetAngle or by an electrics value (`electricsTargetAngleName`). A modder uses it for motorized arms, dump beds or joints.
--- Access: powertrain device type `electricServo` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_electricServo
---@field deviceCategories table<string, boolean> {engine=true}.
---@field outputPorts table Empty table: no output port (the servo acts directly on the wheel).
local powertrain_electricServo = {}

--- Builds the servo, links it to the rotor wheel connectedRotator (declared via wheels.setWheelRotatorType(wheelID, 'rotator')), computes maxTorque and maxAV, determines the available modes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:147
---@param jbeamData table jbeam data of the component (maxRPM required).
---@return table  The device (class `device`).
function powertrain_electricServo.new(jbeamData) end

--- Object returned by new(jbeamData). velocityUpdate is nop (or an empty function if disconnected); torqueUpdate is servoUpdateTorque or the disconnected version.
---@class powertrain_electricServo_device
local powertrain_electricServo_device = {}

--- Computes the inertia of the rotor wheel around its axis (sum of mass * distance² of the wheel nodes) then cumulativeInertia = inertia / gearRatio². Called at powertrain initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:118
function powertrain_electricServo_device:calculateInertia() end

--- Marks the servo as broken, sets the output torque and the wheel torque to 0 and switches to the disconnected functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:107
function powertrain_electricServo_device:onBreak() end

--- Resets the torque, the output speed and the target and current angles.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:140
---@param jbeamData table jbeam data (unused).
function powertrain_electricServo_device:reset(jbeamData) end

--- Defines the angle limits used by the 'shortest' mode (no effect in 'absolute' mode).
---Source: lua/vehicle/powertrain/electricServo.lua:68
---@param minAngle number|nil Minimum angle in radians.
---@param maxAngle number|nil Maximum angle in radians.
function powertrain_electricServo_device:setMinMaxAngles(minAngle, maxAngle) end

--- Changes the mode ('connected' or 'disconnected') without checking availableModes, then reselects the update functions. 'disconnected': zero torque.
---Source: lua/vehicle/powertrain/electricServo.lua:102
---@param mode string 'connected' or 'disconnected'.
function powertrain_electricServo_device:setMode(mode) end

--- Sets the target angle in radians. 'absolute' mode: value as is. 'shortest' mode: wrapped into ]-2π, 2π[, clamped to [minAngle, maxAngle] if defined, and currentAngle is adjusted to choose the shortest path.
---Source: lua/vehicle/powertrain/electricServo.lua:47
---@param angle number Target angle in radians.
function powertrain_electricServo_device:setTargetAngle(angle) end

--- Adds angle to the current target angle (via setTargetAngle).
---Source: lua/vehicle/powertrain/electricServo.lua:64
---@param angle number Angle change in radians.
function powertrain_electricServo_device:setTargetAngleRelative(angle) end

--- Called at each physics step: integrates the current angle with the wheel speed, computes the angle error, a proportional torque clamped by stallTorque and attenuated by the speed, subtracts the friction, and writes wheel.propulsionTorque. Disconnected or broken: torque 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:39
---@param dt number Time step in seconds.
function powertrain_electricServo_device:torqueUpdate(dt) end

--- Defined only if electricsTargetAngleName is set. Reads the target angle from electrics.values and calls setTargetAngle. Called every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:73
---@param dt number Frame duration in seconds (unused).
function powertrain_electricServo_device:updateGFX(dt) end

--- Called after the powertrain is built; always returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:98
---@return boolean  true.
function powertrain_electricServo_device:validate() end

--- Called at each physics step; does nothing (nop or empty function in disconnected or broken mode).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricServo.lua:36
function powertrain_electricServo_device:velocityUpdate() end

return powertrain_electricServo
