# `editor_heroRoadEditor_sidewalkMgr`

*File: `lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua` · VM: Game Engine (GE) · 131 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_sidewalkMgr`: `extensions.load("editor_heroRoadEditor_sidewalkMgr")`, then the global `editor_heroRoadEditor_sidewalkMgr`

Procedural sidewalks/curbs of a Hero Road Editor group. Thin layer on top of the shared sweep toolUtilities/walkRibbon: reads the actual banked edges of the mesh (meshEdgeL/R, meshEdgeDirL/R) and sweeps curb + paving along each enabled side (group.sidewalkLeft / sidewalkRight). During editing it is a transient ProceduralMesh 'HeroWalk_<id>'; the bake writes it to .dae and places a persistent TSStatic in its place.

## Notes

- Both sides are merged into ONE mesh (two draws in total).
- The sidewalk's Z height is that of the roadway edge (p.z), not p.z + d.z*offset, so that it stays level despite the superelevation.
- The offset from the edge is group.sidewalkOffsetM (>= 0, default 0); the width comes from walkRibbon.width(). Crosswalks (group.crossings) lower the curb flush via walkRibbon.crossingDips.
- The mesh is collidable (meshPart.emitObject with collision) but not saved (canSave=false) while the road is being edited.
- The baked sidewalk has only one level of detail (NEAR_PX = 400); collisionType 'Collision Mesh', decalType 'Visible Mesh Final'.
- The runtime records (mesh, parts) are kept in the module, indexed by group.id, and never on the group.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir)` | Bake: writes the sidewalk to <dir>/HeroWalk_<id>.dae (centered on its own center) and places a persistent TSStatic (canSave=true) in its place, after deleting the procedural mesh that has the same name. On write failure, logs an error ('heroSidewalk') and the sidewalk disappears from this bake. | 95 |
| `editor_heroRoadEditor_sidewalkMgr.removeGroup(group)` | Deletes the group's sidewalk mesh and forgets it. | 61 |
| `editor_heroRoadEditor_sidewalkMgr.tris(group)` | Number of triangles of the group's sidewalk, for the tool's count. | 87 |
| `editor_heroRoadEditor_sidewalkMgr.updateGroup(group)` | (Re)builds the group's sidewalks from the current mesh edge and the sidewalkLeft/sidewalkRight toggles. Called right after the mesh rebuild. Does nothing without a scene folder (sceneTreeFolderId); creates nothing if no triangle is produced. | 70 |

### Parameter details

#### `editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir)`

Bake: writes the sidewalk to <dir>/HeroWalk_<id>.dae (centered on its own center) and places a persistent TSStatic (canSave=true) in its place, after deleting the procedural mesh that has the same name. On write failure, logs an error ('heroSidewalk') and the sidewalk disappears from this bake.

- `group` (*table*) : Hero Road group.
- `dir` (*string*) : Bake folder (created if it does not exist), with trailing slash.
- **returns**: string[] Manifest of the created scene object names (empty if nothing to bake); used to remove the static at unbake.

#### `editor_heroRoadEditor_sidewalkMgr.removeGroup(group)`

Deletes the group's sidewalk mesh and forgets it.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_sidewalkMgr.tris(group)`

Number of triangles of the group's sidewalk, for the tool's count.

- `group` (*table|nil*) : Hero Road group.
- **returns**: integer Number of triangles, 0 if no sidewalk.

#### `editor_heroRoadEditor_sidewalkMgr.updateGroup(group)`

(Re)builds the group's sidewalks from the current mesh edge and the sidewalkLeft/sidewalkRight toggles. Called right after the mesh rebuild. Does nothing without a scene folder (sceneTreeFolderId); creates nothing if no triangle is produced.

- `group` (*table*) : Hero Road group.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua`.*
