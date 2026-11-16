# `editor_toolUtilities_terrainPolyPaint`

*File: `lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua` · VM: Game Engine (GE) · 219 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_terrainPolyPaint`: `extensions.load("editor_toolUtilities_terrainPolyPaint")`, then the global `editor_toolUtilities_terrainPolyPaint`

Terrain material painting on a polygonal ring (scanline fill) or on a list of cells, with an undo record. A record is { xs, ys, prev, cnt }: world coordinates of each painted cell and its ORIGINAL material index, to restore the previous state exactly. Each record is a live overlay until revert or release; records stack in paint order, and liftAll/layAll remove and put them all back (terrain save, repainting the network underneath). A single grid update is done on the touched area.

## Notes

- Terrain holes (index 255) are never repainted or restored over.
- liftAll/layAll nest by counter: only the outermost call does the work. Always call them as a pair in the same frame.
- liftAll forgets the records painted on a terrain block that no longer exists.
- All functions use extensions.editor_terrainEditor; without a terrain block or without the terrain editor, paintRing and paintCells return nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_terrainPolyPaint.layAll()` | Puts the paint back, from oldest to newest, over what is now underneath, then refreshes the grid over the touched area. | 191 |
| `editor_toolUtilities_terrainPolyPaint.liftAll()` | Removes the paint of all live records, from newest to oldest. Nests: only the outermost call acts. No grid refresh, layAll always follows in the same frame. | 173 |
| `editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev)` | Paints an explicit list of cells (world xs/ys) all with `matIdx`. | 113 |
| `editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat)` | Paints the terrain cells inside `ring` (scanline fill), then refreshes the grid over the touched box. Returns the undo record, nil if nothing was painted. | 82 |
| `editor_toolUtilities_terrainPolyPaint.release(rec)` | Hands the paint of a record over to the terrain (engraving, baking): it stays painted and is no longer removed with the rest. | 166 |
| `editor_toolUtilities_terrainPolyPaint.revert(rec)` | Puts the cells of a record back to their original materials then does a single grid update. Records painted over it since are removed first then put back, so each cell gets back what was really underneath. | 135 |

### Parameter details

#### `editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev)`

Paints an explicit list of cells (world xs/ys) all with `matIdx`.

- `xs` (*number[]*) : World X of the cells.
- `ys` (*number[]*) : World Y of the cells.
- `matIdx` (*integer*) : Material index.
- `prev` (*integer[]|nil*) : Original materials already known; if absent or empty, they are read from the terrain.
- **returns**: table|nil Undo record, nil if the list is empty or there is no terrain.

#### `editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat)`

Paints the terrain cells inside `ring` (scanline fill), then refreshes the grid over the touched box. Returns the undo record, nil if nothing was painted.

- `ring` (*table*) : Ring of points in world XY (at least 3).
- `mat` (*integer|function*) : Layer index for the whole ring, or a function mat(gx, gy, wx, wy) queried per cell that returns an index, or nil to leave the cell.
- **returns**: table|nil Record { xs, ys, prev, cnt, ... }.

#### `editor_toolUtilities_terrainPolyPaint.release(rec)`

Hands the paint of a record over to the terrain (engraving, baking): it stays painted and is no longer removed with the rest.

- `rec` (*table|nil*) : Record.

#### `editor_toolUtilities_terrainPolyPaint.revert(rec)`

Puts the cells of a record back to their original materials then does a single grid update. Records painted over it since are removed first then put back, so each cell gets back what was really underneath.

- `rec` (*table|nil*) : Record returned by paintRing or paintCells.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua`.*
