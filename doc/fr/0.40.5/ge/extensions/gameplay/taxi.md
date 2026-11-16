# `gameplay_taxi`

*Fichier : `lua/ge/extensions/gameplay/taxi.lua` · VM : Game Engine (GE) · 2061 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_taxi` : `extensions.load("gameplay_taxi")`, puis la globale `gameplay_taxi`

Système de taxi en freeroam et carrière : le joueur à pied peut héler un taxi du trafic (ou en appeler un par le menu rapide), monter, choisir une destination sur la grande carte, puis l'IA du taxi le conduit en suivant un itinéraire (accélérer/ralentir, sauter le trajet, arrêter, changer de destination, caméra d'inactivité). En carrière, une course est facturée (tarif de base + par km + supplément nuit). L'extension enregistre un fournisseur de véhicules spéciaux « taxi » auprès de gameplay_traffic (1 garanti, 1 réservé), gère les états visuels des taxis (feux de toit, clignotants, étiquettes flottantes) et bloque les commandes de conduite pendant la course. Désactivée pendant une mission, en multijoueur ou dans le tutoriel freeroam.

## Exemple

```lua
-- depuis le menu rapide ou un script (joueur à moins de 30 m d'une route)
gameplay_taxi.callForTaxi()
print(gameplay_taxi.getTaxiState(someVehId), gameplay_taxi.isTaxiRideActive())
```

## Remarques

- États d'un taxi (getTaxiState) : available, enRoute, pullingOverForPickup, waitingForPickup, occupied, pullingOverForDropoff, waitingForDropoff, unavailable. Un véhicule inconnu renvoie 'available'.
- Phases de course du joueur : none, awaitingPickup, choosingDestination, driving, arriving. isTaxiRideActive est vrai en driving et arriving.
- Appel d'un taxi : le joueur doit être à moins de 30 m d'une route ; le taxi appelé attend 30 s et repart si le joueur n'est pas à moins de 12 m ; un taxi réservé apparaît à 120-250 m si aucun taxi actif n'est joignable.
- Niveaux « hurry up » : 4 niveaux. Niveau 1 : agressivité de base du trafic et vitesse légale. Niveaux 2, 3, 4 : agressivité IA 0,6 / 0,9 / 1,0 avec limite de vitesse désactivée.
- Tarifs (en carrière uniquement) : taxis fullsize, bastion, midsize et legran ont chacun un tarif initial, un prix au km et un supplément de nuit ; le bluebuck utilise un compteur à la distance en sixièmes de mile et au temps d'arrêt.
- À l'arrivée, le conducteur éjecte le joueur au bout de 10 s en attente de descente (dropoffKickDelay). Appuyer 3 fois sur des déclencheurs du taxi pendant la course arrête le taxi et éjecte le joueur.
- onSkipCalled : fondu au noir, téléportation sûre du taxi sur skipPosition, relance de la route, puis physique accélérée (setPhysicsSpeedFactor(2)) pendant 1 s avant retour à la normale (valeur 0) ; la remise à 0 est aussi assurée à la fin du job.
- onClientEndMission est exporté comme le même handler que onTrafficStopped.

**Dépendances (chargées avant) :** `gameplay_util_vehicleSighting`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_taxi.callForTaxi()` | Appelle un taxi vers la route la plus proche du joueur. Essaie d'abord les taxis actifs disponibles (du plus proche au plus lointain) puis une réserve. Affiche un message et émet le hook onTaxiCalled avec 'tooFarFromRoad', 'dispatched' ou 'noTaxiAvailable'. | 1160 |
| `gameplay_taxi.cancelTaxiCall()` | Annule les taxis appelés (pas ceux hélés) et affiche un message ; sans effet si aucun taxi n'a été appelé. | 1092 |
| `gameplay_taxi.confirmTaxiDestination()` | Valide la destination choisie (phase choosingDestination avec destination définie) et démarre la course. | 1765 |
| `gameplay_taxi.getTaxiState(vehId)` | Renvoie l'état courant d'un taxi. | 498 |
| `gameplay_taxi.getTaxiViewData()` | Données pour l'interface du taxi : phase, possibilité d'accélérer/ralentir/passer/arrêter/changer de destination, niveau hurry up, distance restante et totale, etc. | 356 |
| `gameplay_taxi.isTaxiRideActive()` | Indique si une course est en cours (phases driving ou arriving). | 1869 |
| `gameplay_taxi.isTaxiViewActive()` | Indique si la vue interface du taxi est active. | 1870 |
| `gameplay_taxi.onAiRouteDone(vehId)` | Hook appelé quand l'IA a fini sa route : passe en phase arriving si c'est le taxi de la course. *(interne)* *(hook)* | 1698 |
| `gameplay_taxi.onAnyMissionChanged()` | Hook : réévalue l'activation du système (désactivé pendant une mission). *(interne)* *(hook)* | 841 |
| `gameplay_taxi.onChangeDestinationCalled()` | Hook (bouton Changer de destination) : repasse en choix de destination et rouvre la grande carte. *(interne)* *(hook)* | 1588 |
| `gameplay_taxi.onClientEndMission()` | Hook : même traitement que onTrafficStopped. *(interne)* *(hook)* | 866 |
| `gameplay_taxi.onDeactivateBigMapCallback()` | Hook : si la carte est fermée sans choix, reprend la route, l'attente de descente ou ré-affiche la vue taxi. *(interne)* *(hook)* | 1771 |
| `gameplay_taxi.onExtensionUnloaded()` | Hook : supprime le moteur d'étiquettes flottantes. *(interne)* *(hook)* | 2048 |
| `gameplay_taxi.onGameplayInteract()` | Hook de l'action d'interaction : en course, arrête le taxi ; sinon, hèle un taxi disponible proche. *(interne)* *(hook)* | 1705 |
| `gameplay_taxi.onHurryUpCalled()` | Hook : monte d'un niveau d'urgence IA. *(interne)* *(hook)* | 1624 |
| `gameplay_taxi.onRegisterQuickAccessMenus()` | Hook : ajoute au menu rapide les entrées Appeler / Annuler le taxi (et une catégorie Taxi en carrière). *(interne)* *(hook)* | 1824 |
| `gameplay_taxi.onSetBigmapNavFocus(pos)` | Hook de la grande carte : mémorise la destination choisie et envoie à l'UI TaxiDestinationPreviewed avec la longueur de route. *(interne)* *(hook)* | 1752 |
| `gameplay_taxi.onSkipCalled()` | Hook (bouton Passer) : fondu au noir, téléporte le taxi à skipPosition, relance la route et accélère la physique 1 s ; une seule fois par course. *(interne)* *(hook)* | 1627 |
| `gameplay_taxi.onSlowDownCalled()` | Hook : descend d'un niveau d'urgence IA. *(interne)* *(hook)* | 1625 |
| `gameplay_taxi.onStopTaxiCalled()` | Hook (bouton Arrêter) : lent, passe à l'arrivée ; sinon, fait se ranger le taxi pendant la conduite. *(interne)* *(hook)* | 1677 |
| `gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data)` | Hook du routeur UI : ajoute data.taxi = getTaxiViewData(). *(interne)* *(hook)* | 1799 |
| `gameplay_taxi.onTrafficSpecialVehiclesProviders()` | Hook émis par gameplay_traffic lors de la préparation du trafic : enregistre le fournisseur 'taxi' (priorité 5, 1 garanti, 1 réservé) si le système est activé. *(interne)* *(hook)* | 250 |
| `gameplay_taxi.onTrafficStarted()` | Hook : réévalue l'activation du système. *(interne)* *(hook)* | 837 |
| `gameplay_taxi.onTrafficStopped()` | Hook : termine la course (onTaxiRideEnded raison 'trafficStopped'), vide les états et supprime les étiquettes. *(interne)* *(hook)* | 866 |
| `gameplay_taxi.onTrafficVehicleAdded(id)` | Hook : si le véhicule est un taxi IA non réservé, lui attribue un état de disponibilité. *(interne)* *(hook)* | 845 |
| `gameplay_taxi.onTrafficVehicleCrashed(vehId)` | Hook : un taxi accidenté est écarté (pickup annulé ou marqué indisponible) et son feu passe en « driverDistress ». *(interne)* *(hook)* | 1804 |
| `gameplay_taxi.onTrafficVehicleRemoved(id)` | Hook : oublie le taxi retiré du trafic. *(interne)* *(hook)* | 854 |
| `gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé chaque frame : détecte le taxi le plus proche, met à jour pull over, arrivées, attente et blocage des pickups, étiquettes, caméra d'inactivité, approche d'arrivée, tarif, éjection et interface. *(interne)* *(hook)* | 1470 |
| `gameplay_taxi.onVehicleResetted(id)` | Hook : retire au hasard l'état d'un taxi réinitialisé (sauf taxi de la course ou de pickup). *(interne)* *(hook)* | 1791 |
| `gameplay_taxi.onVehicleSwitched(oldId, newId)` | Hook : quand le joueur monte dans un taxi de pickup, démarre la course (hook onTaxiRideStarted), choisit le calculateur de tarif, bloque les actions de conduite, passe en caméra orbite et ouvre la carte de destination ; à la sortie du taxi, termine la course. *(interne)* *(hook)* | 1519 |
| `gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId)` | Hook : le joueur a actionné un déclencheur du taxi pendant la course ; trois avertissements mènent à l'arrêt et à l'éjection. *(interne)* *(hook)* | 1713 |
| `gameplay_taxi.setIdleCameraEnabled(enabled)` | Active ou désactive (préférence utilisateur) la caméra d'inactivité (démarre après 15 s sans action pendant la course). | 1665 |
| `gameplay_taxi.setUseBillboards(enabled)` | Active ou désactive les étiquettes flottantes d'état (« TAXI » + état) au-dessus des taxis quand le joueur est à pied ; visibles jusqu'à environ 45 m. | 1907 |
| `gameplay_taxi.startTaxiWithCurrentRoute(skipWait)` | Ferme la grande carte, calcule l'itinéraire jusqu'à player.destinationPos puis lance l'IA du taxi (ai.driveUsingPath, 1 tour, évitement activé) et passe en phase driving. Exécuté dans un job. Ne fait rien sans destination ou sans route. | 764 |
| `gameplay_taxi.taxiSettingChanged()` | À appeler quand le réglage enableTaxiInFreeroam change : réévalue si le système doit être actif. | 833 |

### Détail des paramètres

#### `gameplay_taxi.getTaxiState(vehId)`

Renvoie l'état courant d'un taxi.

- `vehId` (*integer*) : Identifiant du véhicule.
- **renvoie** : string Clé d'état ('available' par défaut).

#### `gameplay_taxi.getTaxiViewData()`

Données pour l'interface du taxi : phase, possibilité d'accélérer/ralentir/passer/arrêter/changer de destination, niveau hurry up, distance restante et totale, etc.

- **renvoie** : table Table pour l'UI (playerCurrentPhase, canHurryUp, canSlowDown, canSkip, canStop, distanceLeft, totalDistance…).

#### `gameplay_taxi.isTaxiRideActive()`

Indique si une course est en cours (phases driving ou arriving).

- **renvoie** : boolean true si en course.

#### `gameplay_taxi.isTaxiViewActive()`

Indique si la vue interface du taxi est active.

- **renvoie** : boolean true si active.

#### `gameplay_taxi.onAiRouteDone(vehId)`

Hook appelé quand l'IA a fini sa route : passe en phase arriving si c'est le taxi de la course.

- `vehId` (*integer*) : Véhicule IA.

#### `gameplay_taxi.onSetBigmapNavFocus(pos)`

Hook de la grande carte : mémorise la destination choisie et envoie à l'UI TaxiDestinationPreviewed avec la longueur de route.

- `pos` (*vec3|nil*) : Position choisie, nil pour effacer.

#### `gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data)`

Hook du routeur UI : ajoute data.taxi = getTaxiViewData().

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*string*) : Route d'arrivée.
- `fromRoute` (*string*) : Route de départ.
- `data` (*table*) : Table de données de la vue (modifiée).

#### `gameplay_taxi.onTrafficVehicleAdded(id)`

Hook : si le véhicule est un taxi IA non réservé, lui attribue un état de disponibilité.

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_taxi.onTrafficVehicleCrashed(vehId)`

