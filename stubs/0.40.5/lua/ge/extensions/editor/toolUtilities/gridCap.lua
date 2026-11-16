---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/gridCap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds a "cap" of triangles over an outline that must follow a height field: a square grid aligned with the grain of the outline, clipped to that outline. Each cell entirely inside the outline gives two triangles at the field's heights; only the cells crossed by the outline are clipped (polyBool), which avoids very long or sliver triangles. A Delaunay pass then improves the mesh.
--- Access: extension `editor_toolUtilities_gridCap`: `extensions.load("editor_toolUtilities_gridCap")`, then the global `editor_toolUtilities_gridCap`
---@class editor_toolUtilities_gridCap
editor_toolUtilities_gridCap = {}

--- Builds the cap on the given rings (the outer outline, then its holes; open or closed) in world coordinates. Works in the grain frame where cells are square. Returns nil if no triangle is produced.
---Source: lua/ge/extensions/editor/toolUtilities/gridCap.lua:206
---@param rings table[] Rings of points {x, y, z?}: the outline then the holes.
---@param cf table The grain: ax, ay (along), inX, inY (across).
---@param zAt function Height field zAt(x, y) -> z, in world.
---@param cell number Grid step (m).
---@return table|nil  The flat mesh { x, y, z, tri, nv, nt } or nil.
function editor_toolUtilities_gridCap.build(rings, cf, zAt, cell) end

--- Filters the rings that can touch a cell of the grid on which the cap of the 'outer' outline is laid (box in the grain frame, rounded to the grid, plus a small margin). The others do not change the result.
---Source: lua/ge/extensions/editor/toolUtilities/gridCap.lua:330
---@param outer table Outer outline.
---@param rings table[] Candidate rings.
---@param cf table The grain (ax, ay, inX, inY).
---@param cell number Grid step (m).
---@return table[]  Sublist of reachable rings.
function editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell) end

