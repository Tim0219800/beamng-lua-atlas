# `editor_heroRoadEditor_mesh`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/mesh.lua` · VM : Game Engine (GE) · 1113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_mesh` : `extensions.load("editor_heroRoadEditor_mesh")`, puis la globale `editor_heroRoadEditor_mesh`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_mesh.buildChunkLODs(group, chunkLenM)` | Build the full baked payload for a group: for each ~chunkLenM chunk, its visible LOD set + one deck-only collision mesh.<br> cutArcs is computed ONCE from the full-res total arc length and shared by every LOD and the collision build, so all levels<br> have the same chunk count and each level's neighbours meet crack-free. Consecutive LODs with near-equal triangle counts are<br> dropped (a straight/flat that can't decimate further shouldn't ship a redundant level). Returns a list of chunks, each<br> { lods = { {size, parts}, ... }, col = { part, ... } }, or nil when there's nothing to build. | 883 |
| `editor_heroRoadEditor_mesh.buildExportParts(group, opts, jLo, jHi, isFirst, isLast, cutArcs)` | Assembles the drivable geometry into a list of material parts. | 371 |
| `editor_heroRoadEditor_mesh.buildRibbonEdges(group)` | LIGHT rebuild of just the outer top edges (meshEdgeL/R) used WHILE dragging, when the full grid/collision/decals are torn<br> down for perf. It reuses the SAME machinery the drivable mesh does -- profile.build (widening + fold caps + banking) and<br> worldStation -- on ONLY the two outermost cross-section points, plus the identical co-planar end-cap extension. So the ribbon<br> traces exactly the edge the released mesh will (single source of truth, no flat-vs-banked width mismatch). The full build<br> overwrites these with the decimated/cut version on release -- same curve, just fewer points. | 1033 |
| `editor_heroRoadEditor_mesh.buildTerrainEdges(group)` | FLAT, world-up carriageway edge frames for a TERRAIN-mode road. | 1068 |
| `editor_heroRoadEditor_mesh.chunkCount(total, chunkLenM)` | How many DAE chunks a bake WILL produce for the given total arc length + chunk length (mirrors the chunk baker). The UI uses this<br> with the SAME arc length the bake uses (group.meshVArc[end], not the node polyline) so its preview is never off by one. | 810 |
| `editor_heroRoadEditor_mesh.lodPreview(group)` | Compute, for the Export panel, the whole-road triangle count of each visible LOD. | 924 |
| `editor_heroRoadEditor_mesh.removeMesh(group)` | Deletes the group's live ProceduralMesh(es): the legacy unsuffixed one AND every chunk 'HeroRoad_<id>_<n>' up to the first gap. | 68 |
| `editor_heroRoadEditor_mesh.updateMesh(group)` | LOD0 (near-level) rebuild -- runs from the dirty pipeline on any edit. | 1098 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/mesh.lua`.*
