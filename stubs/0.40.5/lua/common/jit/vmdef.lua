---@meta
-- tim19Atlas stub generated from lua/common/jit/vmdef.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generated file ("DO NOT EDIT") of LuaJIT: tables of internal names used by the jit.dump, jit.bc, jit.v modules and the profiler to display bytecodes, IR instructions, fast functions and trace abort causes. The file checks at load time that jit.version == "LuaJIT 2.1.1788767029", otherwise the assertion fails ("LuaJIT core/library version mismatch"). A modder normally has no reason to use it.
--- Access: `require("jit/vmdef")`
---@class jit_vmdef
---@field bcnames string Names of the LuaJIT bytecode opcodes concatenated (6 characters each).
---@field ffnames table Names of LuaJIT's fast functions.
---@field ircall table Names of the C functions called from the IR.
---@field irfield table Names of the structure fields for the IR (FLOAD/XLOAD).
---@field irfpm table Names of the math functions for FPMATH.
---@field irnames string Names of the intermediate representation (IR) opcodes concatenated.
---@field traceerr table Error messages of aborted traces.
local jit_vmdef = {}

return jit_vmdef
