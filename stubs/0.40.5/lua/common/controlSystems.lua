---@meta
-- tim19Atlas stub generated from lua/common/controlSystems.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by newPIDParallel. Public fields: kP, kI, kD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.
---@class controlSystems_PIDParallel
local controlSystems_PIDParallel = {}

--- Sends error, integral and output to the debug graph via guihooks.graph.
---Source: lua/common/controlSystems.lua:89
function controlSystems_PIDParallel:drawDebug() end

--- Prints the PID configuration with print.
---Source: lua/common/controlSystems.lua:98
function controlSystems_PIDParallel:dump() end

--- Field alias to getMethod (or getWithDebugMethod in debug mode). Usage: pid:get(processVariable, setPoint, dt).
---Source: lua/common/controlSystems.lua:dyn
---@param processVariable number Current measurement.
---@param setPoint number Setpoint.
---@param dt number Time step in seconds.
---@return number  Bounded PID output.
---@return number  Error (setpoint - measurement) after the deadzone.
function controlSystems_PIDParallel:get(processVariable, setPoint, dt) end

--- Computes the PID output for this time step and updates error, integral, output, lastProcessVariable.
---Source: lua/common/controlSystems.lua:58
---@param processVariable number Current measurement.
---@param setPoint number Setpoint.
---@param dt number Time step in seconds (> 0).
---@return number  Bounded output.
---@return number  Error.
function controlSystems_PIDParallel:getMethod(processVariable, setPoint, dt) end

--- Like getMethod but also calls drawDebug. Returns only the output (not the error).
---Source: lua/common/controlSystems.lua:76
---@param processVariable number Current measurement.
---@param setPoint number Setpoint.
---@param dt number Time step in seconds.
---@return number  Bounded output.
function controlSystems_PIDParallel:getWithDebugMethod(processVariable, setPoint, dt) end

--- Resets error, output, integral and lastProcessVariable to 0.
---Source: lua/common/controlSystems.lua:82
function controlSystems_PIDParallel:reset() end

--- Changes the parameters; each nil argument keeps the current value.
---Source: lua/common/controlSystems.lua:41
---@param kP number|nil Proportional gain.
---@param kI number|nil Integral gain.
---@param kD number|nil Derivative gain.
---@param minOutput number|nil Min output.
---@param maxOutput number|nil Max output.
---@param integralInCoef number|nil Accumulation coefficient.
---@param integralOutCoef number|nil Shrink coefficient.
---@param minIntegral number|nil Lower bound of the integral.
---@param maxIntegral number|nil Upper bound of the integral.
---@param errorDeadzone number|nil Deadzone.
function controlSystems_PIDParallel:setConfig(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

--- Enables/disables debug plotting by changing the get method.
---Source: lua/common/controlSystems.lua:93
---@param debugEnabled boolean true to use getWithDebugMethod.
function controlSystems_PIDParallel:setDebug(debugEnabled) end

--- Object returned by newPIDStandard. Public fields: kP, tICoef (1/tI), tD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.
---@class controlSystems_PIDStandard
local controlSystems_PIDStandard = {}

--- Sends error, integral and output to the debug graph via guihooks.graph.
---Source: lua/common/controlSystems.lua:179
function controlSystems_PIDStandard:drawDebug() end

--- Prints the PID configuration with print.
---Source: lua/common/controlSystems.lua:188
function controlSystems_PIDStandard:dump() end

--- Field alias to getMethod (or getWithDebugMethod in debug mode). Usage: pid:get(processVariable, setPoint, dt).
---Source: lua/common/controlSystems.lua:dyn
---@param processVariable number Current measurement.
---@param setPoint number Setpoint.
---@param dt number Time step in seconds.
---@return number  Bounded PID output.
---@return number  Error.
function controlSystems_PIDStandard:get(processVariable, setPoint, dt) end

--- Computes the standard PID output for this time step.
---Source: lua/common/controlSystems.lua:151
---@param processVariable number Current measurement.
---@param setPoint number Setpoint.
---@param dt number Time step in seconds (> 0).
---@return number  Bounded output.
---@return number  Error.
function controlSystems_PIDStandard:getMethod(processVariable, setPoint, dt) end

--- Like getMethod but calls drawDebug; returns only the output.
---Source: lua/common/controlSystems.lua:168
---@param processVariable number Current measurement.
---@param setPoint number Setpoint.
---@param dt number Time step in seconds.
---@return number  Bounded output.
function controlSystems_PIDStandard:getWithDebugMethod(processVariable, setPoint, dt) end

--- Resets integral and lastProcessVariable to 0 (error and output are untouched).
---Source: lua/common/controlSystems.lua:174
function controlSystems_PIDStandard:reset() end

--- Changes the parameters; nil keeps the value. tI is only taken into account if it is > 0.
---Source: lua/common/controlSystems.lua:134
---@param kP number|nil Proportional gain.
---@param tI number|nil Integral time.
---@param tD number|nil Derivative time.
---@param minOutput number|nil Min output.
---@param maxOutput number|nil Max output.
---@param integralInCoef number|nil Accumulation coefficient.
---@param integralOutCoef number|nil Shrink coefficient.
---@param minIntegral number|nil Lower bound of the integral.
---@param maxIntegral number|nil Upper bound of the integral.
---@param errorDeadzone number|nil Deadzone.
function controlSystems_PIDStandard:setConfig(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

--- Enables/disables debug plotting by changing the get method.
---Source: lua/common/controlSystems.lua:183
---@param debugEnabled boolean true to use getWithDebugMethod.
function controlSystems_PIDStandard:setDebug(debugEnabled) end

--- Creates a parallel-form PID: output = kP*error + kI*integral + kD*(−dPV/dt).
---Source: lua/common/controlSystems.lua:18
---@param kP number Proportional gain.
---@param kI number Integral gain.
---@param kD number Derivative gain (applied to the change of the process variable).
---@param minOutput number|nil Minimum output (default -math.huge).
---@param maxOutput number|nil Maximum output (default math.huge).
---@param integralInCoef number|nil Integral accumulation coefficient when it moves away from zero (default 1).
---@param integralOutCoef number|nil Coefficient applied when the integral shrinks (default 1).
---@param minIntegral number|nil Lower bound of the integral (default -maxIntegral).
---@param maxIntegral number|nil Upper bound of the integral (default maxOutput / kI).
---@param errorDeadzone number|nil Deadzone on |error| (default 0).
---@return table  PIDParallel object (methods get, setConfig, reset, setDebug, dump, drawDebug).
function newPIDParallel(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

--- Creates a standard-form PID: output = kP*(error + integral/tI + tD*(−dPV/dt)).
---Source: lua/common/controlSystems.lua:111
---@param kP number Overall proportional gain.
---@param tI number Integral time; if <= 0, the integral term is disabled (coefficient 0).
---@param tD number Derivative time.
---@param minOutput number|nil Minimum output (default -math.huge).
---@param maxOutput number|nil Maximum output (default math.huge).
---@param integralInCoef number|nil Integral accumulation coefficient (default 1).
---@param integralOutCoef number|nil Integral shrink coefficient (default 1).
---@param minIntegral number|nil Lower bound of the integral (default -maxIntegral).
---@param maxIntegral number|nil Upper bound of the integral (default maxOutput).
---@param errorDeadzone number|nil Deadzone on |error| (default 0).
---@return table  PIDStandard object (same methods as PIDParallel).
function newPIDStandard(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

