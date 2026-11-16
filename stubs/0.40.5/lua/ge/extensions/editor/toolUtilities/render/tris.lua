---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/tris.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Solid triangle drawing for the spline editing tools (from the old render.lua). Triangles filtered at 600 m from the camera, filling of simple polygons (ear clipping triangulation) and filling of 2D regions with holes by scanline (even-odd rule). Used for surface previews in the editor.
--- Access: extension `editor_toolUtilities_render_tris`: `extensions.load("editor_toolUtilities_render_tris")`, then the global `editor_toolUtilities_render_tris`
---@class editor_toolUtilities_render_tris
editor_toolUtilities_render_tris = {}

--- Fills a simple polygon, possibly concave, whose vertices are vec3s already at the drawing height. Triangulates in 2D (x,y) by ear clipping (geom.triangulatePolygon2D), then draws the triangles. No effect for fewer than 3 vertices or a degenerate ring.
---Source: lua/ge/extensions/editor/toolUtilities/render/tris.lua:40
---@param verts vec3[] Polygon vertices.
---@param col integer Packed color.
function editor_toolUtilities_render_tris.drawFilledPolygon(verts, col) end

--- Fills a set of 2D regions ({x=,y=} rings), holes included, by horizontal scan with the even-odd rule: a point inside an odd number of rings is filled. Handles concave shapes and disjoint regions without triangulation.
---Source: lua/ge/extensions/editor/toolUtilities/render/tris.lua:56
---@param regions table List of rings, each a list of {x=,y=}.
---@param col integer Packed color.
---@param zFn function zFn(x, y) returns the drawing height (e.g. terrain height).
---@param step number|nil Scan step; auto between 0.25 and 3 m (height/100) if nil.
function editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step) end

--- Active surface triangle (colourActiveSurf).
---Source: lua/ge/extensions/editor/toolUtilities/render/tris.lua:35
---@param a vec3 Vertex 1.
---@param b vec3 Vertex 2.
---@param c vec3 Vertex 3.
function editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c) end

--- Draws a solid triangle of color col if it is entirely within 600 m of the camera.
---Source: lua/ge/extensions/editor/toolUtilities/render/tris.lua:27
---@param a vec3 Vertex 1.
---@param b vec3 Vertex 2.
---@param c vec3 Vertex 3.
---@param col integer Packed color.
function editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col) end

--- Unselected surface triangle (colourNotSelectedSurf).
---Source: lua/ge/extensions/editor/toolUtilities/render/tris.lua:33
---@param a vec3 Vertex 1.
---@param b vec3 Vertex 2.
---@param c vec3 Vertex 3.
function editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c) end

--- Preview surface triangle (colourPreviewSurf).
---Source: lua/ge/extensions/editor/toolUtilities/render/tris.lua:34
---@param a vec3 Vertex 1.
---@param b vec3 Vertex 2.
---@param c vec3 Vertex 3.
function editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c) end

