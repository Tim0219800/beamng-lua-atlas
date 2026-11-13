# `util_procTrack`

*Fichier : `lua/ge/extensions/util/procTrack.lua` · VM : Game Engine (GE) · 1475 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_procTrack` : `extensions.load("util_procTrack")`, puis la globale `util_procTrack`

Générateur procédural de parcours de type gymkhana, utilisé par les scénarios de génération de piste. À partir de rectangles de départ (params.startingRects), il découpe la zone avec util/rectangleGen pour obtenir un graphe de points clés, cherche un chemin aléatoire qui les traverse (parcours en profondeur avec retour arrière), le transforme en tracé sinueux (virages, boucles, lignes droites), puis crée dans le niveau, sous un SimGroup « GymkhanaArena », la route (DecalRoad), des plots, des portes, des anneaux de béton, des barils et des waypoints BeamNGWaypoint pour le scénario courant. Une graine (seed) rend la piste reproductible ; elle peut aussi s'exprimer sous forme de mots (intToWords/wordsToInt). Les objets utilisent des modèles du niveau driver_training.

## Exemple

```lua
local p = extensions.util_procTrack.getDefaultParams()
p.populateFunction = function(params, scenarioParam) --[[ remplir params.startingRects ]] end
p.decoration.afterFunction = function(scenarioParam) end
extensions.util_procTrack.makeGymkhana(p)
```

## Remarques

- L'appelant doit fournir params.populateFunction(params, scenarionParam) (qui remplit params.startingRects, rootX/rootY/rootZ, etc.) et params.decoration.afterFunction(scenarionParam) ; le nom du champ est écrit « scenarionParam » (faute de frappe conservée dans le code).
- Les paramètres par défaut : zone de racine (rootX, rootY, rootZ, rootAngleRad), limites de tentatives (nodeCreationCounter 5, pathCounter 15), rectModeParams (minXDist/minYDist 15 m, minNodes 6, maxNodes 27, density 0,85 pour 1000 m2, fixNodes), path (minRadius 2,5, pylonRadiusThreshold 6, probabilités de boucle et de porte, closed, lapCount), decoration (gateHeight 3, gateWidth 4,5).
- Le nombre de nœuds vaut (nombre de rectangles noSplit) + surface / (1000 / density) + un aléa entre randomMin et randomMax, borné entre minNodes et maxNodes. Au-delà de 27 la génération peut devenir extrêmement longue (commentaire du code).
- La recherche de chemin est un parcours en profondeur avec retour arrière sur un problème de chemin hamiltonien (NP-complet) : le pire cas est très coûteux.
- La graine est un entier : sans seed, elle est tirée avec os.time puis math.random. math.randomseed(params.seed) est appelé dans checkParams.
- La génération modifie le niveau (création de SimGroup, DecalRoad, TSStatic, waypoints, be:reloadCollision()) et le scénario courant (scenario.nodes, scenario.lapConfig) ; elle supprime l'ancien groupe GymkhanaArena.
- Avec debug.neighbours = true (valeur par défaut) des routes de débogage blanches relient les nœuds voisins ; debug.rects est également true par défaut.
- makeBarrel concatène skin sans valeur par défaut : un skin nil provoquerait une erreur Lua.
- Les coordonnées locales (x, y, z) passées à getPosition sont tournées de rootAngleRad puis décalées de rootX/rootY/rootZ.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_procTrack.checkParams()` | Vérifie et complète les paramètres : fixe la graine, appelle populateFunction, calcule la densité et le nombre de nœuds cible (borné par minNodes et maxNodes) et charge util/rectangleGen. | 244 |
| `util_procTrack.createPylons(nodes)` | Crée les plots, portes et anneaux de béton aux nœuds (cercle ou plot central selon le rayon, porte pour une ligne droite ou un rayon nul). | 975 |
| `util_procTrack.createWaypointsForScenario(nodes)` | Crée les positions et angles des waypoints (objets BeamNGWaypoint directionnels) et remplit scenario.nodes / scenario.lapConfig du scénario courant. | 1118 |
| `util_procTrack.createWindingPath(path)` | Extrait du chemin les informations de tracé (angles, distances, normales), détermine les rayons et les types de nœuds (droite, courbe, boucle, porte) puis calcule les points de route. | 589 |
| `util_procTrack.createWindingRoad(nodes)` | Crée les objets DecalRoad de la route (matériaux tread_marks_clean et road_orange_markings) dans le groupe GymkhanaArena. | 862 |
| `util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode)` | Teste si l'ajout de la prochaine arête depuis le nœud courant est interdit. | 498 |
| `util_procTrack.decorateStartAndFinish(nodes)` | Décore les nœuds de départ et d'arrivée. | 918 |
| `util_procTrack.determineInOutAngle(nodes)` | Détermine les angles d'entrée et de sortie autour des cercles (virages). | 756 |
| `util_procTrack.dist(a, b, x, y)` | Distance euclidienne 2D du point (a, b) au point (x, y). | 1264 |
| `util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes)` | Teste si l'ajout de nextNode au chemin couperait le graphe restant en parties non reliées. | 515 |
| `util_procTrack.getBaseInformationFromPath(path)` | Extrait du chemin les informations de base : angles, distances, normales, etc. | 634 |
| `util_procTrack.getDefaultParams()` | Renvoie une nouvelle table de paramètres par défaut pour un gymkhana (voir notes). | 10 |
| `util_procTrack.getPathRoadNodes(nodes)` | Calcule tous les points nécessaires pour créer la route autour des nœuds. | 788 |
| `util_procTrack.getPosition(xx, yy, zz)` | Transforme une position locale du parcours en position globale (rotation de rootAngleRad puis décalage de rootX, rootY, rootZ). | 1391 |
| `util_procTrack.getRotationDeg(dd)` | Convertit un angle local (degrés) en angle global en retirant la rotation de la racine du parcours. | 1387 |
| `util_procTrack.getSeed()` | Renvoie la graine de la piste courante. | 1429 |
| `util_procTrack.intToWords(int)` | Convertit une graine entière en suite de mots de 5 lettres concaténés (base de la taille de la liste de mots). | 1461 |
| `util_procTrack.isInList(list, element)` | Teste si un élément est présent dans une liste. | 571 |
| `util_procTrack.makeBarrel(pos, rot, skin)` | Crée un baril de signalisation (TSStatic barrelmarker_<skin>.dae), tourné de 180 degrés en plus de rot. | 1358 |
| `util_procTrack.makeBaseNodePositions()` | Génère le graphe de points clés (via rectangleGen.getGraph) et, si debug.neighbours est vrai, dessine des routes de débogage entre voisins. | 307 |
| `util_procTrack.makeConcreteRing(pos, radius)` | Crée un anneau de béton (TSStatic ring_2m.dae) de rayon donné (minimum 1). | 1329 |
| `util_procTrack.makeGate(pos, rot)` | Crée une porte (TSStatic gate.dae) à une position locale. | 1302 |
| `util_procTrack.makeGymkhana(inParams)` | Fonction principale : valide les paramètres, génère les points, le chemin, la route, les plots/portes, les waypoints du scénario, puis appelle decoration.afterFunction et affiche un message avec la graine. | 120 |
| `util_procTrack.makePath(graph)` | Cherche un chemin aléatoire dans le graphe, par parcours en profondeur avec retour arrière. Utilise les nœuds de départ/arrivée (drapeaux de rectangles, sinon les plus proches de params.start/finish). En mode circuit fermé, choisit un voisin du départ qui ne coupe pas le graphe. | 368 |
| `util_procTrack.makePylon(pos, size, rot, skin)` | Crée un plot (TSStatic barriersegment du niveau driver_training) à une position locale du parcours. | 1269 |
| `util_procTrack.reGenerate(seed)` | Régénère toute la piste en reprenant populateFunction, scenarionParam et afterFunction des paramètres courants, avec la graine donnée. makeGymkhana doit avoir été appelée avant. | 109 |
| `util_procTrack.wordsToInt(word)` | Convertit une suite de mots de 5 lettres (graine sous forme de mots) en entier. | 1437 |

