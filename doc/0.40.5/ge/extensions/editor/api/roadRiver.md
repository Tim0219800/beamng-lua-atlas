# `editor_api_roadRiver`

*Fichier : `lua/ge/extensions/editor/api/roadRiver.lua` · VM : Game Engine (GE) · 263 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_roadRiver` : `extensions.load("editor_api_roadRiver")`, puis la globale `editor_api_roadRiver`

API de l'éditeur pour créer, modifier et supprimer des routes (DecalRoad) et des maillages à nœuds comme les rivières (River, via createMesh). Elle tient aussi une liste locale des routes du niveau (allRoads) et, si la préférence roadTemplates.general.loadTemplates est active, leurs points médians (roadSplines). initialize(editor) ajoute toutes ces fonctions à l'objet editor. Chaque modification appelle editor.setDirty().

## Exemple

```lua
local id = editor.createRoad({{pos = vec3(0,0,0), width = 4}, {pos = vec3(20,0,0), width = 4}}, {overObjects = true})
editor.addRoadNode(id, {pos = vec3(40,5,0), width = 4, index = 2})
```

## Remarques

- addRoadNode lit nodeInfo.pos alors que sa doc-commentaire dit « position » : la clé réelle est pos (width et index aussi).
- createRoad lit roadInfo.overObjects avant de tester roadInfo : plante si roadInfo est nil et qu'un terrain existe.
- Dans deleteRoad, la boucle sur decorationIDs ne teste pas que scenetree.findObjectById renvoie un objet (décoration déjà supprimée : erreur possible).
- updateRoadVertices et removeRoadFromList (local) ne sont pas tous exposés : seul updateRoadVertices l'est.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_roadRiver.initialize(editorInstance)` | Enregistre toutes les fonctions du module sur l'objet editor. Appelé au chargement de l'API de l'éditeur. *(interne)* | 238 |

### Détail des paramètres

#### `editor_api_roadRiver.initialize(editorInstance)`

Enregistre toutes les fonctions du module sur l'objet editor. Appelé au chargement de l'API de l'éditeur.

- `editorInstance` (*table*) : Objet editor global.

## Classe `editor`

Fonctions ajoutées à l'objet editor par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addMeshNode(meshObjectId, nodeInfo)` | Insère un nœud dans un maillage (rivière, etc.). | 142 |
| `editor.addRoadNode(roadObjectId, nodeInfo)` | Insère un nœud dans une route et met à jour ses sommets. | 38 |
| `editor.createMesh(type, nodes, fields)` | Crée un maillage à nœuds du type donné. Pour 'River', pose des valeurs par défaut (ondulations, vitesses, couleur de base 45 108 171 255, textures d'eau). Applique fields via editor.pasteFields, l'enregistre sous un nom unique « New<type> », l'ajoute à MissionGroup, positionne l'objet sur le premier nœud et ajoute les nœuds. | 154 |
| `editor.createRoad(nodes, roadInfo)` | Crée un DecalRoad (improvedSpline, matériau BlankWhite), l'enregistre, applique roadInfo via editor.pasteFields, l'ajoute à MissionGroup puis ajoute les nœuds. Sans terrain dans le niveau, overObjects est forcé à true. | 67 |
| `editor.deleteMesh(meshObjectId)` | Supprime un maillage via editor.deleteObject. | 202 |
| `editor.deleteMeshNode(mesh, nodeID)` | Supprime un nœud d'un maillage. | 149 |
| `editor.deleteRoad(roadObjectId)` | Supprime une route, récursivement ses routes enfants (champ childRoads) et ses décorations (decorationIDs), la retire des listes et marque l'éditeur modifié. | 91 |
| `editor.deleteRoadNode(roadObjectId, nodeID)` | Supprime un nœud de route et met à jour ses sommets. | 120 |
| `editor.getAllRoads()` | Renvoie la table des routes connues (clé = id, valeur true). | 207 |
| `editor.getAllSplines()` | Renvoie les points médians mémorisés par route (rempli seulement si roadTemplates.general.loadTemplates est actif). | 211 |
| `editor.getNodes(object)` | Lit tous les nœuds d'un objet : pos, width, et depth/normal si l'objet fournit getNodeDepth/getNodeNormal. | 127 |
| `editor.initializeLevelRoadsVertices()` | Réinitialise les listes puis parcourt tous les DecalRoad du niveau pour les enregistrer. Journalise une erreur pour un nom invalide (commençant par des chiffres). | 215 |
| `editor.regenerateAllDecalRoads()` | Appelle regenerate() sur toutes les routes connues. | 229 |
| `editor.resetRoadList()` | Vide les listes locales allRoads et roadSplines. | 21 |
| `editor.setNodeDepth(object, nodeID, depth)` | Change la profondeur d'un nœud (maillages type rivière). | 51 |
| `editor.setNodePosition(object, nodeID, position)` | Déplace un nœud. | 56 |
| `editor.setNodeWidth(object, nodeID, width)` | Change la largeur d'un nœud de route ou de maillage. | 46 |
| `editor.updateRoadVertices(road)` | Enregistre la route dans allRoads et, si les templates de route sont activés, mémorise les positions médianes de ses arêtes (roadSplines). Journalise une erreur si road est nil. | 9 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/roadRiver.lua`.*
