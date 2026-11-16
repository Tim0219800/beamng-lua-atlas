# `editor_toolUtilities_render_tris`

*File: `lua/ge/extensions/editor/toolUtilities/render/tris.lua` · VM: Game Engine (GE) · 121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_render_tris`: `extensions.load("editor_toolUtilities_render_tris")`, then the global `editor_toolUtilities_render_tris`

Solid triangle drawing for the spline editing tools (from the old render.lua). Triangles filtered at 600 m from the camera, filling of simple polygons (ear clipping triangulation) and filling of 2D regions with holes by scanline (even-odd rule). Used for surface previews in the editor.

## Notes

- drawTriCulled only draws if all three vertices are within 600 m of the camera; the triangle is drawn solid with debugDraw.drawTriSolid.
- drawFilledRegions2D is intended for previews, not final geometry: the staircase effect due to the scan step on diagonal edges is hidden by the exact outline drawn by the caller.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_render_tris.drawFilledPolygon(verts, col)` | Fills a simple polygon, possibly concave, whose vertices are vec3s already at the drawing height. Triangulates in 2D (x,y) by ear clipping (geom.triangulatePolygon2D), then draws the triangles. No effect for fewer than 3 vertices or a degenerate ring. | 40 |
| `editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step)` | Fills a set of 2D regions ({x=,y=} rings), holes included, by horizontal scan with the even-odd rule: a point inside an odd number of rings is filled. Handles concave shapes and disjoint regions without triangulation. | 56 |
| `editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c)` | Active surface triangle (colourActiveSurf). | 35 |
| `editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col)` | Draws a solid triangle of color col if it is entirely within 600 m of the camera. | 27 |
| `editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c)` | Unselected surface triangle (colourNotSelectedSurf). | 33 |
| `editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c)` | Preview surface triangle (colourPreviewSurf). | 34 |

### Parameter details

#### `editor_toolUtilities_render_tris.drawFilledPolygon(verts, col)`

Fills a simple polygon, possibly concave, whose vertices are vec3s already at the drawing height. Triangulates in 2D (x,y) by ear clipping (geom.triangulatePolygon2D), then draws the triangles. No effect for fewer than 3 vertices or a degenerate ring.

- `verts` (*vec3[]*) : Polygon vertices.
- `col` (*integer*) : Packed color.

#### `editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step)`

Fills a set of 2D regions ({x=,y=} rings), holes included, by horizontal scan with the even-odd rule: a point inside an odd number of rings is filled. Handles concave shapes and disjoint regions without triangulation.

- `regions` (*table*) : List of rings, each a list of {x=,y=}.
- `col` (*integer*) : Packed color.
- `zFn` (*function*) : zFn(x, y) returns the drawing height (e.g. terrain height).
- `step` (*number|nil*) : Scan step; auto between 0.25 and 3 m (height/100) if nil.

#### `editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c)`

Active surface triangle (colourActiveSurf).

- `a` (*vec3*) : Vertex 1.
- `b` (*vec3*) : Vertex 2.
- `c` (*vec3*) : Vertex 3.

#### `editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col)`

Draws a solid triangle of color col if it is entirely within 600 m of the camera.

- `a` (*vec3*) : Vertex 1.
- `b` (*vec3*) : Vertex 2.
- `c` (*vec3*) : Vertex 3.
- `col` (*integer*) : Packed color.

#### `editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c)`

Unselected surface triangle (colourNotSelectedSurf).

- `a` (*vec3*) : Vertex 1.
- `b` (*vec3*) : Vertex 2.
- `c` (*vec3*) : Vertex 3.

#### `editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c)`

Preview surface triangle (colourPreviewSurf).

- `a` (*vec3*) : Vertex 1.
- `b` (*vec3*) : Vertex 2.
- `c` (*vec3*) : Vertex 3.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/render/tris.lua`.*
