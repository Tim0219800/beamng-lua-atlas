---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/transport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_render_transport` : `extensions.load("editor_toolUtilities_render_transport")`, puis la globale `editor_toolUtilities_render_transport`
---@class editor_toolUtilities_render_transport
editor_toolUtilities_render_transport = {}

--- Flare-room handle for the selected junction: the shared (cyan) bar sphere sitting out on the widest gore, a thin
---  connector line back to the hub node, and an always-on value markup. Drag it in/out to set the junction flare room.
---  Ghosted so it stays findable when buried.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:73
---@param base any
---@param handle any
---@param value any
---@param highlight any
function editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight) end

--- junction -> { rev, pts }
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:144
---@param junctions any
---@param rev any
function editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev) end

--- A strip of lanes from a to b across a road end, reaching len along dir: the lanes a dragged road end would join (red),
---  or the road a lane sweep would make (blue and white-edged when ok, red when not).
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:113
---@param a any
---@param b any
---@param dir any
---@param len any
---@param ok any
function editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok) end

--- One open lane's portal at a road end: a tile from a to b across the lane, reaching len along dir, green where traffic
---  leaves the road there and red where it enters. lit (hovered or swept) shows it bright and outlined.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:103
---@param a any
---@param b any
---@param dir any
---@param len any
---@param leaves any
---@param lit any
function editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit) end

--- Red locked road tips linked to a junction (overdraw normal node spheres).
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:119
---@param groups any
function editor_toolUtilities_render_transport.drawLinkedTips(groups) end

--- Faint no-depth copies of a spline's nodes, bar those in the optional hidden set (keyed by node index), so handles buried
---  in terrain stay findable.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:133
---@param spline any
---@param hidden any
function editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden) end

--- Transport-network junction centres (green spheres + elevation like road nodes).
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:42
---@param junctions any
---@param selectedIdx any
---@param elevScale any
---@param isGizmoActive any
function editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive) end

--- Indicate to the user visually that a join is possible, between two separate splines. refusal: why the tool would refuse it,
---  shown instead (red ends, a still line and the reason).
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:305
---@param node1 any
---@param node2 any
---@param refusal any
function editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal) end

--- Indicate to the user visually that a loop is possible, between start/end of the same spline.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:294
---@param node1 any
---@param node2 any
function editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2) end

--- Renders the given ribbon.
---  [Ribbons are splines which are placed in L-R pairs, and have segments comprising of adjacent 8-point boxes.]
---  [They can have active surfaces (top or bottom), and closest segments.
---  They are used for dynamic audio emitter placement, for example.]
---  [ribbon - The ribbon to render.]
---  [pMouse - The current mouse position.]
---  [isSelectedRibbon - Whether the ribbon is selected, or not.]
---  [selectedNodeIdx - The index of the selected ribbon node, if it exists.]
---  [placedLeftNode - The left node position, if it has been placed by the user.]
---  [bestCursorSeg - The index of the closest segment, if it exists.]
---  [isDragging - Whether the node is being dragged, or not.]
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:332
---@param ribbons any
---@param selectedRibbonIdx any
---@param selectedNodeIdx any
---@param placedLeftNode any
---@param hoveredRibbonIdx any
---@param bestCursorSeg any
---@param isDragging any
function editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging) end

--- Renders the wire-frame for ribbon splines. ghosted also traces the ribbons without depth test, faintly, so the stretches
---  buried in terrain still show: the selected ribbon in full, the others by their edges only.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:251
---@param splines any
---@param selSplineIdx any
---@param binormalSpacing any
---@param ghosted any
function editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted) end

--- A flat reference ribbon's left and right extents at div j, metres out from divPoints[j] along its binormal.
---  Optional reference-line extents (TN): leftExtM / rightExtM; else symmetric half-width. A divided carriageway is pushed
---  out by its (tapered) median half, corner widening pushes each edge out per station (see
---  groupMgr.computeCurveWidenTaper), and the hard shoulder is paved road too.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:175
---@param spline any
---@param j any
function editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j) end

