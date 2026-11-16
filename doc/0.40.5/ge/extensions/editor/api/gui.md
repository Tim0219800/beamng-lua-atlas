# `editor_api_gui`

*File: `lua/ge/extensions/editor/api/gui.lua` · VM: Game Engine (GE) · 2251 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_gui`: `extensions.load("editor_api_gui")`, then the global `editor_api_gui`

Core of the level editor's ImGui interface: management of tool windows (registration, show/hide, groups, modals, saving/loading the layout state), the presentation loop (`presentGui`: main dockspace then onEditorGui* hooks), the icon atlas (`editor.icons`) and a large number of `editor.ui*` wrappers around ImGui widgets (drag, input, slider, color) that additionally fill an `editEnded` BoolPtr when editing ends. An editor tool modder uses it to declare their windows (`editor.registerWindow`, `editor.beginWindow`/`endWindow`) and draw their widgets. `initialize` installs everything on the `editor` object.

## Example

```lua
-- onEditorInitialized
editor.registerWindow("myToolWindow", imgui.ImVec2(300, 200))
-- onEditorGui
if editor.beginWindow("myToolWindow", "My Tool") then
  -- widgets...
end
editor.endWindow()
```

## Notes

- The whole API is exposed as editor.xxx (installed by initialize); the editEnded parameters are optional imgui.BoolPtr.
- endWindow/endModalWindow must always be called, even if beginWindow returned false.
- Modal windows are saved as invisible; they only reappear with openModalWindow.
- The comment of showWindow says "sets the visible boolean to false" while the function sets visibility to true (or to `show`).
- uiIconImageButton without a label generates an automatic per-frame id; pass an explicit `id` if the number/order of buttons changes.
- The getTemp* helpers share one buffer per type: do not keep the pointer beyond the widget call.
- Emitted hooks: onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGuiStatusBar, onEditorToolWindowShow/Hide/GotFocus/LostFocus(windowName), onEditorSaveWindowsState, onEditorLoadWindowsState, onEditorSaveGuiInstancerState, onEditorLoadGuiInstancerState, onWindowResized(ImVec2).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_gui.initialize(editorInstance)` | Remembers the editor, initializes the state and installs all the functions below on `editor`. *(internal)* | 2206 |
| `editor_api_gui.presentGui(dtReal, dtSim, dtRaw)` | Presents the whole editor interface: resyncs editor.keyModifiers from ImGui, creates the main dockspace, then emits onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiStatusBar and checks for resizing. Called every frame by the editor. *(internal)* | 466 |

### Parameter details

#### `editor_api_gui.initialize(editorInstance)`

Remembers the editor, initializes the state and installs all the functions below on `editor`.

- `editorInstance` (*table*) : `editor` object

#### `editor_api_gui.presentGui(dtReal, dtSim, dtRaw)`

Presents the whole editor interface: resyncs editor.keyModifiers from ImGui, creates the main dockspace, then emits onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiStatusBar and checks for resizing. Called every frame by the editor.

- `dtReal` (*number*) : real time delta (s)
- `dtSim` (*number*) : simulation time delta (s)
- `dtRaw` (*number*) : raw time delta (s)

## Class `editor`

