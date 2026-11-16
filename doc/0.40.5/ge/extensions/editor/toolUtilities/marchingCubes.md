# `editor_toolUtilities_marchingCubes`

*File: `lua/ge/extensions/editor/toolUtilities/marchingCubes.lua` · VM: Game Engine (GE) · 267 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_marchingCubes`: `extensions.load("editor_toolUtilities_marchingCubes")`, then the global `editor_toolUtilities_marchingCubes`

Surface extraction by marching cubes (Lorensen & Cline 1987, tables after Paul Bourke): produces a triangle mesh from a scalar density field sampled on a regular 3D grid, at the iso = 0 crossing, with F > 0 = inside (solid). Does not compute normals: the caller recomputes them after welding/decimation.

## Notes

- The working buffers (gVal, gEdgeCache) are reused between calls; the vertex arrays are recreated on each call because the caller keeps them.
- The field is evaluated on a grid of nx = max(2, floor((max-min)/cell)+2) corners per axis.
- Auto .md page: the global 'ci' is flagged as assigned by the module, which suggests a forgotten local variable (inferred from automatic analysis).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_marchingCubes.polygonize(bounds, cell, sampleFn, sampleCtx, store)` | Extracts the iso = 0 surface of sampleFn(sampleCtx, x, y, z) (positive = inside) over the bounds box with a grid of step cell. Returns an indexed mesh as a structure of arrays { vx, vy, vz (positions), ta, tb, tc (1-based triangle corner indices), nv, nt }, or nil if it is empty. If 'store' is provided, the corner values are copied from this pre-sampled grid instead of calling sampleFn, which avoids re-evaluating the field on the corner planes shared between neighboring blocks. | 160 |

### Parameter details

#### `editor_toolUtilities_marchingCubes.polygonize(bounds, cell, sampleFn, sampleCtx, store)`

Extracts the iso = 0 surface of sampleFn(sampleCtx, x, y, z) (positive = inside) over the bounds box with a grid of step cell. Returns an indexed mesh as a structure of arrays { vx, vy, vz (positions), ta, tb, tc (1-based triangle corner indices), nv, nt }, or nil if it is empty. If 'store' is provided, the corner values are copied from this pre-sampled grid instead of calling sampleFn, which avoids re-evaluating the field on the corner planes shared between neighboring blocks.

- `bounds` (*table*) : Box { minx, miny, minz, maxx, maxy, maxz }.
- `cell` (*number*) : Grid step.
- `sampleFn` (*function*) : sampleFn(sampleCtx, x, y, z) -> number.
- `sampleCtx` (*any*) : Context passed as is to sampleFn.
- `store` (*table|nil*) : Shared value grid: sval (flat values, one z column after another), colBase (offset per global corner column), colStride (columns per row = global NX + 1; col = gj*colStride + gi + 1), gi0, gj0, gk0 (global origin of this block's corners).
- **returns**: table|nil { vx, vy, vz, ta, tb, tc, nv, nt } or nil.

**Globals assigned:** `ci`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/marchingCubes.lua`.*
