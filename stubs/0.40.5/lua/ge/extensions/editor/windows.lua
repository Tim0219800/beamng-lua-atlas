---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/windows.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Windows" window of the editor (Window > Window Position Reset... menu). It lists all registered editor windows (editor.getWindowsState()), sorted by title and filterable, with two buttons per window: "Move to center" (recenters the window in the viewport) and "Highlight" (outlines the window with an orange rectangle for 3.5 s). Useful when a window is lost off-screen.
--- Access: extension `editor_windows`: `extensions.load("editor_windows")`, then the global `editor_windows`
---@class editor_windows
editor_windows = {}

--- Editor hook called every UI frame. Draws the "Windows" window (search filter and two-column table) then the current highlight rectangles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/windows.lua:82
function editor_windows.onEditorGui() end

--- Editor hook called at initialization. Registers the window (size 800x500) and adds the "Window Position Reset..." menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/windows.lua:126
function editor_windows.onEditorInitialized() end

