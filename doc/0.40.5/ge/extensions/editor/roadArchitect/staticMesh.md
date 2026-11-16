# `editor_roadArchitect_staticMesh`

*File: `lua/ge/extensions/editor/roadArchitect/staticMesh.lua` · VM: Game Engine (GE) · 268 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_staticMesh`: `extensions.load("editor_roadArchitect_staticMesh")`, then the global `editor_roadArchitect_staticMesh`

Places TSStatic objects (.dae files) along the Road Architect roads, from the layers of the lateral profile. Two layer types are handled: type 4 (same mesh repeated over the whole length of the road) and type 5 (a single mesh unit). Called by roads.finalise; the objects are removed by tryRemove on unfinalise or when the road is deleted.

## Notes

- The objects are created with decalType = 'None', canSave = true and added to the road's scene folder.
- The name of each unique type 5 object is '<matDisplay> <road index>- single -<layer index>'.
- The layer.mat field contains the shape file path (shapeName).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder)` | Iterates over the layers of the road's profile and creates the corresponding static objects (type 4: repetition along the road; type 5: single unit). | 228 |
| `editor_roadArchitect_staticMesh.tryRemove(roadName)` | Removes from the scene all static meshes (repeated and unique) created for the road, and forgets their entries. | 246 |

### Parameter details

#### `editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder)`

Iterates over the layers of the road's profile and creates the corresponding static objects (type 4: repetition along the road; type 5: single unit).

- `r` (*table*) : Road with profile.layers.
- `roadIdx` (*integer*) : Index of the road (used for naming).
- `folder` (*userdata*) : Scene SimGroup.

#### `editor_roadArchitect_staticMesh.tryRemove(roadName)`

Removes from the scene all static meshes (repeated and unique) created for the road, and forgets their entries.

- `roadName` (*string*) : Name of the road (the code comment talks about an index, but the key is the name).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/staticMesh.lua`.*
