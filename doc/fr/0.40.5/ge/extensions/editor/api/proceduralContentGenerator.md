# `editor_api_proceduralContentGenerator`

*Fichier : `lua/ge/extensions/editor/api/proceduralContentGenerator.lua` · VM : Game Engine (GE) · 1049 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_proceduralContentGenerator` : `extensions.load("editor_api_proceduralContentGenerator")`, puis la globale `editor_api_proceduralContentGenerator`

Générateur de contenu procédural (PCG) pour l'éditeur : on construit un graphe de nœuds (générateurs de points, transformations, spawners) puis on l'exécute pour créer des objets dans le niveau (TSStatic, prefabs, objets d'une classe quelconque, DecalRoad). Les données circulant entre nœuds sont des « points » (pos, rot, scale, bounds, color, spawnRandomness) ou des « segments » (routes). Les graphes nommés sont mis en cache ; chaque graphe retient les ids des objets qu'il a créés pour les supprimer à la ré-exécution. L'API est exposée en M.* et, après initialize(editor), en editor.pcg et editor.proceduralContentGenerator.

## Exemple

```lua
local pcg = extensions.editor_api_proceduralContentGenerator
local g = pcg.graph('arbres', {seed = 42})
g:scatterDisk({center = vec3(0,0,0), radius = 50, count = 30})
  :snapTerrain({offset = 0})
  :randomTransform({yaw = {0, 360}, scale = {0.8, 1.2}})
  :spawnStatic({paths = {'/art/shapes/trees/tree1.dae'}, group = 'PCG_Arbres'})
