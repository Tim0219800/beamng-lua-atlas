# `gameplay_freeformDelivery_odometer`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/odometer.lua` · VM : Game Engine (GE) · 251 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_odometer` : `extensions.load("gameplay_freeformDelivery_odometer")`, puis la globale `gameplay_freeformDelivery_odometer`

Sous-module de la livraison libre qui suit l'odomètre des véhicules marqués trackOdometer dans la définition de livraison. Il lit la valeur via core_vehicleBridge (getRootPartOdometer), calcule la distance parcourue depuis le départ, affiche un message dans la liste de tâches et fait échouer la livraison si la distance dépasse maxOdometer.

## Remarques

- Les valeurs d'odomètre sont en mètres ; l'affichage suit le réglage uiUnitLength (m ou ft, 1 m = 3.2808399 ft).
- Une valeur négative (-1) signifie que l'odomètre n'a pas pu être lu.
- La lecture est asynchrone (requestValue) ; isSetupComplete() devient true quand toutes les lectures initiales sont revenues.
- À setup, si vehicleDef.partsInitialized est faux, la commande partCondition.initConditions(nil, 0, nil, 0) est envoyée au véhicule, puis partsInitialized passe à true.
- Le dépassement de maxOdometer appelle gameplay_freeformDelivery_freeformDelivery.finish(true, raison) si la livraison est active.

**Dépendances (chargées avant) :** `core_vehicleBridge`, `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_setup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_odometer.cleanup()` | Vide le suivi et retire le message d'odomètre de la liste de tâches (DiscardTasklistItem). *(interne)* | 242 |
| `gameplay_freeformDelivery_odometer.getOdometerData(vehId)` | Renvoie les données de suivi d'un véhicule. | 181 |
| `gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId)` | Comme getOdometerData mais en cherchant par l'ID du véhicule dans la définition de livraison. | 186 |
| `gameplay_freeformDelivery_odometer.isSetupComplete()` | Indique si toutes les requêtes d'odomètre initiales ont reçu une réponse. | 130 |
| `gameplay_freeformDelivery_odometer.setup(delivery)` | Réinitialise le suivi puis, pour chaque véhicule de delivery.vehicles ayant trackOdometer, demande l'odomètre de départ au véhicule. maxOdometer (optionnel) vient de la définition du véhicule. *(interne)* | 92 |
| `gameplay_freeformDelivery_odometer.update(dtReal)` | Appelée chaque frame ; toutes les 1/8 s, redemande l'odomètre de chaque véhicule suivi et fait échouer la livraison si la distance parcourue dépasse maxOdometer. *(interne)* | 135 |
| `gameplay_freeformDelivery_odometer.updateTasklistMessage()` | Met à jour (ou retire) le message d'odomètre de la liste de tâches pour le véhicule du joueur. N'envoie SetTasklistTask que si le texte a changé. | 197 |

### Détail des paramètres

#### `gameplay_freeformDelivery_odometer.getOdometerData(vehId)`

Renvoie les données de suivi d'un véhicule.

- `vehId` (*integer*) : ID d'objet du véhicule dans le jeu.
- **renvoie** : table|nil {deliveryVehicleId, startingOdometer, currentOdometer, maxOdometer, requestPending} ou nil.

#### `gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId)`

Comme getOdometerData mais en cherchant par l'ID du véhicule dans la définition de livraison.

- `deliveryVehicleId` (*string*) : ID du véhicule dans la livraison (déduit du code).
- **renvoie** : table|nil Données de suivi ou nil.

#### `gameplay_freeformDelivery_odometer.isSetupComplete()`

Indique si toutes les requêtes d'odomètre initiales ont reçu une réponse.

- **renvoie** : boolean true quand aucune requête n'est en attente.

#### `gameplay_freeformDelivery_odometer.setup(delivery)`

Réinitialise le suivi puis, pour chaque véhicule de delivery.vehicles ayant trackOdometer, demande l'odomètre de départ au véhicule. maxOdometer (optionnel) vient de la définition du véhicule.

- `delivery` (*table*) : Données de livraison avec le tableau vehicles.

#### `gameplay_freeformDelivery_odometer.update(dtReal)`

Appelée chaque frame ; toutes les 1/8 s, redemande l'odomètre de chaque véhicule suivi et fait échouer la livraison si la distance parcourue dépasse maxOdometer.

- `dtReal` (*number*) : Delta temps réel en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicleBridge, gameplay_freeformDelivery_utils, gameplay_freeformDelivery_setup. |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/odometer.lua`.*
