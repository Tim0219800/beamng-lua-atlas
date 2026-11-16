---@meta
-- tim19Atlas stub generated from lua/common/jit/p.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaJIT's jit.p module (author Mike Pall, MIT license, copyright 2005-2026): simple interface to the low-overhead profiler built into LuaJIT (jit.profile). It samples the call stack and produces a report (functions, module:line, VM states, zones, source annotations or raw format for flame graphs). In BeamNG the copy is adapted (the != and += operators of the game's extended syntax). The mode option is a string of letters: f/F/l (stack format), number = depth, s (split), p (paths), v (VM states), z (zones), r (raw count), a/A (annotations), G (output for graphs), m<n> (minimum percentage, 3 by default), i<n> (interval in ms, 10 by default).
--- Access: `require("jit/p")`
---@class jit_p
local jit_p = {}

--- Starts the profiler with the given mode string. Intended for the -jp option of the LuaJIT command line.
---Source: lua/common/jit/p.lua:294
---@param mode string|nil String of letters/numbers (see module); "f" by default.
---@param outfile string|nil Output file; default LUAJIT_PROFILEFILE or stdout; '-' = stdout.
function jit_p.start(mode, outfile) end

--- Stops the profiler and writes the result ("[No samples collected]" if there are no samples). Closes the output file if it is not stdout.
---Source: lua/common/jit/p.lua:224
function jit_p.stop() end

return jit_p
