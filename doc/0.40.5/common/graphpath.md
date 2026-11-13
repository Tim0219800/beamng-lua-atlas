# `graphpath`

*Fichier : `lua/common/graphpath.lua` · VM : Commun (GE + véhicule) · 1684 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("graphpath")`

Graphe de routes pondéré et algorithmes de recherche de chemin utilisés par l'IA et le navigateur. newGraphpath() crée un graphe (nœuds nommés, arêtes bidirectionnelles avec longueur, drivabilité, voies, sens unique, positions et rayons) ; les méthodes calculent plus court chemin (Dijkstra avec tas minimal), chemins par arêtes avec pénalité de virage, chemin point-à-point, chemins aléatoires/fuite/poursuite, composantes fortement connexes et graphe minorant. Un moddeur l'utilise pour requêter le réseau routier (map.getGraphpath()) ou construire son propre graphe.

## Exemple

```lua
local gp = newGraphpath()
gp:edge('a', 'b', 7)
gp:edge('b', 'c', 3)
print(table.concat(gp:getPath('a', 'c'), '->'))  -- a->b->c
```

## Remarques

- Le module est retourné par require('graphpath') avec deux fonctions : newGraphpath et newMinheap. Il n'y a pas de global newGraphpath sauf si un autre fichier le définit (l'exemple en en-tête l'utilise comme global).
- Deux familles d'arêtes : edge(sp, ep, dist) crée des arêtes simples (len seulement) ; uniEdge/bidiEdge créent des données riches partagées par les deux sens dans graph[a][b] et graph[b][a] (mêmes tables). Seul bidiEdge attribue eId (identifiant d'arête, deux identifiants consécutifs par arête, un par sens).
- Les algorithmes avancés (getPointNodePath, getFilteredPath, getEdgePath, getPathT...) supposent des arêtes riches : drivability, inNode, oneWay, gated, lanes, plus positions et rayons des nœuds. Ils échoueront (nil arithmétique) sur un graphe créé avec edge() seul.
- Les chemins sont des tableaux de noms de nœuds ordonnés de la source vers le but ; les fonctions de recherche renvoient {} si un nœud est inconnu ou inaccessible (sauf mention contraire).
- dirMult : multiplicateur de coût pour parcourir une arête sens unique à contresens (valeur typique 1e3-1e4 ; nil ou 1 = pas de pénalité).
- cutOffDrivability / penaltyAboveCutoff / penaltyBelowCutoff : les routes dont la drivabilité est <= cutOffDrivability ont leur coût multiplié par penaltyBelowCutoff (défaut 10000), les autres par penaltyAboveCutoff (défaut 1).
- Les champs d'arête : len (longueur m), drivability (0..1), speedLimit, lanes (chaîne de '+' et '-' par voie, '+' dans le sens inNode vers outNode), oneWay, gated, inNode/outNode, inPos/outPos, inRadius/outRadius, eId.
- Le tas minimal (minheap) est partagé au niveau du module (variable locale 'que') par la plupart des recherches : ces recherches ne sont pas réentrantes, sauf getPointToPointPathJob qui crée son propre tas.
- Bug mineur : newGraphpath ignore son paramètre edgeCount.
- Bug probable : dans getFleePath et getRandomPathG, visited est initialisé avec {startNode = 0.2}, c'est-à-dire avec la clé littérale 'startNode' et non la valeur de la variable startNode ; le nœud de départ n'est donc pas pénalisé.
- Aucun appel vers le moteur C++ : module Lua pur. Utilise des globales d'autres fichiers : vec3, square, clamp, sign2, tableSize, tableKeys, profilerPushEvent/PopEvent.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `graphpath.newGraphpath(nodeCount, edgeCount)` | Crée un graphe vide. Les paramètres ne servent qu'à pré-allouer les tables. | 123 |
| `graphpath.newMinheap()` | Crée un tas minimal (file de priorité) avec les clés dans la table elle-même et les valeurs dans vals. | 47 |

### Détail des paramètres

#### `graphpath.newGraphpath(nodeCount, edgeCount)`

Crée un graphe vide. Les paramètres ne servent qu'à pré-allouer les tables.

- `nodeCount` (*integer|nil*) : Nombre de nœuds prévu (pré-allocation).
- `edgeCount` (*integer|nil*) : Ignoré par le code.
- **renvoie** : table Objet Graphpath (champs graph, positions, radius, edgeListCount).

#### `graphpath.newMinheap()`

Crée un tas minimal (file de priorité) avec les clés dans la table elle-même et les valeurs dans vals.

- **renvoie** : table Objet minheap.

## Classe `Graphpath`

Graphe non orienté de nœuds identifiés par des clés (chaînes), avec tables graph[n1][n2] = données d'arête, positions[n] (vec3), radius[n] (largeur/demi-largeur de route).

| Méthode | Description | Ligne |
|---|---|---|
| `Graphpath:_getPointToPointPathImpl(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ, yieldFn)` | Implémentation de la recherche point à point : plusieurs nœuds/arêtes d'accès possibles à la source (fournis par l'itérateur iter) et sortie vers targetPos par projection sur les arêtes ; yieldFn optionnel appelé à chaque itération. | 704 |
| `Graphpath:bidiEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad)` | Comme uniEdge mais attribue aussi un identifiant d'arête eId (deux identifiants consécutifs par arête, un par sens) ; nécessaire pour getEdgePath et l'index d'arêtes. | 218 |
| `Graphpath:clear()` | Remplace la table graph par une table vide (positions et rayons conservés). | 173 |
| `Graphpath:edge(sp, ep, dist)` | Ajoute une arête simple de sp vers ep (len = dist) et crée ep si absent. Une seule direction est stockée (graph[sp][ep]). | 177 |
| `Graphpath:edgeLanesInDirection(fromNode, toNode)` | Nombre de voies de l'arête allant de fromNode vers toNode (compte les '+' ou '-' de la chaîne lanes selon le sens). | 515 |
| `Graphpath:export(edgeCount)` | Exporte le graphe sous forme compacte (une entrée par arête, sans doublon) pour sauvegarde ou envoi à une autre VM. | 133 |
| `Graphpath:generateEdgeIndex()` | Construit la table edgeList (eId vers nœud) à partir des arêtes créées par bidiEdge. | 250 |
| `Graphpath:getBranchNodesAround(start, maxRadius)` | Parcours en profondeur dans un rayon autour de start ; renvoie les carrefours (nœuds avec au moins 2 nouveaux voisins) et leurs liens. | 1416 |
| `Graphpath:getChasePath(nodeBehind, nodeAhead, targetNodeBehind, targetNodeAhead, mePos, meVel, targetPos, targetVel, dirMult)` | Chemin pour poursuivre une cible : choisit le nœud devant selon la position/vitesse de la cible et calcule un chemin vers le nœud de la cible. | 1456 |
| `Graphpath:getEdgeIdFromNodes(fromNode, toNode)` | Identifiant d'arête orientée de fromNode vers toNode (eId pour le sens inNode->outNode, eId+1 pour l'inverse). | 263 |
| `Graphpath:getEdgePath(bNode, fNode, goal, dirMult)` | Plus court chemin sur des arêtes (états = arêtes orientées) avec pénalités de virage (gauche/droite plus forte aux carrefours, demi-tour très pénalisé selon la largeur de route). Part de l'arête bNode vers fNode ; le résultat est une liste de nœuds. | 523 |
| `Graphpath:getEdgePositions(n1id, n2id)` | Positions des extrémités d'une arête : position spécifique à l'arête (inPos/outPos) si elle existe, sinon position du nœud. | 271 |
| `Graphpath:getEdgeRadii(n1id, n2id)` | Rayons aux extrémités d'une arête (rayon propre à l'arête sinon celui du nœud). | 277 |
| `Graphpath:getFilteredPath(start, goal, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff)` | Plus court chemin entre deux nœuds avec pénalités de drivabilité (seuil) et de contresens. | 1266 |
| `Graphpath:getFleePath(startNode, initialDir, chasePos, pathLenLimit, rndDirCoef, rndDistCoef)` | Construit gloutonnement un chemin de fuite loin de chasePos, avec une randomisation de direction, jusqu'à dépasser pathLenLimit. | 1480 |
| `Graphpath:getFlows(inNode, outNode)` | Flux (capacité) avant et arrière d'une arête orientée, déduits du rayon du nœud de sortie réparti sur les voies. | 1035 |
| `Graphpath:getMaxNodeAround(start, radius, dir)` | Parcourt le graphe dans un rayon radius autour de start et renvoie le nœud le plus éloigné, ou le plus avancé selon la direction dir. | 1375 |
| `Graphpath:getNodesFromEdgeId(eId)` | Inverse de getEdgeIdFromNodes : renvoie les deux nœuds de l'arête orientée (départ, arrivée). | 267 |
| `Graphpath:getPath(start, goal, dirMult)` | Plus court chemin (Dijkstra) entre deux nœuds en minimisant la somme des len ; les arêtes sens unique parcourues à contresens sont multipliées par dirMult. | 468 |
| `Graphpath:getPathAwayFrom(start, goal, mePos, stayAwayPos, dirMult)` | Chemin vers goal qui évite stayAwayPos : le coût des arêtes est pondéré par (distance à mePos / distance à stayAwayPos). | 1339 |
| `Graphpath:getPathT(start, mePos, pathLenLim, illegalDirPenalty, initDir)` | Choisit un chemin aléatoire pondéré pour un trafic IA à partir de start, en privilégiant routes drivables, continuité de direction et capacité (flux de voies) ; s'arrête à pathLenLim mètres de mePos, jusqu'à 10 candidats tirés au hasard. | 927 |
| `Graphpath:getPathTWithState(start, mePos, pathLenLim, state)` | Variante de getPathT qui réutilise le chemin précédent comme état pour continuer de façon cohérente (le dernier nœud du chemin précédent doit être start). | 1045 |
| `Graphpath:getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Plus court chemin entre un point (vec3) et un nœud, dans un sens ou l'autre (si start est un cdata/vec3, le chemin est calculé depuis le nœud target et inversé). Pénalise la distance entre le point et la route et peut finir sur le milieu d'une arête (premier élément du tableau = nœud de l'arête qui contient la projection du point). | 603 |
| `Graphpath:getPointToPointPath(sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Chemin entre deux positions via le réseau routier (version synchrone de _getPointToPointPathImpl). | 882 |
| `Graphpath:getPointToPointPathJob(job, sourcePos, iter, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Comme getPointToPointPath mais cède la main (job.yield) toutes les 350 itérations (ou global_yieldInterval) pour ne pas bloquer le jeu ; à appeler depuis un job du jobsystem. | 888 |
| `Graphpath:getRandomPath(nodeAhead, nodeBehind, dirMult)` | Chemin aléatoire (jusqu'à 5 candidats à plus de 300 m, tirage pondéré) avec un biais vers la colinéarité des arêtes ; empêche de faire demi-tour vers nodeBehind. | 1616 |
| `Graphpath:getRandomPathG(startNode, initialDir, pathLenLimit, rndDirCoef, rndDistCoef, oneway)` | Construit gloutonnement un chemin aléatoire qui privilégie la continuité de direction, jusqu'à dépasser pathLenLimit. | 1545 |
| `Graphpath:graphMinor()` | Contracte les nœuds de degré 2 : le résultat ne contient que les impasses et carrefours. minor[a][b] est le tableau ordonné des nœuds d'origine reliant a et b (extrémités incluses), symétrique en minor[b][a]. | 373 |
| `Graphpath:import(graphData)` | Reconstruit le graphe depuis le format produit par export (utilise inNode/outNode/eId des arêtes) et l'index des arêtes. | 147 |
| `Graphpath:numOfEdgeLanes(inNode, outNode)` | Nombre total de voies d'une arête et nombre de voies dans le sens inNode->outNode donné ; si lanes est absent, les déduit des rayons (3,45 m par voie). | 904 |
| `Graphpath:scc(v)` | Composantes fortement connexes (Tarjan) en ne suivant que les arêtes de drivabilité exactement 1. Si v est donné, ne calcule que depuis v. | dyn |
| `Graphpath:setNodeRadius(node, radius)` | Définit le rayon d'un nœud. | 292 |
| `Graphpath:setPointPosition(p, pos)` | Définit la position d'un nœud. | 283 |
| `Graphpath:setPointPositionRadius(p, pos, radius)` | Définit position et rayon d'un nœud. | 287 |
| `Graphpath:spanMap(source, nodeBehind, target, edgeDict, dirMult)` | Plus court chemin où le coût de chaque arête est multiplié par edgeDict['a\0b'] (défaut 1e20 si absente), avec forte pénalité (x300) pour repartir vers nodeBehind depuis la source ; sert à couvrir un ensemble d'arêtes. | 1305 |
| `Graphpath:uniEdge(inNode, outNode, dist, drivability, speedLimit, lanes, oneWay, gated, inPos, inRad, outPos, outRad)` | Ajoute une arête riche partagée par les deux sens, sans identifiant d'arête (pas de eId). | 189 |

## Classe `minheap`

File de priorité à clé numérique minimale en tête. Champs : length, vals ; les clés sont stockées aux indices 1..length de la table.

| Méthode | Description | Ligne |
|---|---|---|
| `minheap:clear()` | Vide le tas (conserve la table). | 63 |
| `minheap:empty()` | Indique si le tas est vide. | 59 |
| `minheap:insert(k, v)` | Insère la valeur v avec la clé k. | 68 |
| `minheap:peekKey()` | Clé minimale sans retirer (nil si vide). | 51 |
| `minheap:peekVal()` | Valeur de clé minimale sans retirer. | 55 |
| `minheap:pop()` | Retire et renvoie l'élément de clé minimale. | 88 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/graphpath.lua`.*
