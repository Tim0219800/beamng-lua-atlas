# `jit_vmdef`

*File: `lua/common/jit/vmdef.lua` · VM: Common (GE + vehicle) · 399 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jit/vmdef")`

Generated file ("DO NOT EDIT") of LuaJIT: tables of internal names used by the jit.dump, jit.bc, jit.v modules and the profiler to display bytecodes, IR instructions, fast functions and trace abort causes. The file checks at load time that jit.version == "LuaJIT 2.1.1788767029", otherwise the assertion fails ("LuaJIT core/library version mismatch"). A modder normally has no reason to use it.

## Notes

- The version assertion ties this file to the embedded LuaJIT; do not replace it with another version.
- bcnames and irnames are long strings of fixed-width names (6 characters) and not tables.

## Fields

| Field | Type | Description |
|---|---|---|
| `bcnames` | string | Names of the LuaJIT bytecode opcodes concatenated (6 characters each). |
| `ffnames` | table | Names of LuaJIT's fast functions. |
| `ircall` | table | Names of the C functions called from the IR. |
| `irfield` | table | Names of the structure fields for the IR (FLOAD/XLOAD). |
| `irfpm` | table | Names of the math functions for FPMATH. |
| `irnames` | string | Names of the intermediate representation (IR) opcodes concatenated. |
| `traceerr` | table | Error messages of aborted traces. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jit/vmdef.lua`.*
