---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui_custom_luaintf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hand-written additions to the ImGui API (as opposed to imgui_luaintf.lua, which is generated). The file returns a function that receives the table M of imgui_api and defines in it: value/pointer constructors (ImVec2, ImVec4, BoolPtr, IntPtr, FloatPtr, DoublePtr, ArrayChar, ArrayInt, ArrayFloat), custom versions of Begin/InputText/InputTextMultiline/Combo1/OpenPopup/SetDragDropPayload, font, scale and texture handling, helpers (ShowHelpMarker, tooltip, tooltipWrapped, HighlightText, HeaderText, BeginDisabled), monitor/ini wrappers, and the Knob widgets. It is loaded after imgui_luaintf, so its definitions override those of the generated file.
--- Access: `require("extensions/ui/imgui_custom_luaintf")` (file under extensions/ but not a regular extension)
---@class ui_imgui_custom_luaintf
ui_imgui_custom_luaintf = {}

--- Creates a text buffer (string.buffer) of size len, optionally pre-filled with val. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param len integer Size in bytes.
---@param val string|nil Initial text.
---@return userdata  string.buffer.
function ui_imgui_custom_luaintf.ArrayChar(len, val) end

--- 0-based float array, initialized to 0. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param size integer Size.
---@return table  Array [0..size-1].
function ui_imgui_custom_luaintf.ArrayFloat(size) end

--- 0-based integer array, initialized to 0. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param size integer Size.
---@return table  Array [0..size-1].
function ui_imgui_custom_luaintf.ArrayInt(size) end

--- Opens an ImGui window. Default flags: WindowFlags_NoFocusOnAppearing. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_name string Title/identifier.
---@param bool_p_open table|nil BoolPtr for the close button.
---@param ImGuiWindowFlags_flags integer|nil Window flags.
---@return boolean  True if the content should be drawn.
function ui_imgui_custom_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags) end

--- Start of a disabled area (true by default). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param disable boolean|nil Disables if true or nil.
function ui_imgui_custom_luaintf.BeginDisabled(disable) end

--- Creates a boolean pointer {[0]=bool} (0/1 converted, other type -> false). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x boolean|number Initial value.
---@return table  {[0]=bool}
function ui_imgui_custom_luaintf.BoolPtr(x) end

--- Dropdown list over an array of strings; items_count computed with #items if nil, max height -1 by default. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Label.
---@param current_item table IntPtr of the current item.
---@param items table Array of strings.
---@param items_count integer|nil Number of elements.
---@param popup_max_height_in_items integer|nil -1 by default.
---@return boolean  True if changed.
function ui_imgui_custom_luaintf.Combo1(label, current_item, items, items_count, popup_max_height_in_items) end

--- Creates a double pointer {[0]=n}. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number Initial value.
---@return table  {[0]=n}
function ui_imgui_custom_luaintf.DoublePtr(x) end

--- End of a disabled area. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
function ui_imgui_custom_luaintf.EndDisabled() end

--- Creates a float pointer {[0]=n} (0 if x is not a number). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number Initial value.
---@return table  {[0]=n}
function ui_imgui_custom_luaintf.FloatPtr(x) end

--- Available width (GetContentRegionAvail().x). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return number  Width.
function ui_imgui_custom_luaintf.GetContentRegionAvailWidth() end

--- Displays header text with the cairo_regular_medium font; default color ImVec4(1,0.6,0,8,0.75). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param text string Text.
---@param color ImVec4|nil Color.
function ui_imgui_custom_luaintf.HeaderText(text, color) end

--- Like HighlightText but also draws a highlight background when the item is hovered (Col_HeaderHovered/HeaderActive) or selected (Col_Header). Returns nothing. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Text.
---@param highlightText string Substring.
---@param selected boolean Selected state.
function ui_imgui_custom_luaintf.HighlightSelectable(label, highlightText, selected) end

--- Displays label with the substring highlightText in orange (matchColor). If highlightText is empty, the whole label is colored. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Text.
---@param highlightText string Substring to highlight.
function ui_imgui_custom_luaintf.HighlightText(label, highlightText) end

--- Creates an ImColor from 0-255 components (alpha 255 by default) and sets Value in 0-1. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param r number Red 0-255.
---@param g number Green 0-255.
---@param b number Blue 0-255.
---@param a number|nil Alpha 0-255.
---@return ImColor  Color.
function ui_imgui_custom_luaintf.ImColorByRGB(r, g, b, a) end

--- Writes io.FontGlobalScale. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param io userdata Result of GetIO().
---@param value number Scale.
function ui_imgui_custom_luaintf.ImGuiIO_FontGlobalScale(io, value) end

--- Creates a texture handler and assigns path to it as an identifier. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param path string Texture path.
---@return userdata  ImTextureHandler (methods getID, getSize...).
function ui_imgui_custom_luaintf.ImTextureHandler(path) end

--- Tells whether the texture is already cached. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param path string Path.
---@return boolean  True if cached.
function ui_imgui_custom_luaintf.ImTextureHandlerIsCached(path) end

