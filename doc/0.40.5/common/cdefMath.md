# `cdefMath`

*File: `lua/common/cdefMath.lua` · VM: Common (GE + vehicle) · 12 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("cdefMath")`

FFI declaration of the C structures __luaVec3_t {double x, y, z} and __luaQuat_t {double x, y, z, w}, which serve as the memory representation of the Lua vec3 and quat types (in double precision).

## Notes

- No Lua function: a single ffi.cdef, executed if ffi exists.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/cdefMath.lua`.*