### Détail des paramètres

#### `util_procTrack.createPylons(nodes)`

Crée les plots, portes et anneaux de béton aux nœuds (cercle ou plot central selon le rayon, porte pour une ligne droite ou un rayon nul).

- `nodes` (*table*) : Nœuds du tracé

#### `util_procTrack.createWaypointsForScenario(nodes)`

Crée les positions et angles des waypoints (objets BeamNGWaypoint directionnels) et remplit scenario.nodes / scenario.lapConfig du scénario courant.

- `nodes` (*table*) : Nœuds du tracé

#### `util_procTrack.createWindingPath(path)`

Extrait du chemin les informations de tracé (angles, distances, normales), détermine les rayons et les types de nœuds (droite, courbe, boucle, porte) puis calcule les points de route.

- `path` (*table*) : Chemin de makePath
- **renvoie** : table Nœuds avec leurs points de route (points)

#### `util_procTrack.createWindingRoad(nodes)`

Crée les objets DecalRoad de la route (matériaux tread_marks_clean et road_orange_markings) dans le groupe GymkhanaArena.

- `nodes` (*table*) : Nœuds avec points de route

#### `util_procTrack.currentEdgeNotOK(current, path, nodes, finishNode)`

Teste si l'ajout de la prochaine arête depuis le nœud courant est interdit.

