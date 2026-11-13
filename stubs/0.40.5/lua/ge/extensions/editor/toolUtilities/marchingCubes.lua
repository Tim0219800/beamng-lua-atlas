---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/marchingCubes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_marchingCubes` : `extensions.load("editor_toolUtilities_marchingCubes")`, puis la globale `editor_toolUtilities_marchingCubes`
---@class editor_toolUtilities_marchingCubes
editor_toolUtilities_marchingCubes = {}

--- Extract the iso=0 surface of `sampleFn(sampleCtx, x, y, z)` (POSITIVE-INSIDE) over the AABB `bounds` at grid spacing `cell`.
---  Returns an SoA indexed mesh { vx,vy,vz (positions), ta,tb,tc (1-based tri corner indices), nv, nt }, or nil if empty.
---  store (optional): a pre-sampled shared value grid, so neighbouring chunks don't re-evaluate the field on their shared corner
---  planes (that seam re-sampling was ~1/6 of all field calls). When given, the corner values are COPIED from it instead of calling
---  sampleFn; the copy is bit-identical to sampling here (same world corners, deterministic field). Fields:
---    sval      -- flat value array, one column's z-strip after another
---    colBase   -- per global corner-column: the offset such that sval[colBase[col] + gk] is the value at global (col, gk)
---    colStride -- corner columns per grid row (= global NX + 1); col = gj*colStride + gi + 1 (1-based)
---    gi0,gj0,gk0 -- this chunk's global corner origin (its local corner (i,j,k) is global (gi0+i, gj0+j, gk0+k))
---Source : lua/ge/extensions/editor/toolUtilities/marchingCubes.lua:160
---@param bounds any
---@param cell any
---@param sampleFn any
---@param sampleCtx any
---@param store any
function editor_toolUtilities_marchingCubes.polygonize(bounds, cell, sampleFn, sampleCtx, store) end

---@type number
ci = nil
