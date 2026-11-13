# `editor_toolUtilities_render_graph`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/graph.lua` · VM : Game Engine (GE) · 346 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_graph` : `extensions.load("editor_toolUtilities_render_graph")`, puis la globale `editor_toolUtilities_render_graph`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_graph.renderChosenNodes(nodes, graphData)` | Renders the chosen navGraph nodes with special indicators. | 249 |
| `editor_toolUtilities_render_graph.renderGraphPath(path, graphData)` | Renders the given graph path. | 236 |
| `editor_toolUtilities_render_graph.renderNavGraph(navGraph, hoverNode)` | Renders the nav graph. | 204 |
| `editor_toolUtilities_render_graph.renderVelocities(spline, isBarsLimit, unitsInt, elevScale)` | Renders the velocities for the given spline.<br> [spline - The spline to render the velocities for.]<br> [isBarsLimit - Whether the velocities are limits, or actual values.]<br> [unitsInt - The units to render the velocities in.] | 31 |
| `editor_toolUtilities_render_graph.renderVelocitiesGraph(spline, unitsInt, elevScale, isBarsLimit)` | Renders the velocities for the given graph path.<br> [spline - The spline to render the velocities for.]<br> [unitsInt - The units to render the velocities in.]<br> [elevScale - The scale factor for elevation markups.]<br> [isBarsLimit - Whether to use velLimits (true) or vels (false) for bar heights.] | 70 |
| `editor_toolUtilities_render_graph.renderWorldGraphNodeBackdrops(graph, drawRadiusMeters, nodeIds, nodeIdCount, sphereRadiusMul, col)` |  | 302 |
| `editor_toolUtilities_render_graph.renderWorldGraphNodes(graph, drawRadiusMeters)` |  | 258 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/graph.lua`.*
