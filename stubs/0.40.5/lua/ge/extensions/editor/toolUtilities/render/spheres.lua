---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/spheres.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drawing of debug spheres and handles for the spline editing tools (from the old render.lua). Leaf module: depends on utils/debugDraw and the shared style. The radius is proportional to the distance to the camera (constant apparent size up to 60 m, then fixed world size), via getSphereScale which the render/spline, transport and graph modules reuse. Contains nodes, junctions, bar and curve handles, highlights (hover, selection, pulsing over time) and "X-ray" ghosts without depth test.
--- Access: extension `editor_toolUtilities_render_spheres`: `extensions.load("editor_toolUtilities_render_spheres")`, then the global `editor_toolUtilities_render_spheres`
---@class editor_toolUtilities_render_spheres
editor_toolUtilities_render_spheres = {}

--- Pulsing halo of a hovered navGraph node.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:122
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p) end

--- Path node (colourPathNode).
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:112
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawPathNode(p) end

--- Large pulsing node of the selected navigation graph.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:113
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p) end

--- Bar handle (halo then core).
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:43
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereBar(p) end

--- X-ray ghost of the bar handle.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:191
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereBarGhost(p) end

--- Hovered bar handle: larger pulsing halo.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:49
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereBarHover(p) end

--- X-ray ghost of the corner handle.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:188
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p) end

--- Sphere at the distance-linked scale, if the point is within 600 m.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:31
---@param p vec3 Center.
---@param scale number Scale multiplier.
---@param col integer Packed color.
function editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col) end

--- Mouse cursor sphere on the map; distance capped at 100 m for the size. Not filtered.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:154
---@param p vec3 Position.
---@param isActive boolean|nil true for the active color, otherwise inactive color.
function editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive) end

--- Curve apex handle (edge bending, corner radius), green by default.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:76
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereCurveHandle(p) end

--- Curve handle with core and halo colors chosen by the tool: stable point with soft halo.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:61
---@param p vec3 Center.
---@param coreCol integer Core color.
---@param glowCol integer Halo color.
function editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol) end

--- Hovered curve handle (pulsing halo).
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:77
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p) end

--- Hovered version of drawSphereCurveHandleCol: larger, brighter, pulsing halo.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:66
---@param p vec3 Center.
---@param coreCol integer Core color.
---@param glowCol integer Halo color.
function editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol) end

--- Node highlight (colourHighlight, no depth test), filtered at 600 m.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:163
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereHighlight(p) end

--- Node highlight without distance filtering.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:177
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p) end

--- Pulsing hover highlight, at the distance-linked scale.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:78
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereHighlightHover(p) end

--- Pulsing hover highlight with fixed world radius.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:88
---@param p vec3 Center.
---@param radius number Base radius in meters.
function editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius) end

--- Pulsing selection highlight, at the distance-linked scale.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:95
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p) end

--- Pulsing selection highlight with fixed world radius.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:105
---@param p vec3 Center.
---@param radius number Base radius in meters.
function editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius) end

--- Sphere at the distance-linked scale, without distance filtering.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:153
---@param p vec3 Center.
---@param scale number Scale multiplier.
---@param col integer Packed color.
function editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col) end

--- Junction center (halo then core).
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:144
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereJunction(p) end

--- Dimmed junction center.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:150
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereJunctionDull(p) end

--- X-ray ghost of a junction.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:185
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p) end

--- Standard node: halo then core.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:131
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereNode(p) end

--- Dimmed node.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:162
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereNodeDull(p) end

--- Node (halo then core) drawn without depth test.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:170
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereNodeForeground(p) end

--- X-ray ghost of a node: only the part buried in the terrain or a mesh is visible.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:182
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereNodeGhost(p) end

--- Locked node (colourNodeLocked colors).
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:137
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereNodeLocked(p) end

--- Rib handle: halo then core.
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:37
---@param p vec3 Center.
function editor_toolUtilities_render_spheres.drawSphereRib(p) end

--- Sphere scale factor for a distance d to the camera: d capped at 60 m, multiplied by a slope (1/sqrt(30) * 0.8).
---Source: lua/ge/extensions/editor/toolUtilities/render/spheres.lua:26
---@param d number Camera-to-point distance in meters.
---@return number  Base scale.
function editor_toolUtilities_render_spheres.getSphereScale(d) end

