# `editor_api_gui`

*Fichier : `lua/ge/extensions/editor/api/gui.lua` · VM : Game Engine (GE) · 2251 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_gui` : `extensions.load("editor_api_gui")`, puis la globale `editor_api_gui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_gui.initialize(editorInstance)` |  | 2206 |
| `editor_api_gui.presentGui(dtReal, dtSim, dtRaw)` | Used by editor, present the entire editor UI | 466 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.IsItemClicked(int_mouse_button)` |  | 985 |
| `editor.IsItemDoubleClicked(int_mouse_button)` |  | 980 |
| `editor.beginModalWindow(windowName, title, flags, noClose)` |  | 1243 |
| `editor.beginWindow(windowName, title, flags, noClose)` |  | 1195 |
| `editor.callShowWindowHookForVisibleWindows()` |  | 1376 |
| `editor.checkWindowFocus(windowName)` |  | 1178 |
| `editor.checkWindowResize()` | Check if the main window got resized. It will call extensions hook onWindowResized with the new size as imgui ImVec2 as parameter. | 426 |
| `editor.closeModalDialog()` |  | 1408 |
| `editor.closeModalWindow(windowName)` |  | 1274 |
| `editor.createIconAtlas()` | Load and create the editor icon texture atlas. It also creates the editor.icons table with all the icons. | 70 |
| `editor.defocusFocusedWindow()` |  | 1384 |
| `editor.drawBrush(brushType, pos, radius, numberOfSegments, color, terrainBlock, brushRatio, brushRotation, onlyTerrain)` |  | 299 |
| `editor.endModalWindow()` |  | 1262 |
| `editor.endWindow()` |  | 1252 |
| `editor.getDefaultIconButtonSize()` |  | 61 |
| `editor.getFontList()` | Returns a table with all the fonts imgui has available | 991 |
| `editor.getSceneViewportRightEdge(screenY)` |  | 446 |
| `editor.getTempBool_BoolBool(value)` | in: bool, out: bool pointer<br> in: nil, out: bool | 1795 |
| `editor.getTempBool_StringString(value)` | in string; out bool pointer<br> in nil; out string | 1811 |
| `editor.getTempCharPtr(value)` | in string; out char pointer<br> in nil; out string | 2071 |
| `editor.getTempFloatArray2_StringString(value)` | in string; out float pointer/array<br> in nil; out string | 1912 |
| `editor.getTempFloatArray2_TableTable(value)` | in table; out float pointer/array<br> in nil; out table | 1933 |
| `editor.getTempFloatArray3_TableTable(value)` | in table; out float pointer/array<br> in nil; out table | 1951 |
| `editor.getTempFloatArray3_Vec3Vec3(value)` |  | 1969 |
| `editor.getTempFloatArray4_StringString(value)` | in string; out float pointer/array<br> in nil; out string | 2007 |
| `editor.getTempFloatArray4_TableTable(value)` | in table; out float pointer/array<br> in nil; out table | 1985 |
| `editor.getTempFloat_NumberNumber(value)` | in: number, out: float pointer<br> in: nil, out: number | 1884 |
| `editor.getTempFloat_StringString(value)` | in string; out float pointer<br> in nil; out number | 1895 |
| `editor.getTempImVec4_TableImVec4(value)` | in table; out float ImVec4<br> in nil; out ImVec4 | 2093 |
| `editor.getTempImVec4_TableTable(value)` | in table; out float pointer/array<br> in nil; out table | 2049 |
| `editor.getTempIntArray2_StringString(value)` | in string; out int pointer/array<br> in nil; out string | 1863 |
| `editor.getTempInt_NumberNumber(value)` | in: number, out: int pointer<br> in: nil, out: number | 1835 |
| `editor.getTempInt_StringString(value)` | in string; out int pointer<br> in nil; out number | 1846 |
| `editor.getTempTextureObj(value)` | in: string/path, out: texture object<br> in: nil, out: texture object | 2082 |
| `editor.getWindowVisibleBoolPtr(windowName)` | Return the boolean pointer of imgui which stores the visibility of the window, used in imgui.Begin call.<br> @param windowName the name of the window | 1084 |
| `editor.hideAllWindows()` | Hide all registered windows | 1107 |
| `editor.hideWindow(windowName)` | Hide the named window, sets the visible boolean to false.<br> @param windowName the name of the window | 1095 |
| `editor.isViewportFocused()` |  | 442 |
| `editor.isViewportHovered()` | Returns true if the 3D game viewport is hovered only. | 438 |
| `editor.isWindowRegistered(windowName)` |  | 1029 |
| `editor.isWindowVisible(windowName)` |  | 1072 |
| `editor.loadWindowsState(customFilename, toolName)` |  | 1312 |
| `editor.modalDialogWindowUi()` | called by the editor, internal | 1415 |
| `editor.openModalDialog(title, windowSize, uiFunction)` |  | 1401 |
| `editor.openModalWindow(windowName)` |  | 1270 |
| `editor.registerModalWindow(windowName, defaultSize, defaultPos, centered, toolName)` | Register a given modal window name, usually must be called in onEditorInitialized() of the editor extension.<br> For more usage of the window api, @see [Tutorial - Step #2, Writing base code](../../../../tutorials/world_editor/create_editor_tool/_index.md).<br> @param windowName the name of the window to register<br> @param defaultSize the default first time size of the window, as imgui ImVec2<br> @param defaultPos the default first time size of the window, as imgui ImVec2<br> @param defaultVisibleBoolean if this is not nil, it will be the default first time open state of the window<br> @param centered if the window is centered by default<br> @param toolName what tool this window belongs to, so window state can be applied on a tool basis if needed | 1041 |
| `editor.registerWindow(windowName, defaultSize, defaultPos, defaultVisibleBoolean, modal, centered, groupName, toolName)` | Register a given window name, usually must be called in onEditorInitialized() of the editor extension.<br> For more usage of the window api, @see [Tutorial - Step #2, Writing base code](../../../../tutorials/world_editor/create_editor_tool/_index.md).<br> @param windowName the name of the window to register<br> @param defaultSize the default first time size of the window, as imgui ImVec2<br> @param defaultPos the default first time size of the window, as imgui ImVec2<br> @param defaultVisibleBoolean if this is not nil, it will be the default first time open state of the window<br> @param modal if the window is a modal window<br> @param centered if the window is centered by default<br> @param groupName the group name for the window, used to open or close many windows at once<br> @param toolName what tool this window belongs to, so window state can be applied on a tool basis if needed | 1013 |
| `editor.saveWindowsState(customFilename, toolName)` |  | 1279 |
| `editor.screenToClient(pt2i)` |  | 511 |
| `editor.setDefaultIconButtonSize(size)` |  | 65 |
| `editor.setKeyModifier(mod, pressed)` |  | 2133 |
| `editor.setWindowGroup(windowName, groupName)` |  | 1393 |
| `editor.setWindowGroupVisibility(groupName, visible)` |  | 1142 |
| `editor.setWindowVisibility(windowName, visible)` |  | 1138 |
| `editor.setupWindow(windowName)` | Setup the window's default size and position. Must be called before imgui.Begin.<br> @param windowName the name of the window | 1152 |
| `editor.showVizHelperWindow()` | Show the visibility helper tool window. | 257 |
| `editor.showWindow(windowName, show)` | Show the named window, sets the visible boolean to false.<br> @param windowName the name of the window | 1119 |
| `editor.texObj(path)` | Returns a table with the loaded texture information<br> @param path the path to a texture image | 40 |
| `editor.uiButtonRightAlign(string_label, ImVec2_size, bool_sameLine, id, offset)` |  | 116 |
| `editor.uiColorButton(desc_id, col, flags, size, editEnded)` |  | 957 |
| `editor.uiColorEdit3(label, col, flags, editEnded)` | Widgets: Color Editor/Picker | 902 |
| `editor.uiColorEdit4(label, col, flags, editEnded)` |  | 909 |
| `editor.uiColorEdit8(label, col, flags, editEnded)` |  | 917 |
| `editor.uiColorPicker3(label, col, flags, editEnded)` |  | 943 |
| `editor.uiColorPicker4(label, col, flags, ref_col, editEnded)` |  | 950 |
| `editor.uiDragFloat(label, v, v_speed, v_min, v_max, format, flags, editEnded)` | Editing Wrappers | 521 |
| `editor.uiDragFloat2(label, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 528 |
| `editor.uiDragFloat3(label, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 535 |
| `editor.uiDragFloat4(label, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 542 |
| `editor.uiDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded)` |  | 549 |
| `editor.uiDragInt(label, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 556 |
| `editor.uiDragInt2(label, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 563 |
| `editor.uiDragInt3(label, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 570 |
| `editor.uiDragInt4(label, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 577 |
| `editor.uiDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded)` |  | 584 |
| `editor.uiDragScalar(label, data_type, v, v_speed, v_min, v_max, format, flags, editEnded)` |  | 591 |
| `editor.uiDragScalarN(label, data_type, v, components, v_speed, v_min, v_max, format, flags, editEnded)` |  | 598 |
| `editor.uiHelpButton(topicName, relativeUrl, size)` |  | 249 |
| `editor.uiHighlightedText(text, highlightText, textColor)` |  | 158 |
| `editor.uiIconImage(icon, size, col, borderCol, label)` | Draw an icon image widget. | 130 |
| `editor.uiIconImageButton(icon, size, col, label, backgroundCol, id, textColor, textBG, onRelease, highlightText)` | Draw an icon image button widget. | 191 |
| `editor.uiInputDouble(label, v, step, step_fast, format, extra_flags, editEnded)` |  | 694 |
| `editor.uiInputFile(label, buf, width, dir, extFilter, flags, editEnded)` |  | 757 |
| `editor.uiInputFloat(label, v, step, step_fast, format, extra_flags, editEnded)` |  | 628 |
| `editor.uiInputFloat2(label, v, format, extra_flags, editEnded)` |  | 640 |
| `editor.uiInputFloat2Ex(label, v, step, step_fast, format, flags, editEnded)` |  | 1639 |
| `editor.uiInputFloat3(label, v, format, extra_flags, editEnded)` |  | 647 |
| `editor.uiInputFloat3Ex(label, v, step, step_fast, format, flags, editEnded)` |  | 1676 |
| `editor.uiInputFloat4(label, v, format, extra_flags, editEnded)` |  | 654 |
| `editor.uiInputFloat4Ex(label, v, step, step_fast, format, flags, editEnded)` |  | 1718 |
| `editor.uiInputFloatEx(label, v, step, step_fast, format, flags, editEnded)` |  | 1610 |
| `editor.uiInputInt(label, v, step, step_fast, extra_flags, editEnded)` |  | 661 |
| `editor.uiInputInt2(label, v, extra_flags, editEnded)` |  | 673 |
| `editor.uiInputInt3(label, v, extra_flags, editEnded)` |  | 680 |
| `editor.uiInputInt4(label, v, extra_flags, editEnded)` |  | 687 |
| `editor.uiInputScalar(label, data_type, v, step, step_fast, format, extra_flags, editEnded)` |  | 701 |
| `editor.uiInputScalarN(label, data_type, v, components, step, step_fast, format, extra_flags, editEnded)` |  | 708 |
| `editor.uiInputSearch(label, text, width, extra_flags, editEnded)` |  | 715 |
| `editor.uiInputSearchTextFilter(label, txtfilter, width, extra_flags, editEnded)` |  | 747 |
| `editor.uiInputText(label, buf, buf_size, flags, callback, user_data, editEnded)` | Widgets: Input with Keyboard | 607 |
| `editor.uiInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data, editEnded)` |  | 614 |
| `editor.uiInputTextMultilineReadOnly(label, buf, size, flags, callback, user_data, editEnded)` |  | 621 |
| `editor.uiPlotLines1(string_label, float_values, int_values_count, int_values_offset, string_overlay_text, float_scale_min, float_scale_max, ImVec2_graph_size, int_stride, auto_resize)` |  | 965 |
| `editor.uiRenderAlternateRows(lineHeight, mOddColor, mEvenColor)` | Render alternate-color rows current window/child<br> Based on approach in https://github.com/ocornut/imgui/issues/2668<br> IMPORTANT: Requires to be surrounded by Begin/BeginChild, End/EndChild | 2148 |
| `editor.uiSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, editEnded)` |  | 830 |
| `editor.uiSliderFloat(label, v, v_min, v_max, format, power, editEnded)` | Widgets: Sliders | 802 |
| `editor.uiSliderFloat2(label, v, v_min, v_max, format, power, editEnded)` |  | 809 |
| `editor.uiSliderFloat3(label, v, v_min, v_max, format, power, editEnded)` |  | 816 |
| `editor.uiSliderFloat4(label, v, v_min, v_max, format, power, editEnded)` |  | 823 |
| `editor.uiSliderInt(label, v, v_min, v_max, format, editEnded)` |  | 837 |
| `editor.uiSliderInt2(label, v, v_min, v_max, format, editEnded)` |  | 844 |
| `editor.uiSliderInt3(label, v, v_min, v_max, format, editEnded)` |  | 851 |
| `editor.uiSliderInt4(label, v, v_min, v_max, format, editEnded)` |  | 858 |
| `editor.uiSliderScalar(label, data_type, v, v_min, v_max, format, power, editEnded)` |  | 865 |
| `editor.uiSliderScalarN(label, data_type, v, components, v_min, v_max, format, power, editEnded)` |  | 872 |
| `editor.uiTextColoredWithFont(color, text, fontName)` |  | 106 |
| `editor.uiTextUnformattedRightAlign(string_label, bool_sameLine, offset)` |  | 97 |
| `editor.uiVSliderFloat(label, size, v, v_min, v_max, format, power, editEnded)` |  | 879 |
| `editor.uiVSliderInt(label, size, v, v_min, v_max, format, editEnded)` |  | 886 |
| `editor.uiVSliderScalar(label, size, data_type, v, v_min, v_max, format, power, editEnded)` |  | 893 |
| `editor.uiVertSeparator(float_height, vec2_offset, width)` |  | 263 |
| `editor.unregisterWindow(windowName)` | Unregister a given window name. For example when a tool window was closed, you dont want it in the saved state of the editor anymore.<br> Call this function right after the imgui.Begin call, if the editor.isWindowVisible(yourWindowName) is false.<br> If you just want to hide the window, the call editor.hideWindow(yourWindowName) only.<br> For more usage of the window api, see [Tutorial - Step #2, Writing base code](../../../../tutorials/world_editor/create_editor_tool/_index.md).<br> @param windowName the name of the window to unregister | 1068 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorGui` — écouté par 103 module(s)
- `onEditorGuiMainMenu` — écouté par 1 module(s)
- `onEditorGuiStatusBar`
- `onEditorGuiToolBar` — écouté par 2 module(s)
- `onEditorLoadGuiInstancerState` — écouté par 2 module(s)
- `onEditorLoadWindowsState`
- `onEditorSaveGuiInstancerState` — écouté par 2 module(s)
- `onEditorSaveWindowsState`
- `onEditorToolWindowGotFocus` — écouté par 4 module(s)
- `onEditorToolWindowHide` — écouté par 10 module(s)
- `onEditorToolWindowLostFocus` — écouté par 2 module(s)
- `onEditorToolWindowShow` — écouté par 3 module(s)
- `onWindowResized` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawQuadSolid`
- `scenetree.` `findObject`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/gui.lua`.*