g:run()
```

## Remarques

- Types de nœuds (table nodes / M.nodes) : scatterBox, scatterGrid, scatterDisk, scatterAlongSpline, fromPoints, fromSegments (générateurs) ; randomTransform, setSpawnRandomness, snapTerrain, offset, filterBounds (transformations) ; spawnStatic, spawnPrefab, spawnClass, spawnDecalRoads (spawners).
- Chaque paramètre de nœud peut être donné dans params ou arriver par un pin connecté (resolvePin : lien entrant prioritaire sur params).
- Le générateur aléatoire est un LCG déterministe (graine = opts.seed de run, sinon graph.seed, défaut 1) : même graine, même résultat.
- Graph:run(opts) : opts.replace ~= false (défaut) supprime d'abord les objets créés précédemment et vide les SimGroup suivis (spawnGroups) : tout le contenu du groupe, même ajouté à la main, est supprimé. Les nœuds sont exécutés en ordre topologique ; un cycle est journalisé (log E 'pcg') et les nœuds du cycle ne sont pas exécutés.
- Les spawners créent les objets dans un SimGroup (défaut 'PCG_Generated', créé sous MissionGroup si absent).
- Pour fromSegments, les segments acceptent {nodes = {{pos,width}}}, {path = {pos...}} ou {a, b, width}. spawnDecalRoads ignore les segments de moins de 2 nœuds ; snapTerrain vaut true par défaut, matériau par défaut 'road_asphalt_2lane', largeur 8.
- Pipe:spawnStatic/spawnPrefab/spawnClass/spawnDecalRoads renvoient le Graph (pas un Pipe) : la chaîne s'arrête là.
- Graph:rebuild() vide seulement la liste de nœuds (les objets spawnés restent) ; Graph:fromSegments renvoie un Pipe dont le pin est 'segments'.
- scatterAlongSpline modes : 'equal' (spacing, startOffset), 'count', 'random' (count, minSpacing), 'fixed' (distances) ; alignToTangent vaut true par défaut.
- M.graphs est la table de cache (nom -> Graph) partagée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects)` | Appelle removeGraph sur tous les graphes en cache, avec la même sémantique de deleteOwnedObjects. | 1002 |
| `editor_api_proceduralContentGenerator.getGraph(name)` | Renvoie le graphe en cache de ce nom ou nil. | 982 |
| `editor_api_proceduralContentGenerator.graph(nameOrOpts, opts)` | graph('nom') / graph('nom', opts) renvoie un graphe mis en cache (le crée au besoin ; opts.seed met à jour la graine d'un graphe existant). graph(opts) ou graph() crée un graphe anonyme non mis en cache. | 956 |
| `editor_api_proceduralContentGenerator.initialize(editorInstance)` | Mémorise l'objet editor et expose l'API (graph, graphs, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint, nodes) sous editor.pcg et editor.proceduralContentGenerator. Appelé au chargement de l'API de l'éditeur. *(interne)* | 1021 |
| `editor_api_proceduralContentGenerator.listGraphs()` | Liste triée des noms de graphes en cache. | 973 |
| `editor_api_proceduralContentGenerator.newPoint(opts)` | Crée un point PCG normalisé : pos (vec3, défaut 0), rot (quat, identité), scale (vec3, défaut 1), bounds (vec3, défaut 1), color ({r,g,b,a} défaut blanc), spawnRandomness (0..1, défaut 0). Les vec3/quat peuvent être donnés en tables {x,y,z} ou {1,2,3}; un nombre seul devient un vec3 uniforme. | 51 |
| `editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects)` | Retire un graphe du cache. Par défaut supprime aussi les objets de la scène qu'il a créés ; avec false, les oublie sans les supprimer. | 989 |

### Détail des paramètres

#### `editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects)`

Appelle removeGraph sur tous les graphes en cache, avec la même sémantique de deleteOwnedObjects.

- `deleteOwnedObjects` (*boolean|nil*) : Défaut true.

#### `editor_api_proceduralContentGenerator.getGraph(name)`

Renvoie le graphe en cache de ce nom ou nil.

- `name` (*string*) : Nom du graphe.
- **renvoie** : table|nil Graph.

#### `editor_api_proceduralContentGenerator.graph(nameOrOpts, opts)`

graph('nom') / graph('nom', opts) renvoie un graphe mis en cache (le crée au besoin ; opts.seed met à jour la graine d'un graphe existant). graph(opts) ou graph() crée un graphe anonyme non mis en cache.

- `nameOrOpts` (*string|table|nil*) : Nom du graphe, ou table d'options pour un graphe anonyme.
- `opts` (*table|nil*) : {seed = number} (graine par défaut 1).
- **renvoie** : table Graph.

#### `editor_api_proceduralContentGenerator.initialize(editorInstance)`

Mémorise l'objet editor et expose l'API (graph, graphs, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint, nodes) sous editor.pcg et editor.proceduralContentGenerator. Appelé au chargement de l'API de l'éditeur.

- `editorInstance` (*table*) : Objet editor global.

#### `editor_api_proceduralContentGenerator.listGraphs()`

Liste triée des noms de graphes en cache.

- **renvoie** : string[] Noms.

#### `editor_api_proceduralContentGenerator.newPoint(opts)`

Crée un point PCG normalisé : pos (vec3, défaut 0), rot (quat, identité), scale (vec3, défaut 1), bounds (vec3, défaut 1), color ({r,g,b,a} défaut blanc), spawnRandomness (0..1, défaut 0). Les vec3/quat peuvent être donnés en tables {x,y,z} ou {1,2,3}; un nombre seul devient un vec3 uniforme.

- `opts` (*table|nil*) : {pos, rot, scale, bounds, color, spawnRandomness}.
- **renvoie** : table Point.

#### `editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects)`

Retire un graphe du cache. Par défaut supprime aussi les objets de la scène qu'il a créés ; avec false, les oublie sans les supprimer.

- `name` (*string*) : Nom du graphe.
- `deleteOwnedObjects` (*boolean|nil*) : Défaut true ; false pour garder les objets.
- **renvoie** : boolean false si le graphe n'existe pas.

## Champs

| Champ | Type | Description |
|---|---|---|
| `graphs` | table<string, table> | Cache des graphes nommés (nom -> Graph). |
| `nodes` | table<string, function> | Fabriques de nœuds par nom (scatterBox, spawnStatic…) ; chacune prend une table params et renvoie un nœud brut. |

## Classe `Graph`

Graphe de nœuds (champs : name, seed, nodes, spawnedIds, spawnGroups). Les méthodes de fabrique renvoient un Pipe pour chaîner.

| Méthode | Description | Ligne |
|---|---|---|
| `Graph:_addNode(node)` | Ajoute un nœud brut au graphe, lui donne un id et renvoie le nœud. | 146 |
| `Graph:add(kindOrNode, params)` | Ajoute un nœud par nom de fabrique (string) ou un nœud personnalisé (table avec execute(node, ctx, get)). Nom inconnu : log E et renvoie nil. | 912 |
| `Graph:clear()` | Alias de clearSpawned. | 203 |
| `Graph:clearSpawned()` | Supprime les objets créés par le graphe (via editor.deleteObject) et vide les SimGroup suivis par nom. | 165 |
| `Graph:connect(fromNode, fromPin, toNode, toPin)` | Relie la sortie fromPin de fromNode à l'entrée toPin de toNode. Accepte aussi la forme connect(pipe, toNode, toPin). | 153 |
| `Graph:destroy(deleteOwnedObjects)` | Détruit le graphe : le retire du cache s'il y est et supprime ses objets (sauf deleteOwnedObjects == false). | 1009 |
| `Graph:fromPoints(params)` | Nœud source recopiant une liste de points donnée (params.points). | 906 |
| `Graph:fromSegments(params)` | Nœud source de segments de route (params.segments). | 907 |
| `Graph:rebuild()` | Vide la liste des nœuds pour reconstruire le graphe (ne supprime pas les objets créés). | 938 |
| `Graph:run(opts)` | Exécute le graphe en ordre topologique. Par défaut supprime d'abord les objets précédents. Marque l'éditeur modifié. | 270 |
| `Graph:scatterAlongSpline(params)` | Nœud plaçant des points le long d'un chemin polyligne. Params : path, closed, mode, count, spacing, minSpacing, distances, startOffset, lateralJitter, upJitter, alignToTangent. | 905 |
| `Graph:scatterBox(params)` | Nœud générant count points aléatoires dans une boîte. Params : center, extent (défaut 10,10,0), count. | 902 |
| `Graph:scatterDisk(params)` | Nœud générant count points répartis uniformément dans un disque/anneau. Params : center, radius (défaut 10), innerRadius, count. | 904 |
| `Graph:scatterGrid(params)` | Nœud générant une grille de points. Params : center, extent, spacing (défaut 2), jitter. | 903 |

## Classe `Pipe`

Poignée de chaînage sur un pin de sortie d'un nœud (graph, node, pin). Chaque méthode ajoute un nœud relié à ce pin et renvoie un nouveau Pipe (sauf les spawners).

| Méthode | Description | Ligne |
|---|---|---|
| `Pipe:clear()` | Raccourci vers Graph:clear. | 933 |
| `Pipe:connectTo(toNode, toPin)` | Relie le pin à toNode.toPin (défaut 'points') et renvoie un Pipe sur ce nœud. | 313 |
| `Pipe:filterBounds(params)` | Ne garde que les points dans la boîte min/max ou dans la sphère center/radius. | 927 |
| `Pipe:offset(params)` | Décale chaque point de delta, plus un décalage aléatoire +-random par axe. | 926 |
| `Pipe:randomTransform(params)` | Ajoute une rotation aléatoire (yaw, pitch, roll en degrés, nombre ou {min,max}) et/ou une échelle (nombre, {min,max} ou {x,y,z} de plages). | 923 |
| `Pipe:rebuild()` | Raccourci vers Graph:rebuild. | 934 |
| `Pipe:run(opts)` | Raccourci vers Graph:run. | 932 |
| `Pipe:setSpawnRandomness(params)` | Fixe spawnRandomness (0..1) de chaque point : value fixe, range tirée, sinon aléatoire. Sert à choisir l'élément dans les listes de paths/classes. | 924 |
| `Pipe:snapTerrain(params)` | Pose chaque point à la hauteur du terrain (core_terrain.getTerrainHeight) + offset. Sans terrain, ne change rien. | 925 |
| `Pipe:spawnClass(params)` | Crée un objet de classe quelconque par point (classe choisie dans classes) et applique les champs fields via setField. Params : classes, fields, group, namePrefix. | 930 |
| `Pipe:spawnDecalRoads(params)` | Crée un DecalRoad par segment. Params : segments, group, namePrefix, material, width, snapTerrain, overObjects, drivability, textureLength, improvedSpline. | 931 |
| `Pipe:spawnPrefab(params)` | Instancie un prefab par point via spawnPrefab (chemin choisi dans paths). Params : paths, group, namePrefix. | 929 |
| `Pipe:spawnStatic(params)` | Crée un TSStatic par point (shape choisi dans paths selon spawnRandomness), collision 'Collision Mesh', couleur d'instance du point. Params : paths, group, namePrefix, collisionType, decalType. | 928 |

## Classe `api`

Table exposée comme editor.pcg / editor.proceduralContentGenerator : mêmes fonctions que le module (graph, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint) et champs graphs, nodes.

Objet `api` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `api.clearAllGraphs(deleteOwnedObjects)` | Voir clearAllGraphs du module. | 1002 |
| `api.getGraph(name)` | Voir getGraph du module. | 982 |
| `api.graph(nameOrOpts, opts)` | Voir graph du module. | 956 |
| `api.listGraphs()` | Voir listGraphs du module. | 973 |
| `api.newPoint(opts)` | Voir newPoint du module. | 51 |
| `api.removeGraph(name, deleteOwnedObjects)` | Voir removeGraph du module. | 989 |

## Appels vers le moteur (C++)

- `Sim.` `findObjectById`, `getUniqueName`
- `obj:` `delete`, `getID`, `getId`, `registerObject`, `setField`, `setPosRot`, `setPosition`, `setScale`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/proceduralContentGenerator.lua`.*