- `current` (*table*) : Nœud courant
- `path` (*table*) : Chemin en cours
- `nodes` (*table*) : Nœuds du graphe
- `finishNode` (*table|nil*) : Nœud d'arrivée
- **renvoie** : boolean true si l'arête n'est pas autorisée

#### `util_procTrack.decorateStartAndFinish(nodes)`

Décore les nœuds de départ et d'arrivée.

- `nodes` (*table*) : Nœuds du tracé

#### `util_procTrack.determineInOutAngle(nodes)`

Détermine les angles d'entrée et de sortie autour des cercles (virages).

- `nodes` (*table*) : Nœuds du tracé

#### `util_procTrack.dist(a, b, x, y)`

Distance euclidienne 2D du point (a, b) au point (x, y).

- `a` (*number*) : X du premier point
- `b` (*number*) : Y du premier point
- `x` (*number*) : X du second point
- `y` (*number*) : Y du second point
- **renvoie** : number Distance

#### `util_procTrack.edgeCreatesSplitGraph(path, nextNode, nodes)`

Teste si l'ajout de nextNode au chemin couperait le graphe restant en parties non reliées.

- `path` (*table*) : Chemin en cours
- `nextNode` (*table*) : Nœud candidat
- `nodes` (*table*) : Nœuds du graphe
- **renvoie** : boolean true si le graphe serait scindé

#### `util_procTrack.getBaseInformationFromPath(path)`

Extrait du chemin les informations de base : angles, distances, normales, etc.

- `path` (*table*) : Chemin de makePath
- **renvoie** : table Nœuds enrichis

#### `util_procTrack.getDefaultParams()`

Renvoie une nouvelle table de paramètres par défaut pour un gymkhana (voir notes).

- **renvoie** : table Paramètres par défaut

#### `util_procTrack.getPathRoadNodes(nodes)`

Calcule tous les points nécessaires pour créer la route autour des nœuds.

- `nodes` (*table*) : Nœuds du tracé

#### `util_procTrack.getPosition(xx, yy, zz)`

Transforme une position locale du parcours en position globale (rotation de rootAngleRad puis décalage de rootX, rootY, rootZ).

- `xx` (*number*) : X local
- `yy` (*number*) : Y local
- `zz` (*number*) : Z local
- **renvoie** : table {x, y, z} global

#### `util_procTrack.getRotationDeg(dd)`

Convertit un angle local (degrés) en angle global en retirant la rotation de la racine du parcours.

