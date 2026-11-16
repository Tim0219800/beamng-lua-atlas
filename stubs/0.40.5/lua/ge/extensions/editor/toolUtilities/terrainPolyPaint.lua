---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Terrain material painting on a polygonal ring (scanline fill) or on a list of cells, with an undo record. A record is { xs, ys, prev, cnt }: world coordinates of each painted cell and its ORIGINAL material index, to restore the previous state exactly. Each record is a live overlay until revert or release; records stack in paint order, and liftAll/layAll remove and put them all back (terrain save, repainting the network underneath). A single grid update is done on the touched area.
--- Access: extension `editor_toolUtilities_terrainPolyPaint`: `extensions.load("editor_toolUtilities_terrainPolyPaint")`, then the global `editor_toolUtilities_terrainPolyPaint`
---@class editor_toolUtilities_terrainPolyPaint
editor_toolUtilities_terrainPolyPaint = {}

--- Puts the paint back, from oldest to newest, over what is now underneath, then refreshes the grid over the touched area.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:191
function editor_toolUtilities_terrainPolyPaint.layAll() end

--- Removes the paint of all live records, from newest to oldest. Nests: only the outermost call acts. No grid refresh, layAll always follows in the same frame.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:173
function editor_toolUtilities_terrainPolyPaint.liftAll() end

--- Paints an explicit list of cells (world xs/ys) all with `matIdx`.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:113
---@param xs number[] World X of the cells.
---@param ys number[] World Y of the cells.
---@param matIdx integer Material index.
---@param prev integer[]|nil Original materials already known; if absent or empty, they are read from the terrain.
---@return table|nil  Undo record, nil if the list is empty or there is no terrain.
function editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev) end

--- Paints the terrain cells inside `ring` (scanline fill), then refreshes the grid over the touched box. Returns the undo record, nil if nothing was painted.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:82
---@param ring table Ring of points in world XY (at least 3).
---@param mat integer|function Layer index for the whole ring, or a function mat(gx, gy, wx, wy) queried per cell that returns an index, or nil to leave the cell.
---@return table|nil  Record { xs, ys, prev, cnt, ... }.
function editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat) end

--- Hands the paint of a record over to the terrain (engraving, baking): it stays painted and is no longer removed with the rest.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:166
---@param rec table|nil Record.
function editor_toolUtilities_terrainPolyPaint.release(rec) end

--- Puts the cells of a record back to their original materials then does a single grid update. Records painted over it since are removed first then put back, so each cell gets back what was really underneath.
---Source: lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:135
---@param rec table|nil Record returned by paintRing or paintCells.
function editor_toolUtilities_terrainPolyPaint.revert(rec) end

