# `career_modules_delivery_general`

*Fichier : `lua/ge/extensions/career/modules/delivery/general.lua` · VM : Game Engine (GE) · 1159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_general` : `extensions.load("career_modules_delivery_general")`, puis la globale `career_modules_delivery_general`

**Dépendances (chargées avant) :** `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_general.checkExitDeliveryMode()` |  | 990 |
| `career_modules_delivery_general.exitDeliveryMode()` |  | 957 |
| `career_modules_delivery_general.getDeliveryAbandonPenaltyFactor()` |  | 29 |
| `career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys)` |  | 1046 |
| `career_modules_delivery_general.getMostRecentCargoContainerData()` |  | 295 |
| `career_modules_delivery_general.getNearbyVehicleCargoContainers(callback)` |  | 192 |
| `career_modules_delivery_general.getSettings()` |  | 1030 |
| `career_modules_delivery_general.getVehicleName(vehId)` |  | 171 |
| `career_modules_delivery_general.isAutomaticRouteEnabled()` |  | 998 |
| `career_modules_delivery_general.isDeliveryModeActive()` |  | 1044 |
| `career_modules_delivery_general.loadSaveData()` |  | 37 |
| `career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData)` | *(hook)* | 642 |
| `career_modules_delivery_general.onAnyMissionChanged(change)` | *(hook)* | 1111 |
| `career_modules_delivery_general.onCareerActivated()` | *(hook)* | 10 |
| `career_modules_delivery_general.onCareerActive(active)` | *(hook)* | 155 |
| `career_modules_delivery_general.onCareerPaintingStarted()` | *(hook)* | 1090 |
| `career_modules_delivery_general.onCareerTuningStarted()` | *(hook)* | 1097 |
| `career_modules_delivery_general.onCheckPermission(tags, permissions)` | *(hook)* | 939 |
| `career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements)` | poi list stuff *(hook)* | 505 |
| `career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId)` | *(hook)* | 1152 |
| `career_modules_delivery_general.onPartShoppingStarted()` | *(hook)* | 1083 |
| `career_modules_delivery_general.onRepairInGarage(invVehId)` | *(hook)* | 1147 |
| `career_modules_delivery_general.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 75 |
| `career_modules_delivery_general.onSetBigmapNavFocus()` | Deactivate automatic route when setting a manual waypoint *(hook)* | 1020 |
| `career_modules_delivery_general.onTeleportedToGarage(garageId, veh)` | *(hook)* | 1104 |
| `career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 420 |
| `career_modules_delivery_general.requestUpdateContainerWeights()` |  | 333 |
| `career_modules_delivery_general.setAutomaticRoute(enabled)` |  | 1003 |
| `career_modules_delivery_general.setDeliveryTimePaused(paused)` |  | 419 |
| `career_modules_delivery_general.setDetailedDropOff(enabled)` |  | 1014 |
| `career_modules_delivery_general.setSetting(key, value)` |  | 1026 |
| `career_modules_delivery_general.startDeliveryMode()` |  | 949 |
| `career_modules_delivery_general.time()` |  | 165 |
| `career_modules_delivery_general.updateContainerWeights(delayCallback)` |  | 334 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDeliveryModeStarted` — écouté par 2 module(s)
- `onDeliveryModeStopped` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `OpenSimpleDelayPopup`, `automaticRouteSet`, `detailedDropOffSet`, `toastrMsg`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/general.lua`.*
