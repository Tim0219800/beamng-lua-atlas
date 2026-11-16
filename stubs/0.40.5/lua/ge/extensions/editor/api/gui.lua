---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/gui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the level editor's ImGui interface: management of tool windows (registration, show/hide, groups, modals, saving/loading the layout state), the presentation loop (`presentGui`: main dockspace then onEditorGui* hooks), the icon atlas (`editor.icons`) and a large number of `editor.ui*` wrappers around ImGui widgets (drag, input, slider, color) that additionally fill an `editEnded` BoolPtr when editing ends. An editor tool modder uses it to declare their windows (`editor.registerWindow`, `editor.beginWindow`/`endWindow`) and draw their widgets. `initialize` installs everything on the `editor` object.
--- Access: extension `editor_api_gui`: `extensions.load("editor_api_gui")`, then the global `editor_api_gui`
---@class editor_api_gui
editor_api_gui = {}

--- Remembers the editor, initializes the state and installs all the functions below on `editor`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gui.lua:2206
---@param editorInstance table `editor` object
function editor_api_gui.initialize(editorInstance) end

--- Presents the whole editor interface: resyncs editor.keyModifiers from ImGui, creates the main dockspace, then emits onEditorGuiMainMenu, onEditorGuiToolBar, onEditorGui(dtReal, dtSim, dtRaw), onEditorGuiStatusBar and checks for resizing. Called every frame by the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gui.lua:466
---@param dtReal number real time delta (s)
---@param dtSim number simulation time delta (s)
---@param dtRaw number raw time delta (s)
function editor_api_gui.presentGui(dtReal, dtSim, dtRaw) end

--- Functions added to `editor` by initialize.
---@class editor_api_gui_editor
local editor_api_gui_editor = {}

--- True if the last item is hovered and the button was just clicked.
---Source: lua/ge/extensions/editor/api/gui.lua:985
---@param int_mouse_button integer|nil button (0 by default)
---@return boolean  result
function editor_api_gui_editor.IsItemClicked(int_mouse_button) end

--- True if the last item is hovered and double-clicked.
---Source: lua/ge/extensions/editor/api/gui.lua:980
---@param int_mouse_button integer|nil button (0 by default)
---@return boolean  result
function editor_api_gui_editor.IsItemDoubleClicked(int_mouse_button) end

--- Like beginWindow for a modal window: opens the popup if the window is marked visible.
---Source: lua/ge/extensions/editor/api/gui.lua:1243
---@param windowName string registered name
---@param title string title
---@param flags integer|nil flags
---@param noClose boolean|nil no cross
---@return boolean  true if the content must be drawn
function editor_api_gui_editor.beginModalWindow(windowName, title, flags, noClose) end

