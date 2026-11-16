# `editor_toolUtilities_render_spline`

*File: `lua/ge/extensions/editor/toolUtilities/render/spline.lua` · VM: Game Engine (GE) · 682 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_render_spline`: `extensions.load("editor_toolUtilities_render_spline")`, then the global `editor_toolUtilities_render_spline`

Wireframe and surface rendering of splines and layers for the spline editing tools (most of the old render.lua). Composite module: draws via render/spheres, lines, tris and markup, with its own pool of temporary vec3s. handleSplineRendering draws nodes, names, ribs, bars and elevations; the other functions draw hulls, ribbons, surfaces conformed to or projected onto the ground, and previews. To be called every frame from an editor tool.

## Notes

- An expected spline is a table with nodes, divPoints (subdivided points), divWidths, binormals, isEnabled, isLink, isLoop, isPolyline, etc.; the exact fields come from the calling tool.
- The projected surfaces (renderDrivePathSurface) cast a vertical raycast from 3 m above (zRayLift) and add 0.05 m (zRayOffset); they are skipped for isLink splines.
- A twist arc is drawn in 16 segments, at 0.97 * 5 m from the center.
- A half-spline (tileSet or spacing field present) draws only the right-hand ribs (even indices).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle)` | Draws a circular arc (16 segments) from point a to point b around center, with the twist angle label in the middle for the selected node. | 58 |
| `editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale)` | Draws the bar handles and their drop line to the ground (vertical raycast), colored according to elevation. No effect if there are fewer than 2 bars. | 104 |
| `editor_toolUtilities_render_spline.drawRibPoints(ribs, spline)` | Draws the rib points (spheres) and rib lines: for a full spline, left and right connected; for a half-spline, only the right edge connected to the center node. | 81 |
| `editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames)` | Draws all splines: the selected one with its nodes, highlight, gizmo/rotation, ribs, bars, elevation and name/length; the others in dimmed form with their name. | 124 |
| `editor_toolUtilities_render_spline.renderDrivePathSurface(spline)` | Draws a quadrilateral wireframe surface whose z values are obtained by raycast onto the ground, along divPoints (every other line). | 555 |
| `editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing)` | Draws the wireframe of half-splines (e.g. sidewalks). | 403 |
| `editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx)` | Draws the wireframe of master splines, with a heat-map surface for the selected spline. | 481 |
| `editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing)` | Draws the wireframe of a spline layer (with binormal offset), optionally projected onto the ground by raycast. | 245 |
| `editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing)` | Like renderLayer for a master spline layer, without applying the binormal offset. | 313 |
| `editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths)` | Draws a preview ribbon: node spheres, width and edge lines and preview surface. The binormals are computed in 2D (horizontal). | 600 |
| `editor_toolUtilities_render_spline.renderShells(splines)` | Draws the hulls of splines (simple wireframe with labels) when the tool is inactive. | 377 |
| `editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx)` | Draws the polylines of the mesh, assembly, rail and decal spline tools: thick stroke for the selected spline, dimmed for the others. An isPolyline spline is drawn through its nodes (closed if isLoop), otherwise through divPoints; disabled or isLink splines are skipped. | 641 |
| `editor_toolUtilities_render_spline.renderWireframeRibbons(splines)` | Draws a wireframe outline of the given splines. | 432 |

### Parameter details

#### `editor_toolUtilities_render_spline.drawArc(center, isSelectedNode, a, b, axis, twistAngle)`

Draws a circular arc (16 segments) from point a to point b around center, with the twist angle label in the middle for the selected node.

- `center` (*vec3*) : Center of the arc.
- `isSelectedNode` (*boolean*) : true to display the twist angle.
- `a` (*vec3*) : Start point.
- `b` (*vec3*) : End point.
- `axis` (*vec3*) : Rotation axis.
- `twistAngle` (*number*) : Twist angle; its sign gives the direction of the arc.

#### `editor_toolUtilities_render_spline.drawBarPoints(bars, elevScale)`

Draws the bar handles and their drop line to the ground (vertical raycast), colored according to elevation. No effect if there are fewer than 2 bars.

- `bars` (*vec3[]*) : Bar points.
- `elevScale` (*number*) : Height corresponding to the red of the ramp.

#### `editor_toolUtilities_render_spline.drawRibPoints(ribs, spline)`

Draws the rib points (spheres) and rib lines: for a full spline, left and right connected; for a half-spline, only the right edge connected to the center node.

