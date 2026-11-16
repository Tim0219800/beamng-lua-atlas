---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polygon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor utility to draw and edit with the mouse a user-defined polygon on the map (laid on the terrain). Only one polygon is managed by the module. The host tool calls handleUserPolygon every frame: click to add a node, drag to move, double-click (more than 2 nodes) to finish, Delete key to remove the selected node, Alt to show/hide the translation gizmo. render, isDragging and isMouseOverEditable let a tool that drives its own interaction stay consistent.
--- Access: extension `editor_toolUtilities_polygon`: `extensions.load("editor_toolUtilities_polygon")`, then the global `editor_toolUtilities_polygon`
---@class editor_toolUtilities_polygon
editor_toolUtilities_polygon = {}

--- Immediately starts dragging the given node during the current mouse press, without a new click. No effect if the index is invalid.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:455
---@param nodeIdx integer Index (1-based) of the node.
function editor_toolUtilities_polygon.beginDragNode(nodeIdx) end

--- Clears the polygon (raises dirty if it contained nodes).
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:124
function editor_toolUtilities_polygon.clearPolygon() end

--- Returns the dirty flag (polygon modified since the last call) then resets it to false.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:132
---@return boolean  true if the polygon has changed.
function editor_toolUtilities_polygon.consumeDirty() end

--- Returns the polygon's internal table (list of vec3, not a copy).
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:90
---@return table  List of vec3.
function editor_toolUtilities_polygon.getPolygon() end

--- Handles the whole lifecycle of the user polygon: rendering, cursor, adding, inserting on an edge, dragging nodes, gizmo (Alt), deletion (Delete), finishing by double-click. To be called every frame while the tool is active.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:238
---@param doubleClickCallback function|nil Called with a copy of the polygon on double-click when it has more than 2 nodes.
---@param opts table|nil clearOnComplete (default true), doRender (default true), foreground (default false: drawn through geometry), snap = {ox, oy, step} (grid snapping), segmentLabels (length of each segment), rigid (dragging a node moves the whole polygon), ground, open.
function editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts) end

--- True while a node is being dragged; lets the host tool suspend its own scene interactions.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:451
---@return boolean  true during a drag.
function editor_toolUtilities_polygon.isDragging() end

--- True if the mouse is over a node or an edge of the polygon (an edit target), to give the polygon priority over cross-tool selection.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:467
---@return boolean  true if hovering an editable element.
function editor_toolUtilities_polygon.isMouseOverEditable() end

--- True if the polygon has more than 2 nodes.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:121
---@return boolean  true if valid.
function editor_toolUtilities_polygon.isPolygonValid() end

--- Drawing pass only, no input: displays nodes, edges and optionally segment lengths. Useful when the host tool handles its own interaction (rigid movement for example). opts.hover also makes the node under the cursor pulse.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:436
---@param opts table|nil { open, foreground, segmentLabels, hover }
function editor_toolUtilities_polygon.render(opts) end

--- Replaces the polygon with a copy of the given nodes (nil or empty = clear). Resets dragging and the gizmo, and raises the dirty flag.
---Source: lua/ge/extensions/editor/toolUtilities/polygon.lua:94
---@param nodes table|nil List of {x,y,z} points (vec3 or equivalent).
function editor_toolUtilities_polygon.setPolygon(nodes) end

