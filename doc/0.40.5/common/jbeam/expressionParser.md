# `jbeam_expressionParser`

*File: `lua/common/jbeam/expressionParser.lua` · VM: Common (GE + vehicle) · 190 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/expressionParser")`

Evaluates JBeam expressions of the form "$=..." (computed values in jbeam files). The expression is transformed into Lua code (the '$=' prefix is removed, each '$' becomes 'var_'), compiled in a restricted environment (math functions, round, square, clamp, smoothstep, case, vec3, quat, include...) then executed. The jbeam variables ($name) are read from the provided vars table. Used by the jbeam loader, not by mods directly.

## Example

```lua
local ep = require('jbeam/expressionParser')
local v = ep.parseSafe('$=$width * 2 + sin(0.5)', {['$width'] = 1.5})
local f, vars = ep.compileSafe('$=$a + 1')
vars['$a'] = 4
print(f())  -- 5
```

## Notes

- Assignments (an isolated '=') are rejected; the operators >=, <=, == and ~= remain allowed.
- Expression environment: all math functions, round, square, clamp, smoothstep, smootherstep, smoothmin, sign, case, vec3, quat, concat (table.concat), include, print(val, label) (prints and returns val), var(name) (returns '$name'), and reading variables via var_name. The table is read-only (any write raises an error).
- Jbeam variables: a value of vars that is a table is read via its val field.
- case(selector, ...): with a boolean, returns the 1st following argument if the selector is true, the 2nd if false; with a number n, returns the n-th argument (1-based index over the arguments after the selector, truncated), and the last one if n is out of range or 0. The code comment mentions n+1 but the code indexes arg[floor(n)] directly.
- include(uri, sheet, cell) reads a .csv (csvlib.readFileCSV) or .xlsx (libs/xlsxlib) file; other extension: error logged and returns nil, message.
- parse has no protection: an expression that does not compile causes a call on nil (Lua error) and a runtime error is not caught. Prefer parseSafe or compileSafe.
- In compileSafe, the context is recreated on each call; the returned variables table is the one to fill before calling the compiled function.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_expressionParser.compileSafe(expr)` | Compiles an expression for reuse without recompiling: returns the function and the variables table it will read. | 154 |
| `jbeam_expressionParser.parse(expr, vars)` | Evaluates the expression without protection (see notes). Assignments are rejected and return nil. | 131 |
| `jbeam_expressionParser.parseSafe(expr, vars)` | Evaluates the expression in a pcall: on a forbidden assignment, invalid syntax or runtime error, logs an error and returns nil. | 98 |

### Parameter details

#### `jbeam_expressionParser.compileSafe(expr)`

Compiles an expression for reuse without recompiling: returns the function and the variables table it will read.

- `expr` (*string*) : Expression starting with '$='.
- **returns**: function|nil Function with no arguments that evaluates the expression; nil on error.
- **returns**: table|nil Variables table (keys '$name') to fill before the call.

#### `jbeam_expressionParser.parse(expr, vars)`

Evaluates the expression without protection (see notes). Assignments are rejected and return nil.

- `expr` (*string*) : Expression starting with '$='.
- `vars` (*table<string, any>*) : Jbeam variables.
- **returns**: any|nil Result.

#### `jbeam_expressionParser.parseSafe(expr, vars)`

Evaluates the expression in a pcall: on a forbidden assignment, invalid syntax or runtime error, logs an error and returns nil.

- `expr` (*string*) : Expression starting with '$='.
- `vars` (*table<string, any>*) : Jbeam variables (keys '$name').
- **returns**: any|nil Result of the expression, nil on error.

## Class `c`

Object `c` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `c.case(selector, ...)` | function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that<br>in case it's a bool, it works like a ternary if, returning the second param if true, the third if false<br>if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param | 13 |
| `c.include(resourceURI, sheetName, cellRef)` |  | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/expressionParser.lua`.*
