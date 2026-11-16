# `ui_imgui_custom_luaintf`

*File: `lua/common/extensions/ui/imgui_custom_luaintf.lua` · VM: Common (GE + vehicle) · 447 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/ui/imgui_custom_luaintf")` (file under extensions/ but not a regular extension)

Hand-written additions to the ImGui API (as opposed to imgui_luaintf.lua, which is generated). The file returns a function that receives the table M of imgui_api and defines in it: value/pointer constructors (ImVec2, ImVec4, BoolPtr, IntPtr, FloatPtr, DoublePtr, ArrayChar, ArrayInt, ArrayFloat), custom versions of Begin/InputText/InputTextMultiline/Combo1/OpenPopup/SetDragDropPayload, font, scale and texture handling, helpers (ShowHelpMarker, tooltip, tooltipWrapped, HighlightText, HeaderText, BeginDisabled), monitor/ini wrappers, and the Knob widgets. It is loaded after imgui_luaintf, so its definitions override those of the generated file.

## Example

```lua
local im = ui_imgui
local val = im.FloatPtr(0.5)
im.SliderFloat('x', val, 0, 1)
im.tooltip('Help')
```

## Notes

- In GE, "pointers" are plain tables {[0] = value}: read/write val[0]. BoolPtr/IntPtr/FloatPtr/DoublePtr return {[0]=0 or false} if the argument type is wrong (log commented out). BoolPtr converts 0/1 to boolean.
- ArrayChar(len, val) returns a pre-filled string.buffer (text buffer for InputText); use ffi.string(buf) or tostring to read it back.
- Begin(): default flags = WindowFlags_NoFocusOnAppearing (not 0 as in the generated version). If the name is nil, an error is logged and the function returns.
- InputText: buf_size defaults to 2^32, flags 0; the callback passed is ignored (nil is forwarded).
- GetKeyIndex is a no-op (returns the index) since ImGui 1.87.
- GetContentRegionAvailWidth and GetWindowContentRegionWidth are wrappers added because they were removed from the recent ImGui version.
- TableSetSortSpecsDirty uses M.TableGetSortSpecs().SpecsDirty.
- Bug: headerDefaultColor is built with ImVec4(1,0.6,0,8,0.75), i.e. 5 arguments (the 5th is ignored, w is 8 instead of a probable 0.8).
- Compatibility aliases: SelectableFlags_AllowItemOverlap = SelectableFlags_AllowOverlap, Mod_Shortcut = Mod_Ctrl, Key_ModCtrl/Shift/Alt/Super to Mod_*.
- uiscale = {[0] = 1}: global UI scale used by ui_imguiUtils and tooltipWrapped. plotLineColor = 4288453788 and plotLineBgColor = 2323270185 are default ImU32 colors.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_imgui_custom_luaintf.ArrayChar(len, val)` | Creates a text buffer (string.buffer) of size len, optionally pre-filled with val. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ArrayFloat(size)` | 0-based float array, initialized to 0. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ArrayInt(size)` | 0-based integer array, initialized to 0. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)` | Opens an ImGui window. Default flags: WindowFlags_NoFocusOnAppearing. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.BeginDisabled(disable)` | Start of a disabled area (true by default). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.BoolPtr(x)` | Creates a boolean pointer {[0]=bool} (0/1 converted, other type -> false). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.Combo1(label, current_item, items, items_count, popup_max_height_in_items)` | Dropdown list over an array of strings; items_count computed with #items if nil, max height -1 by default. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.DoublePtr(x)` | Creates a double pointer {[0]=n}. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.EndDisabled()` | End of a disabled area. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.FloatPtr(x)` | Creates a float pointer {[0]=n} (0 if x is not a number). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.GetContentRegionAvailWidth()` | Available width (GetContentRegionAvail().x). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.HeaderText(text, color)` | Displays header text with the cairo_regular_medium font; default color ImVec4(1,0.6,0,8,0.75). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.HighlightSelectable(label, highlightText, selected)` | Like HighlightText but also draws a highlight background when the item is hovered (Col_HeaderHovered/HeaderActive) or selected (Col_Header). Returns nothing. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.HighlightText(label, highlightText)` | Displays label with the substring highlightText in orange (matchColor). If highlightText is empty, the whole label is colored. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ImColorByRGB(r, g, b, a)` | Creates an ImColor from 0-255 components (alpha 255 by default) and sets Value in 0-1. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ImGuiIO_FontGlobalScale(io, value)` | Writes io.FontGlobalScale. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ImTextureHandler(path)` | Creates a texture handler and assigns path to it as an identifier. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ImTextureHandlerIsCached(path)` | Tells whether the texture is already cached. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ImVec2(x, y)` | Creates an ImVec2 (x, y). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ImVec4(x, y, z, w)` | Creates an ImVec4 (x, y, z, w). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.InputText(label, buf, buf_size, flags, callback, user_data, editEnded)` | Text field on an ArrayChar buffer; default size 2^32, flags 0. The callback is ignored. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.InputTextMultiline(label, buf, buf_size, size, flags, callback, user_data)` | Multiline text field; size (0,0) and flags 0 by default. The callback is ignored. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.IntPtr(x)` | Creates an integer pointer {[0]=n} (0 if x is not a number). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.Knob(string_label, floatPtr_value, float_v_min, float_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)` | Rotary button (knob) for a float. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.KnobInt(string_label, intPtr_value, int_v_min, int_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)` | Knob for an integer; same parameters as Knob with an IntPtr. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.SetDragDropPayload(string_type, void_data, size_t_sz, ImGuiCond_cond)` | Sets the drag-and-drop payload; error logged if type or data is nil; cond 0 by default. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.ShowHelpMarker(desc, sameLine)` | Displays a grayed "(?)"; on hover, a tooltip with desc 35 characters wide. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.getCurrentMonitorSize()` | Returns the size of the current monitor. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.getMainViewPortId()` | Id of the main viewport. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.getMonitorIndex()` | Monitor index (imgui.getMonitorIndex). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.loadIniSettingsFromDisk(filename)` | Loads the ImGui settings (.ini) from a file. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.saveIniSettingsToDisk(filename)` | Saves the ImGui settings (.ini) to a file. (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.tooltip(message)` | If the previous item is hovered, shows message as a tooltip (SetTooltip). (dynamically assigned) | dyn |
| `ui_imgui_custom_luaintf.tooltipWrapped(message, wrapWidth)` | Like tooltip but with wrapping at wrapWidth pixels (350 by default, multiplied by uiscale[0]). (dynamically assigned) | dyn |

### Parameter details

#### `ui_imgui_custom_luaintf.ArrayChar(len, val)`

Creates a text buffer (string.buffer) of size len, optionally pre-filled with val. (dynamically assigned)

- `len` (*integer*) : Size in bytes.
- `val` (*string|nil*) : Initial text.
- **returns**: userdata string.buffer.

#### `ui_imgui_custom_luaintf.ArrayFloat(size)`

0-based float array, initialized to 0. (dynamically assigned)

- `size` (*integer*) : Size.
- **returns**: table Array [0..size-1].

#### `ui_imgui_custom_luaintf.ArrayInt(size)`

0-based integer array, initialized to 0. (dynamically assigned)

- `size` (*integer*) : Size.
- **returns**: table Array [0..size-1].

#### `ui_imgui_custom_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)`

Opens an ImGui window. Default flags: WindowFlags_NoFocusOnAppearing. (dynamically assigned)

- `string_name` (*string*) : Title/identifier.
- `bool_p_open` (*table|nil*) : BoolPtr for the close button.
- `ImGuiWindowFlags_flags` (*integer|nil*) : Window flags.
- **returns**: boolean True if the content should be drawn.

#### `ui_imgui_custom_luaintf.BeginDisabled(disable)`

Start of a disabled area (true by default). (dynamically assigned)

- `disable` (*boolean|nil*) : Disables if true or nil.

#### `ui_imgui_custom_luaintf.BoolPtr(x)`

Creates a boolean pointer {[0]=bool} (0/1 converted, other type -> false). (dynamically assigned)

- `x` (*boolean|number*) : Initial value.
- **returns**: table {[0]=bool}

#### `ui_imgui_custom_luaintf.Combo1(label, current_item, items, items_count, popup_max_height_in_items)`

Dropdown list over an array of strings; items_count computed with #items if nil, max height -1 by default. (dynamically assigned)

- `label` (*string*) : Label.
- `current_item` (*table*) : IntPtr of the current item.
- `items` (*table*) : Array of strings.
- `items_count` (*integer|nil*) : Number of elements.
- `popup_max_height_in_items` (*integer|nil*) : -1 by default.
- **returns**: boolean True if changed.

#### `ui_imgui_custom_luaintf.DoublePtr(x)`

Creates a double pointer {[0]=n}. (dynamically assigned)

- `x` (*number*) : Initial value.
- **returns**: table {[0]=n}

#### `ui_imgui_custom_luaintf.FloatPtr(x)`

Creates a float pointer {[0]=n} (0 if x is not a number). (dynamically assigned)

- `x` (*number*) : Initial value.
- **returns**: table {[0]=n}

#### `ui_imgui_custom_luaintf.GetContentRegionAvailWidth()`

Available width (GetContentRegionAvail().x). (dynamically assigned)

- **returns**: number Width.

#### `ui_imgui_custom_luaintf.HeaderText(text, color)`

Displays header text with the cairo_regular_medium font; default color ImVec4(1,0.6,0,8,0.75). (dynamically assigned)

- `text` (*string*) : Text.
- `color` (*ImVec4|nil*) : Color.

#### `ui_imgui_custom_luaintf.HighlightSelectable(label, highlightText, selected)`

Like HighlightText but also draws a highlight background when the item is hovered (Col_HeaderHovered/HeaderActive) or selected (Col_Header). Returns nothing. (dynamically assigned)

- `label` (*string*) : Text.
- `highlightText` (*string*) : Substring.
- `selected` (*boolean*) : Selected state.

#### `ui_imgui_custom_luaintf.HighlightText(label, highlightText)`

Displays label with the substring highlightText in orange (matchColor). If highlightText is empty, the whole label is colored. (dynamically assigned)

- `label` (*string*) : Text.
- `highlightText` (*string*) : Substring to highlight.

#### `ui_imgui_custom_luaintf.ImColorByRGB(r, g, b, a)`

Creates an ImColor from 0-255 components (alpha 255 by default) and sets Value in 0-1. (dynamically assigned)

- `r` (*number*) : Red 0-255.
- `g` (*number*) : Green 0-255.
- `b` (*number*) : Blue 0-255.
- `a` (*number|nil*) : Alpha 0-255.
- **returns**: ImColor Color.

#### `ui_imgui_custom_luaintf.ImGuiIO_FontGlobalScale(io, value)`

Writes io.FontGlobalScale. (dynamically assigned)

- `io` (*userdata*) : Result of GetIO().
- `value` (*number*) : Scale.

#### `ui_imgui_custom_luaintf.ImTextureHandler(path)`

Creates a texture handler and assigns path to it as an identifier. (dynamically assigned)

- `path` (*string*) : Texture path.
- **returns**: userdata ImTextureHandler (methods getID, getSize...).

#### `ui_imgui_custom_luaintf.ImTextureHandlerIsCached(path)`

Tells whether the texture is already cached. (dynamically assigned)

- `path` (*string*) : Path.
- **returns**: boolean True if cached.

#### `ui_imgui_custom_luaintf.ImVec2(x, y)`

Creates an ImVec2 (x, y). (dynamically assigned)

- `x` (*number*) : X.
- `y` (*number*) : Y.
- **returns**: ImVec2 Vector.

#### `ui_imgui_custom_luaintf.ImVec4(x, y, z, w)`

Creates an ImVec4 (x, y, z, w). (dynamically assigned)

- `x` (*number*) : X / R.
- `y` (*number*) : Y / G.
- `z` (*number*) : Z / B.
- `w` (*number*) : W / A.
- **returns**: ImVec4 Vector.

#### `ui_imgui_custom_luaintf.InputText(label, buf, buf_size, flags, callback, user_data, editEnded)`

Text field on an ArrayChar buffer; default size 2^32, flags 0. The callback is ignored. (dynamically assigned)

- `label` (*string*) : Label.
- `buf` (*userdata*) : ArrayChar buffer.
- `buf_size` (*integer|nil*) : Max size.
- `flags` (*integer|nil*) : InputTextFlags.
- `callback` (*any*) : Ignored.
- `user_data` (*any*) : User data.
- `editEnded` (*any*) : Not used.
- **returns**: boolean True if modified.

#### `ui_imgui_custom_luaintf.InputTextMultiline(label, buf, buf_size, size, flags, callback, user_data)`

Multiline text field; size (0,0) and flags 0 by default. The callback is ignored. (dynamically assigned)

- `label` (*string*) : Label.
- `buf` (*userdata*) : ArrayChar buffer.
- `buf_size` (*integer|nil*) : Max size.
- `size` (*ImVec2|nil*) : Size.
- `flags` (*integer|nil*) : Flags.
- `callback` (*any*) : Ignored.
- `user_data` (*any*) : User data.
- **returns**: boolean True if modified.

#### `ui_imgui_custom_luaintf.IntPtr(x)`

Creates an integer pointer {[0]=n} (0 if x is not a number). (dynamically assigned)

- `x` (*number*) : Initial value.
- **returns**: table {[0]=n}

#### `ui_imgui_custom_luaintf.Knob(string_label, floatPtr_value, float_v_min, float_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)`

Rotary button (knob) for a float. (dynamically assigned)

- `string_label` (*string*) : Label.
- `floatPtr_value` (*table*) : FloatPtr.
- `float_v_min` (*number*) : Min.
- `float_v_max` (*number*) : Max.
- `float_speed` (*number|nil*) : Speed.
- `string_format` (*string|nil*) : Display format.
- `ImGuiKnobVariant_variant` (*integer|nil*) : KnobVariant_*.
- `float_size` (*number|nil*) : Size.
- `ImGuiKnobFlags_flags` (*integer|nil*) : KnobFlags_*.
- `int_steps` (*integer|nil*) : Number of steps.
- **returns**: boolean True if the value changes.

#### `ui_imgui_custom_luaintf.KnobInt(string_label, intPtr_value, int_v_min, int_v_max, float_speed, string_format, ImGuiKnobVariant_variant, float_size, ImGuiKnobFlags_flags, int_steps)`

Knob for an integer; same parameters as Knob with an IntPtr. (dynamically assigned)

- `string_label` (*string*) : Label.
- `intPtr_value` (*table*) : IntPtr.
- `int_v_min` (*integer*) : Min.
- `int_v_max` (*integer*) : Max.
- `float_speed` (*number|nil*) : Speed.
- `string_format` (*string|nil*) : Format.
- `ImGuiKnobVariant_variant` (*integer|nil*) : KnobVariant_*.
- `float_size` (*number|nil*) : Size.
- `ImGuiKnobFlags_flags` (*integer|nil*) : KnobFlags_*.
- `int_steps` (*integer|nil*) : Steps.
- **returns**: boolean True if the value changes.

#### `ui_imgui_custom_luaintf.SetDragDropPayload(string_type, void_data, size_t_sz, ImGuiCond_cond)`

Sets the drag-and-drop payload; error logged if type or data is nil; cond 0 by default. (dynamically assigned)

- `string_type` (*string*) : Payload type.
- `void_data` (*any*) : Data.
- `size_t_sz` (*integer*) : Size.
- `ImGuiCond_cond` (*integer|nil*) : Condition.
- **returns**: boolean Result of imgui.SetDragDropPayload.

#### `ui_imgui_custom_luaintf.ShowHelpMarker(desc, sameLine)`

Displays a grayed "(?)"; on hover, a tooltip with desc 35 characters wide. (dynamically assigned)

- `desc` (*string*) : Help text.
- `sameLine` (*boolean|nil*) : If true, SameLine before.

#### `ui_imgui_custom_luaintf.getCurrentMonitorSize()`

Returns the size of the current monitor. (dynamically assigned)

- **returns**: ImVec2 Size in pixels.

#### `ui_imgui_custom_luaintf.getMainViewPortId()`

Id of the main viewport. (dynamically assigned)

- **returns**: integer Id.

#### `ui_imgui_custom_luaintf.getMonitorIndex()`

Monitor index (imgui.getMonitorIndex). (dynamically assigned)

- **returns**: integer Index.

#### `ui_imgui_custom_luaintf.loadIniSettingsFromDisk(filename)`

Loads the ImGui settings (.ini) from a file. (dynamically assigned)

- `filename` (*string*) : Path.

#### `ui_imgui_custom_luaintf.saveIniSettingsToDisk(filename)`

Saves the ImGui settings (.ini) to a file. (dynamically assigned)

- `filename` (*string*) : Path.

#### `ui_imgui_custom_luaintf.tooltip(message)`

If the previous item is hovered, shows message as a tooltip (SetTooltip). (dynamically assigned)

- `message` (*string*) : Text.

#### `ui_imgui_custom_luaintf.tooltipWrapped(message, wrapWidth)`

Like tooltip but with wrapping at wrapWidth pixels (350 by default, multiplied by uiscale[0]). (dynamically assigned)

- `message` (*string*) : Text.
- `wrapWidth` (*number|nil*) : Wrap width.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/imgui_custom_luaintf.lua`.*
