# `editor_toolUtilities_render_transport`

*File: `lua/ge/extensions/editor/toolUtilities/render/transport.lua` · VM: Game Engine (GE) · 519 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_render_transport`: `extensions.load("editor_toolUtilities_render_transport")`, then the global `editor_toolUtilities_render_transport`

Rendering specific to transport networks and the road editor: junction centers, linked ends, road ribbon wireframe, loop or junction candidates, left/right prism ribbons and ghosts (faint copies without depth test to find what is buried in the terrain). Separate from render.lua because only roadNetwork and heroRoadEditor use it. Composite module that draws via render/spheres, lines, tris and markup.

## Notes

- Filtering distances: 800 m for unselected ribbons and junctions, 400 m for their ghosts (ghosts cost one call per line).
- A spline's wireframe is computed once and drawn in a batch; if the spline exposes meshEdgeL/meshEdgeR (Hero Road, true deck edges with superelevation, crown, shoulders), those are drawn, otherwise the flat reference ribbon.
- A rung is drawn every 12 points (ribbonRungSpacing); the binormal is spaced by 2 points (masterWireBinormalSpacing).
- drawJunctionGhosts caches the junction edge points (weak-keyed table) as long as rev does not change.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight)` | "Flare room" handle of the selected junction: bar sphere (cyan) on the widest island, thin line to the center node and an always-shown value label. Dragging inward or outward adjusts the flare. Ghost so that it stays findable when buried. | 73 |
| `editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev)` | Ghosts of the center and outer edges (asphalt outline between the arms) of each junction within 400 m. The raised edge points come from the cache as long as rev is unchanged. | 144 |
| `editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok)` | Lane band from a to b across a road end, over len along dir: the lanes a dragged end would join (red) or the road a lane sweep would create (blue with white edge if ok, red otherwise). | 113 |
| `editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit)` | Portal of a lane open at the end of a road: tile from a to b across the lane, over length len along dir; green if traffic leaves the road through it, red if it enters. lit (hovered or swept) shows it brighter and outlined. | 103 |
| `editor_toolUtilities_render_transport.drawLinkedTips(groups)` | Draws in locked red the road ends linked to a junction (over the normal node spheres): first node if jctIdStart, last if jctIdFinish. | 119 |
| `editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden)` | Faint copies without depth test of a spline's nodes (except those of the hidden set) so that buried handles remain findable. Skips disabled or isLink splines. | 133 |
| `editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive)` | Draws the network's junction centers (green spheres) with elevation, like road nodes; the selected junction is highlighted. | 42 |
| `editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal)` | Visually indicates that a junction of two distinct splines is possible. If refusal is given, displays red ends, a fixed line and the reason for the refusal instead. | 305 |
| `editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2)` | Visually indicates that a loop is possible between the start and end of the same spline: highlight of both nodes, special line and prompt "hold CTRL + release". | 294 |
| `editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging)` | Draws the given ribbons. A ribbon is a spline laid out in left/right pairs whose segments are adjacent 8-point boxes; it can have active surfaces (top or bottom) and closest segments (used for example for placing dynamic audio emitters). Uses the mouse position on the map. | 332 |
| `editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted)` | Draws the wireframe of ribbon splines. With ghosted, also draws the ribbons faintly and without depth test, so that buried sections are visible: the selected ribbon in full, the others by their edges only. | 251 |
| `editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j)` | Left and right extensions of a flat reference ribbon at division j, in meters on either side of divPoints[j] along its binormal. Uses leftExtM/rightExtM if present, otherwise the symmetric half-width, plus the half-median (refined) of a divided carriageway, the widening in curves (curveWiden*ByDiv) and the stabilized shoulder (hardShoulder*ByDiv). | 175 |

### Parameter details

#### `editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight)`

"Flare room" handle of the selected junction: bar sphere (cyan) on the widest island, thin line to the center node and an always-shown value label. Dragging inward or outward adjusts the flare. Ghost so that it stays findable when buried.

- `base` (*vec3*) : Center node position.
- `handle` (*vec3*) : Handle position.
- `value` (*number*) : Displayed value.
- `highlight` (*boolean*) : true if hovered or being dragged (inferred from the name).

#### `editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev)`

Ghosts of the center and outer edges (asphalt outline between the arms) of each junction within 400 m. The raised edge points come from the cache as long as rev is unchanged.

- `junctions` (*table|nil*) : List of junctions (pos, connectorEdges).
- `rev` (*any*) : Caller's build revision, to invalidate the cache.

