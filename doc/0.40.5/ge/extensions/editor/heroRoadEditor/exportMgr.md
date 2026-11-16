# `editor_heroRoadEditor_exportMgr`

*File: `lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua` · VM: Game Engine (GE) · 247 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_exportMgr`: `extensions.load("editor_heroRoadEditor_exportMgr")`, then the global `editor_heroRoadEditor_exportMgr`

Baking to DAE files and management of the Edit/Live state of a Hero Road Editor group. The bake writes the group's driving mesh to <level>/art/heroRoad/heroRoad_<id>/heroRoad_<id>_NNN.dae, then puts the group in the disabled (Live) state, where a persistent TSStatic (canSave=true) replaces the editable ProceduralMesh. It also "burns" sidewalks and furniture (sidewalkMgr, barrierMgr) and makes the decals persistent (layerMgr).

## Notes

- The state is driven by group.isEnabled: true = Edit (transient procedural surface, nothing is written to the level), false = Live (baked static, persistent).
- The vertices are written relative to each chunk's AABB center and the TSStatic is placed at that center, to keep small local coordinates even far from the world origin (2048 m engine limit cited in the code).
- The baked statics are named 'HeroRoadBaked_<id>_<n>' (n starting at 1); collisionType 'Collision Mesh', decalType 'Visible Mesh Final'.
- Default chunk length: group.chunkLenM or 120 m.
- For a terrain road (group.isMesh == false) no DAE is written; terrainFinalized replaces the manifest.
- The current level is obtained by getMissionPath(); with no level loaded, bakeGroup fails.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_exportMgr.applyState(group)` | Reconciles the group's mesh with its Edit/Live state. Edit: deletes the baked static and the burned pieces, makes decals and folder transient, marks the group dirty (rebuild). Live: deletes the procedural surface and the preview, makes the baked static appear, makes decals and folder persistent, and reloads the collision (be:reloadCollision). If a Live group has no valid bake (or if the .dae files have disappeared), it goes back to Edit. This is also the level save separation: only a Live road is written. | 126 |
| `editor_heroRoadEditor_exportMgr.bakeGroup(group)` | Bakes the group: generates the chunks with LODs and collision mesh (mesh.buildChunkLODs), empties the bake folder, writes the DAEs (daeExport.writeDaeLODs), burns sidewalks and furniture, sets group.isEnabled=false then calls applyState. | 179 |
| `editor_heroRoadEditor_exportMgr.hasBaked(group)` | Indicates whether the group has a bake (final state displayable in disabled mode): terrainFinalized for a terrain road, otherwise a non-empty bakedManifest. | 91 |
| `editor_heroRoadEditor_exportMgr.unbakeGroup(group)` | Cancels the bake: the only way to leave the Live state. Sets isEnabled=true, calls applyState, then clears bakedManifest and terrainFinalized. The DAE files are only deleted at the next bake (wipeFolder). | 233 |

### Parameter details

#### `editor_heroRoadEditor_exportMgr.applyState(group)`

Reconciles the group's mesh with its Edit/Live state. Edit: deletes the baked static and the burned pieces, makes decals and folder transient, marks the group dirty (rebuild). Live: deletes the procedural surface and the preview, makes the baked static appear, makes decals and folder persistent, and reloads the collision (be:reloadCollision). If a Live group has no valid bake (or if the .dae files have disappeared), it goes back to Edit. This is also the level save separation: only a Live road is written.

- `group` (*table*) : Hero Road group (isEnabled, bakedManifest, sceneTreeFolderId...).

#### `editor_heroRoadEditor_exportMgr.bakeGroup(group)`

Bakes the group: generates the chunks with LODs and collision mesh (mesh.buildChunkLODs), empties the bake folder, writes the DAEs (daeExport.writeDaeLODs), burns sidewalks and furniture, sets group.isEnabled=false then calls applyState.

- `group` (*table*) : Hero Road group with at least 2 nodes.
- **returns**: boolean true if the bake succeeded.
- **returns**: string Result or error message (e.g. 'need at least 2 nodes', 'no level loaded...', 'mesh has no geometry', 'write failed: <path>').

#### `editor_heroRoadEditor_exportMgr.hasBaked(group)`

Indicates whether the group has a bake (final state displayable in disabled mode): terrainFinalized for a terrain road, otherwise a non-empty bakedManifest.

- `group` (*table*) : Hero Road group.
- **returns**: boolean true if a bake exists.

#### `editor_heroRoadEditor_exportMgr.unbakeGroup(group)`

Cancels the bake: the only way to leave the Live state. Sets isEnabled=true, calls applyState, then clears bakedManifest and terrainFinalized. The DAE files are only deleted at the next bake (wipeFolder).

- `group` (*table*) : Hero Road group.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua`.*
