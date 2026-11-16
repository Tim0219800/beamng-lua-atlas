# `editor_toolUtilities_polygon`

*File: `lua/ge/extensions/editor/toolUtilities/polygon.lua` · VM: Game Engine (GE) · 488 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_polygon`: `extensions.load("editor_toolUtilities_polygon")`, then the global `editor_toolUtilities_polygon`

Editor utility to draw and edit with the mouse a user-defined polygon on the map (laid on the terrain). Only one polygon is managed by the module. The host tool calls handleUserPolygon every frame: click to add a node, drag to move, double-click (more than 2 nodes) to finish, Delete key to remove the selected node, Alt to show/hide the translation gizmo. render, isDragging and isMouseOverEditable let a tool that drives its own interaction stay consistent.

## Example

```lua
local poly = extensions.editor_toolUtilities_polygon
-- every frame:
poly.handleUserPolygon(function(nodes) print('polygon finished', #nodes) end, {clearOnComplete = false, snap = {ox = 0, oy = 0, step = 1}})
if poly.consumeDirty() then local p = poly.getPolygon() end
```

## Notes

- The nodes are vec3; the z height is resampled on the terrain (core_terrain.getTerrainHeight).
- handleUserPolygon also accepts opts.ground (boolean) and opts.open (boolean: open polyline without a closing edge), not documented in the header comment; render accepts opts.open, opts.foreground, opts.segmentLabels and opts.hover.
- The edges are drawn raised 0.1 m above the terrain; a right-angle mark is displayed when a corner is within about 1 degree of square.
- The double-click callback receives a deep copy of the polygon; if clearOnComplete is true (default) the polygon is then cleared.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_polygon.beginDragNode(nodeIdx)` | Immediately starts dragging the given node during the current mouse press, without a new click. No effect if the index is invalid. | 455 |
| `editor_toolUtilities_polygon.clearPolygon()` | Clears the polygon (raises dirty if it contained nodes). | 124 |
| `editor_toolUtilities_polygon.consumeDirty()` | Returns the dirty flag (polygon modified since the last call) then resets it to false. | 132 |
| `editor_toolUtilities_polygon.getPolygon()` | Returns the polygon's internal table (list of vec3, not a copy). | 90 |
| `editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts)` | Handles the whole lifecycle of the user polygon: rendering, cursor, adding, inserting on an edge, dragging nodes, gizmo (Alt), deletion (Delete), finishing by double-click. To be called every frame while the tool is active. | 238 |
| `editor_toolUtilities_polygon.isDragging()` | True while a node is being dragged; lets the host tool suspend its own scene interactions. | 451 |
| `editor_toolUtilities_polygon.isMouseOverEditable()` | True if the mouse is over a node or an edge of the polygon (an edit target), to give the polygon priority over cross-tool selection. | 467 |
| `editor_toolUtilities_polygon.isPolygonValid()` | True if the polygon has more than 2 nodes. | 121 |
| `editor_toolUtilities_polygon.render(opts)` | Drawing pass only, no input: displays nodes, edges and optionally segment lengths. Useful when the host tool handles its own interaction (rigid movement for example). opts.hover also makes the node under the cursor pulse. | 436 |
| `editor_toolUtilities_polygon.setPolygon(nodes)` | Replaces the polygon with a copy of the given nodes (nil or empty = clear). Resets dragging and the gizmo, and raises the dirty flag. | 94 |

### Parameter details

#### `editor_toolUtilities_polygon.beginDragNode(nodeIdx)`

Immediately starts dragging the given node during the current mouse press, without a new click. No effect if the index is invalid.

- `nodeIdx` (*integer*) : Index (1-based) of the node.

#### `editor_toolUtilities_polygon.consumeDirty()`

Returns the dirty flag (polygon modified since the last call) then resets it to false.

- **returns**: boolean true if the polygon has changed.

#### `editor_toolUtilities_polygon.getPolygon()`

Returns the polygon's internal table (list of vec3, not a copy).

- **returns**: table List of vec3.

#### `editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts)`

Handles the whole lifecycle of the user polygon: rendering, cursor, adding, inserting on an edge, dragging nodes, gizmo (Alt), deletion (Delete), finishing by double-click. To be called every frame while the tool is active.

- `doubleClickCallback` (*function|nil*) : Called with a copy of the polygon on double-click when it has more than 2 nodes.
- `opts` (*table|nil*) : clearOnComplete (default true), doRender (default true), foreground (default false: drawn through geometry), snap = {ox, oy, step} (grid snapping), segmentLabels (length of each segment), rigid (dragging a node moves the whole polygon), ground, open.

#### `editor_toolUtilities_polygon.isDragging()`

True while a node is being dragged; lets the host tool suspend its own scene interactions.

- **returns**: boolean true during a drag.

#### `editor_toolUtilities_polygon.isMouseOverEditable()`

True if the mouse is over a node or an edge of the polygon (an edit target), to give the polygon priority over cross-tool selection.

- **returns**: boolean true if hovering an editable element.

#### `editor_toolUtilities_polygon.isPolygonValid()`

True if the polygon has more than 2 nodes.

- **returns**: boolean true if valid.

#### `editor_toolUtilities_polygon.render(opts)`

Drawing pass only, no input: displays nodes, edges and optionally segment lengths. Useful when the host tool handles its own interaction (rigid movement for example). opts.hover also makes the node under the cursor pulse.

- `opts` (*table|nil*) : { open, foreground, segmentLabels, hover }

#### `editor_toolUtilities_polygon.setPolygon(nodes)`

Replaces the polygon with a copy of the given nodes (nil or empty = clear). Resets dragging and the gizmo, and raises the dirty flag.

- `nodes` (*table|nil*) : List of {x,y,z} points (vec3 or equivalent).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/polygon.lua`.*
