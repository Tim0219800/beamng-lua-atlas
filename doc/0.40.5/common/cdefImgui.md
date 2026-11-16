# `cdefImgui`

*File: `lua/common/cdefImgui.lua` · VM: Common (GE + vehicle) · 8 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("cdefImgui")`

FFI declaration of the C callback function ImGuiInputTextCallbackLua(const void* data), used engine-side for ImGui text input callbacks called from Lua.

## Notes

- No Lua function: a single ffi.cdef, executed if ffi exists.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/cdefImgui.lua`.*