Hook : un taxi accidenté est écarté (pickup annulé ou marqué indisponible) et son feu passe en « driverDistress ».

- `vehId` (*integer*) : Identifiant du véhicule.

#### `gameplay_taxi.onTrafficVehicleRemoved(id)`

Hook : oublie le taxi retiré du trafic.

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé chaque frame : détecte le taxi le plus proche, met à jour pull over, arrivées, attente et blocage des pickups, étiquettes, caméra d'inactivité, approche d'arrivée, tarif, éjection et interface.

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps simulé (s).
- `dtRaw` (*number*) : Temps brut (s).

#### `gameplay_taxi.onVehicleResetted(id)`

Hook : retire au hasard l'état d'un taxi réinitialisé (sauf taxi de la course ou de pickup).

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_taxi.onVehicleSwitched(oldId, newId)`

Hook : quand le joueur monte dans un taxi de pickup, démarre la course (hook onTaxiRideStarted), choisit le calculateur de tarif, bloque les actions de conduite, passe en caméra orbite et ouvre la carte de destination ; à la sortie du taxi, termine la course.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.

#### `gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId)`

Hook : le joueur a actionné un déclencheur du taxi pendant la course ; trois avertissements mènent à l'arrêt et à l'éjection.

- `lnk` (*any*) : Lien du déclencheur.
- `actionValue` (*number*) : 1 à l'appui.
- `vehicleId` (*integer*) : Véhicule concerné.

#### `gameplay_taxi.setIdleCameraEnabled(enabled)`

Active ou désactive (préférence utilisateur) la caméra d'inactivité (démarre après 15 s sans action pendant la course).

- `enabled` (*boolean*) : true pour autoriser.

#### `gameplay_taxi.setUseBillboards(enabled)`

Active ou désactive les étiquettes flottantes d'état (« TAXI » + état) au-dessus des taxis quand le joueur est à pied ; visibles jusqu'à environ 45 m.

- `enabled` (*boolean*) : true pour afficher.

#### `gameplay_taxi.startTaxiWithCurrentRoute(skipWait)`

Ferme la grande carte, calcule l'itinéraire jusqu'à player.destinationPos puis lance l'IA du taxi (ai.driveUsingPath, 1 tour, évitement activé) et passe en phase driving. Exécuté dans un job. Ne fait rien sans destination ou sans route.

- `skipWait` (*boolean|nil*) : true pour ne pas attendre 2 s avant le départ (défaut false).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : gameplay_util_vehicleSighting. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTaxiCalled` — écouté par 1 module(s)
- `onTaxiRideEnded` — écouté par 1 module(s)
- `onTaxiRideStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `TaxiDestinationPreviewed`

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectActive`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`, `setPhysicsSpeedFactor`
- `core_environment.` `getLightState`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/taxi.lua`.*
