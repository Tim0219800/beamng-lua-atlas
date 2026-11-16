# `gameplay_freeformDelivery_routes`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/routes.lua` · VM : Game Engine (GE) · 1189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_routes` : `extensions.load("gameplay_freeformDelivery_routes")`, puis la globale `gameplay_freeformDelivery_routes`

Gestion des itinéraires de la livraison libre. Construit des routes de guidage (core_groundMarkers.setPath) vers une zone cible ou vers un véhicule, avec waypoints issus d'un fichier race ou de noms de nœuds de la carte, détecte l'arrivée du joueur, choisit automatiquement la route quand il ne reste qu'un objectif visible, réagit aux attelages (couplerAttachedRoute) et alimente la grande carte (bigmap) en points d'intérêt et en groupes.

## Remarques

- Une route (entrée de delivery.routes) contient targetAreaId ou vehicleId, des bigmapGroups, une icône et un tableau params ; params peut contenir raceFile, waypointNames, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ, penalty (alias de penaltyAboveCutoff). Une entrée params avec targetAreaId n'est utilisée que si le joueur est dans cette zone cible ; sinon l'entrée sans targetAreaId sert de défaut.
- Le chemin est envoyé avec step = 3 et clearPathOnReachingTarget = false.
- Arrivée : pour une route vers une zone cible, le véhicule du joueur doit être dans la zone ; pour une route vers un véhicule, à moins de 10 m. Le guidage est alors effacé.
- Guidage automatique : s'il reste exactement un objectif visible non terminé (showInTasklist ~= false), la route est choisie selon son type (placement -> targetAreaId, playerInVehicle -> vehicleId, coupled -> trailerId), en suivant au besoin l'unique objectif qui en dépend (requires).
- Bug probable : setup() ajoute à chaque appel les groupes otherLocations et otherVehicles dans delivery.bigmapGroups (table de la livraison, modifiée en place) sans jamais les retirer ; une seconde initialisation sur la même table crée des doublons.
- Bug probable : formatDeliveryToRawPoi lit targetArea.relevantGoals et vehicleData.relevantGoals sans tester nil alors que findTargetArea/findVehicle peuvent renvoyer nil (route vers un id inconnu).
- Dépend des globales gameplay_freeformDelivery_tasklist, _setup et _freeformDelivery, non déclarées dans dependencies.

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_goals`, `gameplay_freeformDelivery_markers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_routes.cleanup()` | Efface le guidage et oublie la livraison, les routes et la route courante. *(interne)* | 587 |
| `gameplay_freeformDelivery_routes.clearRoute()` | Cache le marqueur de route, efface le guidage (core_groundMarkers.resetAll) et met à jour la liste de tâches. | 487 |
| `gameplay_freeformDelivery_routes.getCurrentRoute()` | Route active. | 453 |
| `gameplay_freeformDelivery_routes.getRoute(index)` | Renvoie la route d'indice donné (à partir de 1). | 440 |
| `gameplay_freeformDelivery_routes.getRouteCount()` | Nombre de routes disponibles. | 458 |
| `gameplay_freeformDelivery_routes.getRouteName(route)` | Nom affichable d'une route : nom traduit de la zone cible ou du véhicule, à défaut l'id, ou le texte « route inconnue ». | 422 |
| `gameplay_freeformDelivery_routes.getRoutes()` | Renvoie la liste des routes de la livraison. | 448 |
| `gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId)` | Position d'une zone cible : pos pour un lieu ou une place, centre (ou moyenne des sommets recalée sur le relief) pour une zone. | 475 |
| `gameplay_freeformDelivery_routes.getTargetAreas()` | Renvoie les zones cibles de la livraison active (utile pour générer les POI). | 463 |
| `gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId)` | Position en cache d'un véhicule de la livraison active. | 481 |
| `gameplay_freeformDelivery_routes.getVehicles()` | Renvoie les véhicules de la livraison active (utile pour générer les POI). | 469 |
| `gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures)` | Hook de la grande carte : ajoute la structure de groupes « delivery » (delivery_relevant et groupes de la livraison). *(interne)* *(hook)* | 1134 |
| `gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData)` | Hook de la grande carte : crée les groupes delivery_relevant et ceux de bigmapGroups dans groupData. *(interne)* *(hook)* | 1116 |
| `gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook appelé à l'attelage de deux véhicules ; si l'un est le véhicule du joueur et que l'autre a une couplerAttachedRoute, active cette route. *(interne)* *(hook)* | 1151 |
| `gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)` | Hook appelé au dételage ; efface la route courante si elle correspond à la couplerAttachedRoute du véhicule dételé. *(interne)* *(hook)* | 1165 |
| `gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook du système de POI : ajoute les POI de la livraison (zones cibles et véhicules, avec description des objectifs liés) quand une livraison est active. *(interne)* *(hook)* | 1147 |
| `gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route)` | Construit et active un itinéraire de guidage vers une zone cible de la livraison (position du lieu, centre de la zone ou position de la place). Pose le marqueur de route, avec le contour de zone ou de place le cas échéant, et met à jour le message de la liste de tâches. | 366 |
| `gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route)` | Construit et active un itinéraire de guidage vers la position en cache d'un véhicule de livraison. | 404 |
| `gameplay_freeformDelivery_routes.setup(delivery)` | Initialise le module avec la livraison : routes, groupes de grande carte, groupes de repli otherLocations et otherVehicles pour les routes et véhicules sans groupe. *(interne)* | 505 |
| `gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler)` | Appelée chaque frame : vérifie l'arrivée à la route courante puis met à jour la route automatique. *(interne)* | 582 |

### Détail des paramètres

#### `gameplay_freeformDelivery_routes.clearRoute()`

Cache le marqueur de route, efface le guidage (core_groundMarkers.resetAll) et met à jour la liste de tâches.

- **renvoie** : boolean false si core_groundMarkers n'est pas disponible, sinon true.

#### `gameplay_freeformDelivery_routes.getCurrentRoute()`

Route active.

- **renvoie** : table|nil {type = 'targetArea'|'vehicle', id, automaticGoalId?} ou nil.

#### `gameplay_freeformDelivery_routes.getRoute(index)`

Renvoie la route d'indice donné (à partir de 1).

- `index` (*integer*) : Indice 1-based.
- **renvoie** : table|nil Route ou nil si hors limites.

#### `gameplay_freeformDelivery_routes.getRouteCount()`

Nombre de routes disponibles.

- **renvoie** : integer Nombre de routes.

#### `gameplay_freeformDelivery_routes.getRouteName(route)`

Nom affichable d'une route : nom traduit de la zone cible ou du véhicule, à défaut l'id, ou le texte « route inconnue ».

- `route` (*table*) : Entrée de route.
- **renvoie** : string Nom à afficher.

#### `gameplay_freeformDelivery_routes.getRoutes()`

Renvoie la liste des routes de la livraison.

- **renvoie** : table[] Routes (delivery.routes).

#### `gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId)`

Position d'une zone cible : pos pour un lieu ou une place, centre (ou moyenne des sommets recalée sur le relief) pour une zone.

- `targetAreaId` (*string*) : ID de la zone cible.
- **renvoie** : vec3|nil Position ou nil.

#### `gameplay_freeformDelivery_routes.getTargetAreas()`

Renvoie les zones cibles de la livraison active (utile pour générer les POI).

- **renvoie** : table[] targetAreas, ou tableau vide sans livraison.

#### `gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId)`

Position en cache d'un véhicule de la livraison active.

- `vehicleId` (*string*) : ID du véhicule de livraison.
- **renvoie** : vec3|nil Position ou nil.

#### `gameplay_freeformDelivery_routes.getVehicles()`

Renvoie les véhicules de la livraison active (utile pour générer les POI).

- **renvoie** : table[] vehicles, ou tableau vide sans livraison.

#### `gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures)`

Hook de la grande carte : ajoute la structure de groupes « delivery » (delivery_relevant et groupes de la livraison).

- `customGroupStructures` (*table[]*) : Liste de structures, modifiée en place.

#### `gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData)`

Hook de la grande carte : crée les groupes delivery_relevant et ceux de bigmapGroups dans groupData.

- `groupData` (*table*) : Table des groupes, indexée par id, modifiée en place.

#### `gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)`

Hook appelé à l'attelage de deux véhicules ; si l'un est le véhicule du joueur et que l'autre a une couplerAttachedRoute, active cette route.

- `objId1` (*integer*) : ID du premier véhicule.
- `objId2` (*integer*) : ID du second véhicule.
- `nodeId` (*integer*) : Nœud d'attelage du premier véhicule (déduit du code).
- `obj2nodeId` (*integer*) : Nœud d'attelage du second véhicule (déduit du code).

#### `gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)`

Hook appelé au dételage ; efface la route courante si elle correspond à la couplerAttachedRoute du véhicule dételé.

- `objId1` (*integer*) : ID du premier véhicule.
- `objId2` (*integer*) : ID du second véhicule.
- `nodeId` (*integer*) : Nœud d'attelage du premier véhicule (déduit du code).
- `obj2nodeId` (*integer*) : Nœud d'attelage du second véhicule (déduit du code).
- `breakForce` (*number*) : Force de rupture (non utilisée).

#### `gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook du système de POI : ajoute les POI de la livraison (zones cibles et véhicules, avec description des objectifs liés) quand une livraison est active.

