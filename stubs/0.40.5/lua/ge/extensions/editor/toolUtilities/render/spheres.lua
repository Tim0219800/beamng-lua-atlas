---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/spheres.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_render_spheres` : `extensions.load("editor_toolUtilities_render_spheres")`, puis la globale `editor_toolUtilities_render_spheres`
---@class editor_toolUtilities_render_spheres
editor_toolUtilities_render_spheres = {}

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:122
---@param p any
function editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:112
---@param p any
function editor_toolUtilities_render_spheres.drawPathNode(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:113
---@param p any
function editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:43
---@param p any
function editor_toolUtilities_render_spheres.drawSphereBar(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:191
---@param p any
function editor_toolUtilities_render_spheres.drawSphereBarGhost(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:49
---@param p any
function editor_toolUtilities_render_spheres.drawSphereBarHover(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:188
---@param p any
function editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:31
---@param p any
---@param scale any
---@param col any
function editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:154
---@param p any
---@param isActive any
function editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive) end

--- Footprint default: green so it stands apart from nodes and cyan bar handles.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:76
---@param p any
function editor_toolUtilities_render_spheres.drawSphereCurveHandle(p) end

--- Curve (edge-bend / corner-radius) apex handle, colour-parametrised so each tool can theme it (footprint = green, the hero-road
---  engineered corner knob = its own palette green). Base is a steady dot with a soft glow; hover pulses a larger, brighter glow.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:61
---@param p any
---@param coreCol any
---@param glowCol any
function editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:77
---@param p any
function editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:66
---@param p any
---@param coreCol any
---@param glowCol any
function editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:163
---@param p any
function editor_toolUtilities_render_spheres.drawSphereHighlight(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:177
---@param p any
function editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:78
---@param p any
function editor_toolUtilities_render_spheres.drawSphereHighlightHover(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:88
---@param p any
---@param radius any
function editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:95
---@param p any
function editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:105
---@param p any
---@param radius any
function editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:153
---@param p any
---@param scale any
---@param col any
function editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:144
---@param p any
function editor_toolUtilities_render_spheres.drawSphereJunction(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:150
---@param p any
function editor_toolUtilities_render_spheres.drawSphereJunctionDull(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:185
---@param p any
function editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:131
---@param p any
function editor_toolUtilities_render_spheres.drawSphereNode(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:162
---@param p any
function editor_toolUtilities_render_spheres.drawSphereNodeDull(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:170
---@param p any
function editor_toolUtilities_render_spheres.drawSphereNodeForeground(p) end

--- X-ray ghosts: no depth test, faint, so only the part of a handle buried in terrain or a mesh reads as a ghost.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:182
---@param p any
function editor_toolUtilities_render_spheres.drawSphereNodeGhost(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:137
---@param p any
function editor_toolUtilities_render_spheres.drawSphereNodeLocked(p) end

---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:37
---@param p any
function editor_toolUtilities_render_spheres.drawSphereRib(p) end

--- Public interface.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:26
---@param d any
function editor_toolUtilities_render_spheres.getSphereScale(d) end

