# `ui_imgui_luaintf`

*File: `lua/common/extensions/ui/imgui_luaintf.lua` · VM: Common (GE + vehicle) · 2198 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/ui/imgui_luaintf")` (file under extensions/ but not a regular extension)

Generated file (about 2200 lines, ~485 functions) that exposes almost the entire Dear ImGui API in Lua as very thin wrappers over Engine.imgui (the game's C++ binding): NewFrame/Render, windows, widgets (Text, Button, Slider*, Drag*, Input*, Combo, Tree*, Table*, Plot*), ImDrawList_*, styles (PushStyleColor*, PushStyleVar*), IO, fonts, and the enums as constants M.Xxx_Yyy (e.g. WindowFlags_NoTitleBar, Col_Text, Key_*). It is not an extension: it returns a function that receives the table M of imgui_api. The numeric suffixes (Button/SmallButton, TreeNode1/TreeNode2, Combo1, PushStyleColor2...) correspond to the C++ overloads of the same function.

## Example

```lua
-- Used via ui_imgui:
local im = ui_imgui
if im.Begin('Test') then
  if im.Button('OK') then print('click') end
end
im.End()
```

## Notes

- File convention: each wrapper checks the parameters of type 'const char *'; if nil, it logs an error ("Parameter 'x' of function 'F' cannot be nil, as the c type is 'const char *'") and returns without calling ImGui.
- The "pointer" parameters (bool_p_open, float*, int*...) are tables {[0]=value} created by BoolPtr/FloatPtr/IntPtr/ArrayChar (see imgui_custom_luaintf).
- Default values are set in the wrappers (e.g. flags = 0 if nil).
- Several functions in this file are rewritten by imgui_custom_luaintf.lua (Begin, InputText, GetKeyIndex...): the custom version wins since it is loaded afterwards.
- The functions of this file are not listed one by one here: they follow the official Dear ImGui documentation (the name suffix indicates the overload).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_imgui_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)` | Opens a window (flags 0 by default in this version; the custom version sets NoFocusOnAppearing). (dynamically assigned) | dyn |
| `ui_imgui_luaintf.EndFrame()` | Ends the ImGui frame (handled by the engine). (dynamically assigned) *(internal)* | dyn |
| `ui_imgui_luaintf.GetCurrentContext()` | Returns the current ImGui context. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.GetKeyIndex(ImGuiKey_key)` | Converts a key to an index (imgui.GetKeyIndex); replaced by a no-op version in imgui_custom_luaintf. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.GetVersion()` | Returns the Dear ImGui version. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.NewFrame()` | Starts a new ImGui frame (normally handled by the engine). (dynamically assigned) *(internal)* | dyn |
| `ui_imgui_luaintf.Render()` | Finalizes the ImGui rendering (handled by the engine). (dynamically assigned) *(internal)* | dyn |
| `ui_imgui_luaintf.ShowAboutWindow(bool_p_open)` | Shows the ImGui "About" window. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowDebugLogWindow(bool_p_open)` | Shows the ImGui debug log window. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowDemoWindow(bool_p_open)` | Shows the ImGui demo window. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowFontSelector(string_label)` | Shows a font selector. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowMetricsWindow(bool_p_open)` | Shows the ImGui metrics window. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowStackToolWindow(bool_p_open)` | Shows the ImGui ID stack tool. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowStyleEditor(ImGuiStyle_ref)` | Shows the ImGui style editor. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowStyleSelector(string_label)` | Shows a style selector. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.ShowUserGuide()` | Shows the ImGui user guide. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.StyleColorsClassic(ImGuiStyle_dst)` | Applies the classic theme. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.StyleColorsDark(ImGuiStyle_dst)` | Applies the dark theme. (dynamically assigned) | dyn |
| `ui_imgui_luaintf.StyleColorsLight(ImGuiStyle_dst)` | Applies the light theme. (dynamically assigned) | dyn |

### Parameter details

#### `ui_imgui_luaintf.Begin(string_name, bool_p_open, ImGuiWindowFlags_flags)`

Opens a window (flags 0 by default in this version; the custom version sets NoFocusOnAppearing). (dynamically assigned)

- `string_name` (*string*) : Title (cannot be nil).
- `bool_p_open` (*table|nil*) : Optional BoolPtr.
- `ImGuiWindowFlags_flags` (*integer|nil*) : Window flags.
- **returns**: boolean True if the window is visible.

#### `ui_imgui_luaintf.GetCurrentContext()`

Returns the current ImGui context. (dynamically assigned)

- **returns**: userdata Context.

#### `ui_imgui_luaintf.GetKeyIndex(ImGuiKey_key)`

Converts a key to an index (imgui.GetKeyIndex); replaced by a no-op version in imgui_custom_luaintf. (dynamically assigned)

- `ImGuiKey_key` (*integer*) : ImGui key.
- **returns**: integer Key index.

#### `ui_imgui_luaintf.GetVersion()`

Returns the Dear ImGui version. (dynamically assigned)

- **returns**: string Version.

#### `ui_imgui_luaintf.ShowAboutWindow(bool_p_open)`

Shows the ImGui "About" window. (dynamically assigned)

- `bool_p_open` (*table|nil*) : Optional BoolPtr.

#### `ui_imgui_luaintf.ShowDebugLogWindow(bool_p_open)`

Shows the ImGui debug log window. (dynamically assigned)

- `bool_p_open` (*table|nil*) : Optional BoolPtr.

#### `ui_imgui_luaintf.ShowDemoWindow(bool_p_open)`

Shows the ImGui demo window. (dynamically assigned)

- `bool_p_open` (*table|nil*) : Optional BoolPtr.

#### `ui_imgui_luaintf.ShowFontSelector(string_label)`

Shows a font selector. (dynamically assigned)

- `string_label` (*string*) : Label (cannot be nil).

#### `ui_imgui_luaintf.ShowMetricsWindow(bool_p_open)`

Shows the ImGui metrics window. (dynamically assigned)

- `bool_p_open` (*table|nil*) : Optional BoolPtr.

#### `ui_imgui_luaintf.ShowStackToolWindow(bool_p_open)`

Shows the ImGui ID stack tool. (dynamically assigned)

- `bool_p_open` (*table|nil*) : Optional BoolPtr.

#### `ui_imgui_luaintf.ShowStyleEditor(ImGuiStyle_ref)`

Shows the ImGui style editor. (dynamically assigned)

- `ImGuiStyle_ref` (*userdata|nil*) : Style to edit, optional.

#### `ui_imgui_luaintf.ShowStyleSelector(string_label)`

Shows a style selector. (dynamically assigned)

- `string_label` (*string*) : Label (cannot be nil).
- **returns**: boolean True if the style changed.

#### `ui_imgui_luaintf.StyleColorsClassic(ImGuiStyle_dst)`

Applies the classic theme. (dynamically assigned)

- `ImGuiStyle_dst` (*userdata|nil*) : Target style, optional.

#### `ui_imgui_luaintf.StyleColorsDark(ImGuiStyle_dst)`

Applies the dark theme. (dynamically assigned)

- `ImGuiStyle_dst` (*userdata|nil*) : Target style, optional.

#### `ui_imgui_luaintf.StyleColorsLight(ImGuiStyle_dst)`

Applies the light theme. (dynamically assigned)

- `ImGuiStyle_dst` (*userdata|nil*) : Target style, optional.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/imgui_luaintf.lua`.*
