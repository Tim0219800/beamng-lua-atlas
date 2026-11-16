# `jit_p`

*File: `lua/common/jit/p.lua` · VM: Common (GE + vehicle) · 310 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jit/p")`

LuaJIT's jit.p module (author Mike Pall, MIT license, copyright 2005-2026): simple interface to the low-overhead profiler built into LuaJIT (jit.profile). It samples the call stack and produces a report (functions, module:line, VM states, zones, source annotations or raw format for flame graphs). In BeamNG the copy is adapted (the != and += operators of the game's extended syntax). The mode option is a string of letters: f/F/l (stack format), number = depth, s (split), p (paths), v (VM states), z (zones), r (raw count), a/A (annotations), G (output for graphs), m<n> (minimum percentage, 3 by default), i<n> (interval in ms, 10 by default).

## Example

```lua
local p = require('jit/p')
p.start('f')   -- default mode
-- ... code to profile ...
p.stop()       -- writes the report to stdout (or to LUAJIT_PROFILEFILE)
```

## Notes

- Output goes to outfile, otherwise to the LUAJIT_PROFILEFILE environment variable, otherwise stdout; '-' forces stdout.
- An active profile is also terminated automatically by the __gc of a newproxy(true) proxy when the module is garbage-collected.
- The 'z' mode loads jit.zone on demand.

## Functions

| Function | Description | Line |
|---|---|---|
| `jit_p.start(mode, outfile)` | Starts the profiler with the given mode string. Intended for the -jp option of the LuaJIT command line. | 294 |
| `jit_p.stop()` | Stops the profiler and writes the result ("[No samples collected]" if there are no samples). Closes the output file if it is not stdout. | 224 |

### Parameter details

#### `jit_p.start(mode, outfile)`

Starts the profiler with the given mode string. Intended for the -jp option of the LuaJIT command line.

- `mode` (*string|nil*) : String of letters/numbers (see module); "f" by default.
- `outfile` (*string|nil*) : Output file; default LUAJIT_PROFILEFILE or stdout; '-' = stdout.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jit/p.lua`.*
