---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/graph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendering of speed bars and the AI navigation graph (roadArchitect / drivePath lineage): speed bars and curve, navgraph node selection and overlay of the world AI graph. Separate from render.lua because only the graph and speed tools use it. Composite module that draws via render/spheres, lines, tris and markup, with its own pool of temporary vec3s.
--- Access: extension `editor_toolUtilities_render_graph`: `extensions.load("editor_toolUtilities_render_graph")`, then the global `editor_toolUtilities_render_graph`
---@class editor_toolUtilities_render_graph
editor_toolUtilities_render_graph = {}

--- Draws the chosen navGraph nodes with a large pulsing sphere (to indicate they are part of the selection) and a numbered label.
---Source: lua/ge/extensions/editor/toolUtilities/render/graph.lua:249
---@param nodes table List of chosen node keys.
---@param graphData table Graph data with the nodes field.
function editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData) end

--- Draws a graph path: path node spheres and lines between consecutive nodes.
---Source: lua/ge/extensions/editor/toolUtilities/render/graph.lua:236
---@param path table List of node keys in graphData.nodes.
---@param graphData table Graph data with the nodes field.
function editor_toolUtilities_render_graph.renderGraphPath(path, graphData) end

--- Draws the navigation graph: triangulated ribbons between spheres, centerline and node spheres with halo. The hovered node pulses.
---Source: lua/ge/extensions/editor/toolUtilities/render/graph.lua:204
---@param navGraph table|nil Graph with lines (pL, pR, qL, qR, cL, cR) and nodes (table of vec3).
---@param hoverNode vec3|nil Hovered node (compared by identity).
function editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode) end

--- Draws the speed bars of a spline: ceiling curve (Catmull-Rom over barPoints) colored by height, drop lines to the ground and speed labels at each point. No effect for fewer than 2 nodes.
---Source: lua/ge/extensions/editor/toolUtilities/render/graph.lua:31
---@param spline table Spline with nodes, barPoints, vels, velLimits, isLoop.
---@param isBarsLimit boolean true: uses velLimits (limits), false: vels (actual values).
---@param unitsInt integer Display unit: 0 m/s, 1 mph, 2 kph.
---@param elevScale number Height corresponding to the red of the color ramp.
function editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale) end

--- Like renderVelocities for a graph path: if spline.divPoints exists, the curve follows the computed navgraph path and speeds are linearly interpolated between the chosen nodes (graphNodes/graphPath); otherwise falls back to barPoints. Labels only at the chosen nodes.
---Source: lua/ge/extensions/editor/toolUtilities/render/graph.lua:70
---@param spline table Spline with graphNodes, graphPath, divPoints, barPoints, vels, velLimits, isLoop.
---@param unitsInt integer Display unit: 0 m/s, 1 mph, 2 kph.
---@param elevScale number Elevation color scale.
---@param isBarsLimit boolean true: velLimits, false: vels.
function editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit) end

--- Draws enlarged background spheres behind a list of world graph nodes (highlighting).
---Source: lua/ge/extensions/editor/toolUtilities/render/graph.lua:302
---@param graph table|nil World graph.
---@param drawRadiusMeters number Drawing radius around the camera, in meters.
---@param nodeIds integer[] Node identifiers (values <= 0 are ignored).
---@param nodeIdCount integer Number of valid identifiers in nodeIds.
---@param sphereRadiusMul number|nil Radius multiplier (default 1.6).
---@param col integer|nil Packed color (default style.colourNodeDull).
function editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col) end

--- Draws the spheres of the world AI graph nodes located within the given radius around the camera (kd-tree query). The sphere is placed at nodeZ + nodeDepth + 0.05 m and colored by group if groupCols exists.
---Source: lua/ge/extensions/editor/toolUtilities/render/graph.lua:258
---@param graph table|nil World graph (nodeCount, kdNodes, nodeX, nodeY, nodeZ, nodeDepth...).
---@param drawRadiusMeters number Drawing radius around the camera, in meters.
function editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters) end

