---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui_api.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal module that assembles the ImGui API: creates the table M with the field ctx (global ImGui context) then injects the generated functions from imgui_luaintf.lua and the custom additions from imgui_custom_luaintf.lua. The file states not to use it directly (use ui_imgui) and that it must stay in sync with imgui_api.h on the C++ side.
--- Access: extension `ui_imgui_api`: `extensions.load("ui_imgui_api")`, then the global `ui_imgui_api`
---@class ui_imgui_api
---@field ctx userdata|nil Global Lua ImGui context; nil at creation, set by ui_imgui.
ui_imgui_api = {}

