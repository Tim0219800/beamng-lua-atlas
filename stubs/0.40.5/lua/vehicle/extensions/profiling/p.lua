---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/profiling/p.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library: Mike Pall's LuaJIT profiler (jit.p), copyright 2005-2016, MIT license. It is a simple interface to the low-overhead profiler built into LuaJIT (jit.profile module). It samples the call stack at regular intervals and prints a summary (functions, module lines, VM states, zones) to a file or to standard output. A modder can use it in the vehicle VM to find the most expensive Lua functions.
--- Access: extension `profiling_p`: `extensions.load (vehicle VM)("profiling_p")`, then the global `profiling_p`
---@class profiling_p
profiling_p = {}

--- Starts profiling with the given mode and chooses the output destination (file opened for writing, or standard output).
---Source: lua/vehicle/extensions/profiling/p.lua:304
---@param mode string|nil mode string (see notes), "f" by default
---@param outfile string|nil output file, '-' for standard output; nil = LUAJIT_PROFILEFILE or standard output
function profiling_p.start(mode, outfile) end

--- Stops the profiler and, if doOutput is true, writes the result (display of the top entries or source annotation). Writes "[No samples collected]" if no sample was taken.
---Source: lua/vehicle/extensions/profiling/p.lua:231
---@param doOutput boolean|nil true to write the result
function profiling_p.stop(doOutput) end

