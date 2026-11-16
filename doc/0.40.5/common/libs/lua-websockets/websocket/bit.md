# `bxor`

*File: `lua/common/libs/lua-websockets/websocket/bit.lua` · VM: Common (GE + vehicle) · 11 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `bxor`

Small compatibility layer for lua-websockets bit operations. If the 'bit32' library (Lua 5.2) exists, it is returned with rol/ror added as aliases of lrotate/rrotate; otherwise the module returns LuaJIT's 'bit' library (BitOp). No functions of its own: the module directly returns the table of operations (band, bor, bxor, lshift, rshift...).

## Notes

- In BeamNG (LuaJIT), the 'bit' branch is used, unless a 'bit32' module is available.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/bit.lua`.*
