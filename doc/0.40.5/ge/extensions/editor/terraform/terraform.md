# `editor_terraform_terraform`

*Fichier : `lua/ge/extensions/editor/terraform/terraform.lua` · VM : Game Engine (GE) · 1356 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terraform_terraform` : `extensions.load("editor_terraform_terraform")`, puis la globale `editor_terraform_terraform`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut)` | Cut a set of features into a tool's own scratch pad. The same carve as terraformToQuads and, so that what a tool shows<br>on its pad is what the placer will cut for real, the same falloff -- but the level is left alone: no dirty flag and no<br>undo entry. The pad's owner remembers the heights (`baselineOut`) and hands them back itself.<br>No priority band: a pad holds one site and nothing else is claiming ground on it, so the site's own shapes settle their<br>overlaps between themselves on the same-band min rule. | 1191 |
| `editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses)` | Like carveToSources, but the pad is given as explicit crowned QUADS stamped with the EXACT bilinear per-cell Z (terraformToQuads) instead of<br> min-Z strip runs - so a crowned / arbitrary-width deck abutment lands exactly on the deck top with no boundary dips (a strip carve dips a few<br> cm below at each crown breakpoint). One terraformToQuads pass over both approaches -> one revertable baseline. | 1201 |
| `editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips)` | Like carveToSources, but each element of `groups` is itself a LIST of runs terraformed together in ONE terraformToSources pass (a single<br> baseline capture over their shared window). Use when one region is built from several OVERLAPPING strips (e.g. a crowned bridge abutment's<br> lateral crown facets): carving them as separate runs would double-capture the shared cells - the 2nd run recording already-moved terrain as<br> the "original" - and corrupt the restore baseline. Groups themselves should be disjoint (e.g. the two abutments), so merging is clean. | 785 |
| `editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips)` | Baseline-memory carve. Each source RUN is terraformed on its OWN tight AABB rather than one union box: the bridge's two abutments sit<br> at opposite ends, so a union box would span the whole deck and churn the SDF/smoothing passes over the empty middle for nothing (a<br> continuous single-run source -- road/fence/etc. -- has no empty middle, so it takes the loop once and behaves exactly as before). | 766 |
| `editor_terraform_terraform.cellPriorityAt(gx, gy)` | Priority band owning a terrain cell in the persistent occupancy mask (absolute grid coords). | 144 |
| `editor_terraform_terraform.claimFeatures(features, priority)` | Claim every cell a feature set covers, at this priority, without moving a single height. | 1180 |
| `editor_terraform_terraform.clampBelowDecks(features, marginM)` | Direct, unconditional lower-only terrain clamp under a set of surface footprints (bridge decks). | 1247 |
| `editor_terraform_terraform.gridDims(tb)` | The last valid grid index per axis. The block holds one sample per cell, not one more: its far edge is index N, which the<br> engine wraps round to 0, so a write there lands on the opposite edge of the map. | 80 |
| `editor_terraform_terraform.groundBefore(baselines)` | The ground as it was before the carves recorded in `baselines` (terraBaseline records), as a lookup `height(x, y)` (nil off<br> the terrain): their record of the cells they moved, and the live terrain everywhere else. Where two records hold a cell, the<br> first one listed wins. | 815 |
| `editor_terraform_terraform.heldReach(squareSize)` | How far past a footprint's edge the ground is held: the half-cell skin it is stamped with, and the one-cell ring round that. | 37 |
| `editor_terraform_terraform.resetMask()` |  | 74 |
| `editor_terraform_terraform.restoreBaseline(obj, recordHistory)` | Restore the terrain an object carved (leaves the object itself in place) and forget the record. Returns true if there was a<br> carve to undo (so callers can grey their button). recordHistory makes it a Ctrl+Z-able terrain edit; delete paths pass false. | 802 |
| `editor_terraform_terraform.revertBaseline(bl, recordHistory)` | Restore a window captured by terraformToSources(..., baselineOut): writes the stashed original heights straight<br> back (raw, then one grid refresh over the recorded bounds). Cells edited since the carve (hand sculpting, another<br> road's carve) no longer hold the height the carve wrote (`bl.w`), so they are left as they are. | 680 |
| `editor_terraform_terraform.snapshotBaseline()` |  | 100 |
| `editor_terraform_terraform.swapBaseline(from, to)` | Takes the carve `from` up and lays `to` down in its place, both recorded with the heights they wrote (`w`) and either of<br> them nil, writing only the cells whose height changes: each one written is a call into the engine, and a carve swapped<br> for one much like it differs in a handful of cells out of millions. | 707 |
| `editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own)` | Shared 'Terraform To X' + 'Restore Terrain' button pair for the engineered-spline tools,<br> `own` (optional): { run (obj, p), restore (obj), hasCarve (obj) }, a tool's own carve in place of the plain ribbon one. | 844 |
| `editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly)` | Terraform the heightmap from explicit features, with cell-overlap 1-ring support and per-feature mode.<br> `claimOnly` stops after the merge: the occupancy mask is written and not one height is. See claimFeatures below. | 968 |
| `editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips)` | Terraform heightmap based on quad weights and an SDF falloff.<br> `clips` (optional): road ends whose falloff must not spill forward (see beyondClippedEnd); the road deck itself is still held. | 572 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `PRIO` | table | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terraform/terraform.lua`.*