- `dd` (*number*) : Angle local en degrés
- **renvoie** : number Angle global en degrés

#### `util_procTrack.getSeed()`

Renvoie la graine de la piste courante.

- **renvoie** : integer|nil Graine, ou nil si aucune piste générée

#### `util_procTrack.intToWords(int)`

Convertit une graine entière en suite de mots de 5 lettres concaténés (base de la taille de la liste de mots).

- `int` (*integer*) : Graine
- **renvoie** : string Mots concaténés

#### `util_procTrack.isInList(list, element)`

Teste si un élément est présent dans une liste.

- `list` (*table*) : Liste
- `element` (*any*) : Élément cherché
- **renvoie** : boolean true si présent

#### `util_procTrack.makeBarrel(pos, rot, skin)`

Crée un baril de signalisation (TSStatic barrelmarker_<skin>.dae), tourné de 180 degrés en plus de rot.

- `pos` (*number[]*) : Position locale {x, y, z}
- `rot` (*number|nil*) : Rotation locale en degrés (défaut 0)
- `skin` (*string*) : Suffixe du modèle (obligatoire)

#### `util_procTrack.makeBaseNodePositions()`

Génère le graphe de points clés (via rectangleGen.getGraph) et, si debug.neighbours est vrai, dessine des routes de débogage entre voisins.

- **renvoie** : table|nil Graphe {nodes, start, finish}

#### `util_procTrack.makeConcreteRing(pos, radius)`

Crée un anneau de béton (TSStatic ring_2m.dae) de rayon donné (minimum 1).

- `pos` (*number[]*) : Position locale {x, y, z}
- `radius` (*number*) : Rayon (échelle X et Y)

#### `util_procTrack.makeGate(pos, rot)`

Crée une porte (TSStatic gate.dae) à une position locale.

- `pos` (*number[]*) : Position locale {x, y, z}
- `rot` (*number|nil*) : Rotation locale en degrés (défaut 0)

#### `util_procTrack.makeGymkhana(inParams)`

Fonction principale : valide les paramètres, génère les points, le chemin, la route, les plots/portes, les waypoints du scénario, puis appelle decoration.afterFunction et affiche un message avec la graine.

- `inParams` (*table*) : Paramètres (voir getDefaultParams)

#### `util_procTrack.makePath(graph)`

Cherche un chemin aléatoire dans le graphe, par parcours en profondeur avec retour arrière. Utilise les nœuds de départ/arrivée (drapeaux de rectangles, sinon les plus proches de params.start/finish). En mode circuit fermé, choisit un voisin du départ qui ne coupe pas le graphe.

- `graph` (*table*) : Graphe de makeBaseNodePositions
- **renvoie** : table|nil Liste de nœuds du chemin, ou nil si aucun chemin trouvé

#### `util_procTrack.makePylon(pos, size, rot, skin)`

Crée un plot (TSStatic barriersegment du niveau driver_training) à une position locale du parcours.

- `pos` (*number[]*) : Position locale {x, y, z}
- `size` (*number|number[]|nil*) : Échelle : nombre (hauteur, largeur 0,33) ou {x, y, z} (défaut {0.33, 0.33, 1})
- `rot` (*number|nil*) : Rotation locale en degrés (défaut 0)
- `skin` (*string|nil*) : Suffixe du nom de modèle (défaut vide)

#### `util_procTrack.reGenerate(seed)`

Régénère toute la piste en reprenant populateFunction, scenarionParam et afterFunction des paramètres courants, avec la graine donnée. makeGymkhana doit avoir été appelée avant.

- `seed` (*integer|nil*) : Nouvelle graine (nil : une graine aléatoire est tirée)

#### `util_procTrack.wordsToInt(word)`

Convertit une suite de mots de 5 lettres (graine sous forme de mots) en entier.

- `word` (*string*) : Mots concaténés (5 lettres chacun)
- **renvoie** : integer Graine entière

**Évènements UI (guihooks.trigger) :** `Message`, `procTrackSeed`

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/procTrack.lua`.*
