---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension ui_imgui: ImGui entry point for Lua modders. In the game VM (GE) it simply becomes the module ui/imgui_api (no wrapper); the hundreds of ImGui functions (Begin, Text, Button...) and their enums therefore come from imgui_luaintf.lua and imgui_custom_luaintf.lua. It gets the main ImGui context on load and enables the BeamNG style.
--- Access: extension `ui_imgui`: `extensions.load("ui_imgui")`, then the global `ui_imgui`
---@class ui_imgui
---@field flags function Alias of bit.bor, to combine flags (im.flags(im.WindowFlags_NoMove, im.WindowFlags_NoResize)).
---@field setEnabled function|nil In GE: function that logs an error (imgui cannot be enabled/disabled on the GE side). nil outside the game VM.
ui_imgui = {}

--- Hook called on load (including dynamic reload): gets the main ImGui context again.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/ui/imgui.lua:29
function ui_imgui.onExtensionLoaded() end

--- Hook called when ImGui is ready for the first time: gets the main context (M.ctx = Engine.imgui.GetMainContext()) and calls Engine.imgui.enableBeamNGStyle().
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/ui/imgui.lua:22
function ui_imgui.onImGuiReady() end

