---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main Flowgraph window class (windowName = 'fg_main').
---@class editor_flowgraph_main_C
local editor_flowgraph_main_C = {}

--- Deserialization of the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/main.lua:1126
---@param data table Data.
function editor_flowgraph_main_C:_onDeserialized(data) end

--- Serialization of the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/main.lua:1122
---@param data table Data.
function editor_flowgraph_main_C:_onSerialize(data) end

--- Associates the manager, prepares the border colors and sets focusGraph to the main graph.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:26
---@param mgr table Flowgraph manager.
function editor_flowgraph_main_C:attach(mgr) end

--- Handles the opening and drawing of the context menus (node, pin, link, background) by suspending the node editor.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:1047
function editor_flowgraph_main_C:doContextMenus() end

--- Per-frame entry point; calls drawSelf.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:810
function editor_flowgraph_main_C:draw() end

--- Draws a graph (nodes and links) with a given builder and style.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:206
---@param graph table Graph to draw.
---@param builder table Builder created by flowgraph/builder.
---@param style table ImGui style.
function editor_flowgraph_main_C:drawGraph(graph, builder, style) end

--- Draws the window's menu bar (File, etc.).
---Source: lua/ge/extensions/editor/flowgraph/main.lua:73
function editor_flowgraph_main_C:drawMenu() end

--- Main drawing body: window, canvas, interactions, context menus.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:293
function editor_flowgraph_main_C:drawSelf() end

--- Initializes the context identifiers (node/pin/link), column sizes, FPS smoothing, and registers the 600x600 window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/main.lua:38
function editor_flowgraph_main_C:init() end

--- Indicates whether the mouse is inside the window rectangle.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:1037
---@return boolean  true if hovered.
function editor_flowgraph_main_C:isMouseHovering() end

--- Handles a completed drag and drop: creates the node, macro or variable node at the mouse position, aligned to the grid.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:1003
function editor_flowgraph_main_C:resolveDragDropPayload() end

--- Displays the node creation menu (node library) in a 300x300 child (× UI scale), or "Disabled." if editing is forbidden.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:988
---@param menuPos ImVec2 Menu position.
function editor_flowgraph_main_C:showNewNodeContextMenu(menuPos) end

--- Displays the "Quick Connect" submenu listing the compatible pins (quickAccess, opposite direction) of the graph.
---Source: lua/ge/extensions/editor/flowgraph/main.lua:817
---@param menuPos ImVec2 Menu position.
---@param pin table Source pin.
function editor_flowgraph_main_C:showQuickAccessSubmenu(menuPos, pin) end

