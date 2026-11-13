# `editor_roadArchitect_roads`

*Fichier : `lua/ge/extensions/editor/roadArchitect/roads.lua` · VM : Game Engine (GE) · 1645 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_roads` : `extensions.load("editor_roadArchitect_roads")`, puis la globale `editor_roadArchitect_roads`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie)` | Adds a node between the currently-selected node and the next node.<br> [The added node is computed as the midpoint of the two nodes]. | 404 |
| `editor_roadArchitect_roads.addNodeToRoad(rIdx, pos)` | Adds a new node at the end of the road with the given index. | 191 |
| `editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx)` | Adds a new node at the given position, at the given index of the road. | 210 |
| `editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx)` | Performs a height adjustment to the road with the given index.<br> [The manner by which the road height is adjusted depends on various road/node properties]. | 555 |
| `editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx)` | Performs a lateral rotation upon the road with the given index.<br> [The manner by which the road is rotated depends on various road/node properties]. | 602 |
| `editor_roadArchitect_roads.clearAllRoads()` | Removes all road from the scene. | 452 |
| `editor_roadArchitect_roads.clearBridges()` | Clears the bridges structure. | 910 |
| `editor_roadArchitect_roads.computeAABB2D(rIdx)` | Computes the 2D axis-aligned bounding box of the road with the given id.<br> [The profile width is also included in the computation, rather than just the nodes themselves]. | 314 |
| `editor_roadArchitect_roads.computeAllRoadRenderData()` | Re-computes the road render data, for all roads, from fresh. | 1115 |
| `editor_roadArchitect_roads.computeRoadAABB_2D(r)` | Computes a 2D Axis-Aligned Bounding Box which represents the given road.<br> [This is used only with the acceleration tree.] | 137 |
| `editor_roadArchitect_roads.computeRoadRenderDataSingle(i)` | Computes the road render data for a single road. | 1126 |
| `editor_roadArchitect_roads.convertDecalRoads2RoadArchitect()` | Converts all decal roads (from scene tree) to Road Architect style roads.<br> [Note: this removes the original decal roads from the scene tree.] | 1213 |
| `editor_roadArchitect_roads.copyNode(n)` | Deep copies a node. | 285 |
| `editor_roadArchitect_roads.copyRoad(r)` | Deep copies a road. | 663 |
| `editor_roadArchitect_roads.createMultiSelect(gPolygon)` | Create a multi-select (from given polygon) and allow it to be manipulated. | 1075 |
| `editor_roadArchitect_roads.createRoadFromProfile(profile)` | Creates a new road from a given lateral profile. | 61 |
| `editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName)` | Creates a new road from a given lateral profile template name. | 129 |
| `editor_roadArchitect_roads.deserialiseRoad(rSer)` | Deserializes a road. | 1505 |
| `editor_roadArchitect_roads.finalise()` | Switches to the 'finalised' state.<br> [All requested procedural meshes are created, the collision mesh is re-computed, then all requested decals are laid]. | 1270 |
| `editor_roadArchitect_roads.flipRoad(rIdx)` | Flips the direction of the road with the given index.<br> [This will change the lateral position of the road reference line, and may be useful for fixing import errors]. | 873 |
| `editor_roadArchitect_roads.getCurrentMap()` | Gets the currently-loaded map. | 55 |
| `editor_roadArchitect_roads.getMultiSelectionCentroid()` | Gets the centroid of the multi-selection. | 1100 |
| `editor_roadArchitect_roads.getRoadsFromGroup(group)` | Gets the subset of roads from the given group.<br> When group is nil (whole-network terraform), returns every road in the session. | 330 |
| `editor_roadArchitect_roads.getTree()` | Gets the tree. | 182 |
| `editor_roadArchitect_roads.goToRoad(rIdx)` | Moves the camera to directly above the road with the given index. | 478 |
| `editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos)` | Determines if the mouse position is at an intermediate position along the road (between nodes). | 230 |
| `editor_roadArchitect_roads.manageTempRoadSection(pIdx)` | Creates/updates a temporary linear road section, used for displaying and editing profiles. | 959 |
| `editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast)` | Performs a translation upon the road with the given index.<br> [The manner by which the road is translated depends on various road/node properties]. | 515 |
| `editor_roadArchitect_roads.offsetByValue(offset)` | Vertically-offsets all roads to a custom value. | 1257 |
| `editor_roadArchitect_roads.offsetRoads2Terrain()` | Vertically-offsets all roads to the terrain. | 1249 |
| `editor_roadArchitect_roads.recomputeMap()` | Re-computes the map (hash-table) between road names and index in the roads array. | 353 |
| `editor_roadArchitect_roads.removeAll()` | Removes all road meshes from the scene and clears the roads structure. | 913 |
| `editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx)` | Removes a group index from the given road. | 1129 |
| `editor_roadArchitect_roads.removeHiddenRoads()` | Removes all hidden roads from the roads container. | 462 |
| `editor_roadArchitect_roads.removeNode(rIdx, nIdx)` | Removes the node with the given node id, from the road with the given road id. | 385 |
| `editor_roadArchitect_roads.removeRoad(roadName)` | Removes the road with the given id from the scene. | 362 |
| `editor_roadArchitect_roads.removeTree()` | Removes the tree. | 185 |
| `editor_roadArchitect_roads.serialiseRoad(r)` | Serializes a road. | 1446 |
| `editor_roadArchitect_roads.setAllDirty()` | Sets all the roads dirty. | 175 |
| `editor_roadArchitect_roads.setAuditionProfileDirty()` | Sets the flag which indicates if the audition profiles needs updating, to true. | 188 |
| `editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow)` | Sets the visibility of all bridges (master switch). | 1426 |
| `editor_roadArchitect_roads.setCurrentMap(cMap)` | Sets the currently-loaded map. | 58 |
| `editor_roadArchitect_roads.setDirty(r)` | Handles the case when a road needs updated. | 149 |
| `editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset)` | Sets the width at a given node, by dividing the given width into all the lanes. | 260 |
| `editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow)` | Sets the visibility of all overlays (master switch). | 1436 |
| `editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow)` | Sets the visibility of all roads (master switch). | 1416 |
| `editor_roadArchitect_roads.splitRoad(rIdx, nIdx)` | Splits the road with the given index, at the given node position.<br> [This can be used for creating junctions]. | 737 |
| `editor_roadArchitect_roads.unfinalise()` | Leaves the 'finalised' state and returns to the 'edit' state. | 1334 |
| `editor_roadArchitect_roads.updateBridgeParameters(road)` | Update the bridge parameters after a change (width and depth). | 1054 |
| `editor_roadArchitect_roads.updateMultiAfterRemove()` | Updates the multi-selection container, after a road/group of roads was removed. | 1202 |
| `editor_roadArchitect_roads.updateRoads()` | Manages the updating of roads.<br> [Updates the render data for all roads which require it]. | 889 |
| `editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups)` | Decrease the group indices stored in the roads, after the removal of a group. | 1188 |
| `editor_roadArchitect_roads.updateWAndHToNewProfile(road)` | Updates the width/relative height offset for the given road (in all nodes), after changing the lateral road profile. | 304 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `isAuditionProfileDirty` | boolean |  |
| `map` | table |  |
| `multi` | table |  |
| `roads` | table | Public interface. |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/roads.lua`.*
