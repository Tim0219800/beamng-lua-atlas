---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui_luaintf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generated file (about 2200 lines, ~485 functions) that exposes almost the entire Dear ImGui API in Lua as very thin wrappers over Engine.imgui (the game's C++ binding): NewFrame/Render, windows, widgets (Text, Button, Slider*, Drag*, Input*, Combo, Tree*, Table*, Plot*), ImDrawList_*, styles (PushStyleColor*, PushStyleVar*), IO, fonts, and the enums as constants M.Xxx_Yyy (e.g. WindowFlags_NoTitleBar, Col_Text, Key_*). It is not an extension: it returns a function that receives the table M of imgui_api. The numeric suffixes (Button/SmallButton, TreeNode1/TreeNode2, Combo1, PushStyleColor2...) correspond to the C++ overloads of the same function.
--- Access: `require("extensions/ui/imgui_luaintf")` (file under extensions/ but not a regular extension)
---@class ui_imgui_luaintf
ui_imgui_luaintf = {}

--- Opens a window (flags 0 by default in this version; the custom version sets NoFocusOnAppearing). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param string_name string Title (cannot be nil).
---@param bool_p_open table|nil Optional BoolPtr.
---@param ImGuiWindowFlags_flags integer|nil Window flags.
---@return boolean  True if the window is visible.
function ui_imgui_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags) end

--- Ends the ImGui frame (handled by the engine). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.EndFrame() end

--- Returns the current ImGui context. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@return userdata  Context.
function ui_imgui_luaintf.GetCurrentContext() end

--- Converts a key to an index (imgui.GetKeyIndex); replaced by a no-op version in imgui_custom_luaintf. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiKey_key integer ImGui key.
---@return integer  Key index.
function ui_imgui_luaintf.GetKeyIndex(ImGuiKey_key) end

--- Returns the Dear ImGui version. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@return string  Version.
function ui_imgui_luaintf.GetVersion() end

--- Starts a new ImGui frame (normally handled by the engine). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.NewFrame() end

--- Finalizes the ImGui rendering (handled by the engine). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.Render() end

--- Shows the ImGui "About" window. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil Optional BoolPtr.
function ui_imgui_luaintf.ShowAboutWindow(bool_p_open) end

--- Shows the ImGui debug log window. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil Optional BoolPtr.
function ui_imgui_luaintf.ShowDebugLogWindow(bool_p_open) end

--- Shows the ImGui demo window. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil Optional BoolPtr.
function ui_imgui_luaintf.ShowDemoWindow(bool_p_open) end

--- Shows a font selector. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param string_label string Label (cannot be nil).
function ui_imgui_luaintf.ShowFontSelector(string_label) end

--- Shows the ImGui metrics window. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil Optional BoolPtr.
function ui_imgui_luaintf.ShowMetricsWindow(bool_p_open) end

--- Shows the ImGui ID stack tool. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param bool_p_open table|nil Optional BoolPtr.
function ui_imgui_luaintf.ShowStackToolWindow(bool_p_open) end

--- Shows the ImGui style editor. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_ref userdata|nil Style to edit, optional.
function ui_imgui_luaintf.ShowStyleEditor(ImGuiStyle_ref) end

--- Shows a style selector. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param string_label string Label (cannot be nil).
---@return boolean  True if the style changed.
function ui_imgui_luaintf.ShowStyleSelector(string_label) end

--- Shows the ImGui user guide. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
function ui_imgui_luaintf.ShowUserGuide() end

--- Applies the classic theme. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_dst userdata|nil Target style, optional.
function ui_imgui_luaintf.StyleColorsClassic(ImGuiStyle_dst) end

--- Applies the dark theme. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_dst userdata|nil Target style, optional.
function ui_imgui_luaintf.StyleColorsDark(ImGuiStyle_dst) end

--- Applies the light theme. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_luaintf.lua:dyn
---@param ImGuiStyle_dst userdata|nil Target style, optional.
function ui_imgui_luaintf.StyleColorsLight(ImGuiStyle_dst) end

