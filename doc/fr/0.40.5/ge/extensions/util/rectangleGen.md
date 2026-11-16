# `util_rectangleGen`

*Fichier : `lua/ge/extensions/util/rectangleGen.lua` · VM : Game Engine (GE) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_rectangleGen` : `extensions.load("util_rectangleGen")`, puis la globale `util_rectangleGen`

Générateur de graphe par découpage de rectangles, utilisé pour la génération procédurale de circuits (voir procTrack). À partir de rectangles de départ, il coupe successivement le plus grand rectangle découpable (verticalement ou horizontalement) jusqu'à obtenir le nombre de zones voulu, puis calcule les voisinages entre rectangles adjacents. Chaque rectangle devient un nœud (son centre arrondi) du graphe retourné.

## Remarques

- Les paramètres lus : params.startingRects (x, y, width, height, force, noSplit, start, finish), params.rectModeParams (numNodes, minXDist, minYDist, vertSplitFunction(width, height), cutValueFunction()) et params.path.closed.
- Les rectangles marqués noSplit ne sont jamais découpés et sont ajoutés après la phase de découpe ; start et finish ne sont conservés que pour eux (graph.start / graph.finish).
- La découpe s'arrête quand plus aucun rectangle ne peut être coupé : le nombre de nœuds peut alors être inférieur à numNodes.
- Les coordonnées des nœuds sont arrondies à l'entier inférieur (x - x%1).
- Le test « un rectangle sans voisin » est présent mais son action (return graph) est commentée : aucun contrôle de validité n'est effectué.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_rectangleGen.dist(a, b, x, y)` | Distance euclidienne 2D entre les points (a, b) et (x, y). | 196 |
| `util_rectangleGen.getGraph(params)` | Découpe récursivement les rectangles de départ, calcule les voisins (rectangles adjacents partageant un bord) et construit le graphe de nœuds. | 8 |

### Détail des paramètres

#### `util_rectangleGen.dist(a, b, x, y)`

Distance euclidienne 2D entre les points (a, b) et (x, y).

- `a` (*number*) : X du premier point
- `b` (*number*) : Y du premier point
- `x` (*number*) : X du second point
- `y` (*number*) : Y du second point
- **renvoie** : number Distance

#### `util_rectangleGen.getGraph(params)`

Découpe récursivement les rectangles de départ, calcule les voisins (rectangles adjacents partageant un bord) et construit le graphe de nœuds.

- `params` (*table*) : Paramètres : startingRects, rectModeParams, path (voir notes)
- **renvoie** : table {nodes = liste de {x, y, neighbours = liste de {index, dist}, name = 'rect_<i>', force, closestNeighbourDist}, start = nœud ou nil, finish = nœud ou nil}

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/rectangleGen.lua`.*
