---@meta
-- tim19Atlas stub generated from lua/common/interpolateScatteredMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 2D interpolation over unstructured points using Delaunay triangulation (Bowyer-Watson). loadData builds the triangulation once; get(x, y) finds the triangle containing the point by walking from neighboring triangle to neighboring triangle (no allocation) and interpolates in barycentric coordinates. Useful for z(x, y) maps whose samples do not form a grid.
--- Access: `require("interpolateScatteredMap")`
---@class interpolateScatteredMap
local interpolateScatteredMap = {}

--- Creates an empty interpolation object (valid = false, outsideMode 'default', defaultValue 0).
---Source: lua/common/interpolateScatteredMap.lua:491
---@return table  Object with methods loadData, get, validate, outsideValue, bruteForce, exportTriangles.
function interpolateScatteredMap.new() end

--- Object returned by new(). Fields: tris, triCount, hullEdges, valid, outsideMode, defaultValue, minX/maxX/minY/maxY, sx, sy.
---@class interpolateScatteredMap_interpolateScatteredMap
local interpolateScatteredMap_interpolateScatteredMap = {}

--- Linear search for the triangle containing (x, y); fallback when the walk fails.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/interpolateScatteredMap.lua:dyn
---@param x number X coordinate.
---@param y number Y coordinate.
---@return integer  Triangle index, 0 if none.
function interpolateScatteredMap_interpolateScatteredMap:bruteForce(x, y) end

--- Rebuilds the triangles in input coordinates for debug/visualization.
---Source: lua/common/interpolateScatteredMap.lua:dyn
---@return table[]  List {ax, ay, bx, by, cx, cy, va, vb, vc}.
function interpolateScatteredMap_interpolateScatteredMap:exportTriangles() end

--- Returns the interpolated value at the point (x, y). Outside the convex hull, depends on outsideMode.
---Source: lua/common/interpolateScatteredMap.lua:dyn
---@param x number X coordinate, in the same units as the points after applying xScale (inferred from code: get does not apply xScale).
---@param y number Y coordinate.
---@return number|nil  Value; nil only if outsideMode == 'nil' and the point is outside the hull.
function interpolateScatteredMap_interpolateScatteredMap:get(x, y) end

--- Loads the points, normalizes, deduplicates, triangulates and prepares the triangle neighborhood.
---Source: lua/common/interpolateScatteredMap.lua:dyn
---@param inputData table[] List of points {x, y, value} or {x=, y=, value=}.
---@param opts table|nil Options (see notes).
---@return table  self; check self.valid.
function interpolateScatteredMap_interpolateScatteredMap:loadData(inputData, opts) end

--- Value to return for a point outside the hull according to outsideMode (normally called by get; px, py in normalized coordinates).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/interpolateScatteredMap.lua:dyn
---@param px number Normalized x.
---@param py number Normalized y.
---@param ti integer Index of the current triangle (used in extrapolate mode).
---@return number|nil  Outside value.
function interpolateScatteredMap_interpolateScatteredMap:outsideValue(px, py, ti) end

--- Tests the map on the input points and returns the maximum error.
---Source: lua/common/interpolateScatteredMap.lua:dyn
---@param inputData table[] The original points.
---@param tolerance number|nil Tolerated error (default 1e-4).
---@return number  Maximum absolute error.
---@return boolean  true if <= tolerance.
function interpolateScatteredMap_interpolateScatteredMap:validate(inputData, tolerance) end

return interpolateScatteredMap
