# `freeroam_gasStations`

*Fichier : `lua/ge/extensions/freeroam/gasStations.lua` · VM : Game Engine (GE) · 177 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_gasStations` : `extensions.load("freeroam_gasStations")`, puis la globale `freeroam_gasStations`

Gestion simple du ravitaillement aux stations-service (carburant ou recharge électrique). Fournit les points d'intérêt (POI) des stations pour la grande carte et les marqueurs, le bouton d'action « faire le plein » et le remplissage des réservoirs du véhicule ; en mode carrière, délègue la transaction à career_modules_fuel. Global : freeroam_gasStations. Dépend de gameplay_achievement.

## Remarques

- Les POI de stations ne sont ajoutés que si career_career.isActive() ou si le réglage enableGasStationsInFreeroam est vrai. onGetRawPoiListForLevel appelle career_career.isActive() sans test de nil.
- Types d'énergie : gasoline, diesel, kerosine, n2o, any, unknown -> « refuel » ; electricEnergy -> « recharge ». Le type `air` est ignoré (ignoreFuelTypes).
- refuelCar hors carrière remplit chaque réservoir compatible à tank.maxEnergy via l'action véhicule setEnergyStorageEnergy ; en carrière, au premier réservoir compatible, lance career_modules_fuel.startTransaction(gasStation) puis arrête (return dans le callback).
- Succès « VEHICLE_REFUELLED » débloqué quand au moins un réservoir est rempli ; messages via guihooks 'Message' (catégorie refueling).
- gasStationCenterRadius divise par count même si aucune pompe n'a été trouvée (count = 0) : le centre devient alors NaN/inf.

**Dépendances (chargées avant) :** `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_gasStations.formatGasStationPoi(gasStation)` | Construit l'élément POI d'une station : id, data {type='gasStation', facility}, markerInfo {gasStationMarker {pumps, pos, radius, electric}, bigmapMarker {pos, icon (poi_fuel_round ou poi_charge_round), name, description, thumbnail, previews, cardIcon}}. Station électrique si energyTypes contient electricEnergy. | 53 |
| `freeroam_gasStations.gasStationCenterRadius(f)` | Calcule le centre (moyenne des positions des pompes, objets de la scène nommés par pump[1]) et le rayon (distance max au centre) d'une station. | 30 |
| `freeroam_gasStations.onActivityAcceptGatherData(elemData, activityData)` | Hook de collecte des activités d'un POI : pour chaque élément de type gasStation, ajoute une fiche (icône, titre, props par type de carburant, bouton « refuel/recharge/refuelMixed » dont l'action appelle refuelCar sur le véhicule joueur 0). *(interne)* *(hook)* | 80 |
| `freeroam_gasStations.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de collecte des POI d'un niveau : ajoute un POI par station de freeroam_facilities.getFacilities(levelIdentifier).gasStations (sous conditions, voir notes). *(interne)* *(hook)* | 69 |
| `freeroam_gasStations.refuelCar(gasStation, fuelTypes, veh)` | Remplit le véhicule : demande ses réservoirs (core_vehicleBridge.requestValue 'energyStorage'), vérifie la compatibilité avec fuelTypes, remplit ou lance la transaction carrière, affiche les messages et joue le son de ravitaillement. | 123 |

### Détail des paramètres

#### `freeroam_gasStations.formatGasStationPoi(gasStation)`

Construit l'élément POI d'une station : id, data {type='gasStation', facility}, markerInfo {gasStationMarker {pumps, pos, radius, electric}, bigmapMarker {pos, icon (poi_fuel_round ou poi_charge_round), name, description, thumbnail, previews, cardIcon}}. Station électrique si energyTypes contient electricEnergy.

- `gasStation` (*table*) : Facility de station.
- **renvoie** : table Élément POI.

#### `freeroam_gasStations.gasStationCenterRadius(f)`

Calcule le centre (moyenne des positions des pompes, objets de la scène nommés par pump[1]) et le rayon (distance max au centre) d'une station.

- `f` (*table*) : Facility station avec `pumps` : liste de paires dont le 1er élément est le nom d'objet de la pompe.
- **renvoie** : vec3 Centre.
- **renvoie** : number Rayon (m).

#### `freeroam_gasStations.onActivityAcceptGatherData(elemData, activityData)`

Hook de collecte des activités d'un POI : pour chaque élément de type gasStation, ajoute une fiche (icône, titre, props par type de carburant, bouton « refuel/recharge/refuelMixed » dont l'action appelle refuelCar sur le véhicule joueur 0).

- `elemData` (*table[]*) : Éléments du POI.
- `activityData` (*table[]*) : Liste à compléter.

#### `freeroam_gasStations.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de collecte des POI d'un niveau : ajoute un POI par station de freeroam_facilities.getFacilities(levelIdentifier).gasStations (sous conditions, voir notes).

- `levelIdentifier` (*string*) : Nom du niveau.
- `elements` (*table*) : Liste à compléter.

#### `freeroam_gasStations.refuelCar(gasStation, fuelTypes, veh)`

Remplit le véhicule : demande ses réservoirs (core_vehicleBridge.requestValue 'energyStorage'), vérifie la compatibilité avec fuelTypes, remplit ou lance la transaction carrière, affiche les messages et joue le son de ravitaillement.

- `gasStation` (*table*) : Élément POI de la station (utilisé aussi comme argument de career_modules_fuel.startTransaction).
- `fuelTypes` (*table<string, boolean>*) : Types d'énergie fournis (ensemble).
- `veh` (*userdata*) : Objet véhicule à ravitailler.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `obj:` `getPosition`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/gasStations.lua`.*