#### `editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok)`

Lane band from a to b across a road end, over len along dir: the lanes a dragged end would join (red) or the road a lane sweep would create (blue with white edge if ok, red otherwise).

- `a` (*vec3*) : Band edge.
- `b` (*vec3*) : Other edge.
- `dir` (*vec3*) : Extension direction.
- `len` (*number*) : Length.
- `ok` (*boolean*) : true if the operation is possible.

#### `editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit)`

Portal of a lane open at the end of a road: tile from a to b across the lane, over length len along dir; green if traffic leaves the road through it, red if it enters. lit (hovered or swept) shows it brighter and outlined.

- `a` (*vec3*) : Lane edge.
- `b` (*vec3*) : Other lane edge.
- `dir` (*vec3*) : Extension direction.
- `len` (*number*) : Tile length.
- `leaves` (*boolean*) : true if traffic leaves the road here.
- `lit` (*boolean*) : Highlight.

#### `editor_toolUtilities_render_transport.drawLinkedTips(groups)`

Draws in locked red the road ends linked to a junction (over the normal node spheres): first node if jctIdStart, last if jctIdFinish.

- `groups` (*table*) : Groups/roads with nodes, jctIdStart, jctIdFinish.

#### `editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden)`

Faint copies without depth test of a spline's nodes (except those of the hidden set) so that buried handles remain findable. Skips disabled or isLink splines.

- `spline` (*table*) : Spline with nodes.
- `hidden` (*table<integer, boolean>|nil*) : Set of node indices not to draw.

#### `editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive)`

Draws the network's junction centers (green spheres) with elevation, like road nodes; the selected junction is highlighted.

- `junctions` (*table|nil*) : List of junctions (pos, etc.).
- `selectedIdx` (*integer|nil*) : Index of the selected junction (default 0).
- `elevScale` (*number|nil*) : Elevation color scale (default 100).
- `isGizmoActive` (*boolean*) : Gizmo active (inferred from the name).

#### `editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal)`

Visually indicates that a junction of two distinct splines is possible. If refusal is given, displays red ends, a fixed line and the reason for the refusal instead.

- `node1` (*vec3*) : First node.
- `node2` (*vec3*) : Second node.
- `refusal` (*string|nil*) : Reason for the tool's refusal.

#### `editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2)`

Visually indicates that a loop is possible between the start and end of the same spline: highlight of both nodes, special line and prompt "hold CTRL + release".

- `node1` (*vec3*) : First node.
- `node2` (*vec3*) : Second node.

#### `editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging)`

Draws the given ribbons. A ribbon is a spline laid out in left/right pairs whose segments are adjacent 8-point boxes; it can have active surfaces (top or bottom) and closest segments (used for example for placing dynamic audio emitters). Uses the mouse position on the map.

- `ribbons` (*table*) : List of ribbons.
- `selectedRibbonIdx` (*integer*) : Index of the selected ribbon.
- `selectedNodeIdx` (*integer|nil*) : Index of the selected node.
- `placedLeftNode` (*vec3|nil*) : Left node already placed by the user.
- `hoveredRibbonIdx` (*integer|nil*) : Index of the hovered ribbon.
- `bestCursorSeg` (*integer|nil*) : Index of the segment closest to the cursor.
- `isDragging` (*boolean*) : A node is being dragged.

#### `editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted)`

Draws the wireframe of ribbon splines. With ghosted, also draws the ribbons faintly and without depth test, so that buried sections are visible: the selected ribbon in full, the others by their edges only.

- `splines` (*table*) : List of splines.
- `selSplineIdx` (*integer*) : Index of the selected spline.
- `binormalSpacing` (*integer*) : Binormal spacing.
- `ghosted` (*boolean*) : Add the ghost drawings.

#### `editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j)`

Left and right extensions of a flat reference ribbon at division j, in meters on either side of divPoints[j] along its binormal. Uses leftExtM/rightExtM if present, otherwise the symmetric half-width, plus the half-median (refined) of a divided carriageway, the widening in curves (curveWiden*ByDiv) and the stabilized shoulder (hardShoulder*ByDiv).

- `spline` (*table*) : Spline with divWidths and the optional arrays medianHalfByDiv, hardShoulderLeftByDiv, hardShoulderRightByDiv, curveWidenLeftByDiv, curveWidenRightByDiv, leftExtM, rightExtM.
- `j` (*integer*) : Division index.
- **returns**: number Left extension in meters.
- **returns**: number Right extension in meters.

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/render/transport.lua`.*
