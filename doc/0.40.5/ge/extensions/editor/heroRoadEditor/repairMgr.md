# `editor_heroRoadEditor_repairMgr`

*File: `lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua` · VM: Game Engine (GE) · 171 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_repairMgr`: `extensions.load("editor_heroRoadEditor_repairMgr")`, then the global `editor_heroRoadEditor_repairMgr`

Rendering of the repair patch clusters (asphalt patches) of a Hero Road Editor road. Each cluster group.repairs[i] (created in the Features tab) becomes a pseudo-random fixed-seed scatter of decal instances placed on the roadway via editor.addDecalInstanceWithTan, with a DecalData shared per material. It is surface only: no impact on mesh, sidewalks or collision. The result is a pure function of the cluster's parameters and its seed, so identical after save or undo.

## Notes

- The decal handles (userdata) are kept in a module store indexed by group.id, not on the group, because the group table is encoded into a buffer for undo/sessions and cannot serialize userdata.
- Cluster parameters (default values): coverage 0.7, offset 0.0, lengthM 8.0 (min 0.5), sizeMin 0.6, sizeMax 1.4, density 0.6, t 0.5 (normalized position along the road), seed 1, rotJitter 1.0, material.
- Number of patches = round(density * lengthM * band width), clamped between 1 and 300.
- The material must be a real atlas decal material (asphalt_patches: 4 rows x 2 columns); frames 0 and 4 are ignored (patchFrames = 1,2,3,5,6,7). Render priority 6 (below the markings, 12+), lift-off of 0.03 m.
- Road width: group.leftExtM / rightExtM, otherwise half of divWidths[1] (or 5 m).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_repairMgr.clearRepairs(group)` | Deletes the group's repair decal instances and their DecalData templates, then forgets its store entry. Called on every rebuild and at teardown. | 41 |
| `editor_heroRoadEditor_repairMgr.updateRepairs(group)` | Rebuilds the decal scatter of each placed cluster (first calls clearRepairs). Does nothing more if the road has no repairs, fewer than 2 divPoints, no binormals, no scene folder or a zero length. | 144 |

### Parameter details

#### `editor_heroRoadEditor_repairMgr.clearRepairs(group)`

Deletes the group's repair decal instances and their DecalData templates, then forgets its store entry. Called on every rebuild and at teardown.

- `group` (*table|nil*) : Hero Road group.

#### `editor_heroRoadEditor_repairMgr.updateRepairs(group)`

Rebuilds the decal scatter of each placed cluster (first calls clearRepairs). Does nothing more if the road has no repairs, fewer than 2 divPoints, no binormals, no scene folder or a zero length.

- `group` (*table|nil*) : Hero Road group (repairs, divPoints, binormals, divWidths, sceneTreeFolderId).

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua`.*
