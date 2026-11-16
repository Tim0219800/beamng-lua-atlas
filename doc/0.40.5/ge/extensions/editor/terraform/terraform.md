# `editor_terraform_terraform`

*File: `lua/ge/extensions/editor/terraform/terraform.lua` · VM: Game Engine (GE) · 1356 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_terraform_terraform`: `extensions.load("editor_terraform_terraform")`, then the global `editor_terraform_terraform`

Terrain terraforming engine of the editor. It modifies the TerrainBlock heightmap to align it with 'sources' (road strips: list of {pos, width, binormal}) or 'features' (quads and rings with a per-element mode), with a distance-field (SDF) falloff, relaxation smoothing, noise and a priority-based occupancy mask (PRIO table). It also records 'baselines' (original and written heights) so the terrain can be restored, and provides a pair of 'Terraform To X' / 'Restore Terrain' buttons for the spline tools. Used by editor_terraformTool and by the road, bridge and location tools.

## Example

```lua
local tc = require('editor/terraform/terraform')
local sources = require('editor/terraform/fetchSources').getAllSourcesInSelection()
tc.terraformToSources(100, 5, 1.5, 0.4, 0.5, sources)
```

## Notes

- Depends on editor_terrainEditor (getTerrainBlock, getTerrainEditor); without a terrain or without a terrain editor, the terraforming functions return without doing anything.
- Grid heights are local to the block: z = world height - tb:getPosition().z; writes are clamped to max(0, z).
- gridDims returns the last valid index (N-1): index N is wrapped to 0 by the engine and would write onto the opposite edge of the map.
- Internal constants: doiMultFactor 2.5 (bounding box margin), smoothPasses 5 by default, relaxSweepsPerStep 14, relaxSweepsMax 400, relaxOmega 1.7, targetSweeps 24, spillBatterSlope 1/1.5.
- A baseline (obj.terraBaseline) contains gx, gy (cell indices), z (original height), w (written height), n and the bounds xMin..yMax. revertBaseline only writes the cells still equal to w (tolerance 1e-3): cells touched since are left alone.
- In the code, two local restoreBaseline functions exist; the first (no parameter, around line 117) is shadowed by the second (obj, recordHistory), which is the exported one.
- The code mentions that the perlin module is unused (simplex noise is preferred).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut)` | Carves features into a tool's working pad. Same carving as terraformToQuads and same falloff, but the level is not marked as modified and no undo step is created; the caller keeps the heights (baselineOut) and restores them itself. No priority band. | 1191 |
| `editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses)` | Like carveToSources, but the surface is given as explicit quads (with the exact bilinear Z per cell): an abutment on a cambered deck lands exactly at the deck height, with no dip. Undoes the previous baseline, clears the occupancy mask, performs a terraformToQuads pass and stores the baseline. | 1201 |
| `editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips)` | Like carveToSources, but each element of 'groups' is a list of runs terraformed together in a single pass (a single baseline capture over their common window). Use when an area is made of overlapping strips; the groups themselves must be disjoint. | 785 |
| `editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips)` | Terraforming with baseline memory: first undoes obj.terraBaseline, then terraforms each 'run' of sources on its own tight box (useful for two bridge abutments at opposite ends) and merges the baselines into obj.terraBaseline. | 766 |
| `editor_terraform_terraform.cellPriorityAt(gx, gy)` | Returns the priority band that owns a cell in the occupancy mask (absolute grid coordinates), 0 if none. | 144 |
| `editor_terraform_terraform.claimFeatures(features, priority)` | Reserves all the cells covered by a set of features, at a given priority, without modifying any height (calls terraformToQuads in claimOnly). | 1180 |
| `editor_terraform_terraform.clampBelowDecks(features, marginM)` | Unconditionally lowers the terrain under surface footprints (bridge decks): a grid vertex is brought down to (deck top - margin) only if it sticks up above the deck. Records the history of the lowered vertices. | 1247 |
| `editor_terraform_terraform.gridDims(tb)` | Returns the last valid grid index in X and Y of the terrain block (number of cells minus 1). | 80 |
| `editor_terraform_terraform.groundBefore(baselines)` | Returns a function height(x, y) giving the ground as it was before the terraformings recorded in 'baselines' (their original heights), and the current terrain elsewhere. When two records contain the same cell, the first in the list wins. | 815 |
| `editor_terraform_terraform.heldReach(squareSize)` | Distance, beyond the edge of a footprint, over which the ground is held: (0.5 + square root of 2) * squareSize (half-cell skin plus one-cell ring). | 37 |
| `editor_terraform_terraform.resetMask()` | Clears the persistent occupancy mask (heights and priorities per cell). | 74 |
| `editor_terraform_terraform.restoreBaseline(obj, recordHistory)` | Restores the terrain that an object carved (the object stays in place) and forgets its obj.terraBaseline record. | 802 |
| `editor_terraform_terraform.revertBaseline(bl, recordHistory)` | Restores a window captured by terraformToSources(..., baselineOut): rewrites the original heights, then refreshes the grid once. Cells modified since (sculpting, another road) are not touched. | 680 |
| `editor_terraform_terraform.snapshotBaseline()` | Copies all the terrain heights (full grid) and the state of the occupancy mask so they can be returned to. Does nothing without a terrain. | 100 |
| `editor_terraform_terraform.swapBaseline(from, to)` | Replaces the 'from' terraforming with 'to' (each can be nil) by writing only the cells whose height changes, to limit engine calls. | 707 |
| `editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own)` | Draws the pair of 'Terraform To X' and 'Restore Terrain' buttons shared by the spline tools. 'own' (optional) lets a tool provide its own terraforming ({run(obj, p), restore(obj), hasCarve(obj)}). | 844 |
| `editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly)` | Terraforms the heightmap from explicit features (quads or rings) with support by ring of neighboring cells and a per-feature mode. With claimOnly, stops after the merge: only the occupancy mask is written, no height. | 968 |
| `editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips)` | Terraforms the heightmap from quad weights and a distance-field falloff: the ground under the sources takes the height of the source, then blends into the terrain over the margin and the DOI. Writes into the terrain, marks the level as modified and can record an undo step. Returns without doing anything if there are no sources, no terrain block or no terrain editor. | 572 |

