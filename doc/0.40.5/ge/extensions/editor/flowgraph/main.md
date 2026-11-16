# `editor_flowgraph_main`

*File: `lua/ge/extensions/editor/flowgraph/main.lua` · VM: Game Engine (GE) · 1131 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/main")` (file under extensions/ but not a regular extension)

Main window (fg_main, "Main view") of the Flowgraph editor: menu bar (File: new project, loading via editor_fileDialog, recent files, restore, clipboard encoding...), node canvas of the current graph with drawing modes (default, simple, heatmap, geometry), colored borders according to the project state (running, paused, stopped, macro), context menus (nodes, pins, links, node creation, Quick Connect) and handling of drag and drop of nodes, macros and variables. Very large file (about 1100 lines): only the useful functions are detailed.

## Notes

- Drag and drop creates nodes via mgr.graph:createNode: "types/getVariable" or "types/setVariable" for variables, "macro/integrated" for macros; each creation adds a history entry (fgEditor.addHistory).
- Creating nodes/macros is only possible if mgr.allowEditing is true; otherwise the menu displays "Disabled.".

## Class `C`

Main Flowgraph window class (windowName = 'fg_main').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization of the window state. | 1126 |
| `C:_onSerialize(data)` | Serialization of the window state. | 1122 |
| `C:attach(mgr)` | Associates the manager, prepares the border colors and sets focusGraph to the main graph. | 26 |
| `C:doContextMenus()` | Handles the opening and drawing of the context menus (node, pin, link, background) by suspending the node editor. | 1047 |
| `C:draw()` | Per-frame entry point; calls drawSelf. | 810 |
| `C:drawGraph(graph, builder, style)` | Draws a graph (nodes and links) with a given builder and style. | 206 |
| `C:drawMenu()` | Draws the window's menu bar (File, etc.). | 73 |
| `C:drawSelf()` | Main drawing body: window, canvas, interactions, context menus. | 293 |
| `C:init()` | Initializes the context identifiers (node/pin/link), column sizes, FPS smoothing, and registers the 600x600 window. | 38 |
| `C:isMouseHovering()` | Indicates whether the mouse is inside the window rectangle. | 1037 |
| `C:resolveDragDropPayload()` | Handles a completed drag and drop: creates the node, macro or variable node at the mouse position, aligned to the grid. | 1003 |
| `C:showNewNodeContextMenu(menuPos)` | Displays the node creation menu (node library) in a 300x300 child (× UI scale), or "Disabled." if editing is forbidden. | 988 |
| `C:showQuickAccessSubmenu(menuPos, pin)` | Displays the "Quick Connect" submenu listing the compatible pins (quickAccess, opposite direction) of the graph. | 817 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/main.lua`.*
