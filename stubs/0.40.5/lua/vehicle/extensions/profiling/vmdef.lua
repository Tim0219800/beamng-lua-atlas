---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/profiling/vmdef.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library: LuaJIT's jit.vmdef (Mike Pall), a generated file ("DO NOT EDIT") that contains the LuaJIT VM name tables: names of bytecodes, trace compiler IR instructions, built-in fast functions, trace errors, etc. It is used by LuaJIT tools (profiler, trace dump). No function: read-only data only.
--- Access: extension `profiling_vmdef`: `extensions.load (vehicle VM)("profiling_vmdef")`, then the global `profiling_vmdef`
---@class profiling_vmdef
---@field bcnames string LuaJIT bytecode opcode names concatenated, 6 characters per name.
---@field ffnames table Names of LuaJIT's built-in fast functions.
---@field ircall table Names of the C functions called from the IR (CALL), 0-based.
---@field irfield table<integer, string> Names of the internal object fields read by the IR (str.len, func.env, tab.meta, tab.array, cdata.ptr…), 0-based.
---@field irfpm table<integer, string> Math functions of the IR operation FPMATH (floor, ceil, trunc, sqrt, exp, exp2, log, log2, log10, sin, cos, tan, other), 0-based.
---@field irnames string Names of the trace compiler IR instructions concatenated, 6 characters per name.
---@field traceerr table JIT compiler trace abort error messages, 0-based.
profiling_vmdef = {}

