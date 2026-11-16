# `cdefDebugDraw`

*File: `lua/common/cdefDebugDraw.lua` · VM: Common (GE + vehicle) · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("cdefDebugDraw")`

FFI declarations (ffi.cdef) of the C++ debug drawing functions (BNG_DBG_DRAW_*): sphere, cylinder, line, text, square prism, filled triangle and batch versions. Only runs if ffi is available. A modder does not normally call these symbols directly: use the debugDrawer API instead.

## Notes

- The file defines no Lua function or field: only an ffi.cdef.
- Colors are passed as a packed unsigned integer (packedCol).
- Also declares the typedef Vector3 {float x, y, z}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/cdefDebugDraw.lua`.*
