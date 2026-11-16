---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraform/terraform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Terrain terraforming engine of the editor. It modifies the TerrainBlock heightmap to align it with 'sources' (road strips: list of {pos, width, binormal}) or 'features' (quads and rings with a per-element mode), with a distance-field (SDF) falloff, relaxation smoothing, noise and a priority-based occupancy mask (PRIO table). It also records 'baselines' (original and written heights) so the terrain can be restored, and provides a pair of 'Terraform To X' / 'Restore Terrain' buttons for the spline tools. Used by editor_terraformTool and by the road, bridge and location tools.
--- Access: extension `editor_terraform_terraform`: `extensions.load("editor_terraform_terraform")`, then the global `editor_terraform_terraform`
---@class editor_terraform_terraform
---@field PRIO table<string, number> Priority bands of the occupancy mask: LAKE 1, CARPARK 1.5, OPENSPACE 1.75, BUILDING 2, PAVING 2.5, PATH 3, STRUCTURE 4, RIM 4.2, AREAWAY 4.3, GROUND 5, RAIL 5.5.
editor_terraform_terraform = {}

--- Carves features into a tool's working pad. Same carving as terraformToQuads and same falloff, but the level is not marked as modified and no undo step is created; the caller keeps the heights (baselineOut) and restores them itself. No priority band.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:1191
---@param DOI number Domain of influence (m).
---@param margin number Margin (m).
---@param falloffExp number Falloff.
---@param features table List of features.
---@param passes integer|nil Smoothing passes.
---@param baselineOut table|nil Receives the baseline.
function editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut) end

--- Like carveToSources, but the surface is given as explicit quads (with the exact bilinear Z per cell): an abutment on a cambered deck lands exactly at the deck height, with no dip. Undoes the previous baseline, clears the occupancy mask, performs a terraformToQuads pass and stores the baseline.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:1201
---@param obj table Object that receives terraBaseline.
---@param DOI number Domain of influence (m).
---@param margin number Margin (m).
---@param falloffExp number Falloff.
---@param roughness number Roughness.
---@param scale number Noise scale.
---@param features table List of features (with quad or rings, and a mode).
---@param smoothPasses integer|nil Smoothing passes.
function editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses) end

--- Like carveToSources, but each element of 'groups' is a list of runs terraformed together in a single pass (a single baseline capture over their common window). Use when an area is made of overlapping strips; the groups themselves must be disjoint.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:785
---@param obj table Object that receives terraBaseline.
---@param DOI number Domain of influence (m).
---@param margin number Margin (m).
---@param falloffExp number Falloff.
---@param roughness number Roughness.
---@param scale number Noise scale.
---@param groups table List of groups; each group is a list of runs.
---@param smoothPasses integer|nil Smoothing passes.
---@param clips table|nil Ends not to be exceeded.
function editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips) end

--- Terraforming with baseline memory: first undoes obj.terraBaseline, then terraforms each 'run' of sources on its own tight box (useful for two bridge abutments at opposite ends) and merges the baselines into obj.terraBaseline.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:766
---@param obj table Object that receives terraBaseline.
---@param DOI number Domain of influence (m).
---@param margin number Margin (m).
---@param falloffExp number Falloff.
---@param roughness number Roughness.
---@param scale number Noise scale.
---@param sources table List of runs (each run is a source).
---@param smoothPasses integer|nil Smoothing passes.
---@param clips table|nil Ends not to be exceeded.
function editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips) end

--- Returns the priority band that owns a cell in the occupancy mask (absolute grid coordinates), 0 if none.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:144
---@param gx integer Grid X index.
---@param gy integer Grid Y index.
---@return number  Priority of the cell.
function editor_terraform_terraform.cellPriorityAt(gx, gy) end

--- Reserves all the cells covered by a set of features, at a given priority, without modifying any height (calls terraformToQuads in claimOnly).
---Source: lua/ge/extensions/editor/terraform/terraform.lua:1180
---@param features table List of features.
---@param priority number Priority band.
function editor_terraform_terraform.claimFeatures(features, priority) end

--- Unconditionally lowers the terrain under surface footprints (bridge decks): a grid vertex is brought down to (deck top - margin) only if it sticks up above the deck. Records the history of the lowered vertices.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:1247
---@param features table Deck footprints.
---@param marginM number|nil Margin under the deck in meters (0.4 by default).
---@return integer  Number of lowered vertices (0 if nothing to do or no terrain).
function editor_terraform_terraform.clampBelowDecks(features, marginM) end

--- Returns the last valid grid index in X and Y of the terrain block (number of cells minus 1).
---Source: lua/ge/extensions/editor/terraform/terraform.lua:80
---@param tb userdata TerrainBlock.
---@return integer  Last index in X.
---@return integer  Last index in Y.
function editor_terraform_terraform.gridDims(tb) end

