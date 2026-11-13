# `editor_toolUtilities_render_spline`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/spline.lua` · VM : Game Engine (GE) · 682 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_spline` : `extensions.load("editor_toolUtilities_render_spline")`, puis la globale `editor_toolUtilities_render_spline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle)` | Function to draw a circular arc, to some granularity. | 58 |
| `editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale)` | Draw the bar points. | 104 |
| `editor_toolUtilities_render_spline.drawRibPoints(ribs, spline)` | Draw the rib points. | 81 |
| `editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames)` | Handles the rendering of splines.<br> hiddenNodeSet (optional): a set { [nodeIdx] = true } of selected-spline nodes whose fat sphere / highlight / elevation line are<br> suppressed. Used by heroRoad engineered corners, where a tight bend flings the PI node far off-road and an on-apex grip stands in<br> for it, so the stray node shouldn't also draw. Nil for every other tool.<br> noNames (optional): suppresses the name label on unselected splines. For networks of hundreds of links, where a label per link<br> buries the map in text. The selected spline keeps its own name/length. | 124 |
| `editor_toolUtilities_render_spline.renderDrivePathSurface(spline)` | Renders a quadrilateral surface with raycasted z values. | 555 |
| `editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing)` | Renders the wire-frame for half splines. | 403 |
| `editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx)` | Renders the wire-frame for Master Splines, with heatmap surface for selected spline. | 481 |
| `editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing)` | Renders the wire-frame for the given layer.<br> [Layer - The layer to render.]<br> [Spline - The spline which contains the layer.] | 245 |
| `editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing)` | Renders the wire-frame for a master spline layer without applying binormal offset.<br> [Layer - The layer to render.]<br> [Spline - The spline which contains the layer.] | 313 |
| `editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths)` | Renders the give preview ribbon. | 600 |
| `editor_toolUtilities_render_spline.renderShells(splines)` | Renders the shells of the given splines (just a basic wireframe with markup for when tool is inactive). | 377 |
| `editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx)` | Renders polylines for specific spline tools (mesh spline, assembly spline, rail spline, decal spline).<br> Selected splines get thicker, clearer polylines while unselected ones get dull polylines. | 641 |
| `editor_toolUtilities_render_spline.renderWireframeRibbons(splines)` | Renders a wire-frame outline for the given splines. | 432 |

**Globales affectées :** `i`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/spline.lua`.*
