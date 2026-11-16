# `profiling_p`

*File: `lua/vehicle/extensions/profiling/p.lua` · VM: Vehicle · 320 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `profiling_p`: `extensions.load (vehicle VM)("profiling_p")`, then the global `profiling_p`

Third-party library: Mike Pall's LuaJIT profiler (jit.p), copyright 2005-2016, MIT license. It is a simple interface to the low-overhead profiler built into LuaJIT (jit.profile module). It samples the call stack at regular intervals and prints a summary (functions, module lines, VM states, zones) to a file or to standard output. A modder can use it in the vehicle VM to find the most expensive Lua functions.

## Example

```lua
extensions.load('profiling_p')
profiling_p.start('vl', 'profil.txt') -- modes: see notes
-- ... let it run ...
profiling_p.stop(true)
```

## Notes

- start mode string (combinable): f = stack with function names (default); F = same with module; l = module:line; <number> = stack depth; -<number> = inverted depth; s = split after the first level; p = full paths; v = VM states; z = zones; r = raw counts; a / A = annotate excerpts / full source files; G = raw output for graphical tools (flame graphs); m<number> = minimum percentage displayed (default 3); i<number> = sampling interval in ms (default 10).
- If outfile is nil, the LUAJIT_PROFILEFILE environment variable is used; otherwise standard output. The value '-' forces standard output.
- stop(false) stops sampling without writing a result. A garbage collection of the internal object (prof_ud) also calls prof_finish.
- Mode z loads require('jit.zone'); in this folder the zone library is the neighboring file zone.lua, which is not necessarily loadable under that name (inferred from code).

## Functions

| Function | Description | Line |
|---|---|---|
| `profiling_p.start(mode, outfile)` | Starts profiling with the given mode and chooses the output destination (file opened for writing, or standard output). | 304 |
| `profiling_p.stop(doOutput)` | Stops the profiler and, if doOutput is true, writes the result (display of the top entries or source annotation). Writes "[No samples collected]" if no sample was taken. | 231 |

### Parameter details

#### `profiling_p.start(mode, outfile)`

Starts profiling with the given mode and chooses the output destination (file opened for writing, or standard output).

- `mode` (*string|nil*) : mode string (see notes), "f" by default
- `outfile` (*string|nil*) : output file, '-' for standard output; nil = LUAJIT_PROFILEFILE or standard output

#### `profiling_p.stop(doOutput)`

Stops the profiler and, if doOutput is true, writes the result (display of the top entries or source annotation). Writes "[No samples collected]" if no sample was taken.

- `doOutput` (*boolean|nil*) : true to write the result

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/profiling/p.lua`.*
