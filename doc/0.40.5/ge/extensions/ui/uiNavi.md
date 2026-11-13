# `ui_uiNavi`

*Fichier : `lua/ge/extensions/ui/uiNavi.lua` · VM : Game Engine (GE) · 484 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_uiNavi` : `extensions.load("ui_uiNavi")`, puis la globale `ui_uiNavi`

Back-end Lua de la carte de navigation de l'interface (minimap, GPS). Il envoie à l'UI les positions des véhicules suivis, les points d'intérêt, les missions et les nœuds routiers de la carte, et gère un itinéraire simple (marqueurs au sol via core_groundMarkers). Il sert aussi à alimenter la texture JS d'un tableau de bord de véhicule avec la carte.

## Remarques

- onGuiUpdate envoie 'NavigationMapUpdate' à chaque frame GUI (le code note « TODO: convert into stream »). Quand aucun véhicule suivi n'est contrôlé (ou en caméra libre), la position de la caméra est utilisée à la place.
- Les tables d'objets de la carte sont réutilisées d'une frame à l'autre (pool) : ne pas conserver les données reçues.
- Bug : getSpawnpoints assigne la variable globale `info` (pas de `local`).
- Bug : getPointsOfInterest ne renvoie rien (nil) quand l'ensemble PointOfInterestSet n'existe pas ; requestPoi enverra alors nil à l'UI, et requestUIDashboardMap ignore le résultat dans ce cas.
- Bug : requestVehicleDashboardMap lit une variable globale `minimapImage` (nil dans ce fichier), donc le champ est toujours absent de la table envoyée.
- Fonctions locales non exportées : route_update (exportée sous le nom route_requestStatus), getNodesMinified (inutilisée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_uiNavi.findClosestRoad(x, y, z)` | Renvoie le résultat de map.findClosestRoad pour le point (x, y, z) : les informations sur le segment de route le plus proche. | 9 |
| `ui_uiNavi.getBusStops()` | Liste les arrêts de bus (BeamNGTrigger de type 'busstop'). Les arrêts distants de moins de 70 m (de part et d'autre de la route) sont fusionnés en un point au milieu. | 183 |
| `ui_uiNavi.getMissions()` | Renvoie la table des missions actuellement stockée (vide au départ ; les exemples sont commentés dans le code). | 119 |
| `ui_uiNavi.getPointsOfInterest()` | Renvoie les objets du PointOfInterestSet de la scène sous forme de liste {name, pos, desc, title, type}. | 44 |
| `ui_uiNavi.getSpawnpoints()` | Liste les objets SpawnSphere de la scène avec leur position ({x,y,z} en table). Si le fichier de mission du niveau existe et contient `spawnPoints`, les informations additionnelles (indexées par objectname) sont fusionnées dans chaque entrée. | 13 |
| `ui_uiNavi.onExtensionLoaded()` | Hook appelé au chargement de l'extension : envoie un 'RouteUpdate' vide à l'UI. *(interne)* *(hook)* | 453 |
| `ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame GUI. Rassemble les objets suivis par la carte (uiState ~= 0) avec position, cap en degrés, vitesse et état, puis envoie 'NavigationMapUpdate' ({controlID, objects}) à l'UI. *(interne)* *(hook)* | 228 |
| `ui_uiNavi.onVehicleSwitched(oid, nid)` | Hook appelé au changement de véhicule contrôlé. Le corps est entièrement commenté : ne fait rien. *(interne)* *(hook)* | 437 |
| `ui_uiNavi.planRoute(posX, posY)` | Outil de développement : calcule le chemin entre deux positions via map.getPath et l'envoie à l'UI par 'RoutePlanned'. | 172 |
| `ui_uiNavi.requestMissions()` | Envoie la liste des missions courante à l'UI par l'évènement 'MapMissions'. | 123 |
| `ui_uiNavi.requestPoi()` | Envoie les points d'intérêt à l'UI par l'évènement 'MapPointsOfInterest'. | 60 |
| `ui_uiNavi.requestUIDashboardMap()` | Construit les données de la carte (tuiles de terrain du niveau courant, points d'intérêt, nœuds routiers) et les envoie à l'UI par 'NavigationMap'. Si le niveau n'a pas de minimap, elle est générée depuis le TerrainBlock. Remplit aussi les anciens champs (terrainSize, minimapImage, squareSize, terrainOffset) pour les mods d'ancien format. | 386 |
| `ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId)` | Envoie la carte à la texture JS d'un tableau de bord de véhicule (queueJSUITexture) en appelant la fonction JS `initmap` avec les données en JSON (nœuds, heure HH:MM, tuiles de terrain). Ne fait rien en mode headless, sans niveau chargé ou sans `dashboard`. | 411 |
| `ui_uiNavi.route_end()` | Termine l'itinéraire : efface la destination, supprime le chemin au sol et envoie 'RouteUpdate' (table vide) puis 'RouteEnded' à l'UI. | 145 |
| `ui_uiNavi.route_requestStatus(oldPos, newPos)` | Met à jour l'itinéraire en cours (fonction locale route_update). Sans itinéraire, ne fait rien. Si la position a bougé de plus de 0,1 m, recalcule le chemin, envoie 'RouteUpdate' ; à moins de 50 m de la destination, envoie 'RouteReachedDestination' et termine l'itinéraire. | 158 |
| `ui_uiNavi.route_start(wp, pos)` | Démarre un itinéraire : appelle core_groundMarkers.setPath(wp) et mémorise la destination et sa position. Le code note que le multi-sièges ne rend le chemin que pour le dernier joueur. | 139 |
| `ui_uiNavi.setMissions(m)` | Remplace la liste des missions et l'envoie aussitôt à l'UI via 'MapMissions'. | 127 |

### Détail des paramètres

#### `ui_uiNavi.findClosestRoad(x, y, z)`

Renvoie le résultat de map.findClosestRoad pour le point (x, y, z) : les informations sur le segment de route le plus proche.

- `x` (*number*) : Coordonnée X monde.
- `y` (*number*) : Coordonnée Y monde.
- `z` (*number*) : Coordonnée Z monde.
- **renvoie** : any Résultat de map.findClosestRoad (déduit du code).

#### `ui_uiNavi.getBusStops()`

Liste les arrêts de bus (BeamNGTrigger de type 'busstop'). Les arrêts distants de moins de 70 m (de part et d'autre de la route) sont fusionnés en un point au milieu.

- **renvoie** : table[] Liste de {pos = {x,y,z}}.

#### `ui_uiNavi.getMissions()`

Renvoie la table des missions actuellement stockée (vide au départ ; les exemples sont commentés dans le code).

- **renvoie** : table Liste de missions (pos, desc, title, state, new, objectives, type).

#### `ui_uiNavi.getPointsOfInterest()`

Renvoie les objets du PointOfInterestSet de la scène sous forme de liste {name, pos, desc, title, type}.

- **renvoie** : table[]|nil nil si l'ensemble PointOfInterestSet n'existe pas.

#### `ui_uiNavi.getSpawnpoints()`

Liste les objets SpawnSphere de la scène avec leur position ({x,y,z} en table). Si le fichier de mission du niveau existe et contient `spawnPoints`, les informations additionnelles (indexées par objectname) sont fusionnées dans chaque entrée.

- **renvoie** : table[] Liste d'entrées contenant au moins `pos`.

#### `ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame GUI. Rassemble les objets suivis par la carte (uiState ~= 0) avec position, cap en degrés, vitesse et état, puis envoie 'NavigationMapUpdate' ({controlID, objects}) à l'UI.

