# `jit_v`

*File: `lua/common/jit/v.lua` · VM: Common (GE + vehicle) · 175 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jit/v")`

LuaJIT's jit.v module (Mike Pall, MIT license, 2005-2026): verbose mode of the JIT compiler. It prints one line per generated trace ([TRACE n file:line ...]) and per aborted trace, which helps to see which code is compiled or where the compiler falls back to the interpreter (NYI). Output defaults to stderr; file via argument or the LUAJIT_VERBOSEFILE environment variable.

## Example

```lua
local v = require('jit/v')
v.on('jit_verbose.txt')
-- code to observe
v.off()
```

## Notes

- on and start are the same function (start serves the -jv command-line option).
- A second call to on() first detaches the previous handlers (dumpoff).
- The output file is overwritten at each start; '-' means stdout.

## Functions

| Function | Description | Line |
|---|---|---|
| `jit_v.off()` | Detaches the trace handler and closes the file (except stdout/stderr). | 146 |
| `jit_v.on(outfile)` | Opens the output file and attaches the trace handler (jit.attach 'trace'). | 156 |
| `jit_v.start(outfile)` | Alias of on, intended for the -jv command-line option. | 156 |

### Parameter details

#### `jit_v.on(outfile)`

Opens the output file and attaches the trace handler (jit.attach 'trace').

- `outfile` (*string|nil*) : Output file; default LUAJIT_VERBOSEFILE otherwise stderr; '-' = stdout.

#### `jit_v.start(outfile)`

Alias of on, intended for the -jv command-line option.

- `outfile` (*string|nil*) : Output file.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jit/v.lua`.*
