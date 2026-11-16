---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polyOffset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lateral offset of a 2D polyline whose every edge carries an outward normal. Handles corners by miter join, bevel (chamfer) or line intersection, with a miter limit for sharp angles. run builds a closed ribbon between the line and its offset.
--- Access: extension `editor_toolUtilities_polyOffset`: `extensions.load("editor_toolUtilities_polyOffset")`, then the global `editor_toolUtilities_polyOffset`
---@class editor_toolUtilities_polyOffset
---@field MITER_LIMIT number Maximum factor (4.0) of miter length relative to |d|.
editor_toolUtilities_polyOffset = {}

--- Intersection of two 2D lines P + t*D and Q + s*E. Returns nil if they are parallel (determinant < 1e-9).
---Source: lua/ge/extensions/editor/toolUtilities/polyOffset.lua:15
---@param px number x of the point of the first line.
---@param py number y of the point of the first line.
---@param dx number x of the direction of the first line.
---@param dy number y of the direction of the first line.
---@param qx number x of the point of the second line.
---@param qy number y of the point of the second line.
---@param ex number x of the direction of the second line.
---@param ey number y of the direction of the second line.
---@return number|nil  x of the intersection.
---@return number|nil  y of the intersection.
function editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey) end

--- Offset point of a vertex between two edge normals: the miter, brought back along its bisector when the angle is too sharp (limit MITER_LIMIT * |d|).
---Source: lua/ge/extensions/editor/toolUtilities/polyOffset.lua:24
---@param cx number x of the vertex.
---@param cy number y of the vertex.
---@param n1 table Normal {x,y} of the incoming edge.
---@param n2 table Normal {x,y} of the outgoing edge.
---@param d number Signed offset distance.
---@return number  x of the offset point.
---@return number  y of the offset point.
function editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d) end

--- Offsets a polyline laterally by the signed distance d. The corner join type is chosen by join: 'chamfer' (two points), 'miter' (one point per vertex) or other/nil (intersection of the offset edges, falling back to two points if too far).
---Source: lua/ge/extensions/editor/toolUtilities/polyOffset.lua:37
---@param pts table List of {x,y} points.
---@param nrm table Unit {x,y} normals, one per edge.
---@param d number Signed offset distance, in meters.
---@param join string|nil 'chamfer', 'miter' or nil for the intersection join.
---@return table  List of offset {x,y} points.
function editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join) end

--- Builds a closed ring going from the line to its offset: the base is sunk by overlap into the mass behind (opposite side), then the outer edge is traversed in reverse.
---Source: lua/ge/extensions/editor/toolUtilities/polyOffset.lua:75
---@param pts table List of {x,y} points.
---@param nrm table Normals per edge.
---@param d number Signed offset distance.
---@param join string|nil Join type, see polyline.
---@param overlap number|nil Sinking of the base (default 0.05 m).
---@return table|nil  Ring of {x,y} points, or nil if fewer than 2 points or |d| < 1e-4.
function editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap) end