--- Returns a function height(x, y) giving the ground as it was before the terraformings recorded in 'baselines' (their original heights), and the current terrain elsewhere. When two records contain the same cell, the first in the list wins.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:815
---@param baselines table List of baselines (terraBaseline).
---@return function  function(x, y) returning the world height (nil outside the terrain according to the code).
function editor_terraform_terraform.groundBefore(baselines) end

--- Distance, beyond the edge of a footprint, over which the ground is held: (0.5 + square root of 2) * squareSize (half-cell skin plus one-cell ring).
---Source: lua/ge/extensions/editor/terraform/terraform.lua:37
---@param squareSize number Size of a terrain cell in meters.
---@return number  Range in meters.
function editor_terraform_terraform.heldReach(squareSize) end

--- Clears the persistent occupancy mask (heights and priorities per cell).
---Source: lua/ge/extensions/editor/terraform/terraform.lua:74
function editor_terraform_terraform.resetMask() end

--- Restores the terrain that an object carved (the object stays in place) and forgets its obj.terraBaseline record.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:802
---@param obj table Object carrying terraBaseline.
---@param recordHistory boolean|nil true to make the restoration undoable (Ctrl+Z); the deletion paths pass false.
---@return boolean  true if there was a terraforming to undo (useful to gray out a button).
function editor_terraform_terraform.restoreBaseline(obj, recordHistory) end

--- Restores a window captured by terraformToSources(..., baselineOut): rewrites the original heights, then refreshes the grid once. Cells modified since (sculpting, another road) are not touched.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:680
---@param bl table|nil Baseline.
---@param recordHistory boolean|nil true to record an undoable 'Restore Terrain' step.
function editor_terraform_terraform.revertBaseline(bl, recordHistory) end

--- Copies all the terrain heights (full grid) and the state of the occupancy mask so they can be returned to. Does nothing without a terrain.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:100
function editor_terraform_terraform.snapshotBaseline() end

--- Replaces the 'from' terraforming with 'to' (each can be nil) by writing only the cells whose height changes, to limit engine calls.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:707
---@param from table|nil Baseline to remove.
---@param to table|nil Baseline to apply.
function editor_terraform_terraform.swapBaseline(from, to) end

--- Draws the pair of 'Terraform To X' and 'Restore Terrain' buttons shared by the spline tools. 'own' (optional) lets a tool provide its own terraforming ({run(obj, p), restore(obj), hasCarve(obj)}).
---Source: lua/ge/extensions/editor/terraform/terraform.lua:844
---@param obj table Terraformed object.
---@param canTerraform boolean Displays the terraform button or an empty space.
---@param p table Parameters: doi, margin, falloff, roughness, scale, smooth.
---@param label string Name displayed in the tooltips and identifiers.
---@param icons table Icons (terrainToLine, settings_backup_restore).
---@param cols table Colors (blueB, blueD).
---@param iconsBig any Icon size (ImVec2).
---@param own table|nil Tool-specific terraforming.
function editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own) end

--- Terraforms the heightmap from explicit features (quads or rings) with support by ring of neighboring cells and a per-feature mode. With claimOnly, stops after the merge: only the occupancy mask is written, no height.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:968
---@param DOI number Domain of influence (m).
---@param margin number Margin (m).
---@param falloffExp number Falloff.
---@param roughness number Roughness.
---@param scale number Noise scale.
---@param features table List of features.
---@param passes integer|nil Smoothing passes.
---@param protect any Zone protection (inferred from code, not detailed).
---@param priority number|nil Priority band (see PRIO), 0 by default.
---@param baselineOut table|nil Receives the baseline of the moved cells.
---@param claimOnly boolean|nil true: writes only the mask.
function editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly) end

--- Terraforms the heightmap from quad weights and a distance-field falloff: the ground under the sources takes the height of the source, then blends into the terrain over the margin and the DOI. Writes into the terrain, marks the level as modified and can record an undo step. Returns without doing anything if there are no sources, no terrain block or no terrain editor.
---Source: lua/ge/extensions/editor/terraform/terraform.lua:572
---@param DOI number Domain of influence in meters (minimum 1).
---@param margin number Lateral margin (apron) in meters, converted to cells.
---@param falloffExp number Falloff exponent/decay distance (the tool's 'falloff' value).
---@param roughness number Noise roughness in [0, 1].
---@param scale number Noise scale in [0, 1].
---@param sources table List of sources; each source is a list of {pos, width, binormal}.
---@param smoothPasses integer|nil Number of blur passes on the apron (default 5).
---@param baselineOut table|nil If provided, filled with the baseline (gx, gy, z, w, n, xMin, yMin, xMax, yMax).
---@param clips table|nil Road ends whose falloff must not spill forward (the deck stays held).
function editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips) end

