---@meta
-- tim19Atlas stub generated from lua/common/jit/v.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaJIT's jit.v module (Mike Pall, MIT license, 2005-2026): verbose mode of the JIT compiler. It prints one line per generated trace ([TRACE n file:line ...]) and per aborted trace, which helps to see which code is compiled or where the compiler falls back to the interpreter (NYI). Output defaults to stderr; file via argument or the LUAJIT_VERBOSEFILE environment variable.
--- Access: `require("jit/v")`
---@class jit_v
local jit_v = {}

--- Detaches the trace handler and closes the file (except stdout/stderr).
---Source: lua/common/jit/v.lua:146
function jit_v.off() end

--- Opens the output file and attaches the trace handler (jit.attach 'trace').
---Source: lua/common/jit/v.lua:156
---@param outfile string|nil Output file; default LUAJIT_VERBOSEFILE otherwise stderr; '-' = stdout.
function jit_v.on(outfile) end

--- Alias of on, intended for the -jv command-line option.
---Source: lua/common/jit/v.lua:156
---@param outfile string|nil Output file.
function jit_v.start(outfile) end

return jit_v
