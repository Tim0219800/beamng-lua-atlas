---@meta
-- tim19Atlas stub generated from lua/vehicle/electricsCustomValueParser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compiles and runs the custom electrical values declared in the jbeam (electrics.customValues: fields electricsName, electricsFunction, electricsDefault). Each expression is evaluated every frame in a sandboxed environment (math functions, round, clamp, smoothstep, case, pwm..., and a copy of `electrics`) then the result is copied back into electrics.values. Used only by electrics.lua.
--- Access: `require("electricsCustomValueParser")`
---@class electricsCustomValueParser
local electricsCustomValueParser = {}

--- Builds the sandboxed environment, parses each custom value, initializes electrics.values with electricsDefault and compiles a single function running all the assignments.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electricsCustomValueParser.lua:165
---@param customValueData table<integer, table> List of entries {electricsName, electricsFunction?, electricsDefault?}.
---@return nil  Nothing (nil also if compilation fails, error logged).
function electricsCustomValueParser.compileCustomValueUpdates(customValueData) end

--- Puts back into electrics.values the electricsDefault values of all custom values (called at reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electricsCustomValueParser.lua:117
function electricsCustomValueParser.resetCustomValues() end

--- Copies electrics.values into the environment, runs the compiled function then copies the custom keys back into electrics.values. Called by electrics.updateGFXSecondStep.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electricsCustomValueParser.lua:106
---@param dt number Time step in seconds.
function electricsCustomValueParser.updateGFX(dt) end

--- Local class `customElectricsEnv` of lua/vehicle/electricsCustomValueParser.lua
---@class electricsCustomValueParser_customElectricsEnv
local electricsCustomValueParser_customElectricsEnv = {}

--- function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that
--- in case it's a bool, it works like a ternary if, returning the second param if true, the third if false
--- if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param
---Source: lua/vehicle/electricsCustomValueParser.lua:20
---@param selector any
---@param ... any
function electricsCustomValueParser_customElectricsEnv.case(selector, ...) end

---Source: lua/vehicle/electricsCustomValueParser.lua:36
---@param input any
---@param frequency any
---@param dutyCycle any
---@param timeOffset any
function electricsCustomValueParser_customElectricsEnv.pwm(input, frequency, dutyCycle, timeOffset) end

---Source: lua/vehicle/electricsCustomValueParser.lua:36
---@param input any
---@param frequency any
---@param dutyCycle any
---@param timeOffset any
function pwm(input, frequency, dutyCycle, timeOffset) end

return electricsCustomValueParser
