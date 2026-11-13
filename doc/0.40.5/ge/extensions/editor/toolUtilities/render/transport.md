# `editor_toolUtilities_render_transport`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/transport.lua` · VM : Game Engine (GE) · 519 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_transport` : `extensions.load("editor_toolUtilities_render_transport")`, puis la globale `editor_toolUtilities_render_transport`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight)` | Flare-room handle for the selected junction: the shared (cyan) bar sphere sitting out on the widest gore, a thin<br> connector line back to the hub node, and an always-on value markup. Drag it in/out to set the junction flare room.<br> Ghosted so it stays findable when buried. | 73 |
| `editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev)` | junction -> { rev, pts } | 144 |
| `editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok)` | A strip of lanes from a to b across a road end, reaching len along dir: the lanes a dragged road end would join (red),<br> or the road a lane sweep would make (blue and white-edged when ok, red when not). | 113 |
| `editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit)` | One open lane's portal at a road end: a tile from a to b across the lane, reaching len along dir, green where traffic<br> leaves the road there and red where it enters. lit (hovered or swept) shows it bright and outlined. | 103 |
| `editor_toolUtilities_render_transport.drawLinkedTips(groups)` | Red locked road tips linked to a junction (overdraw normal node spheres). | 119 |
| `editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden)` | Faint no-depth copies of a spline's nodes, bar those in the optional hidden set (keyed by node index), so handles buried<br> in terrain stay findable. | 133 |
| `editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive)` | Transport-network junction centres (green spheres + elevation like road nodes). | 42 |
| `editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal)` | Indicate to the user visually that a join is possible, between two separate splines. refusal: why the tool would refuse it,<br> shown instead (red ends, a still line and the reason). | 305 |
| `editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2)` | Indicate to the user visually that a loop is possible, between start/end of the same spline. | 294 |
| `editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging)` | Renders the given ribbon.<br> [Ribbons are splines which are placed in L-R pairs, and have segments comprising of adjacent 8-point boxes.]<br> [They can have active surfaces (top or bottom), and closest segments.<br> They are used for dynamic audio emitter placement, for example.]<br> [ribbon - The ribbon to render.]<br> [pMouse - The current mouse position.]<br> [isSelectedRibbon - Whether the ribbon is selected, or not.]<br> [selectedNodeIdx - The index of the selected ribbon node, if it exists.]<br> [placedLeftNode - The left node position, if it has been placed by the user.]<br> [bestCursorSeg - The index of the closest segment, if it exists.]<br> [isDragging - Whether the node is being dragged, or not.] | 332 |
| `editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted)` | Renders the wire-frame for ribbon splines. ghosted also traces the ribbons without depth test, faintly, so the stretches<br> buried in terrain still show: the selected ribbon in full, the others by their edges only. | 251 |
| `editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j)` | A flat reference ribbon's left and right extents at div j, metres out from divPoints[j] along its binormal.<br> Optional reference-line extents (TN): leftExtM / rightExtM; else symmetric half-width. A divided carriageway is pushed<br> out by its (tapered) median half, corner widening pushes each edge out per station (see<br> groupMgr.computeCurveWidenTaper), and the hard shoulder is paved road too. | 175 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/transport.lua`.*
