---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/layoutManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Management of the editor's window layouts. Each layout is a folder settings/<tool>/layouts/<name>/ containing windowsState.json; the current layout is settings/<tool>/windowsState.json. The ImGui positions are read/written in settings/imgui.ini (or settings/default_imgui.ini for the Default layout). The tool is "editor" by default.
--- Access: extension `editor_layoutManager`: `extensions.load("editor_layoutManager")`, then the global `editor_layoutManager`
---@class editor_layoutManager
editor_layoutManager = {}

--- Deletes all files of a layout folder then the folder itself.
---Source: lua/ge/extensions/editor/layoutManager.lua:55
---@param layoutPath string Path of the layout folder to delete.
function editor_layoutManager.deleteWindowLayout(layoutPath) end

--- Lists the layout folders of settings/<tool>/layouts/.
---Source: lua/ge/extensions/editor/layoutManager.lua:14
---@param toolName string|nil Tool name; "editor" if nil.
---@return table<integer, string>  Paths of the layout folders (FS:directoryList).
function editor_layoutManager.getWindowLayouts(toolName) end

--- Loads the current windows state (settings/<tool>/windowsState.json). If editor.needsDefaultImguiIniLoad is true, loads default_imgui.ini once, otherwise imgui.ini.
---Source: lua/ge/extensions/editor/layoutManager.lua:37
---@param toolName string|nil Tool name; "editor" if nil.
function editor_layoutManager.loadCurrentWindowLayout(toolName) end

--- Loads the windowsState.json of a layout and reloads imgui.ini: default_imgui.ini if the layout is Default, otherwise imgui.ini.
---Source: lua/ge/extensions/editor/layoutManager.lua:18
---@param layout string|nil Layout folder; settings/editor/layouts/Default if nil.
---@param toolName string|nil Tool name passed to editor.loadWindowsState.
function editor_layoutManager.loadWindowLayout(layout, toolName) end

--- Deletes all custom layouts (everything except Default) from settings/<tool>/layouts then loads the Default layout.
---Source: lua/ge/extensions/editor/layoutManager.lua:63
---@param toolName string|nil Tool name; "editor" if nil.
function editor_layoutManager.resetLayouts(toolName) end

--- Saves the current windows state to settings/<tool>/windowsState.json and saves imgui.ini.
---Source: lua/ge/extensions/editor/layoutManager.lua:50
---@param toolName string|nil Used to build the path, but is not passed to editor.saveWindowsState.
function editor_layoutManager.saveCurrentWindowLayout(toolName) end

--- Saves the windows state to settings/<tool>/layouts/<layoutName>/windowsState.json and saves imgui.ini.
---Source: lua/ge/extensions/editor/layoutManager.lua:30
---@param layoutName string Layout name (folder name).
---@param toolName string|nil Tool name; "editor" if nil.
function editor_layoutManager.saveWindowLayout(layoutName, toolName) end

