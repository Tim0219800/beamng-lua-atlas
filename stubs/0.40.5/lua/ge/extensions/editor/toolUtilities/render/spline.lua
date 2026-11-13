---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/spline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_render_spline` : `extensions.load("editor_toolUtilities_render_spline")`, puis la globale `editor_toolUtilities_render_spline`
---@class editor_toolUtilities_render_spline
editor_toolUtilities_render_spline = {}

--- Function to draw a circular arc, to some granularity.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:58
---@param center any
---@param isSelectedNode any
---@param a any
---@param b any
---@param axis any
---@param twistAngle any
function editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle) end

--- Draw the bar points.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:104
---@param bars any
---@param elevScale any
function editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale) end

--- Draw the rib points.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:81
---@param ribs any
---@param spline any
function editor_toolUtilities_render_spline.drawRibPoints(ribs, spline) end

--- Handles the rendering of splines.
---  hiddenNodeSet (optional): a set { [nodeIdx] = true } of selected-spline nodes whose fat sphere / highlight / elevation line are
---  suppressed. Used by heroRoad engineered corners, where a tight bend flings the PI node far off-road and an on-apex grip stands in
---  for it, so the stray node shouldn't also draw. Nil for every other tool.
---  noNames (optional): suppresses the name label on unselected splines. For networks of hundreds of links, where a label per link
---  buries the map in text. The selected spline keeps its own name/length.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:124
---@param splines any
---@param splineIdx any
---@param nodeIdx any
---@param isGizmoActive any
---@param isUseRot any
---@param isShapeLocked any
---@param isShowElevation any
---@param isShowRibs any
---@param elevScale any
---@param hiddenNodeSet any
---@param noNames any
function editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames) end

--- Renders a quadrilateral surface with raycasted z values.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:555
---@param spline any
function editor_toolUtilities_render_spline.renderDrivePathSurface(spline) end

--- Renders the wire-frame for half splines.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:403
---@param splines any
---@param selSplineIdx any
---@param binormalSpacing any
function editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing) end

--- Renders the wire-frame for Master Splines, with heatmap surface for selected spline.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:481
---@param splines any
---@param selSplineIdx any
function editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx) end

--- Renders the wire-frame for the given layer.
---  [Layer - The layer to render.]
---  [Spline - The spline which contains the layer.]
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:245
---@param layer any
---@param spline any
---@param isRaycast any
---@param binormalSpacing any
function editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing) end

--- Renders the wire-frame for a master spline layer without applying binormal offset.
---  [Layer - The layer to render.]
---  [Spline - The spline which contains the layer.]
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:313
---@param layer any
---@param spline any
---@param isRaycast any
---@param binormalSpacing any
function editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing) end

--- Renders the give preview ribbon.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:600
---@param nodes any
---@param widths any
function editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths) end

--- Renders the shells of the given splines (just a basic wireframe with markup for when tool is inactive).
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:377
---@param splines any
function editor_toolUtilities_render_spline.renderShells(splines) end

--- Renders polylines for specific spline tools (mesh spline, assembly spline, rail spline, decal spline).
---  Selected splines get thicker, clearer polylines while unselected ones get dull polylines.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:641
---@param splines any
---@param selectedSplineIdx any
function editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx) end

--- Renders a wire-frame outline for the given splines.
---Source : lua/ge/extensions/editor/toolUtilities/render/spline.lua:432
---@param splines any
function editor_toolUtilities_render_spline.renderWireframeRibbons(splines) end

---@type number
i = nil
