---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_terrainPolyPaint` : `extensions.load("editor_toolUtilities_terrainPolyPaint")`, puis la globale `editor_toolUtilities_terrainPolyPaint`
---@class editor_toolUtilities_terrainPolyPaint
editor_toolUtilities_terrainPolyPaint = {}

--- And puts it back, oldest first, over whatever is under it now.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:191
function editor_toolUtilities_terrainPolyPaint.layAll() end

--- Takes every live record's paint off, newest first. Nests: only the outermost call does the work. No grid refresh: layAll
---  always follows in the same frame and refreshes the same box.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:173
function editor_toolUtilities_terrainPolyPaint.liftAll() end

--- Paint an explicit list of cells (world xs/ys) all to `matIdx`.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:113
---@param xs any
---@param ys any
---@param matIdx any
---@param prev any
function editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev) end

--- Paint the terrain cells inside `ring` (scanline fill). `mat` is one layer index for the whole ring, or a function asked
---  per cell for a caller that varies it across the fill -- which returns nil for a cell it wants left alone.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:82
---@param ring any
---@param mat any
function editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat) end

--- Hands a record's paint to the terrain (burn, bake): it stays painted, and is no longer taken off with the rest.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:166
---@param rec any
function editor_toolUtilities_terrainPolyPaint.release(rec) end

--- Restore a record's captured cells to their original materials, then batch one grid update over the touched bounds.
---  Records painted over it since come off first and go back on after, so each cell gets back what was really under it.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:135
---@param rec any
function editor_toolUtilities_terrainPolyPaint.revert(rec) end

