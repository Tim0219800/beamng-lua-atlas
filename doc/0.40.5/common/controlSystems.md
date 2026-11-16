# `controlSystems`

*File: `lua/common/controlSystems.lua` · VM: Common (GE + vehicle) · 191 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("controlSystems")`

Provides two PID controllers: parallel form (newPIDParallel, gains kP/kI/kD) and standard form (newPIDStandard, kP with integral time tI and derivative time tD). Both differentiate on the process variable (not on the error) to avoid spikes when the setpoint changes, and handle output saturation, integral anti-windup and an error deadzone. A modder uses them to regulate a torque, an RPM, a speed, etc.

## Example

```lua
local pid = newPIDParallel(1, 0.5, 0.1, 0, 1)
-- at each time step:
local output, err = pid:get(currentValue, targetValue, dt)
```

## Notes

- The constructors are global functions; the returned objects have a get method (assigned in the data table) that points to getMethod, or getWithDebugMethod if setDebug(true).
- get returns two values: the PID output and the current error (useful to detect a near-steady state).
- dt must be > 0 (division by dt in the derivative term).
- If |error| < errorDeadzone, the error is set to 0 AND the integral is reset to 0.
- integralInCoef applies when the integral and the error have opposite signs or are zero (the integral decreases), integralOutCoef when they have the same sign (the integral grows).
- Probable bug: PIDParallel:setConfig computes maxIntegral with the kI parameter (not self.kI): calling setConfig without kI or maxIntegral causes an arithmetic error on nil.
- Inconsistency: PIDStandard:reset resets neither error nor output (unlike PIDParallel:reset).
- The debug methods use guihooks.graph to plot error, integral and output.

## Class `PIDParallel`

Object returned by newPIDParallel. Public fields: kP, kI, kD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.

| Method | Description | Line |
|---|---|---|
| `PIDParallel:drawDebug()` | Sends error, integral and output to the debug graph via guihooks.graph. | 89 |
| `PIDParallel:dump()` | Prints the PID configuration with print. | 98 |
| `PIDParallel:get(processVariable, setPoint, dt)` | Field alias to getMethod (or getWithDebugMethod in debug mode). Usage: pid:get(processVariable, setPoint, dt). | dyn |
| `PIDParallel:getMethod(processVariable, setPoint, dt)` | Computes the PID output for this time step and updates error, integral, output, lastProcessVariable. | 58 |
| `PIDParallel:getWithDebugMethod(processVariable, setPoint, dt)` | Like getMethod but also calls drawDebug. Returns only the output (not the error). | 76 |
| `PIDParallel:reset()` | Resets error, output, integral and lastProcessVariable to 0. | 82 |
| `PIDParallel:setConfig(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Changes the parameters; each nil argument keeps the current value. | 41 |
| `PIDParallel:setDebug(debugEnabled)` | Enables/disables debug plotting by changing the get method. | 93 |

## Class `PIDStandard`

Object returned by newPIDStandard. Public fields: kP, tICoef (1/tI), tD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.

| Method | Description | Line |
|---|---|---|
| `PIDStandard:drawDebug()` | Sends error, integral and output to the debug graph via guihooks.graph. | 179 |
| `PIDStandard:dump()` | Prints the PID configuration with print. | 188 |
| `PIDStandard:get(processVariable, setPoint, dt)` | Field alias to getMethod (or getWithDebugMethod in debug mode). Usage: pid:get(processVariable, setPoint, dt). | dyn |
| `PIDStandard:getMethod(processVariable, setPoint, dt)` | Computes the standard PID output for this time step. | 151 |
| `PIDStandard:getWithDebugMethod(processVariable, setPoint, dt)` | Like getMethod but calls drawDebug; returns only the output. | 168 |
| `PIDStandard:reset()` | Resets integral and lastProcessVariable to 0 (error and output are untouched). | 174 |
| `PIDStandard:setConfig(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Changes the parameters; nil keeps the value. tI is only taken into account if it is > 0. | 134 |
| `PIDStandard:setDebug(debugEnabled)` | Enables/disables debug plotting by changing the get method. | 183 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `newPIDParallel(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Creates a parallel-form PID: output = kP*error + kI*integral + kD*(−dPV/dt). | 18 |
| `newPIDStandard(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone)` | Creates a standard-form PID: output = kP*(error + integral/tI + tD*(−dPV/dt)). | 111 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/controlSystems.lua`.*
