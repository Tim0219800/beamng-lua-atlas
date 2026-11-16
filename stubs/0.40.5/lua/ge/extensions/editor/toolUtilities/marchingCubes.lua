---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/marchingCubes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Surface extraction by marching cubes (Lorensen & Cline 1987, tables after Paul Bourke): produces a triangle mesh from a scalar density field sampled on a regular 3D grid, at the iso = 0 crossing, with F > 0 = inside (solid). Does not compute normals: the caller recomputes them after welding/decimation.
--- Access: extension `editor_toolUtilities_marchingCubes`: `extensions.load("editor_toolUtilities_marchingCubes")`, then the global `editor_toolUtilities_marchingCubes`
---@class editor_toolUtilities_marchingCubes
editor_toolUtilities_marchingCubes = {}

--- Extracts the iso = 0 surface of sampleFn(sampleCtx, x, y, z) (positive = inside) over the bounds box with a grid of step cell. Returns an indexed mesh as a structure of arrays { vx, vy, vz (positions), ta, tb, tc (1-based triangle corner indices), nv, nt }, or nil if it is empty. If 'store' is provided, the corner values are copied from this pre-sampled grid instead of calling sampleFn, which avoids re-evaluating the field on the corner planes shared between neighboring blocks.
---Source: lua/ge/extensions/editor/toolUtilities/marchingCubes.lua:160
---@param bounds table Box { minx, miny, minz, maxx, maxy, maxz }.
---@param cell number Grid step.
---@param sampleFn function sampleFn(sampleCtx, x, y, z) -> number.
---@param sampleCtx any Context passed as is to sampleFn.
---@param store table|nil Shared value grid: sval (flat values, one z column after another), colBase (offset per global corner column), colStride (columns per row = global NX + 1; col = gj*colStride + gi + 1), gi0, gj0, gk0 (global origin of this block's corners).
---@return table|nil  { vx, vy, vz, ta, tb, tc, nv, nt } or nil.
function editor_toolUtilities_marchingCubes.polygonize(bounds, cell, sampleFn, sampleCtx, store) end

---@type number
ci = nil
