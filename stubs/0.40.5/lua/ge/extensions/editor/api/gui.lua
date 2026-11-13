---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/gui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_gui` : `extensions.load("editor_api_gui")`, puis la globale `editor_api_gui`
---@class editor_api_gui
editor_api_gui = {}

---Source : lua/ge/extensions/editor/api/gui.lua:2206
---@param editorInstance any
function editor_api_gui.initialize(editorInstance) end

--- Used by editor, present the entire editor UI
---Source : lua/ge/extensions/editor/api/gui.lua:466
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_api_gui.presentGui(dtReal, dtSim, dtRaw) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/gui.lua
---@class editor_api_gui_editor
local editor_api_gui_editor = {}

---Source : lua/ge/extensions/editor/api/gui.lua:985
---@param int_mouse_button any
function editor_api_gui_editor.IsItemClicked(int_mouse_button) end

---Source : lua/ge/extensions/editor/api/gui.lua:980
---@param int_mouse_button any
function editor_api_gui_editor.IsItemDoubleClicked(int_mouse_button) end

---Source : lua/ge/extensions/editor/api/gui.lua:1243
---@param windowName any
---@param title any
---@param flags any
---@param noClose any
function editor_api_gui_editor.beginModalWindow(windowName, title, flags, noClose) end

---Source : lua/ge/extensions/editor/api/gui.lua:1195
---@param windowName any
---@param title any
---@param flags any
---@param noClose any
function editor_api_gui_editor.beginWindow(windowName, title, flags, noClose) end

---Source : lua/ge/extensions/editor/api/gui.lua:1376
function editor_api_gui_editor.callShowWindowHookForVisibleWindows() end

---Source : lua/ge/extensions/editor/api/gui.lua:1178
---@param windowName any
function editor_api_gui_editor.checkWindowFocus(windowName) end

--- Check if the main window got resized. It will call extensions hook onWindowResized with the new size as imgui ImVec2 as parameter.
---Source : lua/ge/extensions/editor/api/gui.lua:426
function editor_api_gui_editor.checkWindowResize() end

---Source : lua/ge/extensions/editor/api/gui.lua:1408
function editor_api_gui_editor.closeModalDialog() end

---Source : lua/ge/extensions/editor/api/gui.lua:1274
---@param windowName any
function editor_api_gui_editor.closeModalWindow(windowName) end

--- Load and create the editor icon texture atlas. It also creates the editor.icons table with all the icons.
---Source : lua/ge/extensions/editor/api/gui.lua:70
function editor_api_gui_editor.createIconAtlas() end

---Source : lua/ge/extensions/editor/api/gui.lua:1384
function editor_api_gui_editor.defocusFocusedWindow() end

---Source : lua/ge/extensions/editor/api/gui.lua:299
---@param brushType any
---@param pos any
---@param radius any
---@param numberOfSegments any
---@param color any
---@param terrainBlock any
---@param brushRatio any
---@param brushRotation any
---@param onlyTerrain any
function editor_api_gui_editor.drawBrush(brushType, pos, radius, numberOfSegments, color, terrainBlock, brushRatio, brushRotation, onlyTerrain) end

---Source : lua/ge/extensions/editor/api/gui.lua:1262
function editor_api_gui_editor.endModalWindow() end

---Source : lua/ge/extensions/editor/api/gui.lua:1252
function editor_api_gui_editor.endWindow() end

---Source : lua/ge/extensions/editor/api/gui.lua:61
function editor_api_gui_editor.getDefaultIconButtonSize() end

--- Returns a table with all the fonts imgui has available
---Source : lua/ge/extensions/editor/api/gui.lua:991
function editor_api_gui_editor.getFontList() end

---Source : lua/ge/extensions/editor/api/gui.lua:446
---@param screenY any
function editor_api_gui_editor.getSceneViewportRightEdge(screenY) end

--- in: bool, out: bool pointer
---  in: nil, out: bool
---Source : lua/ge/extensions/editor/api/gui.lua:1795
---@param value any
function editor_api_gui_editor.getTempBool_BoolBool(value) end

--- in string; out bool pointer
---  in nil; out string
---Source : lua/ge/extensions/editor/api/gui.lua:1811
---@param value any
function editor_api_gui_editor.getTempBool_StringString(value) end

--- in string; out char pointer
---  in nil; out string
---Source : lua/ge/extensions/editor/api/gui.lua:2071
---@param value any
function editor_api_gui_editor.getTempCharPtr(value) end

--- in string; out float pointer/array
---  in nil; out string
---Source : lua/ge/extensions/editor/api/gui.lua:1912
---@param value any
function editor_api_gui_editor.getTempFloatArray2_StringString(value) end

--- in table; out float pointer/array
---  in nil; out table
---Source : lua/ge/extensions/editor/api/gui.lua:1933
---@param value any
function editor_api_gui_editor.getTempFloatArray2_TableTable(value) end

--- in table; out float pointer/array
---  in nil; out table
---Source : lua/ge/extensions/editor/api/gui.lua:1951
---@param value any
function editor_api_gui_editor.getTempFloatArray3_TableTable(value) end

---Source : lua/ge/extensions/editor/api/gui.lua:1969
---@param value any
function editor_api_gui_editor.getTempFloatArray3_Vec3Vec3(value) end

--- in string; out float pointer/array
---  in nil; out string
---Source : lua/ge/extensions/editor/api/gui.lua:2007
---@param value any
function editor_api_gui_editor.getTempFloatArray4_StringString(value) end

--- in table; out float pointer/array
---  in nil; out table
---Source : lua/ge/extensions/editor/api/gui.lua:1985
---@param value any
function editor_api_gui_editor.getTempFloatArray4_TableTable(value) end

--- in: number, out: float pointer
---  in: nil, out: number
---Source : lua/ge/extensions/editor/api/gui.lua:1884
---@param value any
function editor_api_gui_editor.getTempFloat_NumberNumber(value) end

--- in string; out float pointer
---  in nil; out number
---Source : lua/ge/extensions/editor/api/gui.lua:1895
---@param value any
function editor_api_gui_editor.getTempFloat_StringString(value) end

--- in table; out float ImVec4
---  in nil; out ImVec4
---Source : lua/ge/extensions/editor/api/gui.lua:2093
---@param value any
function editor_api_gui_editor.getTempImVec4_TableImVec4(value) end

--- in table; out float pointer/array
---  in nil; out table
---Source : lua/ge/extensions/editor/api/gui.lua:2049
---@param value any
function editor_api_gui_editor.getTempImVec4_TableTable(value) end

--- in string; out int pointer/array
---  in nil; out string
---Source : lua/ge/extensions/editor/api/gui.lua:1863
---@param value any
function editor_api_gui_editor.getTempIntArray2_StringString(value) end

--- in: number, out: int pointer
---  in: nil, out: number
---Source : lua/ge/extensions/editor/api/gui.lua:1835
---@param value any
function editor_api_gui_editor.getTempInt_NumberNumber(value) end

--- in string; out int pointer
---  in nil; out number
---Source : lua/ge/extensions/editor/api/gui.lua:1846
---@param value any
function editor_api_gui_editor.getTempInt_StringString(value) end

--- in: string/path, out: texture object
---  in: nil, out: texture object
---Source : lua/ge/extensions/editor/api/gui.lua:2082
---@param value any
function editor_api_gui_editor.getTempTextureObj(value) end

--- Return the boolean pointer of imgui which stores the visibility of the window, used in imgui.Begin call.
---  @param windowName the name of the window
---Source : lua/ge/extensions/editor/api/gui.lua:1084
---@param windowName any
function editor_api_gui_editor.getWindowVisibleBoolPtr(windowName) end

--- Hide all registered windows
---Source : lua/ge/extensions/editor/api/gui.lua:1107
function editor_api_gui_editor.hideAllWindows() end

--- Hide the named window, sets the visible boolean to false.
---  @param windowName the name of the window
---Source : lua/ge/extensions/editor/api/gui.lua:1095
---@param windowName any
function editor_api_gui_editor.hideWindow(windowName) end

---Source : lua/ge/extensions/editor/api/gui.lua:442
function editor_api_gui_editor.isViewportFocused() end

--- Returns true if the 3D game viewport is hovered only.
---Source : lua/ge/extensions/editor/api/gui.lua:438
function editor_api_gui_editor.isViewportHovered() end

---Source : lua/ge/extensions/editor/api/gui.lua:1029
---@param windowName any
function editor_api_gui_editor.isWindowRegistered(windowName) end

---Source : lua/ge/extensions/editor/api/gui.lua:1072
---@param windowName any
function editor_api_gui_editor.isWindowVisible(windowName) end

---Source : lua/ge/extensions/editor/api/gui.lua:1312
---@param customFilename any
---@param toolName any
function editor_api_gui_editor.loadWindowsState(customFilename, toolName) end

--- called by the editor, internal
---Source : lua/ge/extensions/editor/api/gui.lua:1415
function editor_api_gui_editor.modalDialogWindowUi() end

---Source : lua/ge/extensions/editor/api/gui.lua:1401
---@param title any
---@param windowSize any
---@param uiFunction any
function editor_api_gui_editor.openModalDialog(title, windowSize, uiFunction) end

---Source : lua/ge/extensions/editor/api/gui.lua:1270
---@param windowName any
function editor_api_gui_editor.openModalWindow(windowName) end

--- Register a given modal window name, usually must be called in onEditorInitialized() of the editor extension.
---  For more usage of the window api, @see [Tutorial - Step #2, Writing base code](../../../../tutorials/world_editor/create_editor_tool/_index.md).
---  @param windowName the name of the window to register
---  @param defaultSize the default first time size of the window, as imgui ImVec2
---  @param defaultPos the default first time size of the window, as imgui ImVec2
---  @param defaultVisibleBoolean if this is not nil, it will be the default first time open state of the window
---  @param centered if the window is centered by default
---  @param toolName what tool this window belongs to, so window state can be applied on a tool basis if needed
---Source : lua/ge/extensions/editor/api/gui.lua:1041
---@param windowName any
---@param defaultSize any
---@param defaultPos any
---@param centered any
---@param toolName any
function editor_api_gui_editor.registerModalWindow(windowName, defaultSize, defaultPos, centered, toolName) end

--- Register a given window name, usually must be called in onEditorInitialized() of the editor extension.
---  For more usage of the window api, @see [Tutorial - Step #2, Writing base code](../../../../tutorials/world_editor/create_editor_tool/_index.md).
---  @param windowName the name of the window to register
---  @param defaultSize the default first time size of the window, as imgui ImVec2
---  @param defaultPos the default first time size of the window, as imgui ImVec2
---  @param defaultVisibleBoolean if this is not nil, it will be the default first time open state of the window
---  @param modal if the window is a modal window
---  @param centered if the window is centered by default
---  @param groupName the group name for the window, used to open or close many windows at once
---  @param toolName what tool this window belongs to, so window state can be applied on a tool basis if needed
---Source : lua/ge/extensions/editor/api/gui.lua:1013
---@param windowName any
---@param defaultSize any
---@param defaultPos any
---@param defaultVisibleBoolean any
---@param modal any
---@param centered any
---@param groupName any
---@param toolName any
function editor_api_gui_editor.registerWindow(windowName, defaultSize, defaultPos, defaultVisibleBoolean, modal, centered, groupName, toolName) end

---Source : lua/ge/extensions/editor/api/gui.lua:1279
---@param customFilename any
---@param toolName any
function editor_api_gui_editor.saveWindowsState(customFilename, toolName) end

---Source : lua/ge/extensions/editor/api/gui.lua:511
---@param pt2i any
function editor_api_gui_editor.screenToClient(pt2i) end

---Source : lua/ge/extensions/editor/api/gui.lua:65
---@param size any
function editor_api_gui_editor.setDefaultIconButtonSize(size) end

---Source : lua/ge/extensions/editor/api/gui.lua:2133
---@param mod any
---@param pressed any
function editor_api_gui_editor.setKeyModifier(mod, pressed) end

---Source : lua/ge/extensions/editor/api/gui.lua:1393
---@param windowName any
---@param groupName any
function editor_api_gui_editor.setWindowGroup(windowName, groupName) end

---Source : lua/ge/extensions/editor/api/gui.lua:1142
---@param groupName any
---@param visible any
function editor_api_gui_editor.setWindowGroupVisibility(groupName, visible) end

---Source : lua/ge/extensions/editor/api/gui.lua:1138
---@param windowName any
---@param visible any
function editor_api_gui_editor.setWindowVisibility(windowName, visible) end

--- Setup the window's default size and position. Must be called before imgui.Begin.
---  @param windowName the name of the window
---Source : lua/ge/extensions/editor/api/gui.lua:1152
---@param windowName any
function editor_api_gui_editor.setupWindow(windowName) end

--- Show the visibility helper tool window.
---Source : lua/ge/extensions/editor/api/gui.lua:257
function editor_api_gui_editor.showVizHelperWindow() end

--- Show the named window, sets the visible boolean to false.
---  @param windowName the name of the window
---Source : lua/ge/extensions/editor/api/gui.lua:1119
---@param windowName any
---@param show any
function editor_api_gui_editor.showWindow(windowName, show) end

--- Returns a table with the loaded texture information
---  @param path the path to a texture image
---Source : lua/ge/extensions/editor/api/gui.lua:40
---@param path any
function editor_api_gui_editor.texObj(path) end

---Source : lua/ge/extensions/editor/api/gui.lua:116
---@param string_label any
---@param ImVec2_size any
---@param bool_sameLine any
---@param id any
---@param offset any
function editor_api_gui_editor.uiButtonRightAlign(string_label, ImVec2_size, bool_sameLine, id, offset) end

---Source : lua/ge/extensions/editor/api/gui.lua:957
---@param desc_id any
---@param col any
---@param flags any
---@param size any
---@param editEnded any
function editor_api_gui_editor.uiColorButton(desc_id, col, flags, size, editEnded) end

--- Widgets: Color Editor/Picker
---Source : lua/ge/extensions/editor/api/gui.lua:902
---@param label any
---@param col any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiColorEdit3(label, col, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:909
---@param label any
---@param col any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiColorEdit4(label, col, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:917
---@param label any
---@param col any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiColorEdit8(label, col, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:943
---@param label any
---@param col any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiColorPicker3(label, col, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:950
---@param label any
---@param col any
---@param flags any
---@param ref_col any
---@param editEnded any
function editor_api_gui_editor.uiColorPicker4(label, col, flags, ref_col, editEnded) end

--- Editing Wrappers
---Source : lua/ge/extensions/editor/api/gui.lua:521
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragFloat(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:528
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragFloat2(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:535
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragFloat3(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:542
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragFloat4(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:549
---@param label any
---@param v_current_min any
---@param v_current_max any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param format_max any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:556
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragInt(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:563
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragInt2(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:570
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragInt3(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:577
---@param label any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragInt4(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:584
---@param label any
---@param v_current_min any
---@param v_current_max any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param format_max any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:591
---@param label any
---@param data_type any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragScalar(label, data_type, v, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:598
---@param label any
---@param data_type any
---@param v any
---@param components any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiDragScalarN(label, data_type, v, components, v_speed, v_min, v_max, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:249
---@param topicName any
---@param relativeUrl any
---@param size any
function editor_api_gui_editor.uiHelpButton(topicName, relativeUrl, size) end

---Source : lua/ge/extensions/editor/api/gui.lua:158
---@param text any
---@param highlightText any
---@param textColor any
function editor_api_gui_editor.uiHighlightedText(text, highlightText, textColor) end

--- Draw an icon image widget.
---Source : lua/ge/extensions/editor/api/gui.lua:130
---@param icon any
---@param size any
---@param col any
---@param borderCol any
---@param label any
function editor_api_gui_editor.uiIconImage(icon, size, col, borderCol, label) end

--- Draw an icon image button widget.
---Source : lua/ge/extensions/editor/api/gui.lua:191
---@param icon any
---@param size any
---@param col any
---@param label any
---@param backgroundCol any
---@param id any
---@param textColor any
---@param textBG any
---@param onRelease any
---@param highlightText any
function editor_api_gui_editor.uiIconImageButton(icon, size, col, label, backgroundCol, id, textColor, textBG, onRelease, highlightText) end

---Source : lua/ge/extensions/editor/api/gui.lua:694
---@param label any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputDouble(label, v, step, step_fast, format, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:757
---@param label any
---@param buf any
---@param width any
---@param dir any
---@param extFilter any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFile(label, buf, width, dir, extFilter, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:628
---@param label any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloat(label, v, step, step_fast, format, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:640
---@param label any
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloat2(label, v, format, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:1639
---@param label any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloat2Ex(label, v, step, step_fast, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:647
---@param label any
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloat3(label, v, format, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:1676
---@param label any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloat3Ex(label, v, step, step_fast, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:654
---@param label any
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloat4(label, v, format, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:1718
---@param label any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloat4Ex(label, v, step, step_fast, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:1610
---@param label any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded any
function editor_api_gui_editor.uiInputFloatEx(label, v, step, step_fast, format, flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:661
---@param label any
---@param v any
---@param step any
---@param step_fast any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputInt(label, v, step, step_fast, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:673
---@param label any
---@param v any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputInt2(label, v, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:680
---@param label any
---@param v any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputInt3(label, v, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:687
---@param label any
---@param v any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputInt4(label, v, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:701
---@param label any
---@param data_type any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputScalar(label, data_type, v, step, step_fast, format, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:708
---@param label any
---@param data_type any
---@param v any
---@param components any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputScalarN(label, data_type, v, components, step, step_fast, format, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:715
---@param label any
---@param text any
---@param width any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputSearch(label, text, width, extra_flags, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:747
---@param label any
---@param txtfilter any
---@param width any
---@param extra_flags any
---@param editEnded any
function editor_api_gui_editor.uiInputSearchTextFilter(label, txtfilter, width, extra_flags, editEnded) end

--- Widgets: Input with Keyboard
---Source : lua/ge/extensions/editor/api/gui.lua:607
---@param label any
---@param buf any
---@param buf_size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded any
function editor_api_gui_editor.uiInputText(label, buf, buf_size, flags, callback, user_data, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:614
---@param label any
---@param buf any
---@param buf_size any
---@param size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded any
function editor_api_gui_editor.uiInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:621
---@param label any
---@param buf any
---@param size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded any
function editor_api_gui_editor.uiInputTextMultilineReadOnly(label, buf, size, flags, callback, user_data, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:965
---@param string_label any
---@param float_values any
---@param int_values_count any
---@param int_values_offset any
---@param string_overlay_text any
---@param float_scale_min any
---@param float_scale_max any
---@param ImVec2_graph_size any
---@param int_stride any
---@param auto_resize any
function editor_api_gui_editor.uiPlotLines1(string_label, float_values, int_values_count, int_values_offset, string_overlay_text, float_scale_min, float_scale_max, ImVec2_graph_size, int_stride, auto_resize) end

--- Render alternate-color rows current window/child
---  Based on approach in https://github.com/ocornut/imgui/issues/2668
---  IMPORTANT: Requires to be surrounded by Begin/BeginChild, End/EndChild
---Source : lua/ge/extensions/editor/api/gui.lua:2148
---@param lineHeight any
---@param mOddColor any
---@param mEvenColor any
function editor_api_gui_editor.uiRenderAlternateRows(lineHeight, mOddColor, mEvenColor) end

---Source : lua/ge/extensions/editor/api/gui.lua:830
---@param label any
---@param v_rad any
---@param v_degrees_min any
---@param v_degrees_max any
---@param editEnded any
function editor_api_gui_editor.uiSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, editEnded) end

--- Widgets: Sliders
---Source : lua/ge/extensions/editor/api/gui.lua:802
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiSliderFloat(label, v, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:809
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiSliderFloat2(label, v, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:816
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiSliderFloat3(label, v, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:823
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiSliderFloat4(label, v, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:837
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded any
function editor_api_gui_editor.uiSliderInt(label, v, v_min, v_max, format, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:844
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded any
function editor_api_gui_editor.uiSliderInt2(label, v, v_min, v_max, format, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:851
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded any
function editor_api_gui_editor.uiSliderInt3(label, v, v_min, v_max, format, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:858
---@param label any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded any
function editor_api_gui_editor.uiSliderInt4(label, v, v_min, v_max, format, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:865
---@param label any
---@param data_type any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiSliderScalar(label, data_type, v, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:872
---@param label any
---@param data_type any
---@param v any
---@param components any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiSliderScalarN(label, data_type, v, components, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:106
---@param color any
---@param text any
---@param fontName any
function editor_api_gui_editor.uiTextColoredWithFont(color, text, fontName) end

---Source : lua/ge/extensions/editor/api/gui.lua:97
---@param string_label any
---@param bool_sameLine any
---@param offset any
function editor_api_gui_editor.uiTextUnformattedRightAlign(string_label, bool_sameLine, offset) end

---Source : lua/ge/extensions/editor/api/gui.lua:879
---@param label any
---@param size any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiVSliderFloat(label, size, v, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:886
---@param label any
---@param size any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded any
function editor_api_gui_editor.uiVSliderInt(label, size, v, v_min, v_max, format, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:893
---@param label any
---@param size any
---@param data_type any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded any
function editor_api_gui_editor.uiVSliderScalar(label, size, data_type, v, v_min, v_max, format, power, editEnded) end

---Source : lua/ge/extensions/editor/api/gui.lua:263
---@param float_height any
---@param vec2_offset any
---@param width any
function editor_api_gui_editor.uiVertSeparator(float_height, vec2_offset, width) end

--- Unregister a given window name. For example when a tool window was closed, you dont want it in the saved state of the editor anymore.
---  Call this function right after the imgui.Begin call, if the editor.isWindowVisible(yourWindowName) is false.
---  If you just want to hide the window, the call editor.hideWindow(yourWindowName) only.
---  For more usage of the window api, see [Tutorial - Step #2, Writing base code](../../../../tutorials/world_editor/create_editor_tool/_index.md).
---  @param windowName the name of the window to unregister
---Source : lua/ge/extensions/editor/api/gui.lua:1068
---@param windowName any
function editor_api_gui_editor.unregisterWindow(windowName) end

