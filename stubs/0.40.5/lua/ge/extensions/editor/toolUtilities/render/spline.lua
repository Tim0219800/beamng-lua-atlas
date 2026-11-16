---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/spline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Wireframe and surface rendering of splines and layers for the spline editing tools (most of the old render.lua). Composite module: draws via render/spheres, lines, tris and markup, with its own pool of temporary vec3s. handleSplineRendering draws nodes, names, ribs, bars and elevations; the other functions draw hulls, ribbons, surfaces conformed to or projected onto the ground, and previews. To be called every frame from an editor tool.
--- Access: extension `editor_toolUtilities_render_spline`: `extensions.load("editor_toolUtilities_render_spline")`, then the global `editor_toolUtilities_render_spline`
---@class editor_toolUtilities_render_spline
editor_toolUtilities_render_spline = {}

--- Draws a circular arc (16 segments) from point a to point b around center, with the twist angle label in the middle for the selected node.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:58
---@param center vec3 Center of the arc.
---@param isSelectedNode boolean true to display the twist angle.
---@param a vec3 Start point.
---@param b vec3 End point.
---@param axis vec3 Rotation axis.
---@param twistAngle number Twist angle; its sign gives the direction of the arc.
function editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle) end

--- Draws the bar handles and their drop line to the ground (vertical raycast), colored according to elevation. No effect if there are fewer than 2 bars.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:104
---@param bars vec3[] Bar points.
---@param elevScale number Height corresponding to the red of the ramp.
function editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale) end

--- Draws the rib points (spheres) and rib lines: for a full spline, left and right connected; for a half-spline, only the right edge connected to the center node.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:81
---@param ribs vec3[] Rib points, in left/right pairs.
---@param spline table Spline (tileSet or spacing signals a half-spline; nodes).
function editor_toolUtilities_render_spline.drawRibPoints(ribs, spline) end

--- Draws all splines: the selected one with its nodes, highlight, gizmo/rotation, ribs, bars, elevation and name/length; the others in dimmed form with their name.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:124
---@param splines table List of splines.
---@param splineIdx integer Index of the selected spline.
---@param nodeIdx integer Index of the selected node.
---@param isGizmoActive boolean The translation gizmo is active.
---@param isUseRot boolean Rotation mode (twist display).
---@param isShapeLocked boolean Locked shape.
---@param isShowElevation boolean Show elevations and drop lines.
---@param isShowRibs boolean Show the ribs.
---@param elevScale number Elevation color scale.
---@param hiddenNodeSet table<integer, boolean>|nil Set of nodes of the selected spline whose large sphere, highlight and elevation line are suppressed (engineered corners of heroRoad where the PI node is far from the road).
---@param noNames boolean|nil Suppresses the name of unselected splines (networks of hundreds of links).
function editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames) end

--- Draws a quadrilateral wireframe surface whose z values are obtained by raycast onto the ground, along divPoints (every other line).
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:555
---@param spline table|nil Spline with divPoints, divWidths, binormals.
function editor_toolUtilities_render_spline.renderDrivePathSurface(spline) end

--- Draws the wireframe of half-splines (e.g. sidewalks).
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:403
---@param splines table List of splines.
---@param selSplineIdx integer Index of the selected spline.
---@param binormalSpacing integer Spacing of the binormal lines.
function editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing) end

--- Draws the wireframe of master splines, with a heat-map surface for the selected spline.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:481
---@param splines table List of splines.
---@param selSplineIdx integer Index of the selected spline.
function editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx) end

--- Draws the wireframe of a spline layer (with binormal offset), optionally projected onto the ground by raycast.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:245
---@param layer table Layer to draw.
---@param spline table Spline containing the layer.
---@param isRaycast boolean Project the points onto the ground.
---@param binormalSpacing integer Spacing of the binormal lines, in division points.
function editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing) end

--- Like renderLayer for a master spline layer, without applying the binormal offset.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:313
---@param layer table Layer to draw.
---@param spline table Spline containing the layer.
---@param isRaycast boolean Project onto the ground.
---@param binormalSpacing integer Spacing of the binormal lines.
function editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing) end

--- Draws a preview ribbon: node spheres, width and edge lines and preview surface. The binormals are computed in 2D (horizontal).
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:600
---@param nodes vec3[] Ribbon nodes.
---@param widths number[] Ribbon width at each node, in meters.
function editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths) end

--- Draws the hulls of splines (simple wireframe with labels) when the tool is inactive.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:377
---@param splines table List of splines.
function editor_toolUtilities_render_spline.renderShells(splines) end

--- Draws the polylines of the mesh, assembly, rail and decal spline tools: thick stroke for the selected spline, dimmed for the others. An isPolyline spline is drawn through its nodes (closed if isLoop), otherwise through divPoints; disabled or isLink splines are skipped.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:641
---@param splines table|nil List of splines.
---@param selectedSplineIdx integer Index of the selected spline.
function editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx) end

--- Draws a wireframe outline of the given splines.
---Source: lua/ge/extensions/editor/toolUtilities/render/spline.lua:432
---@param splines table List of splines.
function editor_toolUtilities_render_spline.renderWireframeRibbons(splines) end

---@type number
i = nil
