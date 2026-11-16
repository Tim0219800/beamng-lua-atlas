# `mapmgr`

*Fichier : `lua/vehicle/mapmgr.lua` · VM : Véhicule · 414 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `mapmgr`

Pont entre le véhicule et la carte routière (navgraph) du jeu. Il reçoit la carte du Lua du jeu (GE) par boîte aux lettres (mailbox), la décode en graphe (graphpath) et arbre spatial (kd-tree des arêtes), et fournit à l'IA et aux extensions : recherche de la route la plus proche (findClosestRoad, findBestRoad), chemin point à point (getPointToPointPath), normale de surface (surfaceNormalBelow), objets proches (getObjects) et signaux de circulation. Il envoie aussi chaque frame au GE l'état du véhicule (map.objectData : joueur assis, dégâts, klaxon, feux, collisions) via sendTracking.

## Exemple

```lua
local a, b, dist = mapmgr.findBestRoad(obj:getPosition(), obj:getDirectionVector())
local path = mapmgr.getPointToPointPath(obj:getPosition(), vec3(100, 200, 0), 0.5, 1e4, 1, 100)
local n = mapmgr.surfaceNormalBelow(obj:getPosition(), 2)
```

## Remarques

- mapData (aussi M.mapData) est un graphpath importé de la carte ; M.nodeAliases, M.rules, M.signalsData et M.changeSet sont aussi publiés. mapData reste nil tant que la carte n'a pas été reçue (appeler requestMap ou attendre le hook onVehicleMapmgrUpdate côté GE) : findClosestRoad / findBestRoad planteraient si mapData ou edgeKdTree est nil (aucune vérification), contrairement à getPointToPointPath qui renvoie {}.
- sendTracking est un nop par défaut (affecté dynamiquement) : enableTracking le remplace par la vraie fonction, disableTracking le remet à nop. main.lua appelle mapmgr.sendTracking() à chaque frame (avant ai.updateGFX). Le champ apparaît donc comme « nop non défini » dans l'extraction mais nop est une fonction globale définie ailleurs.
- init active le suivi si le véhicule a des roues (wheels.wheelCount > 0) ou si v.data.general.enableTracking est vrai.
- sendTracking envoie au GE un appel `map.objectData(id, anyPlayerSeated, degats, états, collisions)`, où états = horn, lightbar, hazard_enabled, turnsignal (si non nuls) et ignitionLevel (si 0 ou 1) lus dans electrics.values ; collisions = ids d'objets en collision (obj:getObjectCollisionIds). Il demande aussi la carte au GE (map.request(id, -2)) quand les signaux de circulation changent de version de façon inattendue.
- Drivabilité dynamique : updateDrivabilities lit la mailbox 'updateDrivabilities' (liste plate {nœudA, nœudB, drivabilité,…}) et modifie la longueur et la drivabilité des arêtes du graphe.
- findClosestRoad double la zone de recherche jusqu'à trouver une arête ou dépasser 200 m ; la distance renvoyée est en mètres, avec un biais wZ (défaut 1.85) qui pénalise les écarts de hauteur. Le commentaire du code note que la même fonction existe dans ge/map.lua.
- findBestRoad choisit parmi les arêtes dont le rayon couvre la position celle qui est la plus alignée avec la direction du véhicule (valeur absolue si l'arête est à double sens), pénalisée par edge.gated ; repli sur findClosestRoad.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mapmgr.clearCustomMap()` | Supprime la carte personnalisée si elle était active (mapData remis à nil). | 79 |
| `mapmgr.disableTracking(forceDisable)` | Désactive l'envoi d'état (sendTracking = nop) si forceDisable ou si aucun joueur n'est assis. | 163 |
| `mapmgr.enableTracking(name)` | Active l'envoi d'état au GE : associe un nom d'objet à l'id (map.setNameForId) et installe sendTracking. | 158 |
| `mapmgr.findBestRoad(pos, dir, wZ)` | Trouve l'arête de route la plus pertinente selon la position ET la direction (alignement, sens unique, barrières), avec repli sur findClosestRoad. | 271 |
| `mapmgr.findClosestRoad(pos, wZ)` | Trouve l'arête de route la plus proche d'une position (distance au segment avec biais de hauteur wZ). Nécessite que la carte soit chargée. | 241 |
| `mapmgr.getObjects()` | Renvoie la table des objets proches (mailbox 'objUpdate'), décodée au plus une fois par instant de simulation. | 179 |
| `mapmgr.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Calcule un chemin sur le navgraph entre deux positions (le point de départ et la cible sont rattachés aux arêtes proches). Renvoie {} si la carte n'est pas chargée. | 379 |
| `mapmgr.init()` | Active le suivi vers le GE si le véhicule a des roues ou general.enableTracking. Appelée par main.lua (initSystems, dernière étape). *(interne)* | 173 |
| `mapmgr.requestMap()` | Demande au GE d'envoyer la carte (map.request(id, serial de la carte actuelle)). | 68 |
| `mapmgr.reset()` | Vide la liste d'objets M.objects au reset du véhicule. *(interne)* | 169 |
| `mapmgr.setCustomMap(map)` | Remplace la carte par un graphe fourni (outil/scénario) et oublie le numéro de build. | 72 |
| `mapmgr.setMap(newbuildSerial)` | Charge la carte depuis la mailbox 'mapData' : construit le graphe, le kd-tree des arêtes, les règles et alias, applique les drivabilités puis notifie le GE par le hook onVehicleMapmgrUpdate. Ne fait rien si le numéro de build est déjà celui chargé ou si les données sont incomplètes. *(interne)* | 45 |
| `mapmgr.setSignals(data)` | Définit la table des signaux de circulation (M.signalsData). *(interne)* | 87 |
| `mapmgr.setSurfaceNormalBelow(v, p, r)` | Calcule la normale de la surface sous un point en échantillonnant la hauteur du sol en 3 points d'un triangle de rayon r autour de p (obj:getSurfaceHeightBelow). Précis jusqu'à environ 50° de pente ; renvoie (0,0,1) si le terrain est trop bas/irrégulier. Écrit le résultat dans v sans allocation. | 194 |
| `mapmgr.surfaceNormalBelow(p, r)` | Version allouante de setSurfaceNormalBelow : renvoie un nouveau vec3. | 226 |
| `mapmgr.updateDrivabilities()` | Applique au graphe les changements de drivabilité reçus par la mailbox 'updateDrivabilities' ; ne fait rien si la mailbox est vide ou sans graphe. *(interne)* | 21 |
| `mapmgr.updateSignals(data)` | Met à jour l'action des signaux d'après un lot {clé1, clé2, clé3, action, …} (par groupes de 4). *(interne)* | 91 |

### Détail des paramètres

#### `mapmgr.disableTracking(forceDisable)`

Désactive l'envoi d'état (sendTracking = nop) si forceDisable ou si aucun joueur n'est assis.

- `forceDisable` (*boolean|nil*) : true pour désactiver même si un joueur est assis.

#### `mapmgr.enableTracking(name)`

Active l'envoi d'état au GE : associe un nom d'objet à l'id (map.setNameForId) et installe sendTracking.

- `name` (*string|nil*) : Nom du véhicule dans la carte ; l'id du véhicule si nil.

#### `mapmgr.findBestRoad(pos, dir, wZ)`

Trouve l'arête de route la plus pertinente selon la position ET la direction (alignement, sens unique, barrières), avec repli sur findClosestRoad.

- `pos` (*vec3|nil*) : Position ; celle du véhicule si nil.
- `dir` (*vec3|nil*) : Direction ; celle du véhicule si nil.
- `wZ` (*number|nil*) : Poids de la différence de hauteur.
- **renvoie** : any Premier noeud de l'arête.
- **renvoie** : any Second noeud de l'arête.
- **renvoie** : number Distance en mètres.

#### `mapmgr.findClosestRoad(pos, wZ)`

Trouve l'arête de route la plus proche d'une position (distance au segment avec biais de hauteur wZ). Nécessite que la carte soit chargée.

- `pos` (*vec3|nil*) : Position ; celle du véhicule si nil.
- `wZ` (*number|nil*) : Poids de la différence de hauteur (1.85 par défaut).
- **renvoie** : any Identifiant du premier noeud de l'arête (nil si rien trouvé à moins de 200 m).
- **renvoie** : any Identifiant du second noeud de l'arête.
- **renvoie** : number Distance à l'arête en mètres.

#### `mapmgr.getObjects()`

Renvoie la table des objets proches (mailbox 'objUpdate'), décodée au plus une fois par instant de simulation.

- **renvoie** : table M.objects (partagée, ne pas conserver entre frames).

#### `mapmgr.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)`

Calcule un chemin sur le navgraph entre deux positions (le point de départ et la cible sont rattachés aux arêtes proches). Renvoie {} si la carte n'est pas chargée.

- `startPos` (*vec3*) : Position de départ.
- `targetPos` (*vec3*) : Position cible.
- `cutOffDrivability` (*number|nil*) : Les routes de drivabilité inférieure ou égale sont pénalisées.
- `dirMult` (*number|nil*) : Pénalité si le chemin ne respecte pas les sens légaux (> 1, typiquement >= 1e4) ; nil ou 1 = aucune.
- `penaltyAboveCutoff` (*number|nil*) : Multiplicateur de coût au-dessus du seuil de drivabilité.
- `penaltyBelowCutoff` (*number|nil*) : Multiplicateur de coût sous le seuil.
- `wZ` (*number|nil*) : Biais de hauteur (4 par défaut) pour choisir le noeud d'arrivée.
- **renvoie** : table Liste des noeuds du chemin (format graphpath), {} si impossible.

#### `mapmgr.setCustomMap(map)`

Remplace la carte par un graphe fourni (outil/scénario) et oublie le numéro de build.

- `map` (*table*) : Graphe au format graphpath.

#### `mapmgr.setMap(newbuildSerial)`

Charge la carte depuis la mailbox 'mapData' : construit le graphe, le kd-tree des arêtes, les règles et alias, applique les drivabilités puis notifie le GE par le hook onVehicleMapmgrUpdate. Ne fait rien si le numéro de build est déjà celui chargé ou si les données sont incomplètes.

- `newbuildSerial` (*number|nil*) : Numéro de build de la carte annoncée ; ignoré s'il est identique à celui déjà chargé.

#### `mapmgr.setSignals(data)`

Définit la table des signaux de circulation (M.signalsData).

- `data` (*table*) : Signaux indexés [groupe][?][?] avec un champ action.

#### `mapmgr.setSurfaceNormalBelow(v, p, r)`

Calcule la normale de la surface sous un point en échantillonnant la hauteur du sol en 3 points d'un triangle de rayon r autour de p (obj:getSurfaceHeightBelow). Précis jusqu'à environ 50° de pente ; renvoie (0,0,1) si le terrain est trop bas/irrégulier. Écrit le résultat dans v sans allocation.

- `v` (*vec3*) : Vecteur de sortie (modifié ; utilisé aussi comme point d'échantillon temporaire).
- `p` (*vec3*) : Point au-dessus de la surface.
- `r` (*number|nil*) : Rayon d'échantillonnage en mètres (2 par défaut).

#### `mapmgr.surfaceNormalBelow(p, r)`

Version allouante de setSurfaceNormalBelow : renvoie un nouveau vec3.

- `p` (*vec3*) : Point au-dessus de la surface.
- `r` (*number|nil*) : Rayon d'échantillonnage (2 par défaut).
- **renvoie** : vec3 Normale unitaire de la surface.

#### `mapmgr.updateSignals(data)`

Met à jour l'action des signaux d'après un lot {clé1, clé2, clé3, action, …} (par groupes de 4).

- `data` (*table|nil*) : Liste plate de mises à jour.

## Champs

| Champ | Type | Description |
|---|---|---|
| `objectCollisionIds` | table | Ids des objets en collision avec ce véhicule, rafraîchi à chaque sendTracking. |
| `objects` | table | Objets proches décodés depuis la mailbox 'objUpdate' (rempli par getObjects ; remis à {} par reset). |
| `sendTracking` | function | nop tant que le suivi n'est pas activé (enableTracking), puis la fonction d'envoi d'état au GE. Appelée à chaque frame par main.lua. |

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getLastMailbox`, `getLastMailboxToBuffer`, `getLastMailboxVersion`, `getObjectCollisionIds`, `getPosition`, `getSimTime`, `getSurfaceHeightBelow`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/mapmgr.lua`.*
