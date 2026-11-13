# `map`

*Fichier : `lua/ge/map.lua` · VM : Game Engine (GE) · 4033 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `map`

Graphe routier (navgraph) du niveau côté Game Engine. Il construit le graphe de nœuds et d'arêtes à partir des routes décalques (DecalRoad), des waypoints de la scène et du fichier map.json du niveau, fusionne les nœuds proches, calcule les limites de vitesse, puis envoie le graphe aux VM véhicules (mailbox "mapData", lu par mapmgr.lua). Un moddeur s'en sert pour chercher la route la plus proche (findClosestRoad), calculer un chemin (getPath, getPointToPointPath), lire la structure du graphe (getMap) et lire l'état des véhicules suivis (getTrackedObjects). Il reçoit aussi chaque frame les données des véhicules (objectData) et les redistribue.

## Exemple

```lua
local mapData = map.getMap()
local n1, n2, dist = map.findClosestRoad(veh:getPosition())
if n1 and dist < 10 then
  local path = map.getPath(n1, 'autre_noeud', 0.5, 1e4)
  print(map.getPathLen(path))
end
```

## Remarques

- Structure de map.getMap() : table {nodes = {...}, nodeAliases = {...}, buildSerial = n}. map.nodes est un dictionnaire nodeId (string) -> noeud.
- Noeud (map.nodes[id]) : pos (vec3), radius (number, demi-largeur de route en m), links (table<string, edge>), normal (vec3, normale du sol calculée par surfaceNormal), noMerge (boolean|nil), endNode (boolean|nil, bout de route). Le champ manual est supprimé après le chargement.
- Le graphe de map.nodes est « à simple face » : une arête n'est stockée que dans les links du noeud de SORTIE (outNode), indexée par l'id du noeud d'ENTRÉE. Donc map.nodes[a].links[b] peut être nil alors que map.nodes[b].links[a] existe. Pour tester une arête, il faut regarder les deux sens (voir spawn.teleportToLastRoadCallback). Le graphe complet bidirectionnel est dans map.getGraphpath().graph.
- Arête (map.nodes[a].links[b]) : drivability (number 0..1, praticabilité), hiddenInNavi (boolean|nil), oneWay (boolean), lanes (string, '+' voie dans le sens inNode->outNode, '-' voie inverse, ex. '--++'), speedLimit (number, m/s, calculé automatiquement si absent), inNode / outNode (string, sens légal pour une route à sens unique), type (string|nil, ex. 'private' après une zone d'exclusion), inPos / outPos (vec3), inRadius / outRadius (number), noMerge (boolean|nil), gated (boolean|nil, route à barrière), originalType et originalGatedRoad (anciennes valeurs sauvegardées par createTrafficExclusionArea).
- Les arêtes du Graphpath (getGraphpath().graph[a][b]) sont des tables différentes : len (coût de parcours = distance / drivabilité effective, + 10000 si route barrière), drivability, inNode, outNode, speedLimit, lanes, oneWay, gated (number 0 ou 10000), inPos/inRadius/outPos/outRadius (seulement si différents de la position/rayon du noeud), eId (numéro d'arête). Ici gated est un nombre, alors que dans map.nodes c'est un booléen (incohérence de type entre les deux structures).
- Les chemins (getPath, getPointToPointPath…) sont des tableaux de noms de noeuds (strings). getPath renvoie {} si le graphe n'est pas chargé ou si start/target n'existent pas.
- Le graphe n'est construit que par map.reset()/map.load() (lancés au chargement du niveau) ; map.getMap().nodes est vide avant. Après un reload, map.buildSerial augmente de 1 et l'extension reçoit le hook onNavgraphReloaded.
- Le champ drawNavGraphState vaut 'off' ou 'on' (modifié par toggleDrawNavGraph). objects et objectNames sont recréés vides à chaque loadMap.
- M.objects (map.getTrackedObjects()) : table objId -> {id, active, damage, states, uiState, objectCollisions, pos (vec3), vel (vec3), dirVec (vec3), dirVecUp (vec3), isParked, view, name, licensePlate}. Elle est vidée dès qu'une frame arrive sans mise à jour (objectsCount == 0), donc ne pas la garder en cache d'une frame à l'autre.
- Accès obsolète : map.map renvoie map.getMap() avec un log d'erreur 'map.map API is deprecated' (métatable en fin de fichier).
- Bug probable (ligne 2617) : la fonction loadMap teste 'mapNodes[outNodeId].radius ~= data.ouRadius' (faute de frappe, ouRadius est toujours nil). Résultat : outRadius est toujours passé à bidiEdge, jamais nil.
- Incohérence de nom : map.onSerialize/map.onDeserialize utilisent 'onDeserialize' alors que le reste du jeu (ex. simTimeAuthority) utilise le hook 'onDeserialized' ; le hook de restauration risque de ne pas être appelé sous ce nom.
- Faute de frappe conservée dans l'API : map.getTrafficExlucsionZones (sans le 'x' attendu). La fonction interne s'appelle getTrafficExclusionZones.
- map.findClosestRoad dépend de maxRadius, nil tant que loadMap n'a pas tourné ; en pratique la fonction renvoie nil si le graphe n'est pas construit (edgeKdTree nil).
- map.safeTeleport n'expose pas les paramètres player et unlimitedSafeSpawnRange de spawn.safeTeleport.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `map.assureLoad()` | Charge la carte routière si elle n'est pas encore chargée (loadMap), puis remet loadedMap à false pour qu'un prochain map.load() recharge. *(interne)* | 3667 |
| `map.clearTrafficExclusionZones()` | Vide la liste des zones d'exclusion de trafic (table.clear). Ne reconstruit pas le graphe : il faut appeler map.reset() pour que ça prenne effet. | 3955 |
| `map.createTrafficExclusionArea(trafficExlusionZones)` | Calcule l'ensemble des noeuds exclus à partir des zones données (noeuds dans chaque rayon, puis élargissement le long des routes sans issue), marque les arêtes internes comme type 'private' et les arêtes frontière comme 'gated' (coût +10000). Appelée par loadMap avec les zones enregistrées. *(interne)* | 2370 |
| `map.debugDrawTrajectory(trajectory)` | Active (trajectoire donnée) ou désactive (nil) le dessin debug d'une trajectoire issue de optimizePath (sphères, normales, forces, cylindres). | 3430 |
| `map.findBestRoad(pos, dir)` | Cherche la route la plus adaptée à une position et une direction : parmi les arêtes à moins de 20 m dont la position tombe dans la largeur de la route, choisit celle dont l'axe est le plus aligné avec dir. Retombe sur findClosestRoad s'il n'y a aucun candidat. | 2732 |
| `map.findClosestRoad(pos, searchRadiusLim)` | Trouve l'arête (segment de route) la plus proche de pos et renvoie ses deux noeuds et la distance. La recherche part d'un rayon min(maxRadius, searchRadiusLim) et le double jusqu'à trouver une arête ou dépasser searchRadiusLim. La distance est calculée au segment central, sans tenir compte de la largeur. | 2706 |
| `map.getGraphpath()` | Renvoie l'objet Graphpath interne (gp) : graphe bidirectionnel avec gp.graph[a][b] (arêtes), gp.positions, gp.radius et les méthodes de plus court chemin. nil avant le chargement. | 3816 |
| `map.getManualWaypoints()` | Renvoie la table des waypoints manuels (BeamNGWaypoint de la scène) : nom -> {pos, radius, ...}, avec la valeur 1 pour les entrées déjà traitées après le chargement. | 3820 |
| `map.getMap()` | Renvoie la table du graphe routier : {nodes = ..., nodeAliases = ..., buildSerial = ...}. Voir les notes pour le détail des noeuds et arêtes. Ne pas modifier : la table est partagée. | 3812 |
| `map.getNodeLinkCount(nId)` | Nombre d'arêtes reliées à un noeud dans le graphe bidirectionnel. | 2150 |
| `map.getNodesFromPathDist(path, dist)` | Parcourt un chemin sur une distance donnée (somme des distances entre noeuds consécutifs) et renvoie le segment atteint et la position relative dans ce segment. | 2801 |
| `map.getNodesNearPositions(trafficExlusionZones)` | Renvoie les ids des noeuds du graphe situés dans le rayon d'au moins une des zones données (un noeud peut apparaître plusieurs fois s'il est dans plusieurs zones). | 2353 |
| `map.getPath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff)` | Plus court chemin entre deux noeuds (Dijkstra sur Graphpath:getFilteredPath). Le coût d'une arête = len x pénalité de sens x pénalité de praticabilité. | 2774 |
| `map.getPathLen(path)` | Longueur totale d'un chemin (somme des distances 3D entre les positions des noeuds). | 2824 |
| `map.getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Plus court chemin entre un point libre et un noeud (ou inversement). L'un des deux arguments doit être un nom de noeud, l'autre un vec3. | 2787 |
| `map.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Plus court chemin entre deux positions libres : la fonction relie chaque position aux arêtes proches (itérateur startPosLinks, jusqu'à 2000 m) puis lance la recherche. | 2909 |
| `map.getPointToPointPathJob(job, startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Même chose que getPointToPointPath mais s'exécute dans un job coroutine (permet de rendre la main entre les étapes). | 2926 |
| `map.getRoadRules()` | Renvoie les règles de conduite du niveau : {rightHandDrive = false, turnOnRed = false} fusionnées avec le champ roadRules du fichier info du niveau. Renvoie {} tant que la carte n'a pas été chargée. | 157 |
| `map.getState()` | Met à jour le nom et la plaque (licensePlate) de chaque objet suivi puis renvoie tout le module M (objets, noms, etc.). Sert au transfert d'état. | 3796 |
| `map.getTrackedObjects()` | Renvoie map.objects : les véhicules dont les données sont arrivées cette frame (id -> {pos, vel, dirVec, dirVecUp, active, damage, states, ...}). | 3824 |
| `map.getTrafficExlucsionZones()` | Renvoie la liste courante des zones d'exclusion de trafic (nom avec faute de frappe conservé). | 3950 |
| `map.isCrashAvoidable(objectID, pos, radius)` | Estime si un objet en mouvement peut s'arrêter avant d'atteindre une position (distance de freinage calculée avec la gravité, un frottement de 0.5 et la pente). Sert à décider si on peut faire apparaître quelque chose à cet endroit. | 3913 |
| `map.load()` | Charge la carte une seule fois (garde loadedMap) en appelant loadMap(). *(interne)* | 3661 |
| `map.logGraphHashes()` | Écrit dans le log les empreintes SHA256 des noeuds et des arêtes (debug du déterminisme de la construction du graphe). | 501 |
| `map.nameNode(prefix, idx)` | Fabrique un nom de noeud unique : prefix..idx, ou prefix..idx.._N si ce nom existe déjà dans map.nodes. | 135 |
| `map.objectData(objId, isactive, damage, states, objectCollisions)` | Reçoit chaque frame les données d'un véhicule (envoyées par la VM véhicule) et les enregistre dans map.objects avec position, vitesse et direction lues sur l'objet. Ignoré si l'objet est déjà enregistré cette frame. *(interne)* | 3829 |
| `map.onAddWaypoint(wp)` | Hook appelé quand un waypoint est ajouté à la scène. Si l'éditeur est actif (setEditorState), recharge la carte après 0.5 s. *(interne)* *(hook)* | 3708 |
| `map.onDeserialize(s)` | Restaure isEditorEnabled et buildSerial après un rechargement du Lua GE (voir note sur le nom du hook). *(interne)* *(hook)* | 3783 |
| `map.onFilesChanged(files)` | Hook appelé quand des fichiers changent sur disque. Si le fichier map.json de la carte est concerné, recharge le graphe. *(interne)* *(hook)* | 3729 |
| `map.onMissionLoaded()` | Hook appelé quand un niveau est chargé : remet loadedMap à false pour autoriser le prochain map.load(). *(interne)* *(hook)* | 3674 |
| `map.onModifiedWaypoint(wp)` | Hook appelé quand un waypoint est modifié. Si l'éditeur est actif, recharge la carte après 0.5 s. *(interne)* *(hook)* | 3722 |
| `map.onRemoveWaypoint(wp)` | Hook appelé quand un waypoint est retiré. Si l'éditeur est actif, recharge la carte après 0.5 s. *(interne)* *(hook)* | 3715 |
| `map.onSerialize()` | Renvoie {isEditorEnabled, buildSerial} pour sauvegarder l'état avant un rechargement du Lua GE. *(interne)* *(hook)* | 3779 |
| `map.onWaypoint(args)` | Hook appelé quand un véhicule déclenche un waypoint. Le corps est entièrement commenté : ne fait rien. *(interne)* *(hook)* | 3678 |
| `map.optimizePath(path, s, useRawPos)` | Lisse un chemin pour obtenir une trajectoire plus fluide : chaque point est déplacé par itérations de « curvature flow » (réduction de l'énergie de courbure) en restant dans la largeur de la route. Renvoie la trajectoire ou nil si le chemin a moins de 2 points. | 3309 |
| `map.request(objId, objbuildSerial)` | Appelée par une VM véhicule pour demander le graphe : si son numéro de version (buildSerial) diffère, lui envoie mapmgr.setMap(buildSerial) et l'état des feux (mapmgr.setSignals) s'il y en a. *(interne)* | 3739 |
| `map.reset(customMapNodes)` | Reconstruit entièrement le graphe routier (loadMap) : lit les routes et waypoints, fusionne, calcule limites de vitesse et praticabilité, construit les arbres de recherche, envoie le graphe aux véhicules et émet onNavgraphReloaded. Peut être lent. | 2511 |
| `map.safeTeleport(vehId, posX, posY, posZ, rotX, rotY, rotZ, rotW, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle)` | Enveloppe de spawn.safeTeleport pour l'appeler depuis une VM véhicule avec des nombres seuls : téléporte un véhicule à un endroit sans collision. | 3941 |
| `map.saveSVG(filename, includeLinks, includeNodes)` | Exporte le graphe routier au format SVG (arêtes et, au choix, noeuds), avec des coordonnées relatives à la position du terrain. | 2933 |
| `map.setEditorState(enabled)` | Indique si l'éditeur est actif ; permet le rechargement automatique de la carte quand un waypoint change. | 3788 |
| `map.setNameForId(name, id)` | Associe un nom à un id d'objet dans map.objectNames. | 3909 |
| `map.setState(newState)` | Fusionne une table dans le module (tableMerge(M, newState)). Sert à restaurer l'état. *(interne)* | 3792 |
| `map.setTrafficExclusionZones(zones)` | Remplace les zones d'exclusion de trafic par la table donnée (erreur loguée si ce n'est pas une table). Le graphe n'est pas reconstruit ici : l'effet s'applique au prochain map.reset(). | 3960 |
| `map.surfaceNormal(p, r)` | Estime la normale du sol au point p en lançant trois rayons verticaux (be:getSurfaceHeightBelow) autour de p à une distance r ; fiable jusqu'à environ 50 degrés de pente. | 506 |
| `map.tempObjectData(objId, isactive, pos, vel, dirVec, dirVecUp, damage, objectCollisions)` | Version de objectData où l'appelant fournit lui-même position, vitesse et directions (objet virtuel ou sans VM). Enregistre l'objet dans map.objects. | 3868 |
| `map.toggleDrawExcludeSet()` | Active/désactive le dessin debug (sphères rouges) des noeuds exclus du trafic. | 2483 |
| `map.toggleDrawInitialExcludeSet()` | Active/désactive le dessin debug (sphères blanches) des noeuds initiaux des zones d'exclusion. | 2502 |
| `map.toggleDrawNavGraph()` | Active/désactive le dessin debug du graphe routier à l'écran et met à jour drawNavGraphState. | 3632 |
| `map.toggleShuffledPairs(mode)` | Debug du déterminisme de construction du graphe : remplace pairs par shuffledPairs (ordre d'itération aléatoire) ou l'inverse. | 48 |
| `map.updateDrivabilities(changeSet)` | Change dynamiquement la praticabilité d'arêtes : recalcule le coût (len) de chaque arête, puis envoie la modification aux VM véhicules (mailbox updateDrivabilities et mapmgr.updateDrivabilities()). Ne fait rien si la taille n'est pas multiple de 3. | 3752 |
| `map.updateGFX(dtReal, dtSim)` | Appelée chaque frame par la boucle principale : si le temps de simulation avance, envoie la table des objets aux VM véhicules (mailbox objUpdate), traite le rechargement différé (éditeur) et dessine les overlays debug. *(interne)* | 3645 |

### Détail des paramètres

#### `map.createTrafficExclusionArea(trafficExlusionZones)`

Calcule l'ensemble des noeuds exclus à partir des zones données (noeuds dans chaque rayon, puis élargissement le long des routes sans issue), marque les arêtes internes comme type 'private' et les arêtes frontière comme 'gated' (coût +10000). Appelée par loadMap avec les zones enregistrées.

- `trafficExlusionZones` (*table<integer, {pos: vec3, radius: number}>*) : Liste de zones circulaires.

#### `map.debugDrawTrajectory(trajectory)`

Active (trajectoire donnée) ou désactive (nil) le dessin debug d'une trajectoire issue de optimizePath (sphères, normales, forces, cylindres).

- `trajectory` (*table|nil*) : Résultat de map.optimizePath, ou nil pour arrêter le dessin.

#### `map.findBestRoad(pos, dir)`

Cherche la route la plus adaptée à une position et une direction : parmi les arêtes à moins de 20 m dont la position tombe dans la largeur de la route, choisit celle dont l'axe est le plus aligné avec dir. Retombe sur findClosestRoad s'il n'y a aucun candidat.

- `pos` (*vec3*) : Position à projeter (m).
- `dir` (*vec3*) : Direction normalisée (par ex. direction du véhicule).
- **renvoie** : string|nil Id du premier noeud de l'arête.
- **renvoie** : string|nil Id du second noeud.
- **renvoie** : number|nil Distance de pos au segment (m).

#### `map.findClosestRoad(pos, searchRadiusLim)`

Trouve l'arête (segment de route) la plus proche de pos et renvoie ses deux noeuds et la distance. La recherche part d'un rayon min(maxRadius, searchRadiusLim) et le double jusqu'à trouver une arête ou dépasser searchRadiusLim. La distance est calculée au segment central, sans tenir compte de la largeur.

- `pos` (*vec3*) : Position (m). Seuls x et y servent à la recherche dans le kd-tree, la distance est 3D.
- `searchRadiusLim` (*number|nil*) : Rayon de recherche maximal en m (200 par défaut).
- **renvoie** : string|nil Id du noeud 1 de l'arête (nil si rien trouvé ou graphe non construit).
- **renvoie** : string|nil Id du noeud 2.
- **renvoie** : number Distance à l'arête en m (valeur non significative si aucun noeud n'est trouvé).

#### `map.getGraphpath()`

Renvoie l'objet Graphpath interne (gp) : graphe bidirectionnel avec gp.graph[a][b] (arêtes), gp.positions, gp.radius et les méthodes de plus court chemin. nil avant le chargement.

- **renvoie** : table|nil Instance Graphpath.

#### `map.getManualWaypoints()`

Renvoie la table des waypoints manuels (BeamNGWaypoint de la scène) : nom -> {pos, radius, ...}, avec la valeur 1 pour les entrées déjà traitées après le chargement.

- **renvoie** : table Table des waypoints manuels.

#### `map.getMap()`

Renvoie la table du graphe routier : {nodes = ..., nodeAliases = ..., buildSerial = ...}. Voir les notes pour le détail des noeuds et arêtes. Ne pas modifier : la table est partagée.

- **renvoie** : table Table map (nodes, nodeAliases, buildSerial).

#### `map.getNodeLinkCount(nId)`

Nombre d'arêtes reliées à un noeud dans le graphe bidirectionnel.

- `nId` (*string*) : Id du noeud.
- **renvoie** : integer Nombre de liens, ou -1 si le graphe n'existe pas ou que le noeud est inconnu.

#### `map.getNodesFromPathDist(path, dist)`

Parcourt un chemin sur une distance donnée (somme des distances entre noeuds consécutifs) et renvoie le segment atteint et la position relative dans ce segment.

- `path` (*string[]*) : Chemin (liste d'ids de noeuds), au moins 2 noeuds.
- `dist` (*number|nil*) : Distance à parcourir en m ; nil = jusqu'à la fin.
- **renvoie** : string|nil Noeud de début du segment (nil si le chemin est invalide).
- **renvoie** : string|nil Noeud de fin du segment.
- **renvoie** : number|nil xnorm entre 0 et 1 : position le long du segment. Vaut 1 si dist dépasse la longueur du chemin.

#### `map.getNodesNearPositions(trafficExlusionZones)`

Renvoie les ids des noeuds du graphe situés dans le rayon d'au moins une des zones données (un noeud peut apparaître plusieurs fois s'il est dans plusieurs zones).

- `trafficExlusionZones` (*table<integer, {pos: vec3, radius: number}>*) : Liste de zones circulaires.
- **renvoie** : string[] Ids de noeuds.

#### `map.getPath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff)`

Plus court chemin entre deux noeuds (Dijkstra sur Graphpath:getFilteredPath). Le coût d'une arête = len x pénalité de sens x pénalité de praticabilité.

- `start` (*string*) : Id du noeud de départ.
- `target` (*string*) : Id du noeud d'arrivée.
- `cutOffDrivability` (*number|nil*) : Seuil de praticabilité (0 par défaut) : les arêtes avec drivability <= seuil sont pénalisées par penaltyBelowCutoff.
- `dirMult` (*number|nil*) : Multiplicateur de coût pour une arête à sens unique prise à contresens (1 ou nil = pas de pénalité ; valeurs raisonnables 1e3 à 1e4).
- `penaltyAboveCutoff` (*number|nil*) : Multiplicateur pour les routes au-dessus du seuil (1 par défaut).
- `penaltyBelowCutoff` (*number|nil*) : Multiplicateur pour les routes sous le seuil (10000 par défaut).
- **renvoie** : string[] Liste d'ids de noeuds du départ à l'arrivée ; {} si le graphe ou un des noeuds n'existe pas.

#### `map.getPathLen(path)`

Longueur totale d'un chemin (somme des distances 3D entre les positions des noeuds).

- `path` (*string[]*) : Liste d'ids de noeuds.
- **renvoie** : number Longueur en m (0 si le chemin ou la carte manque).

#### `map.getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)`

Plus court chemin entre un point libre et un noeud (ou inversement). L'un des deux arguments doit être un nom de noeud, l'autre un vec3.

- `start` (*string|vec3*) : Départ : id de noeud ou position.
- `target` (*string|vec3*) : Arrivée : id de noeud ou position.
- `cutOffDrivability` (*number|nil*) : Voir getPath.
- `dirMult` (*number|nil*) : Voir getPath.
- `penaltyAboveCutoff` (*number|nil*) : Voir getPath.
- `penaltyBelowCutoff` (*number|nil*) : Voir getPath.
- `wZ` (*number|nil*) : Poids de la hauteur dans la distance ; au-dessus de 1, minimise davantage l'écart en z qu'en x/y.
- **renvoie** : string[] Chemin en ids de noeuds ; {} si le graphe n'est pas chargé.

#### `map.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)`

Plus court chemin entre deux positions libres : la fonction relie chaque position aux arêtes proches (itérateur startPosLinks, jusqu'à 2000 m) puis lance la recherche.

- `startPos` (*vec3*) : Position de départ.
- `targetPos` (*vec3*) : Position d'arrivée.
- `cutOffDrivability` (*number|nil*) : Voir getPath.
- `dirMult` (*number|nil*) : Voir getPath (typiquement >= 10e4).
- `penaltyAboveCutoff` (*number|nil*) : Voir getPath.
- `penaltyBelowCutoff` (*number|nil*) : Voir getPath.
- `wD` (*any*) : Obsolète, ignoré (gardé pour compatibilité).
- `wZ` (*number|nil*) : Poids de l'écart de hauteur (4 par défaut).
- **renvoie** : table Chemin ; {} si le graphe n'est pas chargé.

#### `map.getPointToPointPathJob(job, startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)`

Même chose que getPointToPointPath mais s'exécute dans un job coroutine (permet de rendre la main entre les étapes).

- `job` (*table*) : Objet job courant (coroutine du système de jobs).
- `startPos` (*vec3*) : Position de départ.
- `targetPos` (*vec3*) : Position d'arrivée.
- `cutOffDrivability` (*number|nil*) : Voir getPath.
- `dirMult` (*number|nil*) : Voir getPath.
- `penaltyAboveCutoff` (*number|nil*) : Voir getPath.
- `penaltyBelowCutoff` (*number|nil*) : Voir getPath.
- `wD` (*any*) : Obsolète, ignoré.
- `wZ` (*number|nil*) : Poids de l'écart de hauteur (4 par défaut).
- **renvoie** : table Chemin ; {} si le graphe n'est pas chargé.

#### `map.getRoadRules()`

Renvoie les règles de conduite du niveau : {rightHandDrive = false, turnOnRed = false} fusionnées avec le champ roadRules du fichier info du niveau. Renvoie {} tant que la carte n'a pas été chargée.

- **renvoie** : table Règles (rightHandDrive, turnOnRed, ...).

#### `map.getState()`

Met à jour le nom et la plaque (licensePlate) de chaque objet suivi puis renvoie tout le module M (objets, noms, etc.). Sert au transfert d'état.

- **renvoie** : table Le module map lui-même.

#### `map.getTrackedObjects()`

Renvoie map.objects : les véhicules dont les données sont arrivées cette frame (id -> {pos, vel, dirVec, dirVecUp, active, damage, states, ...}).

- **renvoie** : table<integer, table> Objets suivis.

#### `map.getTrafficExlucsionZones()`

Renvoie la liste courante des zones d'exclusion de trafic (nom avec faute de frappe conservé).

- **renvoie** : table Liste de {pos, radius}.

#### `map.isCrashAvoidable(objectID, pos, radius)`

Estime si un objet en mouvement peut s'arrêter avant d'atteindre une position (distance de freinage calculée avec la gravité, un frottement de 0.5 et la pente). Sert à décider si on peut faire apparaître quelque chose à cet endroit.

- `objectID` (*integer*) : Id du véhicule en mouvement.
- `pos` (*vec3*) : Position du point à protéger.
- `radius` (*number|nil*) : Rayon de sécurité en m (7.5 par défaut).
- **renvoie** : boolean true si c'est sûr (objet introuvable, plus de 150 m, ou distance suffisante pour freiner).

#### `map.nameNode(prefix, idx)`

Fabrique un nom de noeud unique : prefix..idx, ou prefix..idx.._N si ce nom existe déjà dans map.nodes.

- `prefix` (*string*) : Préfixe du nom.
- `idx` (*integer*) : Numéro.
- **renvoie** : string Nom libre.

#### `map.objectData(objId, isactive, damage, states, objectCollisions)`

Reçoit chaque frame les données d'un véhicule (envoyées par la VM véhicule) et les enregistre dans map.objects avec position, vitesse et direction lues sur l'objet. Ignoré si l'objet est déjà enregistré cette frame.

- `objId` (*integer*) : Id du véhicule.
- `isactive` (*boolean*) : Véhicule actif.
- `damage` (*number*) : Niveau de dégâts.
- `states` (*table|nil*) : États du véhicule (table vide partagée si nil).
- `objectCollisions` (*table|nil*) : Collisions avec d'autres objets.

#### `map.onAddWaypoint(wp)`

Hook appelé quand un waypoint est ajouté à la scène. Si l'éditeur est actif (setEditorState), recharge la carte après 0.5 s.

- `wp` (*any*) : Waypoint ajouté (non utilisé).

#### `map.onDeserialize(s)`

Restaure isEditorEnabled et buildSerial après un rechargement du Lua GE (voir note sur le nom du hook).

- `s` (*table*) : Table produite par onSerialize : {isEditorEnabled, buildSerial}.

#### `map.onFilesChanged(files)`

Hook appelé quand des fichiers changent sur disque. Si le fichier map.json de la carte est concerné, recharge le graphe.

- `files` (*table[]*) : Liste d'entrées avec un champ filename.

#### `map.onModifiedWaypoint(wp)`

Hook appelé quand un waypoint est modifié. Si l'éditeur est actif, recharge la carte après 0.5 s.

- `wp` (*any*) : Waypoint modifié (non utilisé).

#### `map.onRemoveWaypoint(wp)`

Hook appelé quand un waypoint est retiré. Si l'éditeur est actif, recharge la carte après 0.5 s.

- `wp` (*any*) : Waypoint retiré (non utilisé).

#### `map.onSerialize()`

Renvoie {isEditorEnabled, buildSerial} pour sauvegarder l'état avant un rechargement du Lua GE.

- **renvoie** : table Tableau {isEditorEnabled, buildSerial}.

#### `map.onWaypoint(args)`

Hook appelé quand un véhicule déclenche un waypoint. Le corps est entièrement commenté : ne fait rien.

- `args` (*table*) : Données du déclencheur (subjectName, triggerName, event, mode) ; non utilisées.

#### `map.optimizePath(path, s, useRawPos)`

Lisse un chemin pour obtenir une trajectoire plus fluide : chaque point est déplacé par itérations de « curvature flow » (réduction de l'énergie de courbure) en restant dans la largeur de la route. Renvoie la trajectoire ou nil si le chemin a moins de 2 points.

- `path` (*string[]|table[]*) : Liste d'ids de noeuds, ou (avec useRawPos) liste de {pos = vec3, radius = number}.
- `s` (*table*) : Réglages : segDistSplitLim, fixPathNodes, fixEndpoints, evolvePathNormals, evolveMidNormals, evolveEndNormals, hta (0.1 m par itération par défaut), fRange (1), forceMag ('angle' par défaut ou 'curvature'), forceScale, forceMultiplier (2), iterations (120), distFromEdge (1 m), dispLimFromCenterAbs, dispLimFromCenterRel, logData, logTrajectory, tolFactor (0).
- `useRawPos` (*boolean|nil*) : true si path contient des {pos, radius} au lieu d'ids de noeuds.
- **renvoie** : table|nil Trajectoire : liste de points avec pos, posOrig, normal, halfWidth, force… et trajectory.converged / trajectory.energy.

#### `map.request(objId, objbuildSerial)`

Appelée par une VM véhicule pour demander le graphe : si son numéro de version (buildSerial) diffère, lui envoie mapmgr.setMap(buildSerial) et l'état des feux (mapmgr.setSignals) s'il y en a.

- `objId` (*integer*) : Id du véhicule demandeur.
- `objbuildSerial` (*integer*) : Numéro de version du graphe connu du véhicule.

#### `map.reset(customMapNodes)`

Reconstruit entièrement le graphe routier (loadMap) : lit les routes et waypoints, fusionne, calcule limites de vitesse et praticabilité, construit les arbres de recherche, envoie le graphe aux véhicules et émet onNavgraphReloaded. Peut être lent.

- `customMapNodes` (*table|nil*) : Table de noeuds prête à l'emploi (même format que map.nodes, double face) qui remplace la lecture des routes de la scène.

#### `map.safeTeleport(vehId, posX, posY, posZ, rotX, rotY, rotZ, rotW, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle)`

Enveloppe de spawn.safeTeleport pour l'appeler depuis une VM véhicule avec des nombres seuls : téléporte un véhicule à un endroit sans collision.

- `vehId` (*integer|string*) : Id ou nom du véhicule (passé à scenetree.findObject).
- `posX` (*number*) : Position x (m).
- `posY` (*number*) : Position y (m).
- `posZ` (*number*) : Position z (m).
- `rotX` (*number*) : Quaternion x.
- `rotY` (*number*) : Quaternion y.
- `rotZ` (*number*) : Quaternion z.
- `rotW` (*number*) : Quaternion w.
- `checkOnlyStatics_` (*boolean|nil*) : Ne tester que les objets statiques (ignorer les autres véhicules).
- `visibilityPoint_` (*vec3|nil*) : Point à partir duquel la place trouvée ne doit pas être visible.
- `removeTraffic_` (*boolean|nil*) : Écarter les véhicules de trafic de la zone.
- `centeredPosition` (*boolean|nil*) : true si pos est le centre de la boîte du véhicule et non son noeud de référence.
- `resetVehicle` (*boolean|nil*) : Réinitialiser le véhicule (true par défaut dans spawn.safeTeleport).

#### `map.saveSVG(filename, includeLinks, includeNodes)`

Exporte le graphe routier au format SVG (arêtes et, au choix, noeuds), avec des coordonnées relatives à la position du terrain.

- `filename` (*string*) : Chemin du fichier SVG.
- `includeLinks` (*boolean|nil*) : Dessiner les arêtes (true par défaut).
- `includeNodes` (*boolean|nil*) : Dessiner les noeuds (false par défaut).

#### `map.setEditorState(enabled)`

Indique si l'éditeur est actif ; permet le rechargement automatique de la carte quand un waypoint change.

- `enabled` (*boolean*) : true si l'éditeur est ouvert.

#### `map.setNameForId(name, id)`

Associe un nom à un id d'objet dans map.objectNames.

- `name` (*string*) : Nom.
- `id` (*integer*) : Id d'objet.

#### `map.setState(newState)`

Fusionne une table dans le module (tableMerge(M, newState)). Sert à restaurer l'état.

- `newState` (*table*) : Champs à copier dans map.

#### `map.setTrafficExclusionZones(zones)`

Remplace les zones d'exclusion de trafic par la table donnée (erreur loguée si ce n'est pas une table). Le graphe n'est pas reconstruit ici : l'effet s'applique au prochain map.reset().

- `zones` (*table<integer, {pos: vec3, radius: number}>*) : Liste de zones circulaires.

#### `map.surfaceNormal(p, r)`

Estime la normale du sol au point p en lançant trois rayons verticaux (be:getSurfaceHeightBelow) autour de p à une distance r ; fiable jusqu'à environ 50 degrés de pente.

- `p` (*vec3*) : Point (m).
- `r` (*number|nil*) : Rayon d'échantillonnage en m (2 par défaut).
- **renvoie** : vec3 Normale unitaire.

#### `map.tempObjectData(objId, isactive, pos, vel, dirVec, dirVecUp, damage, objectCollisions)`

Version de objectData où l'appelant fournit lui-même position, vitesse et directions (objet virtuel ou sans VM). Enregistre l'objet dans map.objects.

- `objId` (*integer*) : Id de l'objet.
- `isactive` (*boolean*) : Objet actif.
- `pos` (*vec3*) : Position.
- `vel` (*vec3*) : Vitesse.
- `dirVec` (*vec3*) : Direction avant.
- `dirVecUp` (*vec3*) : Direction haut.
- `damage` (*number*) : Dégâts.
- `objectCollisions` (*table|nil*) : Collisions.

#### `map.toggleShuffledPairs(mode)`

Debug du déterminisme de construction du graphe : remplace pairs par shuffledPairs (ordre d'itération aléatoire) ou l'inverse.

- `mode` (*string|nil*) : 'shuffledPairs' ou 'pairs' ; nil = bascule.

#### `map.updateDrivabilities(changeSet)`

Change dynamiquement la praticabilité d'arêtes : recalcule le coût (len) de chaque arête, puis envoie la modification aux VM véhicules (mailbox updateDrivabilities et mapmgr.updateDrivabilities()). Ne fait rien si la taille n'est pas multiple de 3.

- `changeSet` (*table*) : Liste plate {nodeA1, nodeB1, drivabilité1, nodeA2, nodeB2, drivabilité2, ...}. L'arête est cherchée dans le sens nodeA -> nodeB du graphe bidirectionnel. La drivabilité est limitée à 1e-30 minimum.

#### `map.updateGFX(dtReal, dtSim)`

Appelée chaque frame par la boucle principale : si le temps de simulation avance, envoie la table des objets aux VM véhicules (mailbox objUpdate), traite le rechargement différé (éditeur) et dessine les overlays debug.

- `dtReal` (*number*) : Durée réelle de la frame (s).
- `dtSim` (*number*) : Durée simulée de la frame (s) ; 0 en pause.

## Champs

| Champ | Type | Description |
|---|---|---|
| `drawNavGraphState` | string | 'off' ou 'on' selon que le dessin debug du navgraph est actif (toggleDrawNavGraph). |
| `objectNames` | table<string, integer> | Association nom -> id d'objet, remplie par setNameForId. getState() copie le nom dans objects[id].name. |
| `objects` | table<integer, table> | Véhicules suivis cette frame (clé = id d'objet). Rempli par objectData/tempObjectData, vidé quand plus aucune donnée n'arrive. Même table que getTrackedObjects(). |

## Classe `singleEventTimer`

Minuteur interne à usage unique (non exporté, delayedLoad en est l'instance) servant à recharger la carte 0.5 s après une modification de waypoint dans l'éditeur.

| Méthode | Description | Ligne |
|---|---|---|
| `singleEventTimer:callAfter(dt, eventFun, ...)` | Programme l'appel de eventFun(...) après dt secondes. NB : la page automatique indique (eventFun, ...) mais la signature réelle est (dt, eventFun, ...). | 122 |
| `singleEventTimer:update(dt)` | Décompte le délai ; à zéro appelle eventFun une seule fois. Appelé chaque frame par updateGFX avec dtReal. | 113 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onNavgraphReloaded` — écouté par 3 module(s)

**Évènements UI (guihooks.trigger) :** `NavigationMapChanged`

## Appels vers le moteur (C++)

- `be:` `getSurfaceHeightBelow`, `getTerrainDrivability`, `queueObjectLua`, `sendToMailbox`
- `core_environment.` `getGravity`
- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawSquarePrism`, `drawText`
- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getInitialLength`, `getSpawnWorldOOBB`, `getVelocity`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/map.lua`.*
