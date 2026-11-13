# `editor_api_roadRiver`

*Fichier : `lua/ge/extensions/editor/api/roadRiver.lua` · VM : Game Engine (GE) · 263 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_roadRiver` : `extensions.load("editor_api_roadRiver")`, puis la globale `editor_api_roadRiver`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_roadRiver.initialize(editorInstance)` |  | 238 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addMeshNode(meshObjectId, nodeInfo)` |  | 142 |
| `editor.addRoadNode(roadObjectId, nodeInfo)` | Add a new road node to a road object.<br> @param roadObjectId the road object id<br> @param nodeInfo the node info table, fields:<br> *position* - node position<br> *width* - node width<br> *index* - node index to insert node into. Use U32_MAX to insert at the end.<br> @returns new node id | 38 |
| `editor.createMesh(type, nodes, fields)` |  | 154 |
| `editor.createRoad(nodes, roadInfo)` | Create a new road object.<br> @param nodes list of nodes to create the road with, fields per node:<br> *pos* - position of the node<br> *width* - width of the node<br> @param roadInfo dictionary with the fields that should be set for the new road<br> @returns road object id | 67 |
| `editor.deleteMesh(meshObjectId)` |  | 202 |
| `editor.deleteMeshNode(mesh, nodeID)` |  | 149 |
| `editor.deleteRoad(roadObjectId)` | Delete the road object specified by its id.<br> @param roadObjectId the road object id | 91 |
| `editor.deleteRoadNode(roadObjectId, nodeID)` | Delete a road node by its id.<br> @param roadObjectId the road object id<br> @param nodeId the node id | 120 |
| `editor.getAllRoads()` |  | 207 |
| `editor.getAllSplines()` |  | 211 |
| `editor.getNodes(object)` |  | 127 |
| `editor.initializeLevelRoadsVertices()` |  | 215 |
| `editor.regenerateAllDecalRoads()` |  | 229 |
| `editor.resetRoadList()` |  | 21 |
| `editor.setNodeDepth(object, nodeID, depth)` |  | 51 |
| `editor.setNodePosition(object, nodeID, position)` |  | 56 |
| `editor.setNodeWidth(object, nodeID, width)` |  | 46 |
| `editor.updateRoadVertices(road)` |  | 9 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/roadRiver.lua`.*
