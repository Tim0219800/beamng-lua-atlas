# `editor_api_roadRiver`

*File: `lua/ge/extensions/editor/api/roadRiver.lua` · VM: Game Engine (GE) · 263 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_roadRiver`: `extensions.load("editor_api_roadRiver")`, then the global `editor_api_roadRiver`

Editor API for creating, modifying and deleting roads (DecalRoad) and node-based meshes such as rivers (River, via createMesh). It also keeps a local list of the level's roads (allRoads) and, if the roadTemplates.general.loadTemplates preference is enabled, their midpoints (roadSplines). initialize(editor) adds all these functions to the editor object. Each modification calls editor.setDirty().

## Example

```lua
local id = editor.createRoad({{pos = vec3(0,0,0), width = 4}, {pos = vec3(20,0,0), width = 4}}, {overObjects = true})
editor.addRoadNode(id, {pos = vec3(40,5,0), width = 4, index = 2})
```

## Notes

- addRoadNode reads nodeInfo.pos while its doc comment says "position": the actual key is pos (width and index too).
- createRoad reads roadInfo.overObjects before testing roadInfo: crashes if roadInfo is nil and a terrain exists.
- In deleteRoad, the loop over decorationIDs does not check that scenetree.findObjectById returns an object (decoration already deleted: possible error).
- updateRoadVertices and removeRoadFromList (local) are not all exposed: only updateRoadVertices is.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_roadRiver.initialize(editorInstance)` | Registers all the module's functions on the editor object. Called when the editor API is loaded. *(internal)* | 238 |

### Parameter details

#### `editor_api_roadRiver.initialize(editorInstance)`

Registers all the module's functions on the editor object. Called when the editor API is loaded.

- `editorInstance` (*table*) : Global editor object.

## Class `editor`

Functions added to the editor object by initialize.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addMeshNode(meshObjectId, nodeInfo)` | Inserts a node into a mesh (river, etc.). | 142 |
| `editor.addRoadNode(roadObjectId, nodeInfo)` | Inserts a node into a road and updates its vertices. | 38 |
| `editor.createMesh(type, nodes, fields)` | Creates a node-based mesh of the given type. For 'River', sets default values (waves, speeds, base color 45 108 171 255, water textures). Applies fields via editor.pasteFields, registers it under a unique name "New<type>", adds it to MissionGroup, positions the object on the first node and adds the nodes. | 154 |
| `editor.createRoad(nodes, roadInfo)` | Creates a DecalRoad (improvedSpline, BlankWhite material), registers it, applies roadInfo via editor.pasteFields, adds it to MissionGroup then adds the nodes. Without a terrain in the level, overObjects is forced to true. | 67 |
| `editor.deleteMesh(meshObjectId)` | Deletes a mesh via editor.deleteObject. | 202 |
| `editor.deleteMeshNode(mesh, nodeID)` | Deletes a node from a mesh. | 149 |
| `editor.deleteRoad(roadObjectId)` | Deletes a road, recursively its child roads (childRoads field) and its decorations (decorationIDs), removes it from the lists and marks the editor as modified. | 91 |
| `editor.deleteRoadNode(roadObjectId, nodeID)` | Deletes a road node and updates its vertices. | 120 |
| `editor.getAllRoads()` | Returns the table of known roads (key = id, value true). | 207 |
| `editor.getAllSplines()` | Returns the midpoints remembered per road (only filled if roadTemplates.general.loadTemplates is enabled). | 211 |
| `editor.getNodes(object)` | Reads all the nodes of an object: pos, width, and depth/normal if the object provides getNodeDepth/getNodeNormal. | 127 |
| `editor.initializeLevelRoadsVertices()` | Resets the lists then walks all the level's DecalRoads to register them. Logs an error for an invalid name (starting with digits). | 215 |
| `editor.regenerateAllDecalRoads()` | Calls regenerate() on all known roads. | 229 |
| `editor.resetRoadList()` | Empties the local lists allRoads and roadSplines. | 21 |
| `editor.setNodeDepth(object, nodeID, depth)` | Changes the depth of a node (river-type meshes). | 51 |
| `editor.setNodePosition(object, nodeID, position)` | Moves a node. | 56 |
| `editor.setNodeWidth(object, nodeID, width)` | Changes the width of a road or mesh node. | 46 |
| `editor.updateRoadVertices(road)` | Registers the road in allRoads and, if road templates are enabled, remembers the midpoint positions of its edges (roadSplines). Logs an error if road is nil. | 9 |

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/roadRiver.lua`.*
