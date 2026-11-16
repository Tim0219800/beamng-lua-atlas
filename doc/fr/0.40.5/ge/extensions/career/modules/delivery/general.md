# `career_modules_delivery_general`

*Fichier : `lua/ge/extensions/career/modules/delivery/general.lua` · VM : Game Engine (GE) · 1159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_general` : `extensions.load("career_modules_delivery_general")`, puis la globale `career_modules_delivery_general`

Noyau du système de livraison (logistique) de la carrière : horloge de jeu de livraison, sauvegarde/chargement de logisticsDatabase.json (colis, offres de véhicules, facilités, réglages, progression), mode livraison (démarrage/sortie, pénalité d'abandon de cargaison), réglages (route automatique, dépose détaillée), liste des conteneurs de cargaison des véhicules proches et mise à jour de leur poids dans la VM véhicule. Contribue aussi aux POI de la grande carte et aux permissions du mode livraison.

## Exemple

```lua
if career_modules_delivery_general.isDeliveryModeActive() then
  local pen = career_modules_delivery_general.getDeliveryModePenalty()
  print('Pénalité argent si abandon :', pen.money)
end
```

## Remarques

- Dépend de core_vehicleBridge. La version du format de sauvegarde (moduleVersion) est 42 : une sauvegarde plus ancienne est ignorée.
- Au chargement, si la sauvegarde date de plus d'une heure (os.time), les colis et les minuteurs de générateurs des facilités sont effacés.
- Le temps de livraison (time()) avance de dtSim à chaque onUpdate sauf si setDeliveryTimePaused(true).
- Pénalité d'abandon : money -= rewards.money * (0.1 + somme des abandonMultiplier des modificateurs), plus la réputation de l'organisation et l'amende des tâches de véhicule ; ignorée pour un colis en déplacement transitoire.
- Rayon de détection des véhicules proches : 25 m (comparaison avec le carré 625).
- Les conteneurs 'passenger' seuls sont ignorés par getNearbyVehicleCargoContainers.
- Bug probable : dans defaultDelayCallback, step.startStepSequence(sequence, callback) utilise 'callback', une variable non définie dans cette portée (nil).
- Les modules delivery sont référencés dans onCareerActivated ; ne pas les utiliser avant.

**Dépendances (chargées avant) :** `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_general.checkExitDeliveryMode()` | Quitte le mode livraison s'il ne reste ni cargo dans les véhicules ni tâche de véhicule. | 990 |
| `career_modules_delivery_general.exitDeliveryMode()` | Quitte le mode livraison : annule les déplacements transitoires, supprime les cargos dans les véhicules (changeCargoLocation 'deleted'), applique la pénalité d'abandon (argent/réputation, toast, son), abandonne les tâches de véhicule, vide le focus de la grande carte, planifie la mise à jour des poids, efface la tasklist et déclenche onDeliveryModeStopped. | 957 |
| `career_modules_delivery_general.getDeliveryAbandonPenaltyFactor()` | Renvoie le facteur de base de la pénalité d'abandon de cargaison (0.1). | 29 |
| `career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys)` | Calcule la pénalité si le joueur abandonne les cargos en véhicule : table d'attributs négatifs (money et <organisation>Reputation). Ajoute l'amende des tâches de véhicule sauf si onlyVehIdsAsKeys est fourni. | 1046 |
| `career_modules_delivery_general.getMostRecentCargoContainerData()` | Dernière liste de conteneurs calculée par getNearbyVehicleCargoContainers (rafraîchie environ chaque seconde dans onUpdate). | 295 |
| `career_modules_delivery_general.getNearbyVehicleCargoContainers(callback)` | Interroge (asynchrone, 'getCargoContainers') les véhicules à moins de 25 m du joueur (hors unicycle et véhicules non utilisables) et appelle callback avec la liste triée (vehId puis containerId) des conteneurs de livraison : emplacement, nom, types de cargo, emplacements total/utilisé/transitoire/libre, statut d'attache ('attached', 'nearby' ou 'lost'), colis présents. Appelle callback({}) s'il n'y a aucun véhicule. | 192 |
| `career_modules_delivery_general.getSettings()` | Renvoie la table des réglages de livraison. | 1030 |
| `career_modules_delivery_general.getVehicleName(vehId)` | Nom traduit d'un véhicule via l'inventaire carrière, ou un libellé de repli contenant l'id. | 171 |
| `career_modules_delivery_general.isAutomaticRouteEnabled()` | Renvoie le réglage 'automaticRoute' (route automatique vers la prochaine destination). | 998 |
| `career_modules_delivery_general.isDeliveryModeActive()` | Indique si le mode livraison est actif. | 1044 |
| `career_modules_delivery_general.loadSaveData()` | Charge logisticsDatabase.json du profil courant (ignoré si info.json est plus ancien que moduleVersion), initialise progress et parcelModProgress, réglages (automaticRoute vaut true par défaut) et temps de livraison ; efface les colis si la sauvegarde a plus d'une heure. *(interne)* | 37 |
| `career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData)` | Hook : pour un élément 'logisticsOffice', ajoute les infos du prompt d'activité (titre de la facilité, propriétés, bouton 'inspecter le cargo'). *(interne)* *(hook)* | 642 |
| `career_modules_delivery_general.onAnyMissionChanged(change)` | Hook : quitte le mode livraison quand une mission démarre (change == 'started'). *(interne)* *(hook)* | 1111 |
| `career_modules_delivery_general.onCareerActivated()` | Hook : mémorise les autres modules delivery (parcelManager, cargoScreen, generator, progress, vehicleTasks, tasklist, parcelMods, vehicleOfferManager, tutorial) et util_stepHandler. *(interne)* *(hook)* | 10 |
| `career_modules_delivery_general.onCareerActive(active)` | Hook : à l'activation de la carrière, charge les données, assure la carte (map.assureLoad) et lance dGenerator.setup. *(interne)* *(hook)* | 155 |
| `career_modules_delivery_general.onCareerPaintingStarted()` | Hook : quitte le mode livraison si la peinture commence. *(interne)* *(hook)* | 1090 |
| `career_modules_delivery_general.onCareerTuningStarted()` | Hook : quitte le mode livraison si le tuning commence. *(interne)* *(hook)* | 1097 |
| `career_modules_delivery_general.onCheckPermission(tags, permissions)` | Hook : en mode livraison, si un tag demandé est dans la table des activités restreintes (ex. interaction mission, remorquage vers le garage, achat de véhicule), ajoute une permission avec libellé expliquant la pénalité. *(interne)* *(hook)* | 939 |
| `career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de la liste de POI : ajoute les facilités de livraison visibles (ou ciblées) avec leurs points d'accès interactifs. *(interne)* *(hook)* | 505 |
| `career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId)` | Hook : avant le retrait de l'objet véhicule de l'inventaire, supprime ses cargos (avec pénalité) et vérifie la sortie du mode livraison. *(interne)* *(hook)* | 1152 |
| `career_modules_delivery_general.onPartShoppingStarted()` | Hook : quitte le mode livraison si l'achat de pièces commence. *(interne)* *(hook)* | 1083 |
| `career_modules_delivery_general.onRepairInGarage(invVehId)` | Hook : un véhicule réparé au garage : supprime ses cargos (avec pénalité) et vérifie la sortie du mode livraison. *(interne)* *(hook)* | 1147 |
| `career_modules_delivery_general.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit logisticsDatabase.json (temps, pénalité, progression, colis non expirés en facilité, offres de véhicules non expirées, données de facilités, réglages). *(interne)* *(hook)* | 75 |
| `career_modules_delivery_general.onSetBigmapNavFocus()` | Hook : un point de passage manuel posé sur la grande carte désactive la route automatique en mode livraison. *(interne)* *(hook)* | 1020 |
| `career_modules_delivery_general.onTeleportedToGarage(garageId, veh)` | Hook : quitte le mode livraison si le joueur est remorqué au garage. *(interne)* *(hook)* | 1104 |
| `career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : avance le temps de livraison, applique la pénalité issue d'une sauvegarde précédente (toast + addAttributes), rafraîchit chaque seconde les conteneurs proches et met à jour les poids. *(interne)* *(hook)* | 420 |
| `career_modules_delivery_general.requestUpdateContainerWeights()` | Planifie une mise à jour du poids des conteneurs ; exécutée dans onUpdate quand la simulation n'est pas en pause. | 333 |
| `career_modules_delivery_general.setAutomaticRoute(enabled)` | Active/désactive la route automatique : activée, appelle cargoScreen.setBestRoute ; désactivée, efface le chemin des marqueurs de sol et de la grande carte. Notifie l'UI (guihooks 'automaticRouteSet'). | 1003 |
| `career_modules_delivery_general.setDeliveryTimePaused(paused)` | Met en pause ou relance l'horloge de livraison. | 419 |
| `career_modules_delivery_general.setDetailedDropOff(enabled)` | Définit le réglage detailedDropOff et notifie l'UI (guihooks 'detailedDropOffSet'). | 1014 |
| `career_modules_delivery_general.setSetting(key, value)` | Écrit un réglage de livraison (sauvegardé dans logisticsDatabase.json). | 1026 |
| `career_modules_delivery_general.startDeliveryMode()` | Active le mode livraison (sans effet s'il est déjà actif), vide les POI et déclenche le hook onDeliveryModeStarted. | 949 |
| `career_modules_delivery_general.time()` | Temps de livraison courant (secondes de simulation cumulées, sauvegardé). | 165 |
| `career_modules_delivery_general.updateContainerWeights(delayCallback)` | Si une mise à jour est planifiée, calcule pour chaque véhicule/conteneur le volume (poids des colis, volume des fluides et vrac) et la densité, les envoie au véhicule (setCargoContainers), gèle le véhicule (setFreeze), lit le délai de mise en charge, puis appelle delayCallback avec le délai par véhicule. *(interne)* | 334 |

### Détail des paramètres

#### `career_modules_delivery_general.getDeliveryAbandonPenaltyFactor()`

Renvoie le facteur de base de la pénalité d'abandon de cargaison (0.1).

- **renvoie** : number Facteur appliqué à la récompense en argent du cargo abandonné.

#### `career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys)`

Calcule la pénalité si le joueur abandonne les cargos en véhicule : table d'attributs négatifs (money et <organisation>Reputation). Ajoute l'amende des tâches de véhicule sauf si onlyVehIdsAsKeys est fourni.

- `onlyVehIdsAsKeys` (*table<integer, boolean>|nil*) : Limite le calcul aux véhicules listés.
- **renvoie** : table<string, number> Pénalité par attribut (valeurs <= 0).

#### `career_modules_delivery_general.getMostRecentCargoContainerData()`

Dernière liste de conteneurs calculée par getNearbyVehicleCargoContainers (rafraîchie environ chaque seconde dans onUpdate).

- **renvoie** : table[] Conteneurs de cargaison.

#### `career_modules_delivery_general.getNearbyVehicleCargoContainers(callback)`

Interroge (asynchrone, 'getCargoContainers') les véhicules à moins de 25 m du joueur (hors unicycle et véhicules non utilisables) et appelle callback avec la liste triée (vehId puis containerId) des conteneurs de livraison : emplacement, nom, types de cargo, emplacements total/utilisé/transitoire/libre, statut d'attache ('attached', 'nearby' ou 'lost'), colis présents. Appelle callback({}) s'il n'y a aucun véhicule.

- `callback` (*function*) : Reçoit la table des conteneurs.
- **renvoie** : table|nil {} si core_vehicleBridge est absent.

#### `career_modules_delivery_general.getSettings()`

Renvoie la table des réglages de livraison.

- **renvoie** : table Réglages (automaticRoute, detailedDropOff…).

#### `career_modules_delivery_general.getVehicleName(vehId)`

Nom traduit d'un véhicule via l'inventaire carrière, ou un libellé de repli contenant l'id.

- `vehId` (*integer*) : Id d'objet véhicule.
- **renvoie** : string Nom affichable.

#### `career_modules_delivery_general.isAutomaticRouteEnabled()`

Renvoie le réglage 'automaticRoute' (route automatique vers la prochaine destination).

- **renvoie** : boolean true si activé.

#### `career_modules_delivery_general.isDeliveryModeActive()`

Indique si le mode livraison est actif.

- **renvoie** : boolean true si actif.

#### `career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData)`

Hook : pour un élément 'logisticsOffice', ajoute les infos du prompt d'activité (titre de la facilité, propriétés, bouton 'inspecter le cargo').

- `elemData` (*table[]*) : Éléments POI.
- `activityData` (*table[]*) : Données d'activité à compléter.

#### `career_modules_delivery_general.onAnyMissionChanged(change)`

Hook : quitte le mode livraison quand une mission démarre (change == 'started').

- `change` (*string*) : Type de changement de mission.

#### `career_modules_delivery_general.onCareerActive(active)`

Hook : à l'activation de la carrière, charge les données, assure la carte (map.assureLoad) et lance dGenerator.setup.

- `active` (*boolean*) : true à l'activation.

#### `career_modules_delivery_general.onCheckPermission(tags, permissions)`

Hook : en mode livraison, si un tag demandé est dans la table des activités restreintes (ex. interaction mission, remorquage vers le garage, achat de véhicule), ajoute une permission avec libellé expliquant la pénalité.

- `tags` (*string[]*) : Tags d'activité testés.
- `permissions` (*table[]*) : Liste de permissions à compléter.

#### `career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de la liste de POI : ajoute les facilités de livraison visibles (ou ciblées) avec leurs points d'accès interactifs.

- `levelIdentifier` (*string*) : Id du niveau.
- `elements` (*table[]*) : Liste de POI à compléter.

#### `career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId)`

Hook : avant le retrait de l'objet véhicule de l'inventaire, supprime ses cargos (avec pénalité) et vérifie la sortie du mode livraison.

- `inventoryId` (*integer*) : Id d'inventaire.
- `vehId` (*integer*) : Id d'objet véhicule.

#### `career_modules_delivery_general.onRepairInGarage(invVehId)`

Hook : un véhicule réparé au garage : supprime ses cargos (avec pénalité) et vérifie la sortie du mode livraison.

- `invVehId` (*integer*) : Id d'inventaire du véhicule.

#### `career_modules_delivery_general.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit logisticsDatabase.json (temps, pénalité, progression, colis non expirés en facilité, offres de véhicules non expirées, données de facilités, réglages).

- `currentSavePath` (*string*) : Dossier du profil en cours de sauvegarde.

#### `career_modules_delivery_general.onTeleportedToGarage(garageId, veh)`

Hook : quitte le mode livraison si le joueur est remorqué au garage.

- `garageId` (*string*) : Id du garage.
- `veh` (*any*) : Véhicule téléporté (non utilisé).

#### `career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : avance le temps de livraison, applique la pénalité issue d'une sauvegarde précédente (toast + addAttributes), rafraîchit chaque seconde les conteneurs proches et met à jour les poids.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `career_modules_delivery_general.setAutomaticRoute(enabled)`

Active/désactive la route automatique : activée, appelle cargoScreen.setBestRoute ; désactivée, efface le chemin des marqueurs de sol et de la grande carte. Notifie l'UI (guihooks 'automaticRouteSet').

- `enabled` (*boolean*) : Nouvel état.

#### `career_modules_delivery_general.setDeliveryTimePaused(paused)`

Met en pause ou relance l'horloge de livraison.

- `paused` (*boolean*) : true pour geler le temps.

#### `career_modules_delivery_general.setDetailedDropOff(enabled)`

Définit le réglage detailedDropOff et notifie l'UI (guihooks 'detailedDropOffSet').

- `enabled` (*boolean*) : Nouvel état.

#### `career_modules_delivery_general.setSetting(key, value)`

Écrit un réglage de livraison (sauvegardé dans logisticsDatabase.json).

- `key` (*string*) : Nom du réglage.
- `value` (*any*) : Valeur.

#### `career_modules_delivery_general.time()`

Temps de livraison courant (secondes de simulation cumulées, sauvegardé).

- **renvoie** : number Secondes.

#### `career_modules_delivery_general.updateContainerWeights(delayCallback)`

Si une mise à jour est planifiée, calcule pour chaque véhicule/conteneur le volume (poids des colis, volume des fluides et vrac) et la densité, les envoie au véhicule (setCargoContainers), gèle le véhicule (setFreeze), lit le délai de mise en charge, puis appelle delayCallback avec le délai par véhicule.

- `delayCallback` (*function|nil*) : Reçoit {[vehId] = délai en secondes} ; par défaut affiche une popup de chargement et dégèle les véhicules.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"core_vehicleBridge"}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDeliveryModeStarted` — écouté par 2 module(s)
- `onDeliveryModeStopped` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `OpenSimpleDelayPopup`, `automaticRouteSet`, `detailedDropOffSet`, `toastrMsg`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/general.lua`.*
