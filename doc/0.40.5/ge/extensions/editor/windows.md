# `editor_windows`

*File: `lua/ge/extensions/editor/windows.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_windows`: `extensions.load("editor_windows")`, then the global `editor_windows`

"Windows" window of the editor (Window > Window Position Reset... menu). It lists all registered editor windows (editor.getWindowsState()), sorted by title and filterable, with two buttons per window: "Move to center" (recenters the window in the viewport) and "Highlight" (outlines the window with an orange rectangle for 3.5 s). Useful when a window is lost off-screen.

## Notes

- If the "Windows" window itself goes outside the viewport, it is moved back to (40, 40) relative to the main viewport.
- In onEditorInitialized, the code also creates editor.editModes.assetBrowserEditMode = {onToolbar = nil, icon = nil}, which overwrites the asset browser's edit mode if it already existed (probably a copy-paste).
- The window title is "Windows" but the file uses an internal windowName "windows"; recentering uses getImGuiWindowName(key, data) = title .. '##' .. key.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_windows.onEditorGui()` | Editor hook called every UI frame. Draws the "Windows" window (search filter and two-column table) then the current highlight rectangles. *(internal)* *(hook)* | 82 |
| `editor_windows.onEditorInitialized()` | Editor hook called at initialization. Registers the window (size 800x500) and adds the "Window Position Reset..." menu entry. *(internal)* *(hook)* | 126 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/windows.lua`.*
