---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/edgeHandles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool utility for "gate" handles that can be moved along the outline of a polygon (ring: list of {x,y} points). A gate is { edge, t, id }: edge index and position t (0..1) on that edge. Provides snapping to the outline, default gates (ends of the long axis), the geometry of a floating handle outside the edge and its drawing via debugDraw.
--- Access: extension `editor_toolUtilities_edgeHandles`: `extensions.load("editor_toolUtilities_edgeHandles")`, then the global `editor_toolUtilities_edgeHandles`
---@class editor_toolUtilities_edgeHandles
editor_toolUtilities_edgeHandles = {}

--- Two default gates at opposite ends of the ring's long axis (entry, exit).
---Source: lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:99
---@param ring table List of points {x,y}
---@return table  Entry gate { edge, t }
---@return table  Exit gate { edge, t }
function editor_toolUtilities_edgeHandles.defaultGates(ring) end

--- Draws the handle (points from handleGeom): stem from the edge to the bar, bar with end points, central button that pulses on hover.
---Source: lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:127
---@param gp vec3 Point on the edge
---@param cp vec3 Center of the bar
---@param e1 vec3 End 1
---@param e2 vec3 End 2
---@param base integer Base color (packed)
---@param glow integer Halo color (packed)
---@param hovered boolean true if hovered
function editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered) end

--- World position of a gate and the outward unit normal of its edge (away from the ring center).
---Source: lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:84
---@param ring table List of points {x,y}
---@param gate table { edge, t }
---@return number  wx
---@return number  wy
---@return number  nx (outward normal)
---@return number  ny (outward normal)
function editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate) end

--- Geometry of a gate's grabbable handle: the bar floats at outDist meters off the edge and extends halfWidth meters on each side.
---Source: lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:115
---@param ring table List of points {x,y}
---@param gate table|nil { edge, t }
---@param outDist number Distance of the bar from the edge (m)
---@param halfWidth number Half-width of the bar (m)
---@param liftFn function|nil function(x,y) -> vec3 that places a point on the terrain; z=0 plane by default.
---@return vec3|nil  Point on the edge
---@return vec3  Center of the bar (grab button)
---@return vec3  End 1 of the bar
---@return vec3  End 2 of the bar
function editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn) end

--- Snaps a world point (px,py) to the nearest gate on the outline.
---Source: lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:68
---@param ring table List of points {x=,y=}
---@param px number world x
---@param py number world y
---@return table  { edge = edge index, t = position 0..1 }
function editor_toolUtilities_edgeHandles.nearestGate(ring, px, py) end

--- Gives a unique id (Engine.generateUUID) to each gate that has none, then returns the list. A gate is otherwise identified only by its position in the list, which changes when a previous gate is removed.
---Source: lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:60
---@param gates table|nil List of gates { edge, t, id? }
---@return table|nil  The same list, with named gates.
function editor_toolUtilities_edgeHandles.tagGates(gates) end

