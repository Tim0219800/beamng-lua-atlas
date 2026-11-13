# `editor_toolUtilities_polygon`

*Fichier : `lua/ge/extensions/editor/toolUtilities/polygon.lua` · VM : Game Engine (GE) · 488 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_polygon` : `extensions.load("editor_toolUtilities_polygon")`, puis la globale `editor_toolUtilities_polygon`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_polygon.beginDragNode(nodeIdx)` | Begins dragging the given node immediately, in the current mouse-down (no fresh click needed). Lets a host tool that<br> picks/selects a node with its own logic continue straight into a drag, matching the spline tools' select-and-drag. | 455 |
| `editor_toolUtilities_polygon.clearPolygon()` | Clears the polygon. | 124 |
| `editor_toolUtilities_polygon.consumeDirty()` | Returns and clears the dirty flag. | 132 |
| `editor_toolUtilities_polygon.getPolygon()` | Returns the current polygon. | 90 |
| `editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts)` | Handles the lifecycle of the user polygon. Calling this function allows the user to draw/edit a polygon on the map with the mouse.<br> opts (optional):<br> - clearOnComplete: boolean (default true)  -> clear polygon after double-click completion<br> - doRender: boolean (default true)         -> render the polygon + cursor<br> - foreground: boolean (default false)      -> draw polygon through scene geometry<br> - snap: { ox, oy, step }                   -> snap the working point to a grid of `step`, origin (ox,oy) (nodes land on it)<br> - segmentLabels: boolean (default false)   -> label each segment's length instead of drawing start/end markups<br> - rigid: boolean (default false)           -> dragging a node translates the WHOLE polygon rigidly (whole shape moves) | 238 |
| `editor_toolUtilities_polygon.isDragging()` | True while a node is being dragged (lets a host tool suppress its own scene interaction during a drag). | 451 |
| `editor_toolUtilities_polygon.isMouseOverEditable()` | True if the mouse is over one of the polygon's own nodes or edges (i.e. an edit target). Lets a host tool give<br> its polygon priority over cross-tool selection when deciding what a click means. | 467 |
| `editor_toolUtilities_polygon.isPolygonValid()` | Checks if the polygon is valid. | 121 |
| `editor_toolUtilities_polygon.render(opts)` | Draw-only pass (no input): renders the current polygon's nodes, edges and (optionally) per-segment length labels. Used<br> when a host tool drives its own interaction (e.g. a rigid whole-shape move) but still wants the polygon drawn normally.<br> opts.hover: also pulse the node under the cursor, matching the hover feedback of the normal editing path. | 436 |
| `editor_toolUtilities_polygon.setPolygon(nodes)` | Sets/replaces the current polygon (deep copy).<br> nodes: array of vec3-like (x,y,z). Passing nil/empty clears the polygon. | 94 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/polygon.lua`.*
