# `editor_api_proceduralContentGenerator`

*Fichier : `lua/ge/extensions/editor/api/proceduralContentGenerator.lua` · VM : Game Engine (GE) · 1049 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_proceduralContentGenerator` : `extensions.load("editor_api_proceduralContentGenerator")`, puis la globale `editor_api_proceduralContentGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects)` | clearAllGraphs(deleteOwnedObjects) — same bool semantics as removeGraph. | 1002 |
| `editor_api_proceduralContentGenerator.getGraph(name)` |  | 982 |
| `editor_api_proceduralContentGenerator.graph(nameOrOpts, opts)` | graph("name") / graph("name", opts) returns a cached graph (spawnedIds preserved).<br> graph(opts) / graph() creates an anonymous uncached graph. | 956 |
| `editor_api_proceduralContentGenerator.initialize(editorInstance)` |  | 1021 |
| `editor_api_proceduralContentGenerator.listGraphs()` |  | 973 |
| `editor_api_proceduralContentGenerator.newPoint(opts)` |  | 51 |
| `editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects)` | removeGraph(name, deleteOwnedObjects)<br> deleteOwnedObjects defaults to true: deletes spawned scene objects, then drops the cache entry.<br> Pass false to forget the graph but leave its objects in the scene. | 989 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `graphs` | table |  |
| `nodes` | table |  |

## Classe `Graph`

| Méthode | Description | Ligne |
|---|---|---|
| `Graph:_addNode(node)` |  | 146 |
| `Graph:add(kindOrNode, params)` |  | 912 |
| `Graph:clear()` |  | 203 |
| `Graph:clearSpawned()` |  | 165 |
| `Graph:connect(fromNode, fromPin, toNode, toPin)` |  | 153 |
| `Graph:destroy(deleteOwnedObjects)` |  | 1009 |
| `Graph:fromPoints(params)` |  | 906 |
| `Graph:fromSegments(params)` |  | 907 |
| `Graph:rebuild()` |  | 938 |
| `Graph:run(opts)` |  | 270 |
| `Graph:scatterAlongSpline(params)` |  | 905 |
| `Graph:scatterBox(params)` |  | 902 |
| `Graph:scatterDisk(params)` |  | 904 |
| `Graph:scatterGrid(params)` |  | 903 |

## Classe `Pipe`

| Méthode | Description | Ligne |
|---|---|---|
| `Pipe:clear()` |  | 933 |
| `Pipe:connectTo(toNode, toPin)` |  | 313 |
| `Pipe:filterBounds(params)` |  | 927 |
| `Pipe:offset(params)` |  | 926 |
| `Pipe:randomTransform(params)` |  | 923 |
| `Pipe:rebuild()` |  | 934 |
| `Pipe:run(opts)` |  | 932 |
| `Pipe:setSpawnRandomness(params)` |  | 924 |
| `Pipe:snapTerrain(params)` |  | 925 |
| `Pipe:spawnClass(params)` |  | 930 |
| `Pipe:spawnDecalRoads(params)` |  | 931 |
| `Pipe:spawnPrefab(params)` |  | 929 |
| `Pipe:spawnStatic(params)` |  | 928 |

## Classe `api`

Objet `api` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `api.clearAllGraphs(deleteOwnedObjects)` | clearAllGraphs(deleteOwnedObjects) — same bool semantics as removeGraph. | 1002 |
| `api.getGraph(name)` |  | 982 |
| `api.graph(nameOrOpts, opts)` | graph("name") / graph("name", opts) returns a cached graph (spawnedIds preserved).<br> graph(opts) / graph() creates an anonymous uncached graph. | 956 |
| `api.listGraphs()` |  | 973 |
| `api.newPoint(opts)` |  | 51 |
| `api.removeGraph(name, deleteOwnedObjects)` | removeGraph(name, deleteOwnedObjects)<br> deleteOwnedObjects defaults to true: deletes spawned scene objects, then drops the cache entry.<br> Pass false to forget the graph but leave its objects in the scene. | 989 |

## Appels vers le moteur (C++)

- `Sim.` `findObjectById`, `getUniqueName`
- `obj:` `delete`, `getID`, `getId`, `registerObject`, `setField`, `setPosRot`, `setPosition`, `setScale`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/proceduralContentGenerator.lua`.*
