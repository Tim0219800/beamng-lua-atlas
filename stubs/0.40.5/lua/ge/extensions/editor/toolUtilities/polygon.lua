---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polygon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_polygon` : `extensions.load("editor_toolUtilities_polygon")`, puis la globale `editor_toolUtilities_polygon`
---@class editor_toolUtilities_polygon
editor_toolUtilities_polygon = {}

--- Begins dragging the given node immediately, in the current mouse-down (no fresh click needed). Lets a host tool that
---  picks/selects a node with its own logic continue straight into a drag, matching the spline tools' select-and-drag.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:455
---@param nodeIdx any
function editor_toolUtilities_polygon.beginDragNode(nodeIdx) end

--- Clears the polygon.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:124
function editor_toolUtilities_polygon.clearPolygon() end

--- Returns and clears the dirty flag.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:132
function editor_toolUtilities_polygon.consumeDirty() end

--- Returns the current polygon.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:90
function editor_toolUtilities_polygon.getPolygon() end

--- Handles the lifecycle of the user polygon. Calling this function allows the user to draw/edit a polygon on the map with the mouse.
---  opts (optional):
---  - clearOnComplete: boolean (default true)  -> clear polygon after double-click completion
---  - doRender: boolean (default true)         -> render the polygon + cursor
---  - foreground: boolean (default false)      -> draw polygon through scene geometry
---  - snap: { ox, oy, step }                   -> snap the working point to a grid of `step`, origin (ox,oy) (nodes land on it)
---  - segmentLabels: boolean (default false)   -> label each segment's length instead of drawing start/end markups
---  - rigid: boolean (default false)           -> dragging a node translates the WHOLE polygon rigidly (whole shape moves)
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:238
---@param doubleClickCallback any
---@param opts any
function editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts) end

--- True while a node is being dragged (lets a host tool suppress its own scene interaction during a drag).
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:451
function editor_toolUtilities_polygon.isDragging() end

--- True if the mouse is over one of the polygon's own nodes or edges (i.e. an edit target). Lets a host tool give
---  its polygon priority over cross-tool selection when deciding what a click means.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:467
function editor_toolUtilities_polygon.isMouseOverEditable() end

--- Checks if the polygon is valid.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:121
function editor_toolUtilities_polygon.isPolygonValid() end

--- Draw-only pass (no input): renders the current polygon's nodes, edges and (optionally) per-segment length labels. Used
---  when a host tool drives its own interaction (e.g. a rigid whole-shape move) but still wants the polygon drawn normally.
---  opts.hover: also pulse the node under the cursor, matching the hover feedback of the normal editing path.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:436
---@param opts any
function editor_toolUtilities_polygon.render(opts) end

--- Sets/replaces the current polygon (deep copy).
---  nodes: array of vec3-like (x,y,z). Passing nil/empty clears the polygon.
---Source : lua/ge/extensions/editor/toolUtilities/polygon.lua:94
---@param nodes any
function editor_toolUtilities_polygon.setPolygon(nodes) end