--- Equivalent of imgui.Begin for a registered window (title##name). Returns false if not registered (warning) or invisible. Always to be paired with editor.endWindow().
---Source: lua/ge/extensions/editor/api/gui.lua:1195
---@param windowName string registered name
---@param title string displayed title
---@param flags integer|nil ImGui window flags
---@param noClose boolean|nil true = no close button
---@return boolean  true if the content must be drawn
function editor_api_gui_editor.beginWindow(windowName, title, flags, noClose) end

--- Emits onEditorToolWindowShow for each visible window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gui.lua:1376
function editor_api_gui_editor.callShowWindowHookForVisibleWindows() end

--- Detects the gain/loss of focus of the current ImGui window and emits onEditorToolWindowGotFocus / onEditorToolWindowLostFocus.
---Source: lua/ge/extensions/editor/api/gui.lua:1178
---@param windowName string name
function editor_api_gui_editor.checkWindowFocus(windowName) end

--- Detects a change in the main window size and emits the onWindowResized(ImVec2 DisplaySize) hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gui.lua:426
function editor_api_gui_editor.checkWindowResize() end

--- Closes the generic modal dialog and unregisters its window.
---Source: lua/ge/extensions/editor/api/gui.lua:1408
function editor_api_gui_editor.closeModalDialog() end

--- Hides the modal window and closes the current ImGui popup.
---Source: lua/ge/extensions/editor/api/gui.lua:1274
---@param windowName string name
function editor_api_gui_editor.closeModalWindow(windowName) end

--- Loads the editor icon atlas (JSON + image) and fills editor.icons, editor.atlasWidth, editor.atlasHeight. Logs duplicate icons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gui.lua:70
function editor_api_gui_editor.createIconAtlas() end

--- Removes focus from the windows marked as focused (emits onEditorToolWindowLostFocus).
---Source: lua/ge/extensions/editor/api/gui.lua:1384
function editor_api_gui_editor.defocusFocusedWindow() end

--- Draws a brush ('ellipse' type or box) on the ground around pos, stuck to the terrain (terrainBlock) or to static geometry by raycast.
---Source: lua/ge/extensions/editor/api/gui.lua:299
---@param brushType string 'ellipse' or other (box)
---@param pos vec3 center (nothing is done if nil)
---@param radius number radius (nothing if nil)
---@param numberOfSegments integer|nil segments (128)
---@param color ColorF|nil color (white)
---@param terrainBlock userdata|nil TerrainBlock for the height
---@param brushRatio number|nil aspect ratio (1)
---@param brushRotation number|nil rotation in degrees (0)
---@param onlyTerrain boolean|nil follow only the terrain
function editor_api_gui_editor.drawBrush(brushType, pos, radius, numberOfSegments, color, terrainBlock, brushRatio, brushRotation, onlyTerrain) end

--- Closes a modal window (imgui.EndPopup if it was displayed).
---Source: lua/ge/extensions/editor/api/gui.lua:1262
function editor_api_gui_editor.endModalWindow() end

--- Closes the window opened by beginWindow (calls imgui.End if Begin was called). To be called even if beginWindow returned false.
---Source: lua/ge/extensions/editor/api/gui.lua:1252
function editor_api_gui_editor.endWindow() end

--- Returns the default size of icon buttons.
---Source: lua/ge/extensions/editor/api/gui.lua:61
---@return ImVec2  size
function editor_api_gui_editor.getDefaultIconButtonSize() end

--- Lists the available ImGui fonts.
---Source: lua/ge/extensions/editor/api/gui.lua:991
---@return table[]  list of {name}
function editor_api_gui_editor.getFontList() end

--- Returns the X coordinate of the right edge of the 3D view at the given screen height, taking right-docked windows into account.
---Source: lua/ge/extensions/editor/api/gui.lua:446
---@param screenY number screen y coordinate
---@return number  x coordinate of the right edge
function editor_api_gui_editor.getSceneViewportRightEdge(screenY) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: bool -> bool pointer; nil -> bool read.
---Source: lua/ge/extensions/editor/api/gui.lua:1795
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempBool_BoolBool(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string/bool -> bool pointer ("1" = true); nil -> "1" or "0".
---Source: lua/ge/extensions/editor/api/gui.lua:1811
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempBool_StringString(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> char pointer; nil -> string.
---Source: lua/ge/extensions/editor/api/gui.lua:2071
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempCharPtr(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> float[2] pointer/array; nil -> string.
---Source: lua/ge/extensions/editor/api/gui.lua:1912
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloatArray2_StringString(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float[2] pointer/array; nil -> table.
---Source: lua/ge/extensions/editor/api/gui.lua:1933
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloatArray2_TableTable(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float[3] pointer/array; nil -> table.
---Source: lua/ge/extensions/editor/api/gui.lua:1951
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloatArray3_TableTable(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: vec3 -> float[3] pointer/array; nil -> vec3.
---Source: lua/ge/extensions/editor/api/gui.lua:1969
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloatArray3_Vec3Vec3(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> float[4] pointer/array; nil -> string.
---Source: lua/ge/extensions/editor/api/gui.lua:2007
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloatArray4_StringString(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float[4] pointer/array; nil -> table.
---Source: lua/ge/extensions/editor/api/gui.lua:1985
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloatArray4_TableTable(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: number -> float pointer; nil -> number.
---Source: lua/ge/extensions/editor/api/gui.lua:1884
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloat_NumberNumber(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> float pointer; nil -> number.
---Source: lua/ge/extensions/editor/api/gui.lua:1895
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempFloat_StringString(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> ImVec4; nil -> ImVec4.
---Source: lua/ge/extensions/editor/api/gui.lua:2093
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempImVec4_TableImVec4(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: table -> float pointer/array (ImVec4); nil -> table.
---Source: lua/ge/extensions/editor/api/gui.lua:2049
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempImVec4_TableTable(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> int[2] pointer/array; nil -> string.
---Source: lua/ge/extensions/editor/api/gui.lua:1863
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempIntArray2_StringString(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: number -> int pointer; nil -> number.
---Source: lua/ge/extensions/editor/api/gui.lua:1835
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempInt_NumberNumber(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string -> int pointer; nil -> number.
---Source: lua/ge/extensions/editor/api/gui.lua:1846
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempInt_StringString(value) end

--- Helper for ImGui widgets: converts a Lua value into a reused temporary ImGui pointer (a single shared buffer per type, valid for the duration of one widget call). Conversion: string path -> texture object; nil -> current texture object.
---Source: lua/ge/extensions/editor/api/gui.lua:2082
---@param value any value to convert, or nil to reread the buffer's value
function editor_api_gui_editor.getTempTextureObj(value) end

--- Returns the window's visibility imgui.BoolPtr (used by imgui.Begin), or nil.
---Source: lua/ge/extensions/editor/api/gui.lua:1084
---@param windowName string name
---@return imgui.BoolPtr|nil  pointer
function editor_api_gui_editor.getWindowVisibleBoolPtr(windowName) end

--- Hides all visible registered windows (emits the hooks).
---Source: lua/ge/extensions/editor/api/gui.lua:1107
function editor_api_gui_editor.hideAllWindows() end

--- Hides the window and emits onEditorToolWindowLostFocus then onEditorToolWindowHide.
---Source: lua/ge/extensions/editor/api/gui.lua:1095
---@param windowName string name
function editor_api_gui_editor.hideWindow(windowName) end

--- True if no ImGui item is active.
---Source: lua/ge/extensions/editor/api/gui.lua:442
---@return boolean  result
function editor_api_gui_editor.isViewportFocused() end

--- True if the mouse is over the game's 3D view only (no ImGui item or window hovered).
---Source: lua/ge/extensions/editor/api/gui.lua:438
---@return boolean  result
function editor_api_gui_editor.isViewportHovered() end

--- True if the window is registered.
---Source: lua/ge/extensions/editor/api/gui.lua:1029
---@param windowName string name
---@return boolean  result
function editor_api_gui_editor.isWindowRegistered(windowName) end

--- True if the window is registered and visible; also triggers the Show/Hide hooks if the visibility changed (e.g. closed with the cross).
---Source: lua/ge/extensions/editor/api/gui.lua:1072
---@param windowName string name
---@return boolean  visible
function editor_api_gui_editor.isWindowVisible(windowName) end

--- Reloads the windows state (falls back to settings/<tool>/layouts/Default/windowsState.json if the file is missing or has a different version), first hides all windows, then emits onEditorLoadWindowsState and onEditorLoadGuiInstancerState.
---Source: lua/ge/extensions/editor/api/gui.lua:1312
---@param customFilename string|nil file
---@param toolName string|nil tool to load only
function editor_api_gui_editor.loadWindowsState(customFilename, toolName) end

--- Draws the generic modal dialog; called by the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gui.lua:1415
function editor_api_gui_editor.modalDialogWindowUi() end

--- Opens a generic modal dialog (editorModalDialog window) whose content is drawn by uiFunction.
---Source: lua/ge/extensions/editor/api/gui.lua:1401
---@param title string title
---@param windowSize ImVec2 size
---@param uiFunction function function() called every frame to draw the content
function editor_api_gui_editor.openModalDialog(title, windowSize, uiFunction) end

--- Opens the modal window (showWindow).
---Source: lua/ge/extensions/editor/api/gui.lua:1270
---@param windowName string name
function editor_api_gui_editor.openModalWindow(windowName) end

--- Registers a modal window (shortcut for registerWindow with modal = true).
---Source: lua/ge/extensions/editor/api/gui.lua:1041
---@param windowName string name
---@param defaultSize ImVec2|nil size
---@param defaultPos ImVec2|nil position
---@param centered boolean|nil centered
---@param toolName string|nil tool
function editor_api_gui_editor.registerModalWindow(windowName, defaultSize, defaultPos, centered, toolName) end

--- Registers a tool window (to be called in onEditorInitialized). Keeps the previous visibility if it already exists.
---Source: lua/ge/extensions/editor/api/gui.lua:1013
---@param windowName string unique name
---@param defaultSize ImVec2|nil initial size
---@param defaultPos ImVec2|nil initial position
---@param defaultVisibleBoolean boolean|nil initial visibility
---@param modal boolean|nil modal window
---@param centered boolean|nil centered
---@param groupName string|nil group (open/close as a block)
---@param toolName string|nil owning tool
function editor_api_gui_editor.registerWindow(windowName, defaultSize, defaultPos, defaultVisibleBoolean, modal, centered, groupName, toolName) end

--- Saves the windows state (visibility, size, position, GUI instances) as JSON; modals are saved as invisible. Emits onEditorSaveGuiInstancerState and onEditorSaveWindowsState.
---Source: lua/ge/extensions/editor/api/gui.lua:1279
---@param customFilename string|nil file (default: the editor state file)
---@param toolName string|nil only save the windows of this tool
function editor_api_gui_editor.saveWindowsState(customFilename, toolName) end

--- Converts a screen point to a client point via the Canvas (identity if ImGui viewports are disabled).
---Source: lua/ge/extensions/editor/api/gui.lua:511
---@param pt2i Point2I screen point
---@return Point2I  client point
function editor_api_gui_editor.screenToClient(pt2i) end

--- Sets the default (square) size of icon buttons.
---Source: lua/ge/extensions/editor/api/gui.lua:65
---@param size number side in pixels
function editor_api_gui_editor.setDefaultIconButtonSize(size) end

--- Records the state of a modifier key in editor.keyModifiers (called by the editor's action map). Note: presentGui resyncs ctrl/shift/alt every frame from ImGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gui.lua:2133
---@param mod string modifier (e.g. ctrl, shift, alt)
---@param pressed boolean pressed or not
function editor_api_gui_editor.setKeyModifier(mod, pressed) end

--- Changes the group of a registered window.
---Source: lua/ge/extensions/editor/api/gui.lua:1393
---@param windowName string name
---@param groupName string group
function editor_api_gui_editor.setWindowGroup(windowName, groupName) end

--- Shows or hides all the windows of a group.
---Source: lua/ge/extensions/editor/api/gui.lua:1142
---@param groupName string group
---@param visible boolean visibility
function editor_api_gui_editor.setWindowGroupVisibility(groupName, visible) end

--- Alias of showWindow(windowName, visible).
---Source: lua/ge/extensions/editor/api/gui.lua:1138
---@param windowName string name
---@param visible boolean visibility
function editor_api_gui_editor.setWindowVisibility(windowName, visible) end

--- Applies default size and position (Cond_FirstUseEver, or centering); to be called before imgui.Begin. Can force expansion according to the ui.general.forceExpandWindowOnFirstShow preference.
---Source: lua/ge/extensions/editor/api/gui.lua:1152
---@param windowName string name
function editor_api_gui_editor.setupWindow(windowName) end

--- Opens the visibility help window (editor_vizHelper) if the extension is loaded.
---Source: lua/ge/extensions/editor/api/gui.lua:257
function editor_api_gui_editor.showVizHelperWindow() end

--- Shows (or hides if show == false) the window and emits onEditorToolWindowShow / onEditorToolWindowHide.
---Source: lua/ge/extensions/editor/api/gui.lua:1119
---@param windowName string name
---@param show boolean|nil false to hide; nil = show
function editor_api_gui_editor.showWindow(windowName, show) end

--- Loads a texture and returns its information; nil if loading fails.
---Source: lua/ge/extensions/editor/api/gui.lua:40
---@param path string image path
---@return table|nil  {file, path, tex, texId (legacy, do not use), size, format}
function editor_api_gui_editor.texObj(path) end

--- Right-aligned button in the available area.
---Source: lua/ge/extensions/editor/api/gui.lua:116
---@param string_label string label
---@param ImVec2_size ImVec2|nil size
---@param bool_sameLine boolean|nil same line
---@param id string|nil ImGui id suffix
---@param offset number|nil offset
---@return boolean|nil  true if clicked
function editor_api_gui_editor.uiButtonRightAlign(string_label, ImVec2_size, bool_sameLine, id, offset) end

--- Wrapper of imgui.ColorButton (color) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:957
---@param desc_id any
---@param col any
---@param flags any
---@param size any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified / clicked
function editor_api_gui_editor.uiColorButton(desc_id, col, flags, size, editEnded) end

--- Wrapper of imgui.ColorEdit3 (color) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:902
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified / clicked
function editor_api_gui_editor.uiColorEdit3(label, col, flags, editEnded) end

--- Wrapper of imgui.ColorEdit4 (color) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:909
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified / clicked
function editor_api_gui_editor.uiColorEdit4(label, col, flags, editEnded) end

--- Wrapper of imgui.ColorEdit8 (color) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:917
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified / clicked
function editor_api_gui_editor.uiColorEdit8(label, col, flags, editEnded) end

--- Wrapper of imgui.ColorPicker3 (color) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:943
---@param label any
---@param col any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified / clicked
function editor_api_gui_editor.uiColorPicker3(label, col, flags, editEnded) end

--- Wrapper of imgui.ColorPicker4 (color) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:950
---@param label any
---@param col any
---@param flags any
---@param ref_col any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified / clicked
function editor_api_gui_editor.uiColorPicker4(label, col, flags, ref_col, editEnded) end

--- Wrapper of imgui.DragFloat (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:521
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragFloat(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragFloat2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:528
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragFloat2(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragFloat3 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:535
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragFloat3(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragFloat4 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:542
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragFloat4(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragFloatRange2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:549
---@param label string widget label / ImGui id
---@param v_current_min any
---@param v_current_max any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param format_max any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded) end

--- Wrapper of imgui.DragInt (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:556
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragInt(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragInt2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:563
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragInt2(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragInt3 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:570
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragInt3(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragInt4 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:577
---@param label string widget label / ImGui id
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragInt4(label, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragIntRange2 (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:584
---@param label string widget label / ImGui id
---@param v_current_min any
---@param v_current_max any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param format_max any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags, editEnded) end

--- Wrapper of imgui.DragScalar (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:591
---@param label string widget label / ImGui id
---@param data_type any
---@param v any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragScalar(label, data_type, v, v_speed, v_min, v_max, format, flags, editEnded) end

--- Wrapper of imgui.DragScalarN (drag to modify) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:598
---@param label string widget label / ImGui id
---@param data_type any
---@param v any
---@param components any
---@param v_speed any
---@param v_min any
---@param v_max any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiDragScalarN(label, data_type, v, components, v_speed, v_min, v_max, format, flags, editEnded) end

--- Help button: opens https://documentation.beamng.com/<relativeUrl> in the browser (index by default).
---Source: lua/ge/extensions/editor/api/gui.lua:249
---@param topicName string topic (button id and tooltip)
---@param relativeUrl string|nil relative path
---@param size ImVec2|nil size
function editor_api_gui_editor.uiHelpButton(topicName, relativeUrl, size) end

--- Displays text, highlighting in yellow several occurrences (case-insensitive, about ten at most) of highlightText.
---Source: lua/ge/extensions/editor/api/gui.lua:158
---@param text string text
---@param highlightText string|nil substring
---@param textColor ImVec4|nil color
function editor_api_gui_editor.uiHighlightedText(text, highlightText, textColor) end

--- Draws an icon from the editor atlas (32x32 size by default, multiplied by imgui.uiscale).
---Source: lua/ge/extensions/editor/api/gui.lua:130
---@param icon table entry of editor.icons
---@param size ImVec2|nil size
---@param col ImVec4|nil tint
---@param borderCol ImVec4|nil border
---@param label string|nil text on the right
---@return boolean|nil  true if the image returned a click
function editor_api_gui_editor.uiIconImage(icon, size, col, borderCol, label) end

--- Icon button (with or without a label). Without a provided id, an automatic per-frame id is generated. onRelease = click detected on release.
---Source: lua/ge/extensions/editor/api/gui.lua:191
---@param icon table entry of editor.icons
---@param size ImVec2|nil size (default editor.getDefaultIconButtonSize)
---@param col ImVec4|nil tint
---@param label string|nil text
---@param backgroundCol ImVec4|nil background
---@param id string|nil ImGui id
---@param textColor ImVec4|nil text color
---@param textBG ImU32|nil text background
---@param onRelease boolean|nil click on release
---@param highlightText string|nil substring to highlight
---@return boolean  true if clicked
function editor_api_gui_editor.uiIconImageButton(icon, size, col, label, backgroundCol, id, textColor, textBG, onRelease, highlightText) end

--- Wrapper of imgui.InputDouble (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:694
---@param label string widget label / ImGui id
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputDouble(label, v, step, step_fast, format, extra_flags, editEnded) end

--- File path field with a '...' button opening editor_fileDialog.openFile; writes the chosen path into buf.
---Source: lua/ge/extensions/editor/api/gui.lua:757
---@param label string label (also the dialog context key)
---@param buf cdata ArrayChar buffer of the path
---@param width number|nil field width
---@param dir string|nil initial folder (default: folder of the current path)
---@param extFilter table|string|nil dialog extension filter
---@param flags integer|nil InputText flags
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if the text or file changed
function editor_api_gui_editor.uiInputFile(label, buf, width, dir, extFilter, flags, editEnded) end

--- Wrapper of imgui.InputFloat (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:628
---@param label string widget label / ImGui id
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloat(label, v, step, step_fast, format, extra_flags, editEnded) end

--- Wrapper of imgui.InputFloat2 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:640
---@param label string widget label / ImGui id
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloat2(label, v, format, extra_flags, editEnded) end

--- Variant of uiInputFloat2 with step/step_fast handled by the editor; fills editEnded.
---Source: lua/ge/extensions/editor/api/gui.lua:1639
---@param label string widget label / ImGui id
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloat2Ex(label, v, step, step_fast, format, flags, editEnded) end

--- Wrapper of imgui.InputFloat3 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:647
---@param label string widget label / ImGui id
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloat3(label, v, format, extra_flags, editEnded) end

--- Variant of uiInputFloat3 with step/step_fast handled by the editor; fills editEnded.
---Source: lua/ge/extensions/editor/api/gui.lua:1676
---@param label string widget label / ImGui id
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloat3Ex(label, v, step, step_fast, format, flags, editEnded) end

--- Wrapper of imgui.InputFloat4 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:654
---@param label string widget label / ImGui id
---@param v any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloat4(label, v, format, extra_flags, editEnded) end

--- Variant of uiInputFloat4 with step/step_fast handled by the editor; fills editEnded.
---Source: lua/ge/extensions/editor/api/gui.lua:1718
---@param label string widget label / ImGui id
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloat4Ex(label, v, step, step_fast, format, flags, editEnded) end

--- Variant of uiInputFloat with step/step_fast handled by the editor; fills editEnded.
---Source: lua/ge/extensions/editor/api/gui.lua:1610
---@param label string widget label / ImGui id
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputFloatEx(label, v, step, step_fast, format, flags, editEnded) end

--- Wrapper of imgui.InputInt (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:661
---@param label string widget label / ImGui id
---@param v any
---@param step any
---@param step_fast any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputInt(label, v, step, step_fast, extra_flags, editEnded) end

--- Wrapper of imgui.InputInt2 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:673
---@param label string widget label / ImGui id
---@param v any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputInt2(label, v, extra_flags, editEnded) end

--- Wrapper of imgui.InputInt3 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:680
---@param label string widget label / ImGui id
---@param v any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputInt3(label, v, extra_flags, editEnded) end

--- Wrapper of imgui.InputInt4 (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:687
---@param label string widget label / ImGui id
---@param v any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputInt4(label, v, extra_flags, editEnded) end

--- Wrapper of imgui.InputScalar (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:701
---@param label string widget label / ImGui id
---@param data_type any
---@param v any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputScalar(label, data_type, v, step, step_fast, format, extra_flags, editEnded) end

--- Wrapper of imgui.InputScalarN (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:708
---@param label string widget label / ImGui id
---@param data_type any
---@param v any
---@param components any
---@param step any
---@param step_fast any
---@param format any
---@param extra_flags any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputScalarN(label, data_type, v, components, step, step_fast, format, extra_flags, editEnded) end

--- Search field (magnifier icon + text + clear button) of fixed width. Returns true if the text changed or was cleared.
---Source: lua/ge/extensions/editor/api/gui.lua:715
---@param label string|nil tooltip
---@param text cdata ImGui ArrayChar buffer
---@param width number width in pixels
---@param extra_flags integer|nil InputText flags
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputSearch(label, text, width, extra_flags, editEnded) end

--- Like uiInputSearch but edits an ImGuiTextFilter and rebuilds it (ImGuiTextFilter_Build) on each change.
---Source: lua/ge/extensions/editor/api/gui.lua:747
---@param label string|nil tooltip
---@param txtfilter cdata ImGuiTextFilter
---@param width number width
---@param extra_flags integer|nil flags
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputSearchTextFilter(label, txtfilter, width, extra_flags, editEnded) end

--- Wrapper of imgui.InputText (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:607
---@param label string widget label / ImGui id
---@param buf any
---@param buf_size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputText(label, buf, buf_size, flags, callback, user_data, editEnded) end

--- Wrapper of imgui.InputTextMultiline (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:614
---@param label string widget label / ImGui id
---@param buf any
---@param buf_size any
---@param size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data, editEnded) end

--- Wrapper of imgui.InputTextMultilineReadOnly (keyboard input) that additionally fills editEnded. Same parameters as ImGui; returns true if the value changed.
---Source: lua/ge/extensions/editor/api/gui.lua:621
---@param label string widget label / ImGui id
---@param buf any
---@param size any
---@param flags any
---@param callback any
---@param user_data any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiInputTextMultilineReadOnly(label, buf, size, flags, callback, user_data, editEnded) end

--- Wrapper of imgui.PlotLines1: float curve; default values offset 0, scale FLT_MAX, stride sizeof(float); auto_resize fits the size to the window.
---Source: lua/ge/extensions/editor/api/gui.lua:965
---@param string_label string label
---@param float_values cdata array of floats
---@param int_values_count integer number of values
---@param int_values_offset any
---@param string_overlay_text any
---@param float_scale_min any
---@param float_scale_max any
---@param ImVec2_graph_size any
---@param int_stride any
---@param auto_resize boolean|nil fill the window if graph_size is nil
function editor_api_gui_editor.uiPlotLines1(string_label, float_values, int_values_count, int_values_offset, string_overlay_text, float_scale_min, float_scale_max, ImVec2_graph_size, int_stride, auto_resize) end

--- Draws alternating-color background rows in the current window/child (technique from ocornut/imgui#2668). Must be wrapped in Begin/BeginChild ... End/EndChild.
---Source: lua/ge/extensions/editor/api/gui.lua:2148
---@param lineHeight number row height
---@param mOddColor ImVec4|nil color of odd rows
---@param mEvenColor ImVec4|nil color of even rows
function editor_api_gui_editor.uiRenderAlternateRows(lineHeight, mOddColor, mEvenColor) end

--- Wrapper of imgui.SliderAngle (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:830
---@param label string widget label / ImGui id
---@param v_rad any
---@param v_degrees_min any
---@param v_degrees_max any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, editEnded) end

--- Wrapper of imgui.SliderFloat (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:802
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderFloat(label, v, v_min, v_max, format, power, editEnded) end

--- Wrapper of imgui.SliderFloat2 (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:809
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderFloat2(label, v, v_min, v_max, format, power, editEnded) end

--- Wrapper of imgui.SliderFloat3 (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:816
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderFloat3(label, v, v_min, v_max, format, power, editEnded) end

--- Wrapper of imgui.SliderFloat4 (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:823
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderFloat4(label, v, v_min, v_max, format, power, editEnded) end

--- Wrapper of imgui.SliderInt (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:837
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderInt(label, v, v_min, v_max, format, editEnded) end

--- Wrapper of imgui.SliderInt2 (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:844
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderInt2(label, v, v_min, v_max, format, editEnded) end

--- Wrapper of imgui.SliderInt3 (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:851
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderInt3(label, v, v_min, v_max, format, editEnded) end

--- Wrapper of imgui.SliderInt4 (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:858
---@param label string widget label / ImGui id
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderInt4(label, v, v_min, v_max, format, editEnded) end

--- Wrapper of imgui.SliderScalar (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:865
---@param label string widget label / ImGui id
---@param data_type any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderScalar(label, data_type, v, v_min, v_max, format, power, editEnded) end

--- Wrapper of imgui.SliderScalarN (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:872
---@param label string widget label / ImGui id
---@param data_type any
---@param v any
---@param components any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiSliderScalarN(label, data_type, v, components, v_min, v_max, format, power, editEnded) end

--- Displays text (colored if color is not nil) with a named ImGui font.
---Source: lua/ge/extensions/editor/api/gui.lua:106
---@param color ImVec4|nil color
---@param text string text
---@param fontName string font name (see getFontList)
function editor_api_gui_editor.uiTextColoredWithFont(color, text, fontName) end

--- Displays text right-aligned in the available area.
---Source: lua/ge/extensions/editor/api/gui.lua:97
---@param string_label string text
---@param bool_sameLine boolean|nil true = on the same line
---@param offset number|nil offset in pixels
function editor_api_gui_editor.uiTextUnformattedRightAlign(string_label, bool_sameLine, offset) end

--- Wrapper of imgui.VSliderFloat (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:879
---@param label string widget label / ImGui id
---@param size any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiVSliderFloat(label, size, v, v_min, v_max, format, power, editEnded) end

--- Wrapper of imgui.VSliderInt (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:886
---@param label string widget label / ImGui id
---@param size any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiVSliderInt(label, size, v, v_min, v_max, format, editEnded) end

--- Wrapper of imgui.VSliderScalar (slider) that additionally fills editEnded. Same parameters as ImGui.
---Source: lua/ge/extensions/editor/api/gui.lua:893
---@param label string widget label / ImGui id
---@param size any
---@param data_type any
---@param v any
---@param v_min any
---@param v_max any
---@param format any
---@param power any
---@param editEnded imgui.BoolPtr|nil if provided, receives true when editing has just ended (IsItemDeactivatedAfterEdit)
---@return boolean  true if modified this frame
function editor_api_gui_editor.uiVSliderScalar(label, size, data_type, v, v_min, v_max, format, power, editEnded) end

--- Draws a vertical separator on the current line.
---Source: lua/ge/extensions/editor/api/gui.lua:263
---@param float_height number|nil height (font size by default)
---@param vec2_offset ImVec2|nil offset
---@param width number|nil thickness (1)
function editor_api_gui_editor.uiVertSeparator(float_height, vec2_offset, width) end

--- Unregisters a window so that it is no longer in the saved state. To be called right after imgui.Begin if the window is no longer visible; to simply hide it, use hideWindow.
---Source: lua/ge/extensions/editor/api/gui.lua:1068
---@param windowName string name
function editor_api_gui_editor.unregisterWindow(windowName) end

