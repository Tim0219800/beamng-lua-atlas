# `electricsCustomValueParser`

*File: `lua/vehicle/electricsCustomValueParser.lua` · VM: Vehicle · 237 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("electricsCustomValueParser")`

Compiles and runs the custom electrical values declared in the jbeam (electrics.customValues: fields electricsName, electricsFunction, electricsDefault). Each expression is evaluated every frame in a sandboxed environment (math functions, round, clamp, smoothstep, case, pwm..., and a copy of `electrics`) then the result is copied back into electrics.values. Used only by electrics.lua.

## Example

```lua
-- jbeam (electrics.customValues section)
-- ["electricsName", "electricsFunction", "electricsDefault"],
-- ["myBlink", "pwm(1, 2, 0.5)", 0],
-- ["throttleHalf", "clamp(electrics.throttle * 0.5, 0, 1)", 0]
```

## Notes

- An expression has the form `electrics.<name> = <expression>`: assignments (isolated = sign) are refused inside the expression itself.
- Variables available in the expression: electrics (copy of the current values), dt, math.* functions, dump, dumpz, round, square, clamp, smoothstep, smootherstep, smoothmin, sign, case, pwm, logValue.
- case(selector, ...): with a boolean, acts as a ternary (true -> 1st argument, false -> 2nd); with a number n, returns the (n)th argument (1-based after floor, with n=0 returning the last one for lack of index 0), or the last argument if out of range.
- pwm(input, frequency, dutyCycle, timeOffset): returns input when a normalized sine wave (frequency in Hz) exceeds 1 - dutyCycle, otherwise 0. The pwm time restarts at 0 every 3600 s.
- logValue(value, label) prints the value and returns it (debugging aid).
- Bug/anomaly: `pwm` is declared as a global function (function pwm without local), it leaks into the global environment of the vehicle VM.
- If compilation of the whole block fails, updateCustomElectricsFunction stays nil and M.updateGFX will raise an error every frame (unprotected).
- The 'electricsFunction' expression (literal value of a badly merged jbeam table header) is deliberately ignored.

## Functions

| Function | Description | Line |
|---|---|---|
| `electricsCustomValueParser.compileCustomValueUpdates(customValueData)` | Builds the sandboxed environment, parses each custom value, initializes electrics.values with electricsDefault and compiles a single function running all the assignments. *(internal)* | 165 |
| `electricsCustomValueParser.resetCustomValues()` | Puts back into electrics.values the electricsDefault values of all custom values (called at reset). *(internal)* | 117 |
| `electricsCustomValueParser.updateGFX(dt)` | Copies electrics.values into the environment, runs the compiled function then copies the custom keys back into electrics.values. Called by electrics.updateGFXSecondStep. *(internal)* | 106 |

### Parameter details

#### `electricsCustomValueParser.compileCustomValueUpdates(customValueData)`

Builds the sandboxed environment, parses each custom value, initializes electrics.values with electricsDefault and compiles a single function running all the assignments.

- `customValueData` (*table<integer, table>*) : List of entries {electricsName, electricsFunction?, electricsDefault?}.
- **returns**: nil Nothing (nil also if compilation fails, error logged).

#### `electricsCustomValueParser.updateGFX(dt)`

Copies electrics.values into the environment, runs the compiled function then copies the custom keys back into electrics.values. Called by electrics.updateGFXSecondStep.

- `dt` (*number*) : Time step in seconds.

## Class `customElectricsEnv`

Object `customElectricsEnv` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `customElectricsEnv.case(selector, ...)` | function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that<br>in case it's a bool, it works like a ternary if, returning the second param if true, the third if false<br>if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param | 20 |
| `customElectricsEnv.pwm(input, frequency, dutyCycle, timeOffset)` |  | 36 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `pwm(input, frequency, dutyCycle, timeOffset)` |  | 36 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/electricsCustomValueParser.lua`.*
