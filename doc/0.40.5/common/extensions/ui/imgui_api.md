# `ui_imgui_api`

*File: `lua/common/extensions/ui/imgui_api.lua` · VM: Common (GE + vehicle) · 17 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_imgui_api`: `extensions.load("ui_imgui_api")`, then the global `ui_imgui_api`

Internal module that assembles the ImGui API: creates the table M with the field ctx (global ImGui context) then injects the generated functions from imgui_luaintf.lua and the custom additions from imgui_custom_luaintf.lua. The file states not to use it directly (use ui_imgui) and that it must stay in sync with imgui_api.h on the C++ side.

## Notes

- Both requires use the path '/common/extensions/ui/...' and each module returns a function that receives M.
- ctx is nil until ui_imgui sets it (onImGuiReady / onExtensionLoaded).

## Fields

| Field | Type | Description |
|---|---|---|
| `ctx` | userdata|nil | Global Lua ImGui context; nil at creation, set by ui_imgui. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/imgui_api.lua`.*
