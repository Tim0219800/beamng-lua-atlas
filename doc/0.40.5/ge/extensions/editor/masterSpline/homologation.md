# `editor_masterSpline_homologation`

*File: `lua/ge/extensions/editor/masterSpline/homologation.lua` · VM: Game Engine (GE) · 427 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_masterSpline_homologation`: `extensions.load("editor_masterSpline_homologation")`, then the global `editor_masterSpline_homologation`

Master Spline tool utility to "homologate" a spline against a road standard preset (roadDesignStandards): it measures the geometric deviations (slope, turn radius, banking, width gradient) and corrects them iteratively. The active mode is spline.splineAnalysisMode: 0 slope, 1 radius, 2 banking, 3 width. The preset comes from spline.homologationPreset.

## Notes

- Internal constants: 5 optimization iterations per frame, radius analyzed over 5 points on each side, radius violation tolerance 0.01, Laplacian smoothing 0.2, banking step 1 degree, width nudge 0.05.
- analyseSpline fills the spline's normalized error arrays (eSlopeNorm, eRadiusNorm, eBankingNorm, eWidthNorm) used for display.
- A splineAnalysisMode outside 0 to 3 causes an error (func nil) in analyseSpline and optimiseSpline; there is no guard.
- The preset tolerances come from presetsMap: maxSlope, minRadius, maxBanking, maxWidthGradient.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_masterSpline_homologation.analyseSpline(spline)` | Analyzes the spline with the current metric (spline.splineAnalysisMode) and fills the matching normalized error array, from divPoints/divWidths and the homologation preset. | 218 |
| `editor_masterSpline_homologation.getOptimisationIterationsPerFrame()` | Returns the number of optimization iterations to run per frame (5). | 46 |
| `editor_masterSpline_homologation.optimiseSpline(spline, numIter)` | Recomputes the geometry (catmullRomFree), analyzes the spline, marks it isDirty, then runs numIter iterations of the optimizer matching the mode (slope, radius, banking or width). Modifies the nodes, normals or widths in place. | 406 |

### Parameter details

#### `editor_masterSpline_homologation.analyseSpline(spline)`

Analyzes the spline with the current metric (spline.splineAnalysisMode) and fills the matching normalized error array, from divPoints/divWidths and the homologation preset.

- `spline` (*table*) : Spline with nodes, divPoints, divWidths, nmls, homologationPreset and splineAnalysisMode.

#### `editor_masterSpline_homologation.getOptimisationIterationsPerFrame()`

Returns the number of optimization iterations to run per frame (5).

- **returns**: integer Iterations per frame.

#### `editor_masterSpline_homologation.optimiseSpline(spline, numIter)`

Recomputes the geometry (catmullRomFree), analyzes the spline, marks it isDirty, then runs numIter iterations of the optimizer matching the mode (slope, radius, banking or width). Modifies the nodes, normals or widths in place.

- `spline` (*table*) : Spline to optimize.
- `numIter` (*integer*) : Number of iterations to run in this call (typically getOptimisationIterationsPerFrame()).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/masterSpline/homologation.lua`.*
