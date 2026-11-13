# `editor_toolUtilities_render_tris`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/tris.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_tris` : `extensions.load("editor_toolUtilities_render_tris")`, puis la globale `editor_toolUtilities_render_tris`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_tris.drawFilledPolygon(verts, col)` | Fill a simple (possibly concave) polygon given its vertices as vec3s already lifted to the draw height. Ear-clips<br> in 2D (x,y) via geom, then draws solid, culled triangles in packed colour `col`. No-op for < 3 verts or a<br> degenerate ring (triangulation returns nothing, so the caller's outline is all that shows). | 40 |
| `editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step)` | Fill a set of 2D regions (each ring = array of {x=,y=}), holes included, using the EVEN-ODD rule via horizontal<br> scanlines: a point inside an odd number of rings is filled, so opposite-wound hole rings punch true voids and<br> overlapping outer rings don't double up. Handles concave shapes and multiple disjoint regions with no<br> triangulation. `zFn(x,y)` lifts each corner to the draw height (e.g. terrain height); `step` is the scan spacing<br> (auto-sized from the bounds when omitted). The scan-resolution staircase on diagonal edges is hidden by the<br> caller's exact outline pass. Meant for preview fills, not for cooked geometry. | 56 |
| `editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c)` |  | 35 |
| `editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col)` | Public interface. | 27 |
| `editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c)` |  | 33 |
| `editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c)` |  | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/tris.lua`.*
