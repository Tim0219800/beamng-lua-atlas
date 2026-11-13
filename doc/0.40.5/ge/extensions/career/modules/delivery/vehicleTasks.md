# `career_modules_delivery_vehicleTasks`

*Fichier : `lua/ge/extensions/career/modules/delivery/vehicleTasks.lua` · VM : Game Engine (GE) · 713 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_vehicleTasks` : `extensions.load("career_modules_delivery_vehicleTasks")`, puis la globale `career_modules_delivery_vehicleTasks`

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_vehicleTasks.abandonAllVehicleTasks()` |  | 674 |
| `career_modules_delivery_vehicleTasks.addVehicleTask(vehId, offer)` |  | 73 |
| `career_modules_delivery_vehicleTasks.canDropOffCargoAtPsPath(psPath)` |  | 420 |
| `career_modules_delivery_vehicleTasks.drawDebugMenu()` |  | 700 |
| `career_modules_delivery_vehicleTasks.finishTasks(offerIds)` |  | 434 |
| `career_modules_delivery_vehicleTasks.getFineForAbandon(taskData)` |  | 527 |
| `career_modules_delivery_vehicleTasks.getFineForAbandonAllVehicleTasks()` |  | 663 |
| `career_modules_delivery_vehicleTasks.getTargetDestinationsForActiveTasks()` |  | 624 |
| `career_modules_delivery_vehicleTasks.getVehicleDataWithRewardsSummary()` |  | 362 |
| `career_modules_delivery_vehicleTasks.getVehicleTaskForOffer(offer)` |  | 686 |
| `career_modules_delivery_vehicleTasks.getVehicleTasks()` |  | 658 |
| `career_modules_delivery_vehicleTasks.giveBackDeliveryVehicle(vehId)` |  | 648 |
| `career_modules_delivery_vehicleTasks.isVehicleDeliveryVehicle(vehId)` |  | 638 |
| `career_modules_delivery_vehicleTasks.navigateToNextTask()` |  | 571 |
| `career_modules_delivery_vehicleTasks.onCareerActivated()` | *(hook)* | 8 |
| `career_modules_delivery_vehicleTasks.onTrailerAttached(objId1, objId2)` | *(hook)* | 201 |
| `career_modules_delivery_vehicleTasks.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 578 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string |  |
| `debugOrder` | number |  |
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/vehicleTasks.lua`.*
