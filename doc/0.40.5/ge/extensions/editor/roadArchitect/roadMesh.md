# `editor_roadArchitect_roadMesh`

*File: `lua/ge/extensions/editor/roadArchitect/roadMesh.lua` · VM: Game Engine (GE) · 899 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_roadMesh`: `extensions.load("editor_roadArchitect_roadMesh")`, then the global `editor_roadArchitect_roadMesh`

Creates the procedural meshes (ProceduralMesh scene objects) of Road Architect: sidewalks with curbs (kerbs) on the left or right of the road, and bridges. It keeps internally the mesh tables by road name and by bridge name, so they can be deleted later. It is called by the roads module during finalise/unfinalise and updateRoads.

## Notes

- createRoad reads r.renderData and r.laneKeys: the road must have been computed (geometry.computeRoadRenderData) beforehand.
- createRoad only generates meshes for lateral sections of type 'sidewalk' (one lane per section); the other lane types are rendered by the decals, not by this module.
- The meshes are added to the supplied scene folder, with canSave = true.
- Bridges are named 'Bridge_<road name>'; an existing bridge is deleted then recreated on each updateBridge.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_roadMesh.clearBridges()` | Replaces the bridges table with an empty table without deleting the scene objects. | 888 |
| `editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder)` | Splits the road into lateral sections and creates a sidewalk + curb mesh for each 'sidewalk' lane (left or right side depending on isLeftSide). Stores the meshes under the road name. | 669 |
| `editor_roadArchitect_roadMesh.tryRemove(roadName)` | Removes from the scene the meshes created for the road (if any) and forgets the entry. | 686 |
| `editor_roadArchitect_roadMesh.tryRemoveBridge(name)` | Deletes the bridge mesh object and forgets it. | 879 |
| `editor_roadArchitect_roadMesh.updateBridge(r, folder)` | (Re)creates the procedural mesh of a bridge: deletes the old one, computes the vertex rings from the renderData (lanes -1 to 1), generates surface and caps, and adds it to the folder. | 697 |

### Parameter details

#### `editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder)`

Splits the road into lateral sections and creates a sidewalk + curb mesh for each 'sidewalk' lane (left or right side depending on isLeftSide). Stores the meshes under the road name.

- `r` (*table*) : Road with renderData.
- `roadMeshIdx` (*integer*) : Index of the road, used to name the created objects.
- `folder` (*userdata*) : Scene SimGroup that receives the meshes.

#### `editor_roadArchitect_roadMesh.tryRemove(roadName)`

Removes from the scene the meshes created for the road (if any) and forgets the entry.

- `roadName` (*string*) : Name of the road.

#### `editor_roadArchitect_roadMesh.tryRemoveBridge(name)`

Deletes the bridge mesh object and forgets it.

- `name` (*string*) : Name (identifier) of the bridge type road.

#### `editor_roadArchitect_roadMesh.updateBridge(r, folder)`

(Re)creates the procedural mesh of a bridge: deletes the old one, computes the vertex rings from the renderData (lanes -1 to 1), generates surface and caps, and adds it to the folder.

- `r` (*table*) : Bridge type road, with renderData.
- `folder` (*userdata*) : SimGroup "Road Architect - Bridge <name>".

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/roadMesh.lua`.*
