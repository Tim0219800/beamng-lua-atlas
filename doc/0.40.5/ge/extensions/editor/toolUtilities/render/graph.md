# `editor_toolUtilities_render_graph`

*File: `lua/ge/extensions/editor/toolUtilities/render/graph.lua` · VM: Game Engine (GE) · 346 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_render_graph`: `extensions.load("editor_toolUtilities_render_graph")`, then the global `editor_toolUtilities_render_graph`

Rendering of speed bars and the AI navigation graph (roadArchitect / drivePath lineage): speed bars and curve, navgraph node selection and overlay of the world AI graph. Separate from render.lua because only the graph and speed tools use it. Composite module that draws via render/spheres, lines, tris and markup, with its own pool of temporary vec3s.

## Notes

- Bar heights are the speed (m/s) multiplied by geom.getBarScale(), placed on the ground found by util.vertRaycast.
- unitsInt: 0 or other = m/s, 1 = mph, 2 = kph (util.msToMph / util.msToKph).
- Failing speeds (vels/velLimits empty), 30.0 m/s is used.
- renderWorldGraphNodes uses the kd-tree graph.kdNodes; the graph expects nodeX/nodeY/nodeZ/nodeDepth, optionally nodeGroupId, groupCols, defaultNodeCol and sphereRadius (default 1.5).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData)` | Draws the chosen navGraph nodes with a large pulsing sphere (to indicate they are part of the selection) and a numbered label. | 249 |
| `editor_toolUtilities_render_graph.renderGraphPath(path, graphData)` | Draws a graph path: path node spheres and lines between consecutive nodes. | 236 |
| `editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode)` | Draws the navigation graph: triangulated ribbons between spheres, centerline and node spheres with halo. The hovered node pulses. | 204 |
| `editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale)` | Draws the speed bars of a spline: ceiling curve (Catmull-Rom over barPoints) colored by height, drop lines to the ground and speed labels at each point. No effect for fewer than 2 nodes. | 31 |
| `editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit)` | Like renderVelocities for a graph path: if spline.divPoints exists, the curve follows the computed navgraph path and speeds are linearly interpolated between the chosen nodes (graphNodes/graphPath); otherwise falls back to barPoints. Labels only at the chosen nodes. | 70 |
| `editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col)` | Draws enlarged background spheres behind a list of world graph nodes (highlighting). | 302 |
| `editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters)` | Draws the spheres of the world AI graph nodes located within the given radius around the camera (kd-tree query). The sphere is placed at nodeZ + nodeDepth + 0.05 m and colored by group if groupCols exists. | 258 |

### Parameter details

#### `editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData)`

Draws the chosen navGraph nodes with a large pulsing sphere (to indicate they are part of the selection) and a numbered label.

- `nodes` (*table*) : List of chosen node keys.
- `graphData` (*table*) : Graph data with the nodes field.

#### `editor_toolUtilities_render_graph.renderGraphPath(path, graphData)`

Draws a graph path: path node spheres and lines between consecutive nodes.

- `path` (*table*) : List of node keys in graphData.nodes.
- `graphData` (*table*) : Graph data with the nodes field.

#### `editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode)`

Draws the navigation graph: triangulated ribbons between spheres, centerline and node spheres with halo. The hovered node pulses.

- `navGraph` (*table|nil*) : Graph with lines (pL, pR, qL, qR, cL, cR) and nodes (table of vec3).
- `hoverNode` (*vec3|nil*) : Hovered node (compared by identity).

#### `editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale)`

Draws the speed bars of a spline: ceiling curve (Catmull-Rom over barPoints) colored by height, drop lines to the ground and speed labels at each point. No effect for fewer than 2 nodes.

- `spline` (*table*) : Spline with nodes, barPoints, vels, velLimits, isLoop.
- `isBarsLimit` (*boolean*) : true: uses velLimits (limits), false: vels (actual values).
- `unitsInt` (*integer*) : Display unit: 0 m/s, 1 mph, 2 kph.
- `elevScale` (*number*) : Height corresponding to the red of the color ramp.

#### `editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit)`

Like renderVelocities for a graph path: if spline.divPoints exists, the curve follows the computed navgraph path and speeds are linearly interpolated between the chosen nodes (graphNodes/graphPath); otherwise falls back to barPoints. Labels only at the chosen nodes.

- `spline` (*table*) : Spline with graphNodes, graphPath, divPoints, barPoints, vels, velLimits, isLoop.
- `unitsInt` (*integer*) : Display unit: 0 m/s, 1 mph, 2 kph.
- `elevScale` (*number*) : Elevation color scale.
- `isBarsLimit` (*boolean*) : true: velLimits, false: vels.

#### `editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col)`

Draws enlarged background spheres behind a list of world graph nodes (highlighting).

- `graph` (*table|nil*) : World graph.
- `drawRadiusMeters` (*number*) : Drawing radius around the camera, in meters.
- `nodeIds` (*integer[]*) : Node identifiers (values <= 0 are ignored).
- `nodeIdCount` (*integer*) : Number of valid identifiers in nodeIds.
- `sphereRadiusMul` (*number|nil*) : Radius multiplier (default 1.6).
- `col` (*integer|nil*) : Packed color (default style.colourNodeDull).

#### `editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters)`

Draws the spheres of the world AI graph nodes located within the given radius around the camera (kd-tree query). The sphere is placed at nodeZ + nodeDepth + 0.05 m and colored by group if groupCols exists.

- `graph` (*table|nil*) : World graph (nodeCount, kdNodes, nodeX, nodeY, nodeZ, nodeDepth...).
- `drawRadiusMeters` (*number*) : Drawing radius around the camera, in meters.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/render/graph.lua`.*
