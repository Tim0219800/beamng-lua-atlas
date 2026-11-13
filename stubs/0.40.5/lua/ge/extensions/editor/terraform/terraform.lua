---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraform/terraform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_terraform_terraform` : `extensions.load("editor_terraform_terraform")`, puis la globale `editor_terraform_terraform`
---@class editor_terraform_terraform
---@field PRIO table
editor_terraform_terraform = {}

--- Cut a set of features into a tool's own scratch pad. The same carve as terraformToQuads and, so that what a tool shows
--- on its pad is what the placer will cut for real, the same falloff -- but the level is left alone: no dirty flag and no
--- undo entry. The pad's owner remembers the heights (`baselineOut`) and hands them back itself.
--- No priority band: a pad holds one site and nothing else is claiming ground on it, so the site's own shapes settle their
--- overlaps between themselves on the same-band min rule.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1191
---@param DOI any
---@param margin any
---@param falloffExp any
---@param features any
---@param passes any
---@param baselineOut any
function editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut) end

--- Like carveToSources, but the pad is given as explicit crowned QUADS stamped with the EXACT bilinear per-cell Z (terraformToQuads) instead of
---  min-Z strip runs - so a crowned / arbitrary-width deck abutment lands exactly on the deck top with no boundary dips (a strip carve dips a few
---  cm below at each crown breakpoint). One terraformToQuads pass over both approaches -> one revertable baseline.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1201
---@param obj any
---@param DOI any
---@param margin any
---@param falloffExp any
---@param roughness any
---@param scale any
---@param features any
---@param smoothPasses any
function editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses) end

--- Like carveToSources, but each element of `groups` is itself a LIST of runs terraformed together in ONE terraformToSources pass (a single
---  baseline capture over their shared window). Use when one region is built from several OVERLAPPING strips (e.g. a crowned bridge abutment's
---  lateral crown facets): carving them as separate runs would double-capture the shared cells - the 2nd run recording already-moved terrain as
---  the "original" - and corrupt the restore baseline. Groups themselves should be disjoint (e.g. the two abutments), so merging is clean.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:785
---@param obj any
---@param DOI any
---@param margin any
---@param falloffExp any
---@param roughness any
---@param scale any
---@param groups any
---@param smoothPasses any
---@param clips any
function editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips) end

--- Baseline-memory carve. Each source RUN is terraformed on its OWN tight AABB rather than one union box: the bridge's two abutments sit
---  at opposite ends, so a union box would span the whole deck and churn the SDF/smoothing passes over the empty middle for nothing (a
---  continuous single-run source -- road/fence/etc. -- has no empty middle, so it takes the loop once and behaves exactly as before).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:766
---@param obj any
---@param DOI any
---@param margin any
---@param falloffExp any
---@param roughness any
---@param scale any
---@param sources any
---@param smoothPasses any
---@param clips any
function editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips) end

--- Priority band owning a terrain cell in the persistent occupancy mask (absolute grid coords).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:144
---@param gx any
---@param gy any
function editor_terraform_terraform.cellPriorityAt(gx, gy) end

--- Claim every cell a feature set covers, at this priority, without moving a single height.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1180
---@param features any
---@param priority any
function editor_terraform_terraform.claimFeatures(features, priority) end

--- Direct, unconditional lower-only terrain clamp under a set of surface footprints (bridge decks).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1247
---@param features any
---@param marginM any
function editor_terraform_terraform.clampBelowDecks(features, marginM) end

--- The last valid grid index per axis. The block holds one sample per cell, not one more: its far edge is index N, which the
---  engine wraps round to 0, so a write there lands on the opposite edge of the map.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:80
---@param tb any
function editor_terraform_terraform.gridDims(tb) end

--- The ground as it was before the carves recorded in `baselines` (terraBaseline records), as a lookup `height(x, y)` (nil off
---  the terrain): their record of the cells they moved, and the live terrain everywhere else. Where two records hold a cell, the
---  first one listed wins.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:815
---@param baselines any
function editor_terraform_terraform.groundBefore(baselines) end

--- How far past a footprint's edge the ground is held: the half-cell skin it is stamped with, and the one-cell ring round that.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:37
---@param squareSize any
function editor_terraform_terraform.heldReach(squareSize) end

---Source : lua/ge/extensions/editor/terraform/terraform.lua:74
function editor_terraform_terraform.resetMask() end

--- Restore the terrain an object carved (leaves the object itself in place) and forget the record. Returns true if there was a
---  carve to undo (so callers can grey their button). recordHistory makes it a Ctrl+Z-able terrain edit; delete paths pass false.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:802
---@param obj any
---@param recordHistory any
function editor_terraform_terraform.restoreBaseline(obj, recordHistory) end

--- Restore a window captured by terraformToSources(..., baselineOut): writes the stashed original heights straight
---  back (raw, then one grid refresh over the recorded bounds). Cells edited since the carve (hand sculpting, another
---  road's carve) no longer hold the height the carve wrote (`bl.w`), so they are left as they are.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:680
---@param bl any
---@param recordHistory any
function editor_terraform_terraform.revertBaseline(bl, recordHistory) end

---Source : lua/ge/extensions/editor/terraform/terraform.lua:100
function editor_terraform_terraform.snapshotBaseline() end

--- Takes the carve `from` up and lays `to` down in its place, both recorded with the heights they wrote (`w`) and either of
---  them nil, writing only the cells whose height changes: each one written is a call into the engine, and a carve swapped
---  for one much like it differs in a handful of cells out of millions.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:707
---@param from any
---@param to any
function editor_terraform_terraform.swapBaseline(from, to) end

--- Shared 'Terraform To X' + 'Restore Terrain' button pair for the engineered-spline tools,
---  `own` (optional): { run (obj, p), restore (obj), hasCarve (obj) }, a tool's own carve in place of the plain ribbon one.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:844
---@param obj any
---@param canTerraform any
---@param p any
---@param label any
---@param icons any
---@param cols any
---@param iconsBig any
---@param own any
function editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own) end

--- Terraform the heightmap from explicit features, with cell-overlap 1-ring support and per-feature mode.
---  `claimOnly` stops after the merge: the occupancy mask is written and not one height is. See claimFeatures below.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:968
---@param DOI any
---@param margin any
---@param falloffExp any
---@param roughness any
---@param scale any
---@param features any
---@param passes any
---@param protect any
---@param priority any
---@param baselineOut any
---@param claimOnly any
function editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly) end

--- Terraform heightmap based on quad weights and an SDF falloff.
---  `clips` (optional): road ends whose falloff must not spill forward (see beyondClippedEnd); the road deck itself is still held.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:572
---@param DOI any
---@param margin any
---@param falloffExp any
---@param roughness any
---@param scale any
---@param sources any
---@param smoothPasses any
---@param baselineOut any
---@param clips any
function editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips) end

