---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/tris.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_render_tris` : `extensions.load("editor_toolUtilities_render_tris")`, puis la globale `editor_toolUtilities_render_tris`
---@class editor_toolUtilities_render_tris
editor_toolUtilities_render_tris = {}

--- Fill a simple (possibly concave) polygon given its vertices as vec3s already lifted to the draw height. Ear-clips
---  in 2D (x,y) via geom, then draws solid, culled triangles in packed colour `col`. No-op for < 3 verts or a
---  degenerate ring (triangulation returns nothing, so the caller's outline is all that shows).
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:40
---@param verts any
---@param col any
function editor_toolUtilities_render_tris.drawFilledPolygon(verts, col) end

--- Fill a set of 2D regions (each ring = array of {x=,y=}), holes included, using the EVEN-ODD rule via horizontal
---  scanlines: a point inside an odd number of rings is filled, so opposite-wound hole rings punch true voids and
---  overlapping outer rings don't double up. Handles concave shapes and multiple disjoint regions with no
---  triangulation. `zFn(x,y)` lifts each corner to the draw height (e.g. terrain height); `step` is the scan spacing
---  (auto-sized from the bounds when omitted). The scan-resolution staircase on diagonal edges is hidden by the
---  caller's exact outline pass. Meant for preview fills, not for cooked geometry.
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:56
---@param regions any
---@param col any
---@param zFn any
---@param step any
function editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step) end

---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:35
---@param a any
---@param b any
---@param c any
function editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c) end

--- Public interface.
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:27
---@param a any
---@param b any
---@param c any
---@param col any
function editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col) end

---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:33
---@param a any
---@param b any
---@param c any
function editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c) end

---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:34
---@param a any
---@param b any
---@param c any
function editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c) end

