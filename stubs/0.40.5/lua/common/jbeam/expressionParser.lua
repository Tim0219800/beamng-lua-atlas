---@meta
-- tim19Atlas stub generated from lua/common/jbeam/expressionParser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Evaluates JBeam expressions of the form "$=..." (computed values in jbeam files). The expression is transformed into Lua code (the '$=' prefix is removed, each '$' becomes 'var_'), compiled in a restricted environment (math functions, round, square, clamp, smoothstep, case, vec3, quat, include...) then executed. The jbeam variables ($name) are read from the provided vars table. Used by the jbeam loader, not by mods directly.
--- Access: `require("jbeam/expressionParser")`
---@class jbeam_expressionParser
local jbeam_expressionParser = {}

--- Compiles an expression for reuse without recompiling: returns the function and the variables table it will read.
---Source: lua/common/jbeam/expressionParser.lua:154
---@param expr string Expression starting with '$='.
---@return function|nil  Function with no arguments that evaluates the expression; nil on error.
---@return table|nil  Variables table (keys '$name') to fill before the call.
function jbeam_expressionParser.compileSafe(expr) end

--- Evaluates the expression without protection (see notes). Assignments are rejected and return nil.
---Source: lua/common/jbeam/expressionParser.lua:131
---@param expr string Expression starting with '$='.
---@param vars table<string, any> Jbeam variables.
---@return any|nil  Result.
function jbeam_expressionParser.parse(expr, vars) end

--- Evaluates the expression in a pcall: on a forbidden assignment, invalid syntax or runtime error, logs an error and returns nil.
---Source: lua/common/jbeam/expressionParser.lua:98
---@param expr string Expression starting with '$='.
---@param vars table<string, any> Jbeam variables (keys '$name').
---@return any|nil  Result of the expression, nil on error.
function jbeam_expressionParser.parseSafe(expr, vars) end

--- Local class `c` of lua/common/jbeam/expressionParser.lua
---@class jbeam_expressionParser_c
local jbeam_expressionParser_c = {}

--- function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that
--- in case it's a bool, it works like a ternary if, returning the second param if true, the third if false
--- if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param
---Source: lua/common/jbeam/expressionParser.lua:13
---@param selector any
---@param ... any
function jbeam_expressionParser_c.case(selector, ...) end

---Source: lua/common/jbeam/expressionParser.lua:29
---@param resourceURI any
---@param sheetName any
---@param cellRef any
function jbeam_expressionParser_c.include(resourceURI, sheetName, cellRef) end

return jbeam_expressionParser