Functions added to `editor` by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.IsItemClicked(int_mouse_button)` | True if the last item is hovered and the button was just clicked. | 985 |
| `editor.IsItemDoubleClicked(int_mouse_button)` | True if the last item is hovered and double-clicked. | 980 |
| `editor.beginModalWindow(windowName, title, flags, noClose)` | Like beginWindow for a modal window: opens the popup if the window is marked visible. | 1243 |
| `editor.beginWindow(windowName, title, flags, noClose)` | Equivalent of imgui.Begin for a registered window (title##name). Returns false if not registered (warning) or invisible. Always to be paired with editor.endWindow(). | 1195 |
| `editor.callShowWindowHookForVisibleWindows()` | Emits onEditorToolWindowShow for each visible window. | 1376 |
| `editor.checkWindowFocus(windowName)` | Detects the gain/loss of focus of the current ImGui window and emits onEditorToolWindowGotFocus / onEditorToolWindowLostFocus. | 1178 |
| `editor.checkWindowResize()` | Detects a change in the main window size and emits the onWindowResized(ImVec2 DisplaySize) hook. | 426 |
| `editor.closeModalDialog()` | Closes the generic modal dialog and unregisters its window. | 1408 |
| `editor.closeModalWindow(windowName)` | Hides the modal window and closes the current ImGui popup. | 1274 |
| `editor.createIconAtlas()` | Loads the editor icon atlas (JSON + image) and fills editor.icons, editor.atlasWidth, editor.atlasHeight. Logs duplicate icons. | 70 |
| `editor.defocusFocusedWindow()` | Removes focus from the windows marked as focused (emits onEditorToolWindowLostFocus). | 1384 |
| `editor.drawBrush(brushType, pos, radius, numberOfSegments, color, terrainBlock, brushRatio, brushRotation, onlyTerrain)` | Draws a brush ('ellipse' type or box) on the ground around pos, stuck to the terrain (terrainBlock) or to static geometry by raycast. | 299 |
| `editor.endModalWindow()` | Closes a modal window (imgui.EndPopup if it was displayed). | 1262 |
| `editor.endWindow()` | Closes the window opened by beginWindow (calls imgui.End if Begin was called). To be called even if beginWindow returned false. | 1252 |
| `editor.getDefaultIconButtonSize()` | Returns the default size of icon buttons. | 61 |
| `editor.getFontList()` | Lists the available ImGui fonts. | 991 |
| `editor.getSceneViewportRightEdge(screenY)` | Returns the X coordinate of the right edge of the 3D view at the given screen height, taking right-docked windows into account. | 446 |
| `editor.getTempBool_BoolBool(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: bool -> bool pointer; nil -> bool read. | 1795 |
| `editor.getTempBool_StringString(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string/bool -> bool pointer ("1" = true); nil -> "1" or "0". | 1811 |
| `editor.getTempCharPtr(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> char pointer; nil -> string. | 2071 |
| `editor.getTempFloatArray2_StringString(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> float[2] pointer/array; nil -> string. | 1912 |
| `editor.getTempFloatArray2_TableTable(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float[2] pointer/array; nil -> table. | 1933 |
| `editor.getTempFloatArray3_TableTable(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float[3] pointer/array; nil -> table. | 1951 |
| `editor.getTempFloatArray3_Vec3Vec3(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: vec3 -> float[3] pointer/array; nil -> vec3. | 1969 |
| `editor.getTempFloatArray4_StringString(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> float[4] pointer/array; nil -> string. | 2007 |
| `editor.getTempFloatArray4_TableTable(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float[4] pointer/array; nil -> table. | 1985 |
| `editor.getTempFloat_NumberNumber(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: number -> float pointer; nil -> number. | 1884 |
| `editor.getTempFloat_StringString(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> float pointer; nil -> number. | 1895 |
| `editor.getTempImVec4_TableImVec4(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> ImVec4; nil -> ImVec4. | 2093 |
| `editor.getTempImVec4_TableTable(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float pointer/array (ImVec4); nil -> table. | 2049 |
| `editor.getTempIntArray2_StringString(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> int[2] pointer/array; nil -> string. | 1863 |
| `editor.getTempInt_NumberNumber(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: number -> int pointer; nil -> number. | 1835 |
| `editor.getTempInt_StringString(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> int pointer; nil -> number. | 1846 |
| `editor.getTempTextureObj(value)` | Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string path -> texture object; nil -> current texture object. | 2082 |
| `editor.getWindowVisibleBoolPtr(windowName)` | Returns the window's visibility imgui.BoolPtr (used by imgui.Begin), or nil. | 1084 |
| `editor.hideAllWindows()` | Hides all visible registered windows (emits the hooks). | 1107 |
| `editor.hideWindow(windowName)` | Hides the window and emits onEditorToolWindowLostFocus then onEditorToolWindowHide. | 1095 |
| `editor.isViewportFocused()` | True if no ImGui item is active. | 442 |
| `editor.isViewportHovered()` | True if the mouse is over the game's 3D view only (no ImGui item or window hovered). | 438 |
| `editor.isWindowRegistered(windowName)` | True if the window is registered. | 1029 |
| `editor.isWindowVisible(windowName)` | True if the window is registered and visible; also triggers the Show/Hide hooks if the visibility changed (e.g. closed with the cross). | 1072 |
| `editor.loadWindowsState(customFilename, toolName)` | Reloads the windows state (falls back to settings/<tool>/layouts/Default/windowsState.json if the file is missing or has a different version), first hides all windows, then emits onEditorLoadWindowsState and onEditorLoadGuiInstancerState. | 1312 |
| `editor.modalDialogWindowUi()` | Draws the generic modal dialog; called by the editor. | 1415 |
| `editor.openModalDialog(title, windowSize, uiFunction)` | Opens a generic modal dialog (editorModalDialog window) whose content is drawn by uiFunction. | 1401 |
| `editor.openModalWindow(windowName)` | Opens the modal window (showWindow). | 1270 |
| `editor.registerModalWindow(windowName, defaultSize, defaultPos, centered, toolName)` | Registers a modal window (shortcut for registerWindow with modal = true). | 1041 |
| `editor.registerWindow(windowName, defaultSize, defaultPos, defaultVisibleBoolean, modal, centered, groupName, toolName)` | Registers a tool window (to be called in onEditorInitialized). Keeps the previous visibility if it already exists. | 1013 |
| `editor.saveWindowsState(customFilename, toolName)` | Saves the windows state (visibility, size, position, GUI instances) as JSON; modals are saved as invisible. Emits onEditorSaveGuiInstancerState and onEditorSaveWindowsState. | 1279 |
| `editor.screenToClient(pt2i)` | Converts a screen point to a client point via the Canvas (identity if ImGui viewports are disabled). | 511 |
| `editor.setDefaultIconButtonSize(size)` | Sets the default (square) size of icon buttons. | 65 |
| `editor.setKeyModifier(mod, pressed)` | Records the state of a modifier key in editor.keyModifiers (called by the editor's action map). Note: presentGui resyncs ctrl/shift/alt every frame from ImGui. | 2133 |
| `editor.setWindowGroup(windowName, groupName)` | Changes the group of a registered window. | 1393 |
| `editor.setWindowGroupVisibility(groupName, visible)` | Shows or hides all the windows of a group. | 1142 |
| `editor.setWindowVisibility(windowName, visible)` | Alias of showWindow(windowName, visible). | 1138 |
| `editor.setupWindow(windowName)` | Applies default size and position (Cond_FirstUseEver, or centering); to be called before imgui.Begin. Can force expansion according to the ui.general.forceExpandWindowOnFirstShow preference. | 1152 |
| `editor.showVizHelperWindow()` | Opens the visibility help window (editor_vizHelper) if the extension is loaded. | 257 |
| `editor.showWindow(windowName, show)` | Shows (or hides if show == false) the window and emits onEditorToolWindowShow / onEditorToolWindowHide. | 1119 |
| `editor.texObj(path)` | Loads a texture and returns its information; nil if loading fails. | 40 |
| `editor.uiButtonRightAlign(string_label, ImVec2_size, bool_sameLine, id, offset)` | Right-aligned button in the available area. | 116 |
| `editor.uiColorButton(desc_id, col, flags, size, editEnded)` | Wrapper of imgui.ColorButton (color) that additionally fills editEnded. Same parameters as ImGui. | 957 |
| `editor.uiColorEdit3(label, col, flags, editEnded)` | Wrapper of imgui.ColorEdit3 (color) that additionally fills editEnded. Same parameters as ImGui. | 902 |
| `editor.uiColorEdit4(label, col, flags, editEnded)` | Wrapper of imgui.ColorEdit4 (color) that additionally fills editEnded. Same parameters as ImGui. | 909 |
| `editor.uiColorEdit8(label, col, flags, editEnded)` | Wrapper of imgui.ColorEdit8 (color) that additionally fills editEnded. Same parameters as ImGui. | 917 |
| `editor.uiColorPicker3(label, col, flags, editEnded)` | Wrapper of imgui.ColorPicker3 (color) that additionally fills editEnded. Same parameters as ImGui. | 943 |
| `editor.uiColorPicker4(label, col, flags, ref_col, editEnded)` | Wrapper of imgui.ColorPicker4 (color) that additionally fills editEnded. Same parameters as ImGui. | 950 |
| `editor.uiDragFloat(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragFloat (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 521 |
| `editor.uiDragFloat2(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragFloat2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 528 |
| `editor.uiDragFloat3(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragFloat3 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 535 |
| `editor.uiDragFloat4(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragFloat4 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 542 |
| `editor.uiDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded)` | Wrapper of imgui.DragFloatRange2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 549 |
| `editor.uiDragInt(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragInt (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 556 |
| `editor.uiDragInt2(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragInt2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 563 |
| `editor.uiDragInt3(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragInt3 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 570 |
| `editor.uiDragInt4(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragInt4 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 577 |
| `editor.uiDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded)` | Wrapper of imgui.DragIntRange2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 584 |
| `editor.uiDragScalar(label, data_type, v, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragScalar (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 591 |
| `editor.uiDragScalarN(label, data_type, v, components, v_speed, v_min, v_max, format, flags, editEnded)` | Wrapper of imgui.DragScalarN (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 598 |
| `editor.uiHelpButton(topicName, relativeUrl, size)` | Help button: opens https://documentation.beamng.com/<relativeUrl> in the browser (index by default). | 249 |
| `editor.uiHighlightedText(text, highlightText, textColor)` | Displays text, highlighting in yellow several occurrences (case-insensitive, about ten at most) of highlightText. | 158 |
| `editor.uiIconImage(icon, size, col, borderCol, label)` | Draws an icon from the editor atlas (32x32 size by default, multiplied by imgui.uiscale). | 130 |
| `editor.uiIconImageButton(icon, size, col, label, backgroundCol, id, textColor, textBG, onRelease, highlightText)` | Icon button (with or without a label). Without a provided id, an automatic per-frame id is generated. onRelease = click detected on release. | 191 |
| `editor.uiInputDouble(label, v, step, step_fast, format, extra_flags, editEnded)` | Wrapper of imgui.InputDouble (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 694 |
| `editor.uiInputFile(label, buf, width, dir, extFilter, flags, editEnded)` | File path field with a '...' button opening editor_fileDialog.openFile; writes the chosen path into buf. | 757 |
| `editor.uiInputFloat(label, v, step, step_fast, format, extra_flags, editEnded)` | Wrapper of imgui.InputFloat (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 628 |
| `editor.uiInputFloat2(label, v, format, extra_flags, editEnded)` | Wrapper of imgui.InputFloat2 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 640 |
| `editor.uiInputFloat2Ex(label, v, step, step_fast, format, flags, editEnded)` | Variant of uiInputFloat2 with step/step_fast handled by the editor; fills editEnded. | 1639 |
| `editor.uiInputFloat3(label, v, format, extra_flags, editEnded)` | Wrapper of imgui.InputFloat3 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 647 |
| `editor.uiInputFloat3Ex(label, v, step, step_fast, format, flags, editEnded)` | Variant of uiInputFloat3 with step/step_fast handled by the editor; fills editEnded. | 1676 |
| `editor.uiInputFloat4(label, v, format, extra_flags, editEnded)` | Wrapper of imgui.InputFloat4 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 654 |
| `editor.uiInputFloat4Ex(label, v, step, step_fast, format, flags, editEnded)` | Variant of uiInputFloat4 with step/step_fast handled by the editor; fills editEnded. | 1718 |
| `editor.uiInputFloatEx(label, v, step, step_fast, format, flags, editEnded)` | Variant of uiInputFloat with step/step_fast handled by the editor; fills editEnded. | 1610 |
| `editor.uiInputInt(label, v, step, step_fast, extra_flags, editEnded)` | Wrapper of imgui.InputInt (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 661 |
| `editor.uiInputInt2(label, v, extra_flags, editEnded)` | Wrapper of imgui.InputInt2 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 673 |
| `editor.uiInputInt3(label, v, extra_flags, editEnded)` | Wrapper of imgui.InputInt3 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 680 |
| `editor.uiInputInt4(label, v, extra_flags, editEnded)` | Wrapper of imgui.InputInt4 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 687 |
| `editor.uiInputScalar(label, data_type, v, step, step_fast, format, extra_flags, editEnded)` | Wrapper of imgui.InputScalar (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 701 |
| `editor.uiInputScalarN(label, data_type, v, components, step, step_fast, format, extra_flags, editEnded)` | Wrapper of imgui.InputScalarN (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 708 |
| `editor.uiInputSearch(label, text, width, extra_flags, editEnded)` | Search field (magnifier icon + text + clear button) of fixed width. Returns true if the text changed or was cleared. | 715 |
| `editor.uiInputSearchTextFilter(label, txtfilter, width, extra_flags, editEnded)` | Like uiInputSearch but edits an ImGuiTextFilter and rebuilds it (ImGuiTextFilter_Build) on each change. | 747 |
| `editor.uiInputText(label, buf, buf_size, flags, callback, user_data, editEnded)` | Wrapper of imgui.InputText (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 607 |
| `editor.uiInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data, editEnded)` | Wrapper of imgui.InputTextMultiline (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 614 |
| `editor.uiInputTextMultilineReadOnly(label, buf, size, flags, callback, user_data, editEnded)` | Wrapper of imgui.InputTextMultilineReadOnly (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed. | 621 |
| `editor.uiPlotLines1(string_label, float_values, int_values_count, int_values_offset, string_overlay_text, float_scale_min, float_scale_max, ImVec2_graph_size, int_stride, auto_resize)` | Wrapper of imgui.PlotLines1: float curve; default values offset 0, scale FLT_MAX, stride sizeof(float); auto_resize fits the size to the window. | 965 |
| `editor.uiRenderAlternateRows(lineHeight, mOddColor, mEvenColor)` | Draws alternating-color background rows in the current window/child (technique from ocornut/imgui#2668). Must be wrapped in Begin/BeginChild ... End/EndChild. | 2148 |
| `editor.uiSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, editEnded)` | Wrapper of imgui.SliderAngle (slider) that additionally fills editEnded. Same parameters as ImGui. | 830 |
| `editor.uiSliderFloat(label, v, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.SliderFloat (slider) that additionally fills editEnded. Same parameters as ImGui. | 802 |
| `editor.uiSliderFloat2(label, v, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.SliderFloat2 (slider) that additionally fills editEnded. Same parameters as ImGui. | 809 |
| `editor.uiSliderFloat3(label, v, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.SliderFloat3 (slider) that additionally fills editEnded. Same parameters as ImGui. | 816 |
| `editor.uiSliderFloat4(label, v, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.SliderFloat4 (slider) that additionally fills editEnded. Same parameters as ImGui. | 823 |
| `editor.uiSliderInt(label, v, v_min, v_max, format, editEnded)` | Wrapper of imgui.SliderInt (slider) that additionally fills editEnded. Same parameters as ImGui. | 837 |
| `editor.uiSliderInt2(label, v, v_min, v_max, format, editEnded)` | Wrapper of imgui.SliderInt2 (slider) that additionally fills editEnded. Same parameters as ImGui. | 844 |
| `editor.uiSliderInt3(label, v, v_min, v_max, format, editEnded)` | Wrapper of imgui.SliderInt3 (slider) that additionally fills editEnded. Same parameters as ImGui. | 851 |
| `editor.uiSliderInt4(label, v, v_min, v_max, format, editEnded)` | Wrapper of imgui.SliderInt4 (slider) that additionally fills editEnded. Same parameters as ImGui. | 858 |
| `editor.uiSliderScalar(label, data_type, v, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.SliderScalar (slider) that additionally fills editEnded. Same parameters as ImGui. | 865 |
| `editor.uiSliderScalarN(label, data_type, v, components, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.SliderScalarN (slider) that additionally fills editEnded. Same parameters as ImGui. | 872 |
| `editor.uiTextColoredWithFont(color, text, fontName)` | Displays text (colored if color is not nil) with a named ImGui font. | 106 |
| `editor.uiTextUnformattedRightAlign(string_label, bool_sameLine, offset)` | Displays text right-aligned in the available area. | 97 |
| `editor.uiVSliderFloat(label, size, v, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.VSliderFloat (slider) that additionally fills editEnded. Same parameters as ImGui. | 879 |
| `editor.uiVSliderInt(label, size, v, v_min, v_max, format, editEnded)` | Wrapper of imgui.VSliderInt (slider) that additionally fills editEnded. Same parameters as ImGui. | 886 |
| `editor.uiVSliderScalar(label, size, data_type, v, v_min, v_max, format, power, editEnded)` | Wrapper of imgui.VSliderScalar (slider) that additionally fills editEnded. Same parameters as ImGui. | 893 |
| `editor.uiVertSeparator(float_height, vec2_offset, width)` | Draws a vertical separator on the current line. | 263 |
| `editor.unregisterWindow(windowName)` | Unregisters a window so that it is no longer in the saved state. To be called right after imgui.Begin if the window is no longer visible; to simply hide it, use hideWindow. | 1068 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorGui` — listened to by 103 module(s)
- `onEditorGuiMainMenu` — listened to by 1 module(s)
- `onEditorGuiStatusBar`
- `onEditorGuiToolBar` — listened to by 2 module(s)
- `onEditorLoadGuiInstancerState` — listened to by 2 module(s)
- `onEditorLoadWindowsState`
- `onEditorSaveGuiInstancerState` — listened to by 2 module(s)
- `onEditorSaveWindowsState`
- `onEditorToolWindowGotFocus` — listened to by 4 module(s)
- `onEditorToolWindowHide` — listened to by 10 module(s)
- `onEditorToolWindowLostFocus` — listened to by 2 module(s)
- `onEditorToolWindowShow` — listened to by 3 module(s)
- `onWindowResized` — listened to by 2 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawQuadSolid`
- `scenetree.` `findObject`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/gui.lua`.*