- `dtReal` (*number*) : Durée réelle de la frame (s).
- `dtSim` (*number*) : Durée simulée de la frame (s).
- `dtRaw` (*number*) : Durée brute de la frame (s).

#### `ui_uiNavi.onVehicleSwitched(oid, nid)`

Hook appelé au changement de véhicule contrôlé. Le corps est entièrement commenté : ne fait rien.

- `oid` (*integer*) : Ancien id de véhicule.
- `nid` (*integer*) : Nouvel id de véhicule.

#### `ui_uiNavi.planRoute(posX, posY)`

Outil de développement : calcule le chemin entre deux positions via map.getPath et l'envoie à l'UI par 'RoutePlanned'.

- `posX` (*number[]*) : Point de départ {x, y, z}.
- `posY` (*number[]*) : Point d'arrivée {x, y, z}.

#### `ui_uiNavi.requestUIDashboardMap()`

Construit les données de la carte (tuiles de terrain du niveau courant, points d'intérêt, nœuds routiers) et les envoie à l'UI par 'NavigationMap'. Si le niveau n'a pas de minimap, elle est générée depuis le TerrainBlock. Remplit aussi les anciens champs (terrainSize, minimapImage, squareSize, terrainOffset) pour les mods d'ancien format.

- **renvoie** : table Les données envoyées (terrainTiles, poi, nodes, ...).

#### `ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId)`

Envoie la carte à la texture JS d'un tableau de bord de véhicule (queueJSUITexture) en appelant la fonction JS `initmap` avec les données en JSON (nœuds, heure HH:MM, tuiles de terrain). Ne fait rien en mode headless, sans niveau chargé ou sans `dashboard`.

- `dashboard` (*string*) : Nom de la texture JS cible.
- `initmap` (*string|nil*) : Fonction JS à appeler, par défaut 'map.setData'.
- `vehId` (*integer|nil*) : Id du véhicule cible, sinon le véhicule du joueur 0.

#### `ui_uiNavi.route_requestStatus(oldPos, newPos)`

Met à jour l'itinéraire en cours (fonction locale route_update). Sans itinéraire, ne fait rien. Si la position a bougé de plus de 0,1 m, recalcule le chemin, envoie 'RouteUpdate' ; à moins de 50 m de la destination, envoie 'RouteReachedDestination' et termine l'itinéraire.

- `oldPos` (*vec3*) : Position précédente du joueur.
- `newPos` (*vec3*) : Position actuelle du joueur.

#### `ui_uiNavi.route_start(wp, pos)`

Démarre un itinéraire : appelle core_groundMarkers.setPath(wp) et mémorise la destination et sa position. Le code note que le multi-sièges ne rend le chemin que pour le dernier joueur.

- `wp` (*any*) : Destination (nom de waypoint de la carte), transmise à core_groundMarkers.setPath et à map.getPath.
- `pos` (*number[]*) : Position {x, y, z} de la destination.

#### `ui_uiNavi.setMissions(m)`

Remplace la liste des missions et l'envoie aussitôt à l'UI via 'MapMissions'.

- `m` (*table*) : Nouvelle liste de missions.

**Évènements UI (guihooks.trigger) :** `MapMissions`, `MapPointsOfInterest`, `NavigationMap`, `NavigationMapUpdate`, `RouteEnded`, `RoutePlanned`, `RouteReachedDestination`, `RouteUpdate`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/uiNavi.lua`.*
