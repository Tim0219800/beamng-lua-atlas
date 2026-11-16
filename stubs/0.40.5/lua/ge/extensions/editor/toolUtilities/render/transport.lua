---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/transport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendering specific to transport networks and the road editor: junction centers, linked ends, road ribbon wireframe, loop or junction candidates, left/right prism ribbons and ghosts (faint copies without depth test to find what is buried in the terrain). Separate from render.lua because only roadNetwork and heroRoadEditor use it. Composite module that draws via render/spheres, lines, tris and markup.
--- Access: extension `editor_toolUtilities_render_transport`: `extensions.load("editor_toolUtilities_render_transport")`, then the global `editor_toolUtilities_render_transport`
---@class editor_toolUtilities_render_transport
editor_toolUtilities_render_transport = {}

--- "Flare room" handle of the selected junction: bar sphere (cyan) on the widest island, thin line to the center node and an always-shown value label. Dragging inward or outward adjusts the flare. Ghost so that it stays findable when buried.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:73
---@param base vec3 Center node position.
---@param handle vec3 Handle position.
---@param value number Displayed value.
---@param highlight boolean true if hovered or being dragged (inferred from the name).
function editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight) end

--- Ghosts of the center and outer edges (asphalt outline between the arms) of each junction within 400 m. The raised edge points come from the cache as long as rev is unchanged.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:144
---@param junctions table|nil List of junctions (pos, connectorEdges).
---@param rev any Caller's build revision, to invalidate the cache.
function editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev) end

--- Lane band from a to b across a road end, over len along dir: the lanes a dragged end would join (red) or the road a lane sweep would create (blue with white edge if ok, red otherwise).
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:113
---@param a vec3 Band edge.
---@param b vec3 Other edge.
---@param dir vec3 Extension direction.
---@param len number Length.
---@param ok boolean true if the operation is possible.
function editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok) end

--- Portal of a lane open at the end of a road: tile from a to b across the lane, over length len along dir; green if traffic leaves the road through it, red if it enters. lit (hovered or swept) shows it brighter and outlined.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:103
---@param a vec3 Lane edge.
---@param b vec3 Other lane edge.
---@param dir vec3 Extension direction.
---@param len number Tile length.
---@param leaves boolean true if traffic leaves the road here.
---@param lit boolean Highlight.
function editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit) end

--- Draws in locked red the road ends linked to a junction (over the normal node spheres): first node if jctIdStart, last if jctIdFinish.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:119
---@param groups table Groups/roads with nodes, jctIdStart, jctIdFinish.
function editor_toolUtilities_render_transport.drawLinkedTips(groups) end

--- Faint copies without depth test of a spline's nodes (except those of the hidden set) so that buried handles remain findable. Skips disabled or isLink splines.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:133
---@param spline table Spline with nodes.
---@param hidden table<integer, boolean>|nil Set of node indices not to draw.
function editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden) end

--- Draws the network's junction centers (green spheres) with elevation, like road nodes; the selected junction is highlighted.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:42
---@param junctions table|nil List of junctions (pos, etc.).
---@param selectedIdx integer|nil Index of the selected junction (default 0).
---@param elevScale number|nil Elevation color scale (default 100).
---@param isGizmoActive boolean Gizmo active (inferred from the name).
function editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive) end

--- Visually indicates that a junction of two distinct splines is possible. If refusal is given, displays red ends, a fixed line and the reason for the refusal instead.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:305
---@param node1 vec3 First node.
---@param node2 vec3 Second node.
---@param refusal string|nil Reason for the tool's refusal.
function editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal) end

--- Visually indicates that a loop is possible between the start and end of the same spline: highlight of both nodes, special line and prompt "hold CTRL + release".
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:294
---@param node1 vec3 First node.
---@param node2 vec3 Second node.
function editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2) end

--- Draws the given ribbons. A ribbon is a spline laid out in left/right pairs whose segments are adjacent 8-point boxes; it can have active surfaces (top or bottom) and closest segments (used for example for placing dynamic audio emitters). Uses the mouse position on the map.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:332
---@param ribbons table List of ribbons.
---@param selectedRibbonIdx integer Index of the selected ribbon.
---@param selectedNodeIdx integer|nil Index of the selected node.
---@param placedLeftNode vec3|nil Left node already placed by the user.
---@param hoveredRibbonIdx integer|nil Index of the hovered ribbon.
---@param bestCursorSeg integer|nil Index of the segment closest to the cursor.
---@param isDragging boolean A node is being dragged.
function editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging) end

--- Draws the wireframe of ribbon splines. With ghosted, also draws the ribbons faintly and without depth test, so that buried sections are visible: the selected ribbon in full, the others by their edges only.
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:251
---@param splines table List of splines.
---@param selSplineIdx integer Index of the selected spline.
---@param binormalSpacing integer Binormal spacing.
---@param ghosted boolean Add the ghost drawings.
function editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted) end

--- Left and right extensions of a flat reference ribbon at division j, in meters on either side of divPoints[j] along its binormal. Uses leftExtM/rightExtM if present, otherwise the symmetric half-width, plus the half-median (refined) of a divided carriageway, the widening in curves (curveWiden*ByDiv) and the stabilized shoulder (hardShoulder*ByDiv).
---Source: lua/ge/extensions/editor/toolUtilities/render/transport.lua:175
---@param spline table Spline with divWidths and the optional arrays medianHalfByDiv, hardShoulderLeftByDiv, hardShoulderRightByDiv, curveWidenLeftByDiv, curveWidenRightByDiv, leftExtM, rightExtM.
---@param j integer Division index.
---@return number  Left extension in meters.
---@return number  Right extension in meters.
function editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j) end

