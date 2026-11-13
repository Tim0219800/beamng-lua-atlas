# `editor_roadArchitect_junctions`

*Fichier : `lua/ge/extensions/editor/roadArchitect/junctions.lua` · VM : Game Engine (GE) · 10439 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_junctions` : `extensions.load("editor_roadArchitect_junctions")`, puis la globale `editor_roadArchitect_junctions`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_junctions.addCrossroads(isNew)` | Adds a 4-way crossroads junction. | 8381 |
| `editor_roadArchitect_junctions.addHighwayMergeJunction(isNew)` | Adds a highway merge junction (merges eg 2 lanes -> 1 lane, 3 lanes -> lanes, etc). | 9056 |
| `editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew)` | Adds a highway separator junction (splits a two-way highway into two one-way sections, for separate linking). | 9246 |
| `editor_roadArchitect_junctions.addHighwaySlipJunction(isNew)` | Adds a highway slip junction. | 9429 |
| `editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew)` | Adds a highway <-> urban transition junction (tapers the central reservation down to a centerline). | 9155 |
| `editor_roadArchitect_junctions.addPedXJunction(isNew)` | Adds a 2-way pedestrian crossing junction (ped x + traffic lights only). | 8280 |
| `editor_roadArchitect_junctions.addRoundaboutJunction(isNew)` | Adds a 4-way roundabout junction. | 8684 |
| `editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew)` | Adds an urban sidewalk/non-sidewalk transition junction. | 8785 |
| `editor_roadArchitect_junctions.addShoulderFadeJunction(isNew)` | Adds a shoulder fade junction (tapers out the hard shoulder lane of a 1-way highway, to become a 1-way rural road). | 9330 |
| `editor_roadArchitect_junctions.addTJunction(isNew)` | Adds a 3-way T-junction. | 8482 |
| `editor_roadArchitect_junctions.addUrbanMergeJunction(isNew)` | Adds an urban merge junction (merges eg 2 lanes -> 1 lane, 3 lanes -> lanes, etc). | 8869 |
| `editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew)` | Adds an urban separator junction. | 8970 |
| `editor_roadArchitect_junctions.addYJunction(isNew)` | Adds a 3-way angled Y-junction. | 8583 |
| `editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad)` | Chops all the given roads up to the given sphere (removes any nodes inside the sphere, and projects the corresponding start/end node onto the sphere). | 10076 |
| `editor_roadArchitect_junctions.clearAllJunctions()` | Removes all junctions. | 9537 |
| `editor_roadArchitect_junctions.computeInitRot(jIdx)` | Computes the rotation angle (around Z-axis) at junction place. Filters by case. | 97 |
| `editor_roadArchitect_junctions.copyJunction(jct)` | Deep copies the given junction. | 9672 |
| `editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen)` |  | 10146 |
| `editor_roadArchitect_junctions.deserialiseJct(jSer)` | Deserialises the given junction. | 9788 |
| `editor_roadArchitect_junctions.finaliseJunction(jIdx)` | Finalises the junction with the given index. | 9651 |
| `editor_roadArchitect_junctions.getJunctionCentroid(jIdx)` | Compute the centroid of the junction with the given index. Filters by case. | 65 |
| `editor_roadArchitect_junctions.goToJunction(jIdx)` | Moves the camera above the junction with the given index, to highlight it to the user. | 9588 |
| `editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform)` | Imports a road network from the L-System tool. | 10329 |
| `editor_roadArchitect_junctions.loadJunction()` | Loads a junction from disk. | 9861 |
| `editor_roadArchitect_junctions.removeJunction(jIdx)` | Removes the junction with the given index. | 9528 |
| `editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta)` | Rotates the junction with the given index, by the given angle. | 9557 |
| `editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q)` | Rotates the junction with the given index, by the given quaternion. | 9575 |
| `editor_roadArchitect_junctions.saveJunction(jIdx)` | Saves the junction with the given id to disk. | 9846 |
| `editor_roadArchitect_junctions.serialiseJct(jct)` | Serialises the given junction. | 9730 |
| `editor_roadArchitect_junctions.setAllMeshProperty(jIdx)` | Sets all the roads in the junction with the given id, to use meshes/not use meshes. | 9629 |
| `editor_roadArchitect_junctions.translateJunction(jIdx, offset)` | Translates the junction with the given index, by the given vector. | 9544 |
| `editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx)` | Update the junction with the given id, after a parameter change. | 8244 |
| `editor_roadArchitect_junctions.updateJunctionCondition(jct)` | Updates the condition of the given junction. | 152 |
| `editor_roadArchitect_junctions.updateJunctionsAfterRoadRemove()` | Updates the junctions list (called after a road has been removed). | 9637 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `junctions` | table | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/junctions.lua`.*