--- Creates an ImVec2 (x, y). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number X.
---@param y number Y.
---@return ImVec2  Vector.
function ui_imgui_custom_luaintf.ImVec2(x, y) end

--- Creates an ImVec4 (x, y, z, w). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number X / R.
---@param y number Y / G.
---@param z number Z / B.
---@param w number W / A.
---@return ImVec4  Vector.
function ui_imgui_custom_luaintf.ImVec4(x, y, z, w) end

--- Text field on an ArrayChar buffer; default size 2^32, flags 0. The callback is ignored. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Label.
---@param buf userdata ArrayChar buffer.
---@param buf_size integer|nil Max size.
---@param flags integer|nil InputTextFlags.
---@param callback any Ignored.
---@param user_data any User data.
---@param editEnded any Not used.
---@return boolean  True if modified.
function ui_imgui_custom_luaintf.InputText(label, buf, buf_size, flags, callback, user_data, editEnded) end

--- Multiline text field; size (0,0) and flags 0 by default. The callback is ignored. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param label string Label.
---@param buf userdata ArrayChar buffer.
---@param buf_size integer|nil Max size.
---@param size ImVec2|nil Size.
---@param flags integer|nil Flags.
---@param callback any Ignored.
---@param user_data any User data.
---@return boolean  True if modified.
function ui_imgui_custom_luaintf.InputTextMultiline(label, buf, buf_size, size, flags, callback, user_data) end

--- Creates an integer pointer {[0]=n} (0 if x is not a number). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param x number Initial value.
---@return table  {[0]=n}
function ui_imgui_custom_luaintf.IntPtr(x) end

--- Rotary button (knob) for a float. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_label string Label.
---@param floatPtr_value table FloatPtr.
---@param float_v_min number Min.
---@param float_v_max number Max.
---@param float_speed number|nil Speed.
---@param string_format string|nil Display format.
---@param ImGuiKnobVariant_variant integer|nil KnobVariant_*.
---@param float_size number|nil Size.
---@param ImGuiKnobFlags_flags integer|nil KnobFlags_*.
---@param int_steps integer|nil Number of steps.
---@return boolean  True if the value changes.
function ui_imgui_custom_luaintf.Knob(string_label, floatPtr_value, float_v_min, float_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps) end

--- Knob for an integer; same parameters as Knob with an IntPtr. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_label string Label.
---@param intPtr_value table IntPtr.
---@param int_v_min integer Min.
---@param int_v_max integer Max.
---@param float_speed number|nil Speed.
---@param string_format string|nil Format.
---@param ImGuiKnobVariant_variant integer|nil KnobVariant_*.
---@param float_size number|nil Size.
---@param ImGuiKnobFlags_flags integer|nil KnobFlags_*.
---@param int_steps integer|nil Steps.
---@return boolean  True if the value changes.
function ui_imgui_custom_luaintf.KnobInt(string_label, intPtr_value, int_v_min, int_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps) end

--- Sets the drag-and-drop payload; error logged if type or data is nil; cond 0 by default. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param string_type string Payload type.
---@param void_data any Data.
---@param size_t_sz integer Size.
---@param ImGuiCond_cond integer|nil Condition.
---@return boolean  Result of imgui.SetDragDropPayload.
function ui_imgui_custom_luaintf.SetDragDropPayload(string_type, void_data, size_t_sz, ImGuiCond_cond) end

--- Displays a grayed "(?)"; on hover, a tooltip with desc 35 characters wide. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param desc string Help text.
---@param sameLine boolean|nil If true, SameLine before.
function ui_imgui_custom_luaintf.ShowHelpMarker(desc, sameLine) end

--- Returns the size of the current monitor. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return ImVec2  Size in pixels.
function ui_imgui_custom_luaintf.getCurrentMonitorSize() end

--- Id of the main viewport. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return integer  Id.
function ui_imgui_custom_luaintf.getMainViewPortId() end

--- Monitor index (imgui.getMonitorIndex). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@return integer  Index.
function ui_imgui_custom_luaintf.getMonitorIndex() end

--- Loads the ImGui settings (.ini) from a file. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param filename string Path.
function ui_imgui_custom_luaintf.loadIniSettingsFromDisk(filename) end

--- Saves the ImGui settings (.ini) to a file. (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param filename string Path.
function ui_imgui_custom_luaintf.saveIniSettingsToDisk(filename) end

--- If the previous item is hovered, shows message as a tooltip (SetTooltip). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param message string Text.
function ui_imgui_custom_luaintf.tooltip(message) end

--- Like tooltip but with wrapping at wrapWidth pixels (350 by default, multiplied by uiscale[0]). (dynamically assigned)
---Source: lua/common/extensions/ui/imgui_custom_luaintf.lua:dyn
---@param message string Text.
---@param wrapWidth number|nil Wrap width.
function ui_imgui_custom_luaintf.tooltipWrapped(message, wrapWidth) end