### Parameter details

#### `editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut)`

Carves features into a tool's working pad. Same carving as terraformToQuads and same falloff, but the level is not marked as modified and no undo step is created; the caller keeps the heights (baselineOut) and restores them itself. No priority band.

- `DOI` (*number*) : Domain of influence (m).
- `margin` (*number*) : Margin (m).
- `falloffExp` (*number*) : Falloff.
- `features` (*table*) : List of features.
- `passes` (*integer|nil*) : Smoothing passes.
- `baselineOut` (*table|nil*) : Receives the baseline.

#### `editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses)`

Like carveToSources, but the surface is given as explicit quads (with the exact bilinear Z per cell): an abutment on a cambered deck lands exactly at the deck height, with no dip. Undoes the previous baseline, clears the occupancy mask, performs a terraformToQuads pass and stores the baseline.

- `obj` (*table*) : Object that receives terraBaseline.
- `DOI` (*number*) : Domain of influence (m).
- `margin` (*number*) : Margin (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Roughness.
- `scale` (*number*) : Noise scale.
- `features` (*table*) : List of features (with quad or rings, and a mode).
- `smoothPasses` (*integer|nil*) : Smoothing passes.

#### `editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips)`

Like carveToSources, but each element of 'groups' is a list of runs terraformed together in a single pass (a single baseline capture over their common window). Use when an area is made of overlapping strips; the groups themselves must be disjoint.

- `obj` (*table*) : Object that receives terraBaseline.
- `DOI` (*number*) : Domain of influence (m).
- `margin` (*number*) : Margin (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Roughness.
- `scale` (*number*) : Noise scale.
- `groups` (*table*) : List of groups; each group is a list of runs.
- `smoothPasses` (*integer|nil*) : Smoothing passes.
- `clips` (*table|nil*) : Ends not to be exceeded.

#### `editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips)`

Terraforming with baseline memory: first undoes obj.terraBaseline, then terraforms each 'run' of sources on its own tight box (useful for two bridge abutments at opposite ends) and merges the baselines into obj.terraBaseline.

- `obj` (*table*) : Object that receives terraBaseline.
- `DOI` (*number*) : Domain of influence (m).
- `margin` (*number*) : Margin (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Roughness.
- `scale` (*number*) : Noise scale.
- `sources` (*table*) : List of runs (each run is a source).
- `smoothPasses` (*integer|nil*) : Smoothing passes.
- `clips` (*table|nil*) : Ends not to be exceeded.

#### `editor_terraform_terraform.cellPriorityAt(gx, gy)`

Returns the priority band that owns a cell in the occupancy mask (absolute grid coordinates), 0 if none.

- `gx` (*integer*) : Grid X index.
- `gy` (*integer*) : Grid Y index.
- **returns**: number Priority of the cell.

#### `editor_terraform_terraform.claimFeatures(features, priority)`

Reserves all the cells covered by a set of features, at a given priority, without modifying any height (calls terraformToQuads in claimOnly).

- `features` (*table*) : List of features.
- `priority` (*number*) : Priority band.

#### `editor_terraform_terraform.clampBelowDecks(features, marginM)`

Unconditionally lowers the terrain under surface footprints (bridge decks): a grid vertex is brought down to (deck top - margin) only if it sticks up above the deck. Records the history of the lowered vertices.

- `features` (*table*) : Deck footprints.
- `marginM` (*number|nil*) : Margin under the deck in meters (0.4 by default).
- **returns**: integer Number of lowered vertices (0 if nothing to do or no terrain).

#### `editor_terraform_terraform.gridDims(tb)`

Returns the last valid grid index in X and Y of the terrain block (number of cells minus 1).

- `tb` (*userdata*) : TerrainBlock.
- **returns**: integer Last index in X.
- **returns**: integer Last index in Y.

#### `editor_terraform_terraform.groundBefore(baselines)`

Returns a function height(x, y) giving the ground as it was before the terraformings recorded in 'baselines' (their original heights), and the current terrain elsewhere. When two records contain the same cell, the first in the list wins.

- `baselines` (*table*) : List of baselines (terraBaseline).
- **returns**: function function(x, y) returning the world height (nil outside the terrain according to the code).

#### `editor_terraform_terraform.heldReach(squareSize)`

Distance, beyond the edge of a footprint, over which the ground is held: (0.5 + square root of 2) * squareSize (half-cell skin plus one-cell ring).

- `squareSize` (*number*) : Size of a terrain cell in meters.
- **returns**: number Range in meters.

#### `editor_terraform_terraform.restoreBaseline(obj, recordHistory)`

Restores the terrain that an object carved (the object stays in place) and forgets its obj.terraBaseline record.

- `obj` (*table*) : Object carrying terraBaseline.
- `recordHistory` (*boolean|nil*) : true to make the restoration undoable (Ctrl+Z); the deletion paths pass false.
- **returns**: boolean true if there was a terraforming to undo (useful to gray out a button).

#### `editor_terraform_terraform.revertBaseline(bl, recordHistory)`

Restores a window captured by terraformToSources(..., baselineOut): rewrites the original heights, then refreshes the grid once. Cells modified since (sculpting, another road) are not touched.

- `bl` (*table|nil*) : Baseline.
- `recordHistory` (*boolean|nil*) : true to record an undoable 'Restore Terrain' step.

#### `editor_terraform_terraform.swapBaseline(from, to)`

Replaces the 'from' terraforming with 'to' (each can be nil) by writing only the cells whose height changes, to limit engine calls.

- `from` (*table|nil*) : Baseline to remove.
- `to` (*table|nil*) : Baseline to apply.

#### `editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own)`

Draws the pair of 'Terraform To X' and 'Restore Terrain' buttons shared by the spline tools. 'own' (optional) lets a tool provide its own terraforming ({run(obj, p), restore(obj), hasCarve(obj)}).

- `obj` (*table*) : Terraformed object.
- `canTerraform` (*boolean*) : Displays the terraform button or an empty space.
- `p` (*table*) : Parameters: doi, margin, falloff, roughness, scale, smooth.
- `label` (*string*) : Name displayed in the tooltips and identifiers.
- `icons` (*table*) : Icons (terrainToLine, settings_backup_restore).
- `cols` (*table*) : Colors (blueB, blueD).
- `iconsBig` (*any*) : Icon size (ImVec2).
- `own` (*table|nil*) : Tool-specific terraforming.

#### `editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly)`

Terraforms the heightmap from explicit features (quads or rings) with support by ring of neighboring cells and a per-feature mode. With claimOnly, stops after the merge: only the occupancy mask is written, no height.

- `DOI` (*number*) : Domain of influence (m).
- `margin` (*number*) : Margin (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Roughness.
- `scale` (*number*) : Noise scale.
- `features` (*table*) : List of features.
- `passes` (*integer|nil*) : Smoothing passes.
- `protect` (*any*) : Zone protection (inferred from code, not detailed).
- `priority` (*number|nil*) : Priority band (see PRIO), 0 by default.
- `baselineOut` (*table|nil*) : Receives the baseline of the moved cells.
- `claimOnly` (*boolean|nil*) : true: writes only the mask.

#### `editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips)`

Terraforms the heightmap from quad weights and a distance-field falloff: the ground under the sources takes the height of the source, then blends into the terrain over the margin and the DOI. Writes into the terrain, marks the level as modified and can record an undo step. Returns without doing anything if there are no sources, no terrain block or no terrain editor.

- `DOI` (*number*) : Domain of influence in meters (minimum 1).
- `margin` (*number*) : Lateral margin (apron) in meters, converted to cells.
- `falloffExp` (*number*) : Falloff exponent/decay distance (the tool's 'falloff' value).
- `roughness` (*number*) : Noise roughness in [0, 1].
- `scale` (*number*) : Noise scale in [0, 1].
- `sources` (*table*) : List of sources; each source is a list of {pos, width, binormal}.
- `smoothPasses` (*integer|nil*) : Number of blur passes on the apron (default 5).
- `baselineOut` (*table|nil*) : If provided, filled with the baseline (gx, gy, z, w, n, xMin, yMin, xMax, yMax).
- `clips` (*table|nil*) : Road ends whose falloff must not spill forward (the deck stays held).

## Fields

| Field | Type | Description |
|---|---|---|
| `PRIO` | table<string, number> | Priority bands of the occupancy mask: LAKE 1, CARPARK 1.5, OPENSPACE 1.75, BUILDING 2, PAVING 2.5, PATH 3, STRUCTURE 4, RIM 4.2, AREAWAY 4.3, GROUND 5, RAIL 5.5. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/terraform/terraform.lua`.*