- `levelIdentifier` (*string*) : Identifiant du niveau (non utilisé).
- `elements` (*table[]*) : Liste de POI complétée en place.

#### `gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route)`

Construit et active un itinéraire de guidage vers une zone cible de la livraison (position du lieu, centre de la zone ou position de la place). Pose le marqueur de route, avec le contour de zone ou de place le cas échéant, et met à jour le message de la liste de tâches.

- `targetAreaId` (*string*) : ID de la zone cible dans delivery.targetAreas.
- `route` (*table|nil*) : Entrée de route dont params fournit waypoints et options de calcul.
- **renvoie** : boolean true si la route est posée ; false si core_groundMarkers manque ou si la zone, le site ou la position est introuvable.

#### `gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route)`

Construit et active un itinéraire de guidage vers la position en cache d'un véhicule de livraison.

- `vehicleId` (*string*) : ID du véhicule dans delivery.vehicles.
- `route` (*table|nil*) : Entrée de route (params).
- **renvoie** : boolean true si la route est posée.

#### `gameplay_freeformDelivery_routes.setup(delivery)`

Initialise le module avec la livraison : routes, groupes de grande carte, groupes de repli otherLocations et otherVehicles pour les routes et véhicules sans groupe.

- `delivery` (*table*) : Données de livraison.

#### `gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler)`

Appelée chaque frame : vérifie l'arrivée à la route courante puis met à jour la route automatique.

- `dtReal` (*number*) : Non utilisé.
- `dtSim` (*number*) : Non utilisé.
- `dtRaw` (*number*) : Non utilisé.
- `profiler` (*table|nil*) : Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_freeformDelivery_utils, _goals et _markers. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/routes.lua`.*
