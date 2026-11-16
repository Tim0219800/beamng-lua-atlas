---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaJIT/vmdef.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generated LuaJIT file (jit.vmdef, "DO NOT EDIT"): tables of names used by the jit.* tools (dump, bc, v, profiler) to display bytecodes, IR instructions, fast functions, IR C calls and trace failure reasons. It returns a data table; only useful for debugging or analyzing the JIT.
--- Access: `require("libs/LuaJIT/vmdef")`
---@class libs_LuaJIT_vmdef
---@field bcnames string Names of the LuaJIT bytecode opcodes concatenated, 6 characters per opcode (padded with spaces).
---@field ffnames table<integer, string> Names of LuaJIT's fast functions, 0-based ("Lua", "C", "assert"...).
---@field ircall table<integer, string> Names of the C functions called by the IR (lj_str_cmp, lj_tab_new1, sqrt...), 0-based.
---@field irfield table<integer, string> Names of the object fields accessible by the IR (str.len, func.env, tab.meta, tab.array...), 0-based.
---@field irfpm table<integer, string> Names of the IR's FPMATH math functions (floor, ceil, trunc, sqrt, exp, exp2, log, log2, log10, sin, cos, tan, other), 0-based.
---@field irnames string Names of the trace compiler's IR operations, concatenated in blocks of 6 characters.
---@field traceerr table<integer, string> Trace recording error messages (e.g. "trace too short", "trace too long"), 0-based.
local libs_LuaJIT_vmdef = {}

return libs_LuaJIT_vmdef
