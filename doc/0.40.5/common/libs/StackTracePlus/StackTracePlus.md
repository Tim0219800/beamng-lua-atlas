# `libs_StackTracePlus_StackTracePlus`

*File: `lua/common/libs/StackTracePlus/StackTracePlus.lua` · VM: Common (GE + vehicle) · 564 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/StackTracePlus/StackTracePlus")`

StackTracePlus: third-party library (Ignacio Burgueño, MIT license) that produces detailed Lua stack traces: guessed function names when they are missing, known functions and tables of the standard library, and a dump of the local variables of each level. Usable as an error handler for xpcall or pcall. The module returns the table _M.

## Example

```lua
local stp = require("libs/StackTracePlus/StackTracePlus")
local ok, trace = xpcall(myFunction, function(e) return (stp.stacktrace(e)) end)
```

## Notes

- stacktrace and stacktraceSimple accept an optional first thread argument: if it is not of type thread, the parameters are shifted (message, level, level_limit, dump_locals).
- dump_locals is true by default. level is 1 by default and level_limit stops the climb.
- stacktrace returns two values: the trace (string) and the original error (string or rendering of a table error object).
- add_known_table and add_known_function raise an error if the item is already known to the module ("Cannot override...").

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_StackTracePlus_StackTracePlus.add_known_function(fun, description)` | Adds a function to the list of known functions, with a description used in the traces. | 556 |
| `libs_StackTracePlus_StackTracePlus.add_known_table(tab, description)` | Adds a table to the list of known tables, with a description used when displaying local variables. | 547 |
| `libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals)` | Collects a detailed stack trace (delimited by "Stack Traceback >> START/END"), with the local variables of each Lua level. Suited as an xpcall error handler. | 439 |
| `libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals)` | Variant of stacktrace with the same parameters, producing a simpler trace (inferred from code: same skeleton, without the same detailed formatting). | 326 |

### Parameter details

#### `libs_StackTracePlus_StackTracePlus.add_known_function(fun, description)`

Adds a function to the list of known functions, with a description used in the traces.

- `fun` (*function*) : Function to name
- `description` (*string*) : Displayed name

#### `libs_StackTracePlus_StackTracePlus.add_known_table(tab, description)`

Adds a table to the list of known tables, with a description used when displaying local variables.

- `tab` (*table*) : Table to name
- `description` (*string*) : Displayed name

#### `libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals)`

Collects a detailed stack trace (delimited by "Stack Traceback >> START/END"), with the local variables of each Lua level. Suited as an xpcall error handler.

- `thread` (*thread|nil*) : Coroutine to inspect (default: the current coroutine)
- `message` (*string|table|nil*) : Error message or object placed at the head of the trace
- `level` (*integer|nil*) : Starting stack level (default 1)
- `level_limit` (*integer|nil*) : Maximum level to display
- `dump_locals` (*boolean|nil*) : Display local variables (default true)
- **returns**: string The full trace
- **returns**: string|nil The original error message

#### `libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals)`

Variant of stacktrace with the same parameters, producing a simpler trace (inferred from code: same skeleton, without the same detailed formatting).

- `thread` (*thread|nil*) : Coroutine to inspect
- `message` (*string|table|nil*) : Error message
- `level` (*integer|nil*) : Starting level (default 1)
- `level_limit` (*integer|nil*) : Maximum level
- `dump_locals` (*boolean|nil*) : Display locals (default true)
- **returns**: string The trace

## Class `Dumper`

Internal object that analyzes a stack (created by Dumper.new(thread)) and accumulates the trace lines.

| Method | Description | Line |
|---|---|---|
| `Dumper:DumpLocals(level)` | Walks through and adds to the trace the local variables of a stack level. | 254 |
| `Dumper:add(text)` | Adds a line of text to the buffer. | 238 |
| `Dumper:add_f(fmt, ...)` | Adds formatted text (string.format). | 241 |
| `Dumper:concat_lines()` | Concatenates the accumulated lines into a string. | 244 |
| `Dumper.new(thread)` | Creates a Dumper bound to a coroutine; adapts getinfo/getlocal (one-level offset if it is the current coroutine). | 207 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/StackTracePlus/StackTracePlus.lua`.*
