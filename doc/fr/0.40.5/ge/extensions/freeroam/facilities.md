# `freeroam_facilities`

*Fichier : `lua/ge/extensions/freeroam/facilities.lua` · VM : Game Engine (GE) · 584 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_facilities` : `extensions.load("freeroam_facilities")`, puis la globale `freeroam_facilities`

Registre des « facilities » (installations) d'un niveau : garages, stations-service, concessions, ordinateurs, vendeurs privés, fournisseurs de livraison et dragstrips. Lit la section de ces listes dans `<niveau>/info.json` et dans `<niveau>/facilities/*.facilities.json`, normalise chaque entrée (id, aperçu, fichier de sites), puis donne accès aux positions (portes, places de parking, zones), à la téléportation au garage et à la génération des POI (marqueurs de grande carte / jeu). Global : freeroam_facilities.

## Exemple

```lua
local garage = freeroam_facilities.getGarage('mongarage')
local spots = freeroam_facilities.getParkingSpotsForFacility(garage)
for _, g in ipairs(freeroam_facilities.getFacilitiesByType('gasStation')) do print(g.id) end
```

## Remarques

- Types -> listes : garage/garages, gasStation/gasStations, dealership/dealerships, computer/computers, privateSeller/privateSellers, deliveryProvider/deliveryProviders, dragstrip/dragstrips.
- Les facilities sont mises en cache par niveau (facilitiesByLevel) et ne sont donc lues qu'une fois par session.
- Normalisation : id par défaut = « <dossier><fichier>-<type>-<index> » ; preview par défaut 'defaultFacility.jpg' (cherché à côté du fichier puis dans le dossier du niveau, sinon /ui/images/noPreview.jpg) ; sitesFile par défaut 'facilities.sites.json' (chaîne ou liste) ; zoneNames et parkingSpotNames par défaut {}.
- BUG : formatFacilityToRawPoi appelle M[<clusterType>..'FormatFacility'](f, elements) et attend un élément en retour, mais les fonctions zoneMarkerFormatFacility, walkingMarkerFormatFacility et vehicleTriggerFormatFacility ne renvoient rien (elles insèrent directement dans `elements`) : `e` est toujours nil, les valeurs par défaut de facilityPoiDefaults ne sont donc jamais appliquées par ce chemin. Pour clusterType 'gasStationMarker' la fonction M.gasStationMarkerFormatFacility n'existe pas dans ce fichier (erreur d'appel de nil).
- BUG : dans zoneMarkerFormatFacility, le message d'erreur utilise `data.id` alors que `data` n'est pas défini (variable globale nil -> erreur à l'exécution en cas d'échec).
- BUG mineur : dans getZonesForFacility, le message de log « Missing Spot… » utilise `v`, variable non définie (affiche nil) au lieu de zoneName.
- Hors carrière (career_career.isActive() faux), onGetRawPoiListForLevel ne publie que les dragstrips ; concessions et ordinateurs seulement en carrière. Le tutoriel dragstrip est cherché en dur sur le niveau 'west_coast_usa'.
- doors : liste de paires {nomObjetScène, ?, rayon} ; le rayon par défaut utilisé est 6 m.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_facilities.formatFacilityToRawPoi(f, elements)` | Tente de formater une facility selon son clusterType par défaut et d'y appliquer les valeurs par défaut de facilityPoiDefaults (clusterInBigMap, interactableInPlayMode, quickTravelAvailable…). Voir le bug dans les notes. | 445 |
| `freeroam_facilities.getAverageDoorPositionForFacility(facility)` | Moyenne des positions des objets de scène listés dans facility.doors ; vec3 nul avec log d'erreur s'il n'y en a aucun. | 135 |
| `freeroam_facilities.getClosestDoorPositionForFacility(facility)` | Position de la porte la plus proche de la caméra (core_camera.getPosition). | 156 |
| `freeroam_facilities.getDealership(id)` | Raccourci getFacility('dealership', id). | 132 |
| `freeroam_facilities.getFacilities(levelName)` | Charge (cache) et renvoie toutes les facilities d'un niveau, sous forme de table de listes (garages, gasStations, dealerships, computers, privateSellers, deliveryProviders, dragstrips). | 78 |
| `freeroam_facilities.getFacilitiesByType(type, levelName)` | Liste des facilities d'un type pour un niveau (niveau courant par défaut). | 117 |
| `freeroam_facilities.getFacility(type, id)` | Cherche une facility par type et id dans le niveau courant ; log d'erreur si le type est invalide ou l'id introuvable. | 101 |
| `freeroam_facilities.getGarage(id)` | Raccourci getFacility('garage', id). | 130 |
| `freeroam_facilities.getGaragePosRot(poi, veh)` | Meilleure place de parking (pour le véhicule) du garage dont l'id est poi.id. | 248 |
| `freeroam_facilities.getGasStation(id)` | Raccourci getFacility('gasStation', id). | 131 |
| `freeroam_facilities.getParkingSpotsForFacility(facility)` | Charge les fichiers de sites de la facility (gameplay_sites_sitesManager.loadSites) et renvoie les places de parking dont les noms sont dans facility.parkingSpotNames. | 179 |
| `freeroam_facilities.getZonesForFacility(facility)` | Idem pour les zones listées dans facility.zoneNames. | 214 |
| `freeroam_facilities.onActivityAcceptGatherData(elemData, activityData)` | Hook de collecte des activités proposées par un POI : fiche (icône, titre, props, bouton) pour garage (gameplay_garageMode.start), concession (career_modules_vehicleShopping.openShop), ordinateur (career_modules_computer.openMenu), dragstrip (écran de règles ou d'historique via gameplay_drag_dragBridge). Les stations sont gérées dans gasStations.lua. *(interne)* *(hook)* | 493 |
| `freeroam_facilities.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de collecte des POI d'un niveau : concessions (hors remotePurchaseOnly) et ordinateurs en carrière, dragstrips toujours. *(interne)* *(hook)* | 461 |
| `freeroam_facilities.onGetRawPoiListForTutorial(elements)` | Hook de collecte des POI du tutoriel : dragstrips avec isTutorialForDragstrip sur le niveau west_coast_usa. *(interne)* *(hook)* | 482 |
| `freeroam_facilities.teleportToGarage(garageId, veh, resetVeh)` | Téléporte un véhicule au garage (spawn.safeTeleport), réinitialise la caméra, émet onTeleportedToGarage(garageId, veh) et recadre la navigation de la grande carte si un itinéraire est actif. | 260 |
| `freeroam_facilities.vehicleTriggerFormatFacility(f, elements)` | Idem walkingMarkerFormatFacility mais avec un marqueur de type vehicleTrigger (dragstrips). | 409 |
| `freeroam_facilities.walkingMarkerFormatFacility(f, elements)` | Ajoute à `elements` un POI à marqueur piéton (centre des portes, rayon = distance max + rayon de porte) et marqueur de grande carte. | 372 |
| `freeroam_facilities.zoneMarkerFormatFacility(f, elements, bigMapIcon)` | Ajoute à `elements` un POI à marqueur de zone (zones, centre = milieu de la boîte englobante posé sur le terrain, rayon) et un marqueur de grande carte avec téléportation au garage. | 353 |

### Détail des paramètres

#### `freeroam_facilities.formatFacilityToRawPoi(f, elements)`

Tente de formater une facility selon son clusterType par défaut et d'y appliquer les valeurs par défaut de facilityPoiDefaults (clusterInBigMap, interactableInPlayMode, quickTravelAvailable…). Voir le bug dans les notes.

- `f` (*table|nil*) : Facility.
- `elements` (*table[]*) : Liste de POI.

#### `freeroam_facilities.getAverageDoorPositionForFacility(facility)`

Moyenne des positions des objets de scène listés dans facility.doors ; vec3 nul avec log d'erreur s'il n'y en a aucun.

- `facility` (*table*) : Facility avec `doors`.
- **renvoie** : vec3 Position moyenne.

#### `freeroam_facilities.getClosestDoorPositionForFacility(facility)`

Position de la porte la plus proche de la caméra (core_camera.getPosition).

- `facility` (*table*) : Facility avec `doors`.
- **renvoie** : vec3|nil Position ou nil.

#### `freeroam_facilities.getDealership(id)`

Raccourci getFacility('dealership', id).

- `id` (*string*) : Id de la concession.
- **renvoie** : table|nil Concession.

#### `freeroam_facilities.getFacilities(levelName)`

Charge (cache) et renvoie toutes les facilities d'un niveau, sous forme de table de listes (garages, gasStations, dealerships, computers, privateSellers, deliveryProviders, dragstrips).

- `levelName` (*string*) : Nom du niveau.
- **renvoie** : table<string, table[]> Listes par type.

#### `freeroam_facilities.getFacilitiesByType(type, levelName)`

Liste des facilities d'un type pour un niveau (niveau courant par défaut).

- `type` (*string*) : Type de facility.
- `levelName` (*string|nil*) : Niveau (défaut getCurrentLevelIdentifier()).
- **renvoie** : table[]|nil Liste, nil sans niveau.

#### `freeroam_facilities.getFacility(type, id)`

Cherche une facility par type et id dans le niveau courant ; log d'erreur si le type est invalide ou l'id introuvable.

- `type` (*string*) : garage, gasStation, dealership, computer, privateSeller, deliveryProvider ou dragstrip.
- `id` (*string*) : Id de la facility.
- **renvoie** : table|nil Facility.

#### `freeroam_facilities.getGarage(id)`

Raccourci getFacility('garage', id).

- `id` (*string*) : Id du garage.
- **renvoie** : table|nil Garage.

#### `freeroam_facilities.getGaragePosRot(poi, veh)`

Meilleure place de parking (pour le véhicule) du garage dont l'id est poi.id.

- `poi` (*table*) : {id = idGarage}
- `veh` (*userdata|nil*) : Véhicule (défaut joueur 0).
- **renvoie** : vec3|nil Position.
- **renvoie** : quat|nil Rotation.

#### `freeroam_facilities.getGasStation(id)`

Raccourci getFacility('gasStation', id).

- `id` (*string*) : Id de la station.
- **renvoie** : table|nil Station.

#### `freeroam_facilities.getParkingSpotsForFacility(facility)`

Charge les fichiers de sites de la facility (gameplay_sites_sitesManager.loadSites) et renvoie les places de parking dont les noms sont dans facility.parkingSpotNames.

- `facility` (*table*) : Facility.
- **renvoie** : table[] Places de parking trouvées (non manquantes).

#### `freeroam_facilities.getZonesForFacility(facility)`

Idem pour les zones listées dans facility.zoneNames.

- `facility` (*table*) : Facility.
- **renvoie** : table[] Zones trouvées.

#### `freeroam_facilities.onActivityAcceptGatherData(elemData, activityData)`

Hook de collecte des activités proposées par un POI : fiche (icône, titre, props, bouton) pour garage (gameplay_garageMode.start), concession (career_modules_vehicleShopping.openShop), ordinateur (career_modules_computer.openMenu), dragstrip (écran de règles ou d'historique via gameplay_drag_dragBridge). Les stations sont gérées dans gasStations.lua.

- `elemData` (*table[]*) : Éléments du POI.
- `activityData` (*table[]*) : Liste à compléter.

#### `freeroam_facilities.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de collecte des POI d'un niveau : concessions (hors remotePurchaseOnly) et ordinateurs en carrière, dragstrips toujours.

- `levelIdentifier` (*string*) : Niveau.
- `elements` (*table[]*) : Liste à compléter.

#### `freeroam_facilities.onGetRawPoiListForTutorial(elements)`

Hook de collecte des POI du tutoriel : dragstrips avec isTutorialForDragstrip sur le niveau west_coast_usa.

- `elements` (*table[]*) : Liste à compléter.

#### `freeroam_facilities.teleportToGarage(garageId, veh, resetVeh)`

Téléporte un véhicule au garage (spawn.safeTeleport), réinitialise la caméra, émet onTeleportedToGarage(garageId, veh) et recadre la navigation de la grande carte si un itinéraire est actif.

- `garageId` (*string*) : Id du garage.
- `veh` (*userdata*) : Véhicule.
- `resetVeh` (*boolean|nil*) : Réparer/réinitialiser le véhicule.

#### `freeroam_facilities.vehicleTriggerFormatFacility(f, elements)`

Idem walkingMarkerFormatFacility mais avec un marqueur de type vehicleTrigger (dragstrips).

- `f` (*table*) : Facility avec `doors`.
- `elements` (*table[]*) : Liste à compléter.

#### `freeroam_facilities.walkingMarkerFormatFacility(f, elements)`

Ajoute à `elements` un POI à marqueur piéton (centre des portes, rayon = distance max + rayon de porte) et marqueur de grande carte.

- `f` (*table*) : Facility avec `doors`.
- `elements` (*table[]*) : Liste à compléter.

#### `freeroam_facilities.zoneMarkerFormatFacility(f, elements, bigMapIcon)`

Ajoute à `elements` un POI à marqueur de zone (zones, centre = milieu de la boîte englobante posé sur le terrain, rayon) et un marqueur de grande carte avec téléportation au garage.

- `f` (*table*) : Facility.
- `elements` (*table[]*) : Liste de POI à compléter.
- `bigMapIcon` (*string|nil*) : Non utilisé.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTeleportedToGarage` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `getPosition`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/facilities.lua`.*
