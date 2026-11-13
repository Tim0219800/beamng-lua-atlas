# `editor_toolUtilities_marchingCubes`

*Fichier : `lua/ge/extensions/editor/toolUtilities/marchingCubes.lua` · VM : Game Engine (GE) · 267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_marchingCubes` : `extensions.load("editor_toolUtilities_marchingCubes")`, puis la globale `editor_toolUtilities_marchingCubes`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_marchingCubes.polygonize(bounds, cell, sampleFn, sampleCtx, store)` | Extract the iso=0 surface of `sampleFn(sampleCtx, x, y, z)` (POSITIVE-INSIDE) over the AABB `bounds` at grid spacing `cell`.<br> Returns an SoA indexed mesh { vx,vy,vz (positions), ta,tb,tc (1-based tri corner indices), nv, nt }, or nil if empty.<br> store (optional): a pre-sampled shared value grid, so neighbouring chunks don't re-evaluate the field on their shared corner<br> planes (that seam re-sampling was ~1/6 of all field calls). When given, the corner values are COPIED from it instead of calling<br> sampleFn; the copy is bit-identical to sampling here (same world corners, deterministic field). Fields:<br>   sval      -- flat value array, one column's z-strip after another<br>   colBase   -- per global corner-column: the offset such that sval[colBase[col] + gk] is the value at global (col, gk)<br>   colStride -- corner columns per grid row (= global NX + 1); col = gj*colStride + gi + 1 (1-based)<br>   gi0,gj0,gk0 -- this chunk's global corner origin (its local corner (i,j,k) is global (gi0+i, gj0+j, gk0+k)) | 160 |

**Globales affectées :** `ci`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/marchingCubes.lua`.*
