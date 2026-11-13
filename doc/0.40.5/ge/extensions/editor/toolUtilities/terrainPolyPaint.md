# `editor_toolUtilities_terrainPolyPaint`

*Fichier : `lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua` · VM : Game Engine (GE) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_terrainPolyPaint` : `extensions.load("editor_toolUtilities_terrainPolyPaint")`, puis la globale `editor_toolUtilities_terrainPolyPaint`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_terrainPolyPaint.layAll()` | And puts it back, oldest first, over whatever is under it now. | 191 |
| `editor_toolUtilities_terrainPolyPaint.liftAll()` | Takes every live record's paint off, newest first. Nests: only the outermost call does the work. No grid refresh: layAll<br> always follows in the same frame and refreshes the same box. | 173 |
| `editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev)` | Paint an explicit list of cells (world xs/ys) all to `matIdx`. | 113 |
| `editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat)` | Paint the terrain cells inside `ring` (scanline fill). `mat` is one layer index for the whole ring, or a function asked<br> per cell for a caller that varies it across the fill -- which returns nil for a cell it wants left alone. | 82 |
| `editor_toolUtilities_terrainPolyPaint.release(rec)` | Hands a record's paint to the terrain (burn, bake): it stays painted, and is no longer taken off with the rest. | 166 |
| `editor_toolUtilities_terrainPolyPaint.revert(rec)` | Restore a record's captured cells to their original materials, then batch one grid update over the touched bounds.<br> Records painted over it since come off first and go back on after, so each cell gets back what was really under it. | 135 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua`.*
