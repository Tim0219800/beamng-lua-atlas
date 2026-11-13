# `util_procTrack`

*Fichier : `lua/ge/extensions/util/procTrack.lua` · VM : Game Engine (GE) · 1475 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_procTrack` : `extensions.load("util_procTrack")`, puis la globale `util_procTrack`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_procTrack.checkParams()` | this function checks if the parameters are OK. | 244 |
| `util_procTrack.createPylons(nodes)` | create pylons, like circles and gates. | 975 |
| `util_procTrack.createWaypointsForScenario(nodes)` | creates the waypoint positions, angles etc. | 1118 |
| `util_procTrack.createWindingPath(path)` | this function extracts information such as angle, distance between nodes from the path.<br> then | 589 |
| `util_procTrack.createWindingRoad(nodes)` | actually creates the road object. | 862 |
| `util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode)` | this function checks wether adding the next edge for the node current is allowed or not. | 498 |
| `util_procTrack.decorateStartAndFinish(nodes)` | decorates the start and finish nodes. | 918 |
| `util_procTrack.determineInOutAngle(nodes)` | determines the in and out angles for circles. | 756 |
| `util_procTrack.dist(a, b, x, y)` | returns the distance from a/b to x/y. | 1264 |
| `util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes)` | this function checks if the adding of the nextNode would result in splitting the graph. | 515 |
| `util_procTrack.getBaseInformationFromPath(path)` | extracts basic information from the path like angles, distances, normals etc. | 634 |
| `util_procTrack.getDefaultParams()` | This function gives you a fresh instance of the default params | 10 |
| `util_procTrack.getPathRoadNodes(nodes)` | gets all the nodes needed to create a road around the nodes. | 788 |
| `util_procTrack.getPosition(xx, yy, zz)` | this function transforms local position to global position. | 1391 |
| `util_procTrack.getRotationDeg(dd)` | this function transforms local angle in rad to global angle in deg. | 1387 |
| `util_procTrack.getSeed()` |  | 1429 |
| `util_procTrack.intToWords(int)` |  | 1461 |
| `util_procTrack.isInList(list, element)` | checks wether an element is in a list or not. | 571 |
| `util_procTrack.makeBarrel(pos, rot, skin)` |  | 1358 |
| `util_procTrack.makeBaseNodePositions()` |  | 307 |
| `util_procTrack.makeConcreteRing(pos, radius)` |  | 1329 |
| `util_procTrack.makeGate(pos, rot)` |  | 1302 |
| `util_procTrack.makeGymkhana(inParams)` | this is the main function and will create a complete track . | 120 |
| `util_procTrack.makePath(graph)` | this function finds a random path through the nodes with backtracking.<br> NOTE: currently uses depth first search with backtracking which has a worst case of about O(#edges!) which is very bad. Unfortunately, the hamilton path problem is NP-complete,<br> meaning there is no know algorithm to solve this in polynomial time, although algorithms exist to solve it in exponential time | 368 |
| `util_procTrack.makePylon(pos, size, rot, skin)` | makes a pylon (Cube) with parameters. | 1269 |
| `util_procTrack.reGenerate(seed)` | this function regenerates the whole track. a new seed can be set. | 109 |
| `util_procTrack.wordsToInt(word)` |  | 1437 |

**Évènements UI (guihooks.trigger) :** `Message`, `procTrackSeed`

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/procTrack.lua`.*