- `ribs` (*vec3[]*) : Rib points, in left/right pairs.
- `spline` (*table*) : Spline (tileSet or spacing signals a half-spline; nodes).

#### `editor_toolUtilities_render_spline.handleSplineRendering(splines, splineIdx, nodeIdx, isGizmoActive, isUseRot, isShapeLocked, isShowElevation, isShowRibs, elevScale, hiddenNodeSet, noNames)`

Draws all splines: the selected one with its nodes, highlight, gizmo/rotation, ribs, bars, elevation and name/length; the others in dimmed form with their name.

- `splines` (*table*) : List of splines.
- `splineIdx` (*integer*) : Index of the selected spline.
- `nodeIdx` (*integer*) : Index of the selected node.
- `isGizmoActive` (*boolean*) : The translation gizmo is active.
- `isUseRot` (*boolean*) : Rotation mode (twist display).
- `isShapeLocked` (*boolean*) : Locked shape.
- `isShowElevation` (*boolean*) : Show elevations and drop lines.
- `isShowRibs` (*boolean*) : Show the ribs.
- `elevScale` (*number*) : Elevation color scale.
- `hiddenNodeSet` (*table<integer, boolean>|nil*) : Set of nodes of the selected spline whose large sphere, highlight and elevation line are suppressed (engineered corners of heroRoad where the PI node is far from the road).
- `noNames` (*boolean|nil*) : Suppresses the name of unselected splines (networks of hundreds of links).

#### `editor_toolUtilities_render_spline.renderDrivePathSurface(spline)`

Draws a quadrilateral wireframe surface whose z values are obtained by raycast onto the ground, along divPoints (every other line).

- `spline` (*table|nil*) : Spline with divPoints, divWidths, binormals.

#### `editor_toolUtilities_render_spline.renderHalfSplineWireFrame(splines, selSplineIdx, binormalSpacing)`

Draws the wireframe of half-splines (e.g. sidewalks).

- `splines` (*table*) : List of splines.
- `selSplineIdx` (*integer*) : Index of the selected spline.
- `binormalSpacing` (*integer*) : Spacing of the binormal lines.

#### `editor_toolUtilities_render_spline.renderHomologatedSurface(splines, selSplineIdx)`

Draws the wireframe of master splines, with a heat-map surface for the selected spline.

- `splines` (*table*) : List of splines.
- `selSplineIdx` (*integer*) : Index of the selected spline.

#### `editor_toolUtilities_render_spline.renderLayer(layer, spline, isRaycast, binormalSpacing)`

Draws the wireframe of a spline layer (with binormal offset), optionally projected onto the ground by raycast.

- `layer` (*table*) : Layer to draw.
- `spline` (*table*) : Spline containing the layer.
- `isRaycast` (*boolean*) : Project the points onto the ground.
- `binormalSpacing` (*integer*) : Spacing of the binormal lines, in division points.

#### `editor_toolUtilities_render_spline.renderMasterLayer(layer, spline, isRaycast, binormalSpacing)`

Like renderLayer for a master spline layer, without applying the binormal offset.

- `layer` (*table*) : Layer to draw.
- `spline` (*table*) : Spline containing the layer.
- `isRaycast` (*boolean*) : Project onto the ground.
- `binormalSpacing` (*integer*) : Spacing of the binormal lines.

#### `editor_toolUtilities_render_spline.renderPreviewRibbon(nodes, widths)`

Draws a preview ribbon: node spheres, width and edge lines and preview surface. The binormals are computed in 2D (horizontal).

- `nodes` (*vec3[]*) : Ribbon nodes.
- `widths` (*number[]*) : Ribbon width at each node, in meters.

#### `editor_toolUtilities_render_spline.renderShells(splines)`

Draws the hulls of splines (simple wireframe with labels) when the tool is inactive.

- `splines` (*table*) : List of splines.

#### `editor_toolUtilities_render_spline.renderSplinePolylines(splines, selectedSplineIdx)`

Draws the polylines of the mesh, assembly, rail and decal spline tools: thick stroke for the selected spline, dimmed for the others. An isPolyline spline is drawn through its nodes (closed if isLoop), otherwise through divPoints; disabled or isLink splines are skipped.

- `splines` (*table|nil*) : List of splines.
- `selectedSplineIdx` (*integer*) : Index of the selected spline.

#### `editor_toolUtilities_render_spline.renderWireframeRibbons(splines)`

Draws a wireframe outline of the given splines.

- `splines` (*table*) : List of splines.

**Globals assigned:** `i`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/render/spline.lua`.*
