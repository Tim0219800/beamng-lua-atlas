# `gameplay_parking`

*Fichier : `lua/ge/extensions/gameplay/parking.lua` · VM : Game Engine (GE) · 1126 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_parking` : `extensions.load("gameplay_parking")`, puis la globale `gameplay_parking`

Système de véhicules garés et de suivi du stationnement. D'une part il fait apparaître des voitures garées sur les places du fichier de sites du niveau (city.sites.json via gameplay_city) et les téléporte vers de nouvelles places devant le joueur quand il s'éloigne, en s'appuyant sur un pool d'activation (core_vehicleActivePooling). D'autre part il suit un véhicule en conduite (enableTracking) pour détecter qu'il entre, sort ou se gare correctement dans une place et émet onVehicleParkingStatus. Un moddeur s'en sert pour peupler une zone de voitures garées ou pour des missions de stationnement.

## Exemple

```lua
gameplay_parking.setupVehicles(10)  -- fait apparaître 10 voitures garées
gameplay_parking.setParkingVars({precision = 0.9, neatness = 0.5})
gameplay_parking.enableTracking(be:getPlayerVehicleID(0), true)
-- hook : function M.onVehicleParkingStatus(vehId, data) if data.event == 'valid' then ... end end
```

## Remarques

- Variables (vars) par défaut : precision 0.8 (précision requise pour valider le stationnement), neatness 0 (netteté des voitures garées générées), radiusCoef 1 (coefficient du rayon actif, borné à 0.25..1000 par setParkingVars), baseProbability 0.75, activeAmount math.huge, enableRespawn true.
- Constantes internes : rayon cible 50 m, rayon de recherche 200 m, point de recherche à 200 m devant, rayon de maintien actif 50 m, rayon à garder libre 120 m.
- Événements de suivi (data.event) : 'enter', 'exit', 'valid' (stationnement valide maintenu 0,5 s), 'invalid', 'none'.
- Tags de places (customFields.tags) utilisés : street (active mapmgr.enableTracking), forwards, backwards, perfect, banned, dayTime, nightTime ; champ probability. Champ dynamique de véhicule trafficClearRadius : empêche les respawns de voitures garées à proximité.
- Un véhicule ayant le drapeau ignoreParking est ignoré par insertVehicle.
- Les véhicules insérés reçoivent playerUsable = false, ignoreTraffic et isParked, et sont ajoutés à la liste noire du mode marche.
- processVehicles est un alias d'activate ; getParkingAmount est un alias de getParkedCarsAmount.
- onClientStartMission est une fonction vide.
- Hooks émis : onParkingVehiclesActivated(parkedVehIds), onParkingVehiclesDeactivated(), onVehicleParkingStatus(vehId, data).
- Hors de onUpdate, la logique ne tourne pas si le système est inactif, sans sites, avec la physique coupée ou en mode grande carte.

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_parking.activate(vehIds)` | Active un groupe de véhicules comme voitures garées (les insère), puis émet onParkingVehiclesActivated. Désactive le système s'il n'y a pas de sites, pas de véhicules ou aucun inséré. Alias : processVehicles. | 660 |
| `gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist)` | Indique si une place est utilisable pour un véhicule garé : existante, dans la fenêtre de distance du focus, libre (pas de véhicule, pas banned, aucun véhicule dessus), hors des rayons trafficClearRadius, taille adaptée (ni trop petite ni trop grande : rapport >= 0.5). | 155 |
| `gameplay_parking.deactivate()` | Désactive le système : vide les listes, supprime le pool et émet onParkingVehiclesDeactivated. | 682 |
| `gameplay_parking.deleteVehicles(amount)` | Supprime du monde les dernières voitures garées (toutes par défaut). | 647 |
| `gameplay_parking.disableTracking(vehId)` | Arrête le suivi du stationnement d'un véhicule. | 394 |
| `gameplay_parking.enableTracking(vehId, autoDisable)` | Active le suivi du stationnement pour un véhicule conduit (active aussi le système). Crée les données de suivi : inside, preParked, parked, event, maxDist 80 m, parkingTimer, isOversized… | 374 |
| `gameplay_parking.filterParkingSpots(psList, filters)` | Filtre en place une liste issue de findParkingSpots : retire les places banned, puis selon filters : standardSize (largeur <= 3, longueur <= 8), checkVehicles (aucun véhicule dessus), useProbability (probabilité de la place × baseProbability × coefficient jour/nuit selon l'heure et les tags dayTime/nightTime). Défaut : {useProbability = true}. | 226 |
| `gameplay_parking.findParkingSpots(pos, minRadius, maxRadius)` | Trouve les places dans une couronne autour d'une position, triées de la plus proche à la plus lointaine. | 197 |
| `gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist)` | Force une voiture garée à se téléporter sur une nouvelle place libre aléatoire proche. Sans place valide, l'envoie hors carte via gameplay_traffic.forceTeleport. Sans effet si enableRespawn est false ou si la voiture a ignoreForceTeleport. | 335 |
| `gameplay_parking.getCurrentParkingSpot(vehId)` | Id de la place où un véhicule est correctement garé. Avec suivi actif, renvoie parkingSpotId si preParked ; sans suivi, cherche la place la plus proche (15 m) qui contient le véhicule avec la précision vars.precision. | 403 |
| `gameplay_parking.getParkedCarsAmount(activeOnly)` | Nombre de voitures garées gérées ; avec activeOnly, borné par activeAmount. Alias : getParkingAmount. | 462 |
| `gameplay_parking.getParkedCarsData()` | Données par voiture garée : parkingSpotId, activeRadius, randomPaint, searchFlag… | 470 |
| `gameplay_parking.getParkedCarsList()` | Liste des ids de voitures garées gérées. | 466 |
| `gameplay_parking.getParkingAmount(activeOnly)` | Alias de getParkedCarsAmount. | 462 |
| `gameplay_parking.getParkingSpots()` | Renvoie la collection de places de parking (sites.parkingSpots : sorted, objects…), en chargeant les sites si nécessaire. | 74 |
| `gameplay_parking.getParkingVars()` | Variables de stationnement actuelles. | 458 |
| `gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters)` | Renvoie une liste de places valides triée avec un biais aléatoire en faveur des plus proches de la position d'origine. Élargit le rayon jusqu'à avoir assez de places ou atteindre maxDist. | 295 |
| `gameplay_parking.getState()` | Indique si le système est actif. | 70 |
| `gameplay_parking.getTrackingData()` | Données de suivi de tous les véhicules suivis, par id. | 399 |
| `gameplay_parking.insertVehicle(vehId)` | Ajoute un véhicule aux voitures garées gérées : crée le pool 'autoParking' si besoin, le rend non utilisable par le joueur, l'associe à sa place actuelle éventuelle et active le suivi mapmgr. Ignoré si obj.ignoreParking. | 604 |
| `gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision)` | Place un véhicule garé sur une place : choisit le sens (tags forwards/backwards, sinon avec la netteté), ajoute un décalage et une rotation aléatoires sauf tag perfect, éteint le contact, libère l'ancienne place, peut changer la peinture, et met à jour le suivi mapmgr. | 95 |
| `gameplay_parking.onClientEndMission()` | Hook de fin de niveau : appelle resetAll. *(interne)* *(hook)* | 1004 |
| `gameplay_parking.onClientStartMission()` | Hook de début de niveau ; ne fait rien. *(interne)* *(hook)* | 1001 |
| `gameplay_parking.onDeserialized(data, options)` | Hook après rechargement Lua : refait apparaître les voitures stockées si options.respawnVehicles, réactive les voitures garées, rétablit les suivis, les variables et l'état. *(interne)* *(hook)* | 1049 |
| `gameplay_parking.onSerialize(options)` | Hook avant rechargement Lua : renvoie l'état (actif, voiture garées, suivis, variables). Avec options.despawnVehicles, capture aussi les données d'apparition des voitures (sauf options.exceptVehicleId) puis les supprime. *(interne)* *(hook)* | 1008 |
| `gameplay_parking.onUpdate(dt, dtSim)` | Appelé à chaque image. Met à jour le suivi du stationnement (événements enter/exit/valid/invalid), recherche périodiquement des places devant le joueur et recycle une voiture garée par image vers une nouvelle place hors de portée du joueur. *(interne)* *(hook)* | 822 |
| `gameplay_parking.onVehicleActiveChanged(vehId, active)` | Hook de pool d'activation : marque une voiture garée désactivée pour téléportation ; à sa réactivation, la téléporte si un autre véhicule (100 m d'un joueur, 20 m sinon) est proche. *(interne)* *(hook)* | 800 |
| `gameplay_parking.onVehicleDestroyed(vehId)` | Hook : retire le véhicule des listes de voitures garées et de suivi, et libère sa place. *(interne)* *(hook)* | 787 |
| `gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName)` | Hook de core_multiSpawn : active le groupe quand il porte le nom 'autoParking'. *(interne)* *(hook)* | 772 |
| `gameplay_parking.onVehicleResetted(vehId)` | Hook : quand le véhicule joueur est réinitialisé/téléporté, force une recherche de places proche du joueur (mode de réapparition proche). *(interne)* *(hook)* | 778 |
| `gameplay_parking.processVehicles(vehIds)` | Alias d'activate. | 660 |
| `gameplay_parking.removeVehicle(vehId)` | Retire un véhicule des voitures garées gérées (ne le supprime pas du monde). | 640 |
| `gameplay_parking.resetAll()` | Réinitialise tout : désactive, oublie les sites, vide listes et suivis, supprime le pool et remet les variables par défaut. | 758 |
| `gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist)` | Téléporte toutes les voitures garées (ou celles fournies) sur des places aléatoires ; repli sur forceTeleport quand aucune place ne convient. | 362 |
| `gameplay_parking.setActiveAmount(amount)` | Définit le nombre maximal de voitures garées actives (visibles) ; nil = illimité. | 453 |
| `gameplay_parking.setParkingVars(data, reset)` | Fusionne des variables de stationnement (réinitialise d'abord si reset). Un radiusCoef réinitialise les rayons actifs ; un activeAmount met à jour le pool de véhicules. | 434 |
| `gameplay_parking.setSites(data)` | Définit les données de sites (places de parking) utilisées, en remplaçant celles du niveau. Accepte un chemin de fichier, ou une table de sites valide (avec parkingSpots) ; sinon remet à nil. | 45 |
| `gameplay_parking.setState(val)` | Active ou désactive le système de stationnement. À l'activation, charge les sites par défaut si besoin et initialise le point de focus (gameplay_traffic.getFocus()). | 58 |
| `gameplay_parking.setupVehicles(amount, options)` | Fait apparaître des véhicules garés sur des places aléatoires (groupe de véhicules de type propparked, ou options.vehGroup). Supprime d'abord les voitures garées actuelles sauf keepCurrent. Quand le groupe est apparu, onVehicleGroupSpawned appelle activate. | 693 |

### Détail des paramètres

#### `gameplay_parking.activate(vehIds)`

Active un groupe de véhicules comme voitures garées (les insère), puis émet onParkingVehiclesActivated. Désactive le système s'il n'y a pas de sites, pas de véhicules ou aucun inséré. Alias : processVehicles.

- `vehIds` (*integer[]*) : Ids de véhicules.

#### `gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist)`

Indique si une place est utilisable pour un véhicule garé : existante, dans la fenêtre de distance du focus, libre (pas de véhicule, pas banned, aucun véhicule dessus), hors des rayons trafficClearRadius, taille adaptée (ni trop petite ni trop grande : rapport >= 0.5).

- `vehId` (*integer*) : Véhicule à garer.
- `parkingSpot` (*table*) : Place à tester.
- `minDist` (*number|nil*) : Distance minimale au focus (m, défaut 0).
- `maxDist` (*number|nil*) : Distance maximale au focus (m, défaut 1e12).
- **renvoie** : boolean true si la place convient.

#### `gameplay_parking.deleteVehicles(amount)`

Supprime du monde les dernières voitures garées (toutes par défaut).

- `amount` (*integer|nil*) : Nombre à supprimer, en commençant par la fin de la liste.

#### `gameplay_parking.disableTracking(vehId)`

Arrête le suivi du stationnement d'un véhicule.

- `vehId` (*integer|nil*) : Véhicule (défaut joueur 0).

#### `gameplay_parking.enableTracking(vehId, autoDisable)`

Active le suivi du stationnement pour un véhicule conduit (active aussi le système). Crée les données de suivi : inside, preParked, parked, event, maxDist 80 m, parkingTimer, isOversized…

- `vehId` (*integer|nil*) : Véhicule (défaut joueur 0).
- `autoDisable` (*boolean|nil*) : Si true, le suivi s'arrête à la première validation du stationnement.

#### `gameplay_parking.filterParkingSpots(psList, filters)`

Filtre en place une liste issue de findParkingSpots : retire les places banned, puis selon filters : standardSize (largeur <= 3, longueur <= 8), checkVehicles (aucun véhicule dessus), useProbability (probabilité de la place × baseProbability × coefficient jour/nuit selon l'heure et les tags dayTime/nightTime). Défaut : {useProbability = true}.

- `psList` (*table[]*) : Liste {ps, squaredDistance}.
- `filters` (*table|nil*) : useProbability, standardSize, checkVehicles.
- **renvoie** : table[] La même liste filtrée.

#### `gameplay_parking.findParkingSpots(pos, minRadius, maxRadius)`

Trouve les places dans une couronne autour d'une position, triées de la plus proche à la plus lointaine.

- `pos` (*vec3|nil*) : Centre (défaut position caméra).
- `minRadius` (*number|nil*) : Rayon minimal (défaut 0).
- `maxRadius` (*number|nil*) : Rayon maximal (défaut 200 m).
- **renvoie** : table[] Liste {ps = place, squaredDistance = number}.

#### `gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist)`

Force une voiture garée à se téléporter sur une nouvelle place libre aléatoire proche. Sans place valide, l'envoie hors carte via gameplay_traffic.forceTeleport. Sans effet si enableRespawn est false ou si la voiture a ignoreForceTeleport.

- `vehId` (*integer*) : Voiture garée.
- `pos` (*vec3|nil*) : Position de référence (défaut caméra).
- `minDist` (*number|nil*) : Distance minimale.
- `maxDist` (*number|nil*) : Distance maximale.

#### `gameplay_parking.getCurrentParkingSpot(vehId)`

Id de la place où un véhicule est correctement garé. Avec suivi actif, renvoie parkingSpotId si preParked ; sans suivi, cherche la place la plus proche (15 m) qui contient le véhicule avec la précision vars.precision.

- `vehId` (*integer|nil*) : Véhicule (défaut joueur 0).
- **renvoie** : integer|nil Id de place, ou nil.

#### `gameplay_parking.getParkedCarsAmount(activeOnly)`

Nombre de voitures garées gérées ; avec activeOnly, borné par activeAmount. Alias : getParkingAmount.

- `activeOnly` (*boolean|nil*) : true pour compter au plus activeAmount.
- **renvoie** : integer Nombre.

#### `gameplay_parking.getParkedCarsData()`

Données par voiture garée : parkingSpotId, activeRadius, randomPaint, searchFlag…

- **renvoie** : table<integer, table> Données (référence directe).

#### `gameplay_parking.getParkedCarsList()`

Liste des ids de voitures garées gérées.

- **renvoie** : integer[] Ids (référence directe).

#### `gameplay_parking.getParkingAmount(activeOnly)`

Alias de getParkedCarsAmount.

- `activeOnly` (*boolean|nil*) : Voir getParkedCarsAmount.
- **renvoie** : integer Nombre.

#### `gameplay_parking.getParkingSpots()`

Renvoie la collection de places de parking (sites.parkingSpots : sorted, objects…), en chargeant les sites si nécessaire.

- **renvoie** : table|nil Collection de places, nil sans sites.

#### `gameplay_parking.getParkingVars()`

Variables de stationnement actuelles.

- **renvoie** : table Variables (référence directe).

#### `gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters)`

Renvoie une liste de places valides triée avec un biais aléatoire en faveur des plus proches de la position d'origine. Élargit le rayon jusqu'à avoir assez de places ou atteindre maxDist.

- `originPos` (*vec3|nil*) : Origine (défaut caméra).
- `minDist` (*number|nil*) : Distance minimale (défaut 0).
- `maxDist` (*number|nil*) : Distance maximale (défaut 10000).
- `targetCount` (*integer|nil*) : Nombre de places voulu ; nil ou <= 0 = rayon maxDist et minimum automatique.
- `filters` (*table|nil*) : Filtres de filterParkingSpots.
- **renvoie** : table[] Liste {ps, squaredDistance} (vide si rien trouvé).

#### `gameplay_parking.getState()`

Indique si le système est actif.

- **renvoie** : boolean true si actif.

#### `gameplay_parking.getTrackingData()`

Données de suivi de tous les véhicules suivis, par id.

- **renvoie** : table<integer, table> Données (inside, parked, event, parkingSpotId, lastParkingSpotId…).

#### `gameplay_parking.insertVehicle(vehId)`

Ajoute un véhicule aux voitures garées gérées : crée le pool 'autoParking' si besoin, le rend non utilisable par le joueur, l'associe à sa place actuelle éventuelle et active le suivi mapmgr. Ignoré si obj.ignoreParking.

- `vehId` (*integer*) : Véhicule.

#### `gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision)`

Place un véhicule garé sur une place : choisit le sens (tags forwards/backwards, sinon avec la netteté), ajoute un décalage et une rotation aléatoires sauf tag perfect, éteint le contact, libère l'ancienne place, peut changer la peinture, et met à jour le suivi mapmgr.

- `vehId` (*integer*) : Véhicule à déplacer.
- `parkingSpot` (*table*) : Objet place de parking.
- `lowPrecision` (*boolean|nil*) : Transmis à moveResetVehicleTo (utilisé quand le véhicule n'est pas prêt).

#### `gameplay_parking.onDeserialized(data, options)`

Hook après rechargement Lua : refait apparaître les voitures stockées si options.respawnVehicles, réactive les voitures garées, rétablit les suivis, les variables et l'état.

- `data` (*table*) : Résultat de onSerialize.
- `options` (*table|nil*) : respawnVehicles, debugVehicleStashing.

#### `gameplay_parking.onSerialize(options)`

Hook avant rechargement Lua : renvoie l'état (actif, voiture garées, suivis, variables). Avec options.despawnVehicles, capture aussi les données d'apparition des voitures (sauf options.exceptVehicleId) puis les supprime.

- `options` (*table|nil*) : despawnVehicles, exceptVehicleId, debugVehicleStashing.
- **renvoie** : table Données à restaurer.

#### `gameplay_parking.onUpdate(dt, dtSim)`

Appelé à chaque image. Met à jour le suivi du stationnement (événements enter/exit/valid/invalid), recherche périodiquement des places devant le joueur et recycle une voiture garée par image vers une nouvelle place hors de portée du joueur.

- `dt` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_parking.onVehicleActiveChanged(vehId, active)`

Hook de pool d'activation : marque une voiture garée désactivée pour téléportation ; à sa réactivation, la téléporte si un autre véhicule (100 m d'un joueur, 20 m sinon) est proche.

- `vehId` (*integer*) : Véhicule.
- `active` (*boolean*) : Nouvel état d'activité.

#### `gameplay_parking.onVehicleDestroyed(vehId)`

Hook : retire le véhicule des listes de voitures garées et de suivi, et libère sa place.

- `vehId` (*integer*) : Véhicule détruit.

#### `gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName)`

Hook de core_multiSpawn : active le groupe quand il porte le nom 'autoParking'.

- `vehList` (*integer[]*) : Véhicules apparus.
- `groupId` (*any*) : Id du groupe (inutilisé).
- `groupName` (*string*) : Nom du groupe.

#### `gameplay_parking.onVehicleResetted(vehId)`

Hook : quand le véhicule joueur est réinitialisé/téléporté, force une recherche de places proche du joueur (mode de réapparition proche).

- `vehId` (*integer*) : Véhicule réinitialisé.

#### `gameplay_parking.processVehicles(vehIds)`

Alias d'activate.

- `vehIds` (*integer[]*) : Ids de véhicules.

#### `gameplay_parking.removeVehicle(vehId)`

Retire un véhicule des voitures garées gérées (ne le supprime pas du monde).

- `vehId` (*integer*) : Véhicule.

#### `gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist)`

Téléporte toutes les voitures garées (ou celles fournies) sur des places aléatoires ; repli sur forceTeleport quand aucune place ne convient.

- `vehIds` (*integer[]|nil*) : Voitures (défaut toutes les voitures garées).
- `minDist` (*number|nil*) : Distance minimale.
- `maxDist` (*number|nil*) : Distance maximale.

#### `gameplay_parking.setActiveAmount(amount)`

Définit le nombre maximal de voitures garées actives (visibles) ; nil = illimité.

- `amount` (*number|nil*) : Nombre maximal.

#### `gameplay_parking.setParkingVars(data, reset)`

Fusionne des variables de stationnement (réinitialise d'abord si reset). Un radiusCoef réinitialise les rayons actifs ; un activeAmount met à jour le pool de véhicules.

- `data` (*table*) : precision, neatness, radiusCoef, baseProbability, activeAmount, enableRespawn.
- `reset` (*boolean|nil*) : true pour revenir aux valeurs par défaut avant fusion.

#### `gameplay_parking.setSites(data)`

Définit les données de sites (places de parking) utilisées, en remplaçant celles du niveau. Accepte un chemin de fichier, ou une table de sites valide (avec parkingSpots) ; sinon remet à nil.

- `data` (*string|table|nil*) : Chemin d'un fichier .sites.json ou table de sites.

#### `gameplay_parking.setState(val)`

Active ou désactive le système de stationnement. À l'activation, charge les sites par défaut si besoin et initialise le point de focus (gameplay_traffic.getFocus()).

- `val` (*boolean*) : true pour activer.

#### `gameplay_parking.setupVehicles(amount, options)`

Fait apparaître des véhicules garés sur des places aléatoires (groupe de véhicules de type propparked, ou options.vehGroup). Supprime d'abord les voitures garées actuelles sauf keepCurrent. Quand le groupe est apparu, onVehicleGroupSpawned appelle activate.

- `amount` (*integer|nil*) : Nombre ; -1 ou nil = réglage trafficParkingAmount (0 = auto entre 4 et 16).
- `options` (*table|nil*) : keepCurrent, vehGroup, pos, bypassChecks.
- **renvoie** : boolean false si le nombre est nul, si le groupe est vide ou s'il n'y a aucune place (sans bypassChecks).

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugLevel` | integer | Niveau de debug : > 0 logs de téléportation et de filtrage ; >= 1 dessine les places autour du véhicule suivi ; >= 2 dessine les coins ; >= 3 dessine le point de recherche et les cercles. |
| `dependencies` | string[] | {'core_vehicleActivePooling'}, extension chargée avant. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onParkingVehiclesActivated` — écouté par 1 module(s)
- `onParkingVehiclesDeactivated`
- `onVehicleParkingStatus` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `getEnabled`, `getObjectActive`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getObjectPositionXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawSquarePrism`
- `obj:` `delete`, `getDirectionVector`, `getDirectionVectorUp`, `getDirectionVectorXYZ`, `getDynDataFieldbyName`, `getField`, `getMetallicPaintData`, `getPosition`, `setDynDataFieldbyName`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/parking.lua`.*
