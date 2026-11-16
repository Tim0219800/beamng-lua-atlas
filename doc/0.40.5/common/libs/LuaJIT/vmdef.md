# `libs_LuaJIT_vmdef`

*File: `lua/common/libs/LuaJIT/vmdef.lua` · VM: Common (GE + vehicle) · 365 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/LuaJIT/vmdef")`

Generated LuaJIT file (jit.vmdef, "DO NOT EDIT"): tables of names used by the jit.* tools (dump, bc, v, profiler) to display bytecodes, IR instructions, fast functions, IR C calls and trace failure reasons. It returns a data table; only useful for debugging or analyzing the JIT.

## Fields

| Field | Type | Description |
|---|---|---|
| `bcnames` | string | Names of the LuaJIT bytecode opcodes concatenated, 6 characters per opcode (padded with spaces). |
| `ffnames` | table<integer, string> | Names of LuaJIT's fast functions, 0-based ("Lua", "C", "assert"...). |
| `ircall` | table<integer, string> | Names of the C functions called by the IR (lj_str_cmp, lj_tab_new1, sqrt...), 0-based. |
| `irfield` | table<integer, string> | Names of the object fields accessible by the IR (str.len, func.env, tab.meta, tab.array...), 0-based. |
| `irfpm` | table<integer, string> | Names of the IR's FPMATH math functions (floor, ceil, trunc, sqrt, exp, exp2, log, log2, log10, sin, cos, tan, other), 0-based. |
| `irnames` | string | Names of the trace compiler's IR operations, concatenated in blocks of 6 characters. |
| `traceerr` | table<integer, string> | Trace recording error messages (e.g. "trace too short", "trace too long"), 0-based. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuaJIT/vmdef.lua`.*
