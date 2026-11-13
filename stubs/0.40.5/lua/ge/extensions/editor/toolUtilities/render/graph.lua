---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/graph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_render_graph` : `extensions.load("editor_toolUtilities_render_graph")`, puis la globale `editor_toolUtilities_render_graph`
---@class editor_toolUtilities_render_graph
editor_toolUtilities_render_graph = {}

--- Renders the chosen navGraph nodes with special indicators.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:249
---@param nodes any
---@param graphData any
function editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData) end

--- Renders the given graph path.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:236
---@param path any
---@param graphData any
function editor_toolUtilities_render_graph.renderGraphPath(path, graphData) end

--- Renders the nav graph.
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:204
---@param navGraph any
---@param hoverNode any
function editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode) end

--- Renders the velocities for the given spline.
---  [spline - The spline to render the velocities for.]
---  [isBarsLimit - Whether the velocities are limits, or actual values.]
---  [unitsInt - The units to render the velocities in.]
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:31
---@param spline any
---@param isBarsLimit any
---@param unitsInt any
---@param elevScale any
function editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale) end

--- Renders the velocities for the given graph path.
---  [spline - The spline to render the velocities for.]
---  [unitsInt - The units to render the velocities in.]
---  [elevScale - The scale factor for elevation markups.]
---  [isBarsLimit - Whether to use velLimits (true) or vels (false) for bar heights.]
---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:70
---@param spline any
---@param unitsInt any
---@param elevScale any
---@param isBarsLimit any
function editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit) end

---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:302
---@param graph any
---@param drawRadiusMeters any
---@param nodeIds any
---@param nodeIdCount any
---@param sphereRadiusMul any
---@param col any
function editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col) end

---Source : lua/ge/extensions/editor/toolUtilities/render/graph.lua:258
---@param graph any
---@param drawRadiusMeters any
function editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters) end

